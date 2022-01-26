-- Create table
create table TBCOGPASSAPARAMETRO
(
  COD_TERMINAL    VARCHAR2(30) not null,
  COD_APLIC_CHAMA VARCHAR2(20) not null,
  NOME_PARAM      VARCHAR2(50),
  PARAM_C1        VARCHAR2(50),
  PARAM_C2        VARCHAR2(50),
  PARAM_C3        VARCHAR2(50),
  PARAM_C4        VARCHAR2(50),
  PARAM_C5        VARCHAR2(50),
  PARAM_C6        VARCHAR2(50),
  PARAM_C7        VARCHAR2(50),
  PARAM_C8        VARCHAR2(50),
  PARAM_C9        VARCHAR2(50),
  PARAM_C10       VARCHAR2(50),
  PARAM_N1        NUMBER(16,4),
  PARAM_N2        NUMBER(16,4),
  PARAM_N3        NUMBER(16,4),
  PARAM_N4        NUMBER(16,4),
  PARAM_N5        NUMBER(16,4),
  PARAM_N6        NUMBER(16,4),
  PARAM_N7        NUMBER(16,4),
  PARAM_N8        NUMBER(16,4),
  PARAM_N9        NUMBER(16,4),
  PARAM_N10       NUMBER(16,4),
  PARAM_N11       NUMBER(16,4),
  PARAM_N12       NUMBER(16,4),
  PARAM_N13       NUMBER(16,4),
  PARAM_N14       NUMBER(16,4),
  PARAM_N15       NUMBER(16,4),
  PARAM_N16       NUMBER(16,4),
  PARAM_N17       NUMBER(16,4),
  PARAM_N18       NUMBER(16,4),
  PARAM_N19       NUMBER(16,4),
  PARAM_N20       NUMBER(16,4),
  PARAM_D1        DATE,
  PARAM_D2        DATE,
  PARAM_D3        DATE,
  PARAM_D4        DATE,
  PARAM_D5        DATE,
  PARAM_D6        DATE,
  PARAM_D7        DATE,
  PARAM_D8        DATE,
  PARAM_D9        DATE,
  PARAM_D10       DATE,
  PARAM_N21       NUMBER(16,4),
  PARAM_N22       NUMBER(16,4),
  PARAM_N23       NUMBER(16,4),
  PARAM_N24       NUMBER(16,4),
  PARAM_N25       NUMBER(16,4),
  PARAM_N26       NUMBER(16,4),
  PARAM_N27       NUMBER(16,4),
  PARAM_N28       NUMBER(16,4),
  PARAM_N29       NUMBER(16,4),
  PARAM_N30       NUMBER(16,4),
  PARAM_D11       DATE,
  PARAM_D12       DATE,
  PARAM_D13       DATE,
  PARAM_D14       DATE,
  PARAM_D15       DATE,
  PARAM_D16       DATE,
  PARAM_D17       DATE,
  PARAM_D18       DATE,
  PARAM_D19       DATE,
  PARAM_D20       DATE,
  PARAM_N31       NUMBER(16,4),
  PARAM_N32       NUMBER(16,4),
  PARAM_N33       NUMBER(16,4),
  PARAM_N34       NUMBER(16,4),
  PARAM_N35       NUMBER(16,4),
  PARAM_C11       VARCHAR2(100),
  PARAM_C12       VARCHAR2(100),
  PARAM_C13       VARCHAR2(100),
  PARAM_C14       VARCHAR2(100),
  PARAM_C15       VARCHAR2(100),
  PARAM_C16       VARCHAR2(100),
  PARAM_C17       VARCHAR2(100),
  PARAM_C18       VARCHAR2(100),
  PARAM_C19       VARCHAR2(100),
  PARAM_C20       VARCHAR2(100),
  PARAM_C21       VARCHAR2(100),
  PARAM_C22       VARCHAR2(100),
  PARAM_C23       VARCHAR2(100),
  PARAM_C24       VARCHAR2(100),
  PARAM_C25       VARCHAR2(100),
  PARAM_N36       NUMBER(16,4),
  PARAM_N37       NUMBER(16,4),
  PARAM_N38       NUMBER(16,4),
  PARAM_N39       NUMBER(16,4),
  PARAM_N40       NUMBER(16,4),
  PARAM_N41       NUMBER(16,4),
  PARAM_N42       NUMBER(16,4),
  PARAM_N43       NUMBER(16,4),
  PARAM_N44       NUMBER(16,4),
  PARAM_N45       NUMBER(16,4),
  PARAM_N46       NUMBER(16,4),
  PARAM_N47       NUMBER(16,4),
  PARAM_N48       NUMBER(16,4),
  PARAM_N49       NUMBER(16,4),
  PARAM_N50       NUMBER(16,4),
  PARAM_N51       NUMBER(16,4),
  PARAM_N52       NUMBER(16,4),
  PARAM_N53       NUMBER(16,4),
  PARAM_N54       NUMBER(16,4),
  PARAM_N55       NUMBER(16,4),
  PARAM_N56       NUMBER(16,4),
  PARAM_N57       NUMBER(16,4),
  PARAM_N58       NUMBER(16,4),
  PARAM_N59       NUMBER(16,4),
  PARAM_N60       NUMBER(16,4),
  PARAM_C26       VARCHAR2(400),
  PARAM_C100      VARCHAR2(2000)
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
alter table TBCOGPASSAPARAMETRO
  add constraint TBCOGPASSAPARAMETRO1 primary key (COD_TERMINAL, COD_APLIC_CHAMA)
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
