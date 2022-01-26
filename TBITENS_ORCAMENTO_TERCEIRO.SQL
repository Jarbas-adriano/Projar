-- Create table
create table TBITENS_ORCAMENTO_TERCEIRO
(
  COD_SERVICO_TERC   NUMBER not null,
  COD_ORCAMENTO      NUMBER not null,
  COD_EMPRESA        NUMBER not null,
  COD_CLIENTE        NUMBER not null,
  VALOR              NUMBER(6,2),
  QUANTIDADE_SERVICO NUMBER
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
alter table TBITENS_ORCAMENTO_TERCEIRO
  add primary key (COD_SERVICO_TERC, COD_ORCAMENTO, COD_EMPRESA, COD_CLIENTE)
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
