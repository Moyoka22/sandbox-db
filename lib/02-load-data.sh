#!/usr/bin/env -S bash -eu

DATA_FILEPATH="$(mktemp)"
INPUT_DATA_FILEPATH="$(mktemp)"
URL='https://raw.githubusercontent.com/datasets/world-cities/master/data/world-cities.csv'

curl -sSL "${URL}" > "${DATA_FILEPATH}"

cat <(awk 'NR <= 1' $DATA_FILEPATH | tr -d '"') <(awk 'NR > 1' $DATA_FILEPATH) > $INPUT_DATA_FILEPATH

psql -v ON_ERROR_STOP=1 --username postgres --dbname "${POSTGRES_DB}" <<-EOSQL
\copy "public"."cities" ($(head -1 $INPUT_DATA_FILEPATH)) FROM ${INPUT_DATA_FILEPATH} WITH delimiter ',' CSV HEADER;
EOSQL

