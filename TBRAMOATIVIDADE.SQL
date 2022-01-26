-- Create table
create table TBRAMOATIVIDADE
(
  RAMOATIVIDADE VARCHAR2(7) not null,
  NOME          VARCHAR2(100),
  NOME_ABREV    VARCHAR2(20)
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
alter table TBRAMOATIVIDADE
  add constraint TBRAMOATIVIDADE1 primary key (RAMOATIVIDADE)
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
