CREATE OR REPLACE PROCEDURE PCCONS_USUARIO_X_PRODUTIVIDADE(PCOD_TERMINAL  VARCHAR2,
                                                           PCOD_APLICACAO VARCHAR2,
                                                           PCOD_EMPRESA   NUMBER,
                                                           PCOD_USUARIO   NUMBER,
                                                           PDATA_INICIAL  DATE,
                                                           PDATA_FINAL    DATE) IS
   IQTDE_ORCAMENTO         NUMBER;
   IQTDE_ORCAMENTO_EFETIVO NUMBER;
   IQTDE_OS_FINALIZADAS    NUMBER;
   IQTDE_SERVICOS          NUMBER;
BEGIN
   IQTDE_ORCAMENTO         := 0;
   IQTDE_ORCAMENTO_EFETIVO := 0;
   IQTDE_OS_FINALIZADAS    := 0;
   IQTDE_SERVICOS          := 0;

   DELETE FROM TBTEMPORARIA X
   WHERE X.CODTERMINAL = PCOD_TERMINAL AND
         X.COD_APLICACAO = PCOD_APLICACAO;

   FOR VUSUARIO IN (SELECT ROWNUM NUM_LINHA, A.*
                    FROM TBUSUARIO A
                    WHERE (A.COD_USUARIO = PCOD_USUARIO OR PCOD_USUARIO = 0) AND
                          A.COD_EMPRESA = PCOD_EMPRESA AND 
                          A.SITUACAO = 'A'             )
   LOOP
      -- QTDE DE OR�AMENTOS
      SELECT COUNT(1)
      INTO IQTDE_ORCAMENTO
      FROM TBHEADER_ORCAMENTO A
      WHERE A.COD_EMPRESA = VUSUARIO.COD_EMPRESA AND
            A.DATA_FINAL_VIGENCIA >= PDATA_INICIAL AND
            A.DATA_INICIAL_VIGENCIA <= PDATA_FINAL AND
            A.COD_USUARIO_RESPONSAVEL = VUSUARIO.COD_USUARIO;
   
      --- OR�AMENTOS QUE VIRARAM PRESTA��O DE SERVI�O     
      SELECT COUNT(1)
      INTO IQTDE_ORCAMENTO_EFETIVO
      FROM TBHEADERORDEM_SERVICO B, TBHEADER_ORCAMENTO C
      WHERE B.COD_EMPRESA = VUSUARIO.COD_EMPRESA AND
            B.COD_ORCAMENTO_RELAC IS NOT NULL AND
            B.DATA_INICIO >= PDATA_INICIAL AND
            B.DATA_TERMINO <= PDATA_FINAL AND
            C.COD_ORCAMENTO = B.COD_ORCAMENTO_RELAC AND
            C.COD_EMPRESA = VUSUARIO.COD_EMPRESA AND
            C.COD_USUARIO_RESPONSAVEL = VUSUARIO.COD_USUARIO;
   
      --- QTDE DE ORDEM DE SERVI�O REALIZADA (FINALIZADA)
      SELECT COUNT(1)
      INTO IQTDE_OS_FINALIZADAS
      FROM TBHEADERORDEM_SERVICO B
      WHERE B.COD_EMPRESA = VUSUARIO.COD_EMPRESA AND
            B.COD_USUARIO_RESPONSAVEL = VUSUARIO.COD_USUARIO AND
            B.DATA_INICIO >= PDATA_INICIAL AND
            B.DATA_TERMINO <= PDATA_FINAL AND
            B.SITUACAO = 'F';
      --- QTDE DE SERVI�OS REALIZADOS NO PERIODO
      SELECT COUNT(1)
      INTO IQTDE_SERVICOS
      FROM TBHEADERITENS_OS A
      WHERE A.COD_OS IN (SELECT B.COD_OS
                         FROM TBHEADERORDEM_SERVICO B
                         WHERE B.COD_EMPRESA = PCOD_EMPRESA AND
                               B.COD_USUARIO_RESPONSAVEL = VUSUARIO.COD_USUARIO AND
                               B.DATA_INICIO >= PDATA_INICIAL AND
                               B.DATA_TERMINO <= PDATA_FINAL AND
                               B.SITUACAO = 'F') AND
            A.COD_EMPRESA = PCOD_EMPRESA;
   
      INSERT INTO TBTEMPORARIA
         (CODTERMINAL, COD_APLICACAO, TIPOREGISTRO, CHAVE, NUM1, NUM2, NUM3, NUM4, NUM5, NUM6)
      VALUES
         (PCOD_TERMINAL, PCOD_APLICACAO, 'C', VUSUARIO.NUM_LINHA, IQTDE_ORCAMENTO, IQTDE_ORCAMENTO_EFETIVO,
          IQTDE_OS_FINALIZADAS, IQTDE_SERVICOS, VUSUARIO.COD_EMPRESA, VUSUARIO.COD_USUARIO);
   END LOOP;
END;
/
