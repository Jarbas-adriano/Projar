-- Create table
create table TBDESPESAS
(
  COD_EMPRESA         NUMBER not null,
  COD_DESPESA         NUMBER not null,
  NOME_DESPESA        VARCHAR2(50),
  SITUACAO            VARCHAR2(1),
  OBSERVACAO          VARCHAR2(2000),
  DATA_PAGAMENTO_BASE DATE,
  VALOR               NUMBER,
  QTDE_PARCELAS       NUMBER
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
alter table TBDESPESAS
  add primary key (COD_EMPRESA, COD_DESPESA)
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
alter table TBDESPESAS
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
