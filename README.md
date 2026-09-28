# Infosys Database Scripts

This project creates the `infosys` schema and an `employee` table, then inserts a sample employee record.

## Prerequisites

- PostgreSQL must be installed and the database server must be running.
- `psql` must be available on `PATH`. On Windows Git Bash, the script also checks for PostgreSQL 18 at `/c/Program Files/PostgreSQL/18/bin/psql.exe`.
- The configured PostgreSQL user must have permission to create the schema and table and insert rows.

## Run

From this directory, run the script in Bash:

```bash
./runsql.sh
```

The script runs `SQL/SQL1.sql` followed by `SQL/SQL2.sql`. It stops if either SQL file fails. You can also run it from another working directory; the SQL paths are resolved relative to the script.

## Connection Settings

Set environment variables before running the script to override the connection defaults:

| Variable | Default | Description |
| --- | --- | --- |
| `DB_HOST` | `localhost` | PostgreSQL server host |
| `DB_USER` | `postgres` | PostgreSQL user |
| `DB_NAME` | `postgres` | Database to connect to |
| `DB_PASSWORD` | `root` | Password for the PostgreSQL user |

For example:

```bash
export DB_HOST=localhost
export DB_USER=postgres
export DB_NAME=postgres
export DB_PASSWORD='your_password'
./runsql.sh
```

The password is passed to `psql` through `PGPASSWORD`; it is not written into the SQL files. The default password `root` is intended only as a local example. Set `DB_PASSWORD` to the password configured for your PostgreSQL user, and avoid committing real credentials.

## SQL Files

- `SQL/SQL1.sql` creates the `infosys` schema and `infosys.employee` table if they do not already exist.
- `SQL/SQL2.sql` inserts the sample employee (`12345`, `Soumi`, `s123@gmail.com`) and skips the insert if that employee ID already exists.
