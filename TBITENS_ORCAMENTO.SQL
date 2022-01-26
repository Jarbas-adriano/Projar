-- Create table
create table TBITENS_ORCAMENTO
(
  COD_SERVICO           NUMBER not null,
  COD_ORCAMENTO         NUMBER not null,
  COD_EMPRESA           NUMBER not null,
  COD_CLIENTE           NUMBER not null,
  VALOR_SERV_INDIVIDUAL NUMBER(6,2),
  QUANTIDADE_SERVICO    NUMBER,
  TEM_SERV_TERCEIRO     VARCHAR2(1),
  VALOR_SERV_TERCEIRO   NUMBER(6,2),
  COD_SERVICO_TERCEIRO  NUMBER,
  QTDE_SERV_TERCEIRO    NUMBER
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
alter table TBITENS_ORCAMENTO
  add primary key (COD_SERVICO, COD_ORCAMENTO, COD_EMPRESA, COD_CLIENTE)
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
