-- Create table
create table TBCONDICAO_PAGAMENTO
(
  COD_EMPRESA       NUMBER not null,
  COD_CONDICAO_PAG  NUMBER not null,
  NOME_CONDICAO_PAG VARCHAR2(50),
  SITUACAO          VARCHAR2(1),
  OBSERVACOES       VARCHAR2(2000)
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
alter table TBCONDICAO_PAGAMENTO
  add primary key (COD_EMPRESA, COD_CONDICAO_PAG)
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
alter table TBCONDICAO_PAGAMENTO
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
