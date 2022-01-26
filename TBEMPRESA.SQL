-- Create table
create table TBEMPRESA
(
  COD_EMPRESA      NUMBER not null,
  CNPJ             VARCHAR2(14) not null,
  RAZAO_SOCIAL     VARCHAR2(50),
  NOME_FANTASIA    VARCHAR2(50),
  ENDERECO         VARCHAR2(50),
  CIDADE           VARCHAR2(50),
  BAIRRO           VARCHAR2(50),
  NUMERO           NUMBER,
  RAMO_ATIVIDADE   VARCHAR2(20),
  NOME_RESPONSAVEL VARCHAR2(50),
  OBSERVACAO       VARCHAR2(2000),
  DATA_CADASTRO    DATE,
  IMG_LOGO         BLOB,
  UF               VARCHAR2(2),
  TELEFONE         VARCHAR2(15)
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
alter table TBEMPRESA
  add primary key (COD_EMPRESA)
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
