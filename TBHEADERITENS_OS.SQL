-- Create table
create table TBHEADERITENS_OS
(
  COD_SERVICO           NUMBER not null,
  COD_OS                NUMBER not null,
  COD_EMPRESA           NUMBER not null,
  COD_CLIENTE           NUMBER not null,
  VALOR_SERV_INDIVIDUAL NUMBER(6,2),
  QUANTIDADE_SERVICO    NUMBER,
  TEM_SERV_TERCEIRO     VARCHAR2(1),
  VALOR_SERV_TERCEIRO   NUMBER(6,2),
  COD_SERVICO_TERCEIRO  NUMBER
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
alter table TBHEADERITENS_OS
  add primary key (COD_SERVICO, COD_OS, COD_EMPRESA, COD_CLIENTE)
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
alter table TBHEADERITENS_OS
  add foreign key (COD_SERVICO)
  references TBSERVICOS (COD_SERVICO);
alter table TBHEADERITENS_OS
  add foreign key (COD_OS, COD_EMPRESA, COD_CLIENTE)
  references TBHEADERORDEM_SERVICO (COD_OS, COD_EMPRESA, COD_CLIENTE);
