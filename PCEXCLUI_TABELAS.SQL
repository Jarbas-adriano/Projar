CREATE OR REPLACE PROCEDURE PCEXCLUI_TABELAS IS
BEGIN
   BEGIN
      FOR I IN (SELECT 'drop table ' || TABLE_NAME || ' cascade constraints' TBL
                FROM USER_TABLES)
      LOOP
         EXECUTE IMMEDIATE I.TBL;
      END LOOP;
   END;
END;
/
