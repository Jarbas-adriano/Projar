-- Create table
create table TBCIDADES
(
  COD_IBGE  NUMBER not null,
  NOME      VARCHAR2(50),
  UF        VARCHAR2(2),
  PAIS      VARCHAR2(50),
  AREA      NUMBER,
  POPULACAO NUMBER,
  COD_UF    NUMBER
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
alter table TBCIDADES
  add primary key (COD_IBGE)
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
