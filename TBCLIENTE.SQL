-- Create table
create table TBCLIENTE
(
  COD_EMPRESA             NUMBER not null,
  COD_CLIENTE             NUMBER not null,
  COD_CIDADE              NUMBER not null,
  NOME_NOME_FANTASIA      VARCHAR2(50),
  RAZAO_SOCIAL            VARCHAR2(50),
  CPF                     VARCHAR2(14),
  CNPJ                    VARCHAR2(18),
  TIPO_PESSOA             VARCHAR2(1),
  ENDERECO                VARCHAR2(200),
  NUMERO                  NUMBER,
  BAIRRO                  VARCHAR2(50),
  COMPLEMENTO             VARCHAR2(50),
  CEP                     VARCHAR2(9),
  RAMO_ATIVIDADE          VARCHAR2(50),
  DATA_CADASTRO           DATE,
  EMAIL                   VARCHAR2(50),
  COD_BANCO               VARCHAR2(30) not null,
  COD_AGENCIA             NUMBER,
  COD_CONTA_BANCO         NUMBER,
  OBSERVACAO              VARCHAR2(2000),
  REGISTRO_JUNTA          VARCHAR2(50),
  QUANTIDADE_FUNCIONARIOS NUMBER,
  CAPITAL_REGISTRADO      NUMBER(7,2),
  INSCRICAO_ESTADUAL      VARCHAR2(9),
  TELEFONE_CELULAR        VARCHAR2(30),
  TELEFONE_FIXO           VARCHAR2(30),
  DATA_NASCIMENTO         DATE,
  FACEBOOK                VARCHAR2(50),
  WHATS_APP               VARCHAR2(15),
  CONTATO_PRINCIPAL       VARCHAR2(50),
  SITUACAO                VARCHAR2(1)
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
alter table TBCLIENTE
  add primary key (COD_EMPRESA, COD_CLIENTE)
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
alter table TBCLIENTE
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
