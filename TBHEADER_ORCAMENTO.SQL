-- Create table
create table TBHEADER_ORCAMENTO
(
  COD_ORCAMENTO              NUMBER not null,
  COD_EMPRESA                NUMBER not null,
  COD_CLIENTE                NUMBER not null,
  DESCRICAO                  VARCHAR2(50),
  SITUACAO                   VARCHAR2(1),
  DATA_INICIAL_VIGENCIA      DATE,
  DATA_FINAL_VIGENCIA        DATE,
  OBSERVACOES                VARCHAR2(2000),
  VALOR_TOTAL                NUMBER(6,2),
  VALOR_DESCONTO             NUMBER(6,2),
  DATA_CADASTRO              DATE,
  MOTIVO_DESCONTO            VARCHAR2(2000),
  VALOR_SERV_TERCEIRO        NUMBER(6,2),
  USUA_RESPONSAVEL           VARCHAR2(50),
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table TBHEADER_ORCAMENTO
  add primary key (COD_ORCAMENTO, COD_EMPRESA, COD_CLIENTE)
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
alter table TBHEADER_ORCAMENTO
  add foreign key (COD_EMPRESA, COD_CLIENTE)
  references TBCLIENTE (COD_EMPRESA, COD_CLIENTE);
