#!/bin/sh

psql -U postgres -c 'create database apibuilderdb' postgres
psql -U postgres -c 'create role api login PASSWORD NULL' postgres > /dev/null
psql -U postgres -c 'GRANT ALL ON DATABASE apibuilderdb TO api' postgres
psql -U postgres -c 'ALTER DATABASE apibuilderdb owner to api' postgres
psql -U postgres -c 'grant all on schema public to api' apibuilderdb
sem-apply --url postgresql://api@localhost/apibuilderdb

