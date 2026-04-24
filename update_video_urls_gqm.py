import csv
import os
import sys
from supabase import create_client
from dotenv import load_dotenv

load_dotenv()

SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_SERVICE_KEY = os.getenv("SUPABASE_SERVICE_KEY")

TABLE_NAME = "gqm_vehiculos"
OLD_CSV = "data/gqm_vehiculos_2026_15.csv"
NEW_CSV = "data/gqm_vehiculos_2026_24.csv"


def main():
    dry_run = "--dry-run" in sys.argv

    with open(OLD_CSV, encoding="utf-8") as f:
        old_rows = list(csv.DictReader(f))
    with open(NEW_CSV, encoding="utf-8") as f:
        new_rows = list(csv.DictReader(f))

    if len(old_rows) != len(new_rows):
        raise SystemExit(f"Las filas no coinciden: {len(old_rows)} vs {len(new_rows)}")

    if dry_run:
        print("=== DRY RUN: no se escribira nada en Supabase ===\n")
        supabase = None
    else:
        supabase = create_client(SUPABASE_URL, SUPABASE_SERVICE_KEY)
        print("Conectado a Supabase\n")

    cambios = 0
    for idx, (old, new) in enumerate(zip(old_rows, new_rows)):
        old_url = (old.get("url_video") or "").strip()
        new_url = (new.get("url_video") or "").strip()

        if old_url == new_url:
            continue

        supabase_id = idx + 1
        valor = new_url if new_url else None
        marca = new.get("marca", "")
        modelo = new.get("modelo", "")

        if dry_run:
            print(f"[id={supabase_id}] {marca} {modelo}")
            print(f"   OLD: {old_url or '(vacio)'}")
            print(f"   NEW: {valor if valor is not None else '(NULL)'}")
            cambios += 1
            continue

        resp = (
            supabase.table(TABLE_NAME)
            .update({"url_video": valor})
            .eq("id", supabase_id)
            .execute()
        )
        print(f"[id={supabase_id}] {marca} {modelo} -> {valor}")
        cambios += len(resp.data)

    if dry_run:
        print(f"\nDRY RUN: {cambios} filas se actualizarian. Corre sin --dry-run para aplicar.")
    else:
        print(f"\nListo. {cambios} filas actualizadas.")


if __name__ == "__main__":
    main()
