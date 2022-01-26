-- Create table
create table TBTERCEIROS
(
  COD_EMPRESA   NUMBER not null,
  COD_TERCEIRO  NUMBER not null,
  NOME_FANTASIA VARCHAR2(50),
  CNPJ          VARCHAR2(18),
  SITUACAO      VARCHAR2(1),
  OBSERVACOES   VARCHAR2(2000),
  ENDERECO      VARCHAR2(50),
  COD_CIDADE    NUMBER,
  CEP           VARCHAR2(9),
  BAIRRO        VARCHAR2(50),
  NUMERO        NUMBER,
  RAZAO_SOCIAL  VARCHAR2(100)
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
alter table TBTERCEIROS
  add primary key (COD_EMPRESA, COD_TERCEIRO)
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
alter table TBTERCEIROS
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
