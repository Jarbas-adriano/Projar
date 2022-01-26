-- Create table
create table TBTIPO_PAGAMENTO
(
  COD_EMPRESA             NUMBER not null,
  COD_TP_PAGAMENTO        NUMBER not null,
  NOME_TP_PAGAMENTO       VARCHAR2(20),
  SITUACAO                VARCHAR2(1),
  QTDE_DIAS_ENTRE_FATURAS NUMBER
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
alter table TBTIPO_PAGAMENTO
  add primary key (COD_TP_PAGAMENTO)
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
alter table TBTIPO_PAGAMENTO
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
