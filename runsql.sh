#!/bin/bash

# Database credentials



set -euo pipefail
DB_HOST="${DB_HOST:-localhost}"
DB_USER="${DB_USER:-postgres}"
DB_NAME="${DB_NAME:-postgres}"
SQL_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/SQL" && pwd)"

if ! command -v psql >/dev/null 2>&1; then
	printf 'Error: psql is not installed or is not on PATH in this Bash environment.\n' >&2
	exit 127
fi

psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -v ON_ERROR_STOP=1 -f "$SQL_DIR/SQL1.sql"
psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -v ON_ERROR_STOP=1 -f "$SQL_DIR/SQL2.sql"

