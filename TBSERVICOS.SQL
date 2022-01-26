-- Create table
create table TBSERVICOS
(
  COD_EMPRESA           NUMBER not null,
  COD_SERVICO           NUMBER not null,
  NOME_SERVICO          VARCHAR2(50),
  SITUACAO              VARCHAR2(1),
  VALOR                 NUMBER(6,2),
  TEMPO_DURACAO_BASE    NUMBER(4,2),
  OBSERVACAO            VARCHAR2(2000),
  TEM_SERVI_OS_TERCEIRO VARCHAR2(1)
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
alter table TBSERVICOS
  add primary key (COD_SERVICO)
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
alter table TBSERVICOS
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
