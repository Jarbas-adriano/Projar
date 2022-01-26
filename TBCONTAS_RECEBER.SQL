-- Create table
create table TBCONTAS_RECEBER
(
  COD_OS                  NUMBER not null,
  COD_EMPRESA             NUMBER not null,
  COD_CLIENTE             NUMBER not null,
  COD_TP_PAGAMENTO        NUMBER not null,
  TOTAL_PARCELA           NUMBER(6,2),
  SITUACAO                VARCHAR2(1),
  COD_CONDICAO_PAGAMENTO  NUMBER,
  DATA_PAGAMENTO          DATE,
  COD_BANCO_RECEBIMENTO   NUMBER,
  COD_AGENCIA_RECEBIMENTO NUMBER,
  COD_CONTA_RECEBIMENTO   NUMBER,
  OBSERVACAO              VARCHAR2(30),
  SEQUENCIA               NUMBER not null,
  DATA_VENCIMENTO         DATE,
  VALOR_REAL_RECEBIDO     NUMBER(6,2)
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBCONTAS_RECEBER
  add primary key (COD_OS, COD_EMPRESA, COD_CLIENTE, SEQUENCIA)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TBCONTAS_RECEBER
  add foreign key (COD_TP_PAGAMENTO)
  references TBTIPO_PAGAMENTO (COD_TP_PAGAMENTO);
alter table TBCONTAS_RECEBER
  add foreign key (COD_OS, COD_EMPRESA, COD_CLIENTE)
  references TBHEADERORDEM_SERVICO (COD_OS, COD_EMPRESA, COD_CLIENTE);
