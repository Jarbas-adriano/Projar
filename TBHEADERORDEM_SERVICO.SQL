-- Create table
create table TBHEADERORDEM_SERVICO
(
  COD_OS                     NUMBER not null,
  COD_EMPRESA                NUMBER not null,
  COD_CLIENTE                NUMBER not null,
  SITUACAO                   VARCHAR2(1),
  VALOR_TOTAL                NUMBER(6,2),
  VALOR_DESCONTO             NUMBER(6,2),
  DATA_INICIO                DATE,
  DATA_PREVISAO_FIM          DATE,
  OBSERVACOES                VARCHAR2(2000),
  TEM_ORCAMENTO_RELACIONADO  VARCHAR2(1),
  COD_ORCAMENTO_RELAC        NUMBER,
  MOTIVO_DESCONTO            VARCHAR2(2000),
  USUARIO_LIBEROU_DESC       NUMBER,
  USUARIO_EXE                VARCHAR2(50),
  DATA_TERMINO               DATE,
  NOME_NOME_FANTASIA_CLIENTE VARCHAR2(50),
  COD_USUARIO_RESPONSAVEL    NUMBER,
  PORCENTAGEM_DESCONTO       NUMBER(6,2)
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
-- Add comments to the columns 
comment on column TBHEADERORDEM_SERVICO.SITUACAO
  is '''A'' - ABERTO , ''F''- FINALIZADA';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBHEADERORDEM_SERVICO
  add primary key (COD_OS, COD_EMPRESA, COD_CLIENTE)
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
alter table TBHEADERORDEM_SERVICO
  add foreign key (COD_EMPRESA, COD_CLIENTE)
  references TBCLIENTE (COD_EMPRESA, COD_CLIENTE);
