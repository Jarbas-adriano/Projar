-- Create table
create table TBUSUARIO
(
  COD_EMPRESA   NUMBER not null,
  COD_USUARIO   NUMBER not null,
  CPF           VARCHAR2(15),
  NOME          VARCHAR2(50),
  LOGIN         VARCHAR2(20) not null,
  SENHA         VARCHAR2(12),
  EMAIL         VARCHAR2(50),
  TIPO_USUARIO  VARCHAR2(1),
  DATA_CADASTRO DATE,
  SITUACAO      VARCHAR2(1),
  OBSERVACAO    VARCHAR2(2000),
  COD_FUNCAO    NUMBER,
  PODE_EXCLUIR  VARCHAR2(1) default 'S'
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
alter table TBUSUARIO
  add primary key (COD_EMPRESA, COD_USUARIO)
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
alter table TBUSUARIO
  add foreign key (COD_EMPRESA)
  references TBEMPRESA (COD_EMPRESA);
