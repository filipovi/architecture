BEGIN TRANSACTION;
    CREATE ROLE "cw" ENCRYPTED PASSWORD 'cw' LOGIN NOCREATEROLE NOCREATEDB NOSUPERUSER CONNECTION LIMIT -1;
    GRANT ALL ON database "cw" TO "cw";
COMMIT;
