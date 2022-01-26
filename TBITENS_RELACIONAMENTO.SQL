-- Create table
create table TBITENS_RELACIONAMENTO
(
  COD_ORCAMENTO        NUMBER not null,
  COD_EMPRESA          NUMBER not null,
  COD_CLIENTE          NUMBER not null,
  COD_SERVICO          NUMBER not null,
  VALOR_INDIVIDUAL     NUMBER(6,2),
  TEM_SERV_TERCEIRO    VARCHAR2(1),
  COD_SERVICO_TERCEIRO NUMBER,
  VLR_SERVICO_TERCEIRO NUMBER(6,2),
  QUANTIDADE           VARCHAR2(30)
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
alter table TBITENS_RELACIONAMENTO
  add primary key (COD_ORCAMENTO, COD_EMPRESA, COD_CLIENTE, COD_SERVICO)
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
alter table TBITENS_RELACIONAMENTO
  add foreign key (COD_SERVICO)
  references TBSERVICOS (COD_SERVICO);
alter table TBITENS_RELACIONAMENTO
  add foreign key (COD_ORCAMENTO, COD_EMPRESA, COD_CLIENTE)
  references TBHEADER_ORCAMENTO (COD_ORCAMENTO, COD_EMPRESA, COD_CLIENTE);
