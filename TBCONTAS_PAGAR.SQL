-- Create table
create table TBCONTAS_PAGAR
(
  COD_EMPRESA     NUMBER not null,
  COD_DESPESA     NUMBER not null,
  VALOR_DESPESA   NUMBER(16,2),
  SITUACAO        VARCHAR2(1),
  DATA_PAGAMENTO  DATE,
  DATA_CADASTRO   DATE,
  SEQUENCIA       NUMBER not null,
  OBSERVACAO      VARCHAR2(2000),
  NUM_PARCELA     NUMBER,
  DATA_VENCIMENTO DATE not null,
  VALOR_REAL_PAGO NUMBER(16,2)
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
-- Add comments to the columns 
comment on column TBCONTAS_PAGAR.SITUACAO
  is '<P> Pago - <E> Pendente';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBCONTAS_PAGAR
  add primary key (COD_EMPRESA, COD_DESPESA, DATA_VENCIMENTO, SEQUENCIA)
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
alter table TBCONTAS_PAGAR
  add foreign key (COD_EMPRESA, COD_DESPESA)
  references TBDESPESAS (COD_EMPRESA, COD_DESPESA);
