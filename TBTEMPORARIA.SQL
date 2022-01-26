-- Create table
create table TBTEMPORARIA
(
  CODTERMINAL   VARCHAR2(30) not null,
  COD_APLICACAO VARCHAR2(30) not null,
  TIPOREGISTRO  VARCHAR2(1) not null,
  CHAVE         VARCHAR2(250) not null,
  ORDEM         VARCHAR2(250),
  ALFA1         VARCHAR2(60),
  ALFA2         VARCHAR2(60),
  ALFA3         VARCHAR2(60),
  ALFA4         VARCHAR2(60),
  ALFA5         VARCHAR2(60),
  ALFA6         VARCHAR2(60),
  ALFA7         VARCHAR2(60),
  ALFA8         VARCHAR2(60),
  ALFA9         VARCHAR2(60),
  ALFA10        VARCHAR2(60),
  ALFA11        VARCHAR2(60),
  ALFA12        VARCHAR2(60),
  ALFA13        VARCHAR2(60),
  ALFA14        VARCHAR2(60),
  ALFA15        VARCHAR2(60),
  ALFA16        VARCHAR2(60),
  ALFA17        VARCHAR2(60),
  ALFA18        VARCHAR2(60),
  ALFA19        VARCHAR2(60),
  ALFA20        VARCHAR2(60),
  NUM1          NUMBER(16,4),
  NUM2          NUMBER(16,4),
  NUM3          NUMBER(16,4),
  NUM4          NUMBER(16,4),
  NUM5          NUMBER(16,4),
  NUM6          NUMBER(16,4),
  NUM7          NUMBER(16,4),
  NUM8          NUMBER(16,4),
  NUM9          NUMBER(16,4),
  NUM10         NUMBER(16,4),
  NUM11         NUMBER(16,4),
  NUM12         NUMBER(16,4),
  NUM13         NUMBER(16,4),
  NUM14         NUMBER(16,4),
  NUM15         NUMBER(16,4),
  NUM16         NUMBER(16,4),
  NUM17         NUMBER(16,4),
  NUM18         NUMBER(16,4),
  NUM19         NUMBER(16,4),
  NUM20         NUMBER(16,4),
  NUM21         NUMBER(16,4),
  NUM22         NUMBER(16,4),
  NUM23         NUMBER(16,4),
  NUM24         NUMBER(16,4),
  NUM25         NUMBER(16,4),
  NUM26         NUMBER(16,4),
  NUM27         NUMBER(14,2),
  NUM28         NUMBER(14,2),
  NUM29         NUMBER(14,2),
  NUM30         NUMBER(14,2),
  DATA1         DATE,
  DATA2         DATE,
  DATA3         DATE,
  DATA4         DATE,
  DATA5         DATE,
  DATA6         DATE,
  DATA7         DATE,
  DATA8         DATE,
  DATA9         DATE,
  DATA10        DATE,
  ALFA99        VARCHAR2(250),
  ALFA98        VARCHAR2(999),
  NUM31         NUMBER(14,2),
  NUM32         NUMBER(14,2),
  NUM33         NUMBER(14,2),
  NUM34         NUMBER(14,2),
  NUM35         NUMBER(14,2),
  NUM36         NUMBER(14,2),
  NUM37         NUMBER(14,2),
  NUM38         NUMBER(14,2),
  NUM39         NUMBER(14,2),
  NUM40         NUMBER(14,2)
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
alter table TBTEMPORARIA
  add constraint TBTEMPORARIA1 primary key (CODTERMINAL, COD_APLICACAO, TIPOREGISTRO, CHAVE)
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
