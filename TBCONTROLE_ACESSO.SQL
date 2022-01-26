-- Create table
create table TBCONTROLE_ACESSO
(
  COD_USUARIO                    NUMBER not null,
  CADASTRO_CLIENTES              VARCHAR2(1) default 'N',
  CADASTRO_USUARIO               VARCHAR2(1) default 'N',
  CADASTRO_SERVICO               VARCHAR2(1) default 'N',
  CADASTRO_TIPOS_PAGAMENTO       VARCHAR2(1) default 'N',
  CADASTRO_DESPESAS              VARCHAR2(1) default 'N',
  CADASTRO_CONDICOES_PAG         VARCHAR2(1) default 'N',
  CADASTRO_TERCEIROS             VARCHAR2(1) default 'N',
  CADASTRO_EMPRESA               VARCHAR2(1) default 'N',
  CADASTRO_FUNCAO                VARCHAR2(1) default 'N',
  CONSULTA_SALDO_DEVEDOR         VARCHAR2(1) default 'N',
  CONSULTA_CONTAS_A_PAGAR        VARCHAR2(1) default 'N',
  CONSULTA_USUARIO_PRODUTIVIDADE VARCHAR2(1) default 'N',
  CONSULTA_CLIENTES_XFATURAS     VARCHAR2(1) default 'N',
  CONSULTA_FATURAMENTO           VARCHAR2(1) default 'N',
  GERA_ORCAMENTO                 VARCHAR2(1) default 'N',
  GERA_PRESTACAO_SERV            VARCHAR2(1) default 'N',
  AGENDA_CONTAS_PAGAR            VARCHAR2(1) default 'N',
  BAIXA_SALDO_DEVEDOR            VARCHAR2(1) default 'N',
  MANUTENCAO_EM_TITULOS          VARCHAR2(1) default 'N',
  COD_EMPRESA                    NUMBER not null,
  BAIXA_CONTAS_PAGAR             VARCHAR2(1) default 'N',
  CONSULTA_OS_PRODUCAO           VARCHAR2(1) default 'N',
  EMITE_RELATORIOS               VARCHAR2(1) default 'N',
  FAZ_BACKUP                     VARCHAR2(1) default 'N'
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
alter table TBCONTROLE_ACESSO
  add primary key (COD_USUARIO, COD_EMPRESA)
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
