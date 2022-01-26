-- Create table
create table TBSERVICOS2
(
  COD_SERVICO_TERCEIRO  NUMBER not null,
  COD_EMPRESA           NUMBER not null,
  COD_TERCEIRO          NUMBER not null,
  NOME_SERVICO_TERCEIRO VARCHAR2(50),
  SITUACAO              VARCHAR2(1),
  VALOR                 NUMBER(6,2),
  TEMPO_DURACAO_BASE    NUMBER,
  OBSERVACAO            VARCHAR2(2000)
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
alter table TBSERVICOS2
  add primary key (COD_SERVICO_TERCEIRO, COD_EMPRESA, COD_TERCEIRO)
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
alter table TBSERVICOS2
  add foreign key (COD_EMPRESA, COD_TERCEIRO)
  references TBTERCEIROS (COD_EMPRESA, COD_TERCEIRO);
