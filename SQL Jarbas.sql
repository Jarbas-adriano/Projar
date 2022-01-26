/*
CREATED		12/10/2020
MODIFIED		20/10/2020
PROJECT		
MODEL		
COMPANY		
AUTHOR		
VERSION		
DATABASE		ORACLE 10G 
*/


-- CREATE TYPES SECTION


-- CREATE TABLES SECTION


CREATE TABLE "TBCLIENTE" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CLIENTE" NUMBER NOT NULL ,
	"COD_CIDADE" NUMBER NOT NULL ,
	"NOME_NOME_FANTASIA" VARCHAR2 (50),
	"RAZAO_SOCIAL" VARCHAR2 (50),
	"CPF" VARCHAR2 (14),
	"CNPJ" VARCHAR2 (11),
	"TIPO_PESSOA" VARCHAR2 (1),
	"ENDERECO" VARCHAR2 (200),
	"NUMERO" NUMBER,
	"BAIRRO" VARCHAR2 (50),
	"COMPLEMENTO" VARCHAR2 (50),
	"CEP" VARCHAR2 (9),
	"RAMO_ATIVIDADE" VARCHAR2 (50),
	"DATA_CADASTRO" DATE,
	"EMAIL" VARCHAR2 (50),
	"COD_BANCO" VARCHAR2 (30) NOT NULL ,
	"COD_AGENCIA" NUMBER,
	"COD_CONTA_BANCO" NUMBER,
	"OBSERVACAO" VARCHAR2 (2000),
	"REGISTRO_JUNTA" VARCHAR2 (50),
	"QUANTIDADE_FUNCIONARIOS" NUMBER,
	"CAPITAL_REGISTRADO" NUMBER(7,2),
	"INSCRICAO_ESTADUAL" VARCHAR2 (9),
	"TELEFONE_CELULAR" VARCHAR2 (30),
	"TELEFONE_FIXO" VARCHAR2 (30),
	"DATA_NASCIMENTO" DATE,
	"FACEBOOK" VARCHAR2 (50),
	"WHATS_APP" VARCHAR2 (1),
	"CONTATO_PRINCIPAL" VARCHAR2 (50),
PRIMARY KEY ("COD_EMPRESA","COD_CLIENTE") 
) 
/

CREATE TABLE "TBEMPRESA" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"CNPJ" VARCHAR2 (14) NOT NULL ,
	"RAZAO_SOCIAL" VARCHAR2 (50),
	"NOME_FANTASIA" VARCHAR2 (50),
	"ENDERECO" VARCHAR2 (50),
	"CIDADE" VARCHAR2 (50),
	"BAIRRO" VARCHAR2 (50),
	"NUMERO" NUMBER,
	"RAMO_ATIVIDADE" VARCHAR2 (20),
	"NOME_RESPONSAVEL" VARCHAR2 (50),
	"OBSERVACAO" VARCHAR2 (2000),
	"DATA_CADASTRO" DATE,
PRIMARY KEY ("COD_EMPRESA") 
) 
/

CREATE TABLE "TBUSUARIO" (
	"COD_USUARIO" NUMBER NOT NULL ,
	"NOME" VARCHAR2 (50),
	"TIPO_USUARIO" VARCHAR2 (1),
	"LOGIN" VARCHAR2 (20),
	"SENHA" VARCHAR2 (20),
	"EMAIL" VARCHAR2 (50),
	"DATA_CADASTRO" DATE,
	"SITUACAO" VARCHAR2 (1),
	"OBSERVACAO" VARCHAR2 (2000),
	"FUNCAO" VARCHAR2 (50),
PRIMARY KEY ("COD_USUARIO") 
) 
/

CREATE TABLE "TBSERVICOS" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_SERVICO" NUMBER NOT NULL ,
	"NOME_SERVICO" VARCHAR2 (50),
	"SITUACAO" VARCHAR2 (1),
	"VALOR" NUMBER(6,2),
	"TEMPO_DURACAO_BASE" NUMBER(2,2),
	"OBSERVACAO" VARCHAR2 (2000),
	"TEM_SERVI_OS_TERCEIRO" VARCHAR2 (1),
PRIMARY KEY ("COD_SERVICO") 
) 
/

CREATE TABLE "TBTIPO_PAGAMENTO" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_TP_PAGAMENTO" NUMBER NOT NULL ,
	"NOME_TP_PAGAMENTO" VARCHAR2 (20),
	"SITUACAO" VARCHAR2 (1),
	"PRAZO1" NUMBER,
	"PRAZO2" NUMBER,
	"PRAZO3" VARCHAR2 (30),
PRIMARY KEY ("COD_TP_PAGAMENTO") 
) 
/

CREATE TABLE "TBDESPESAS" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_DESPESA" NUMBER NOT NULL ,
	"NOME_DESPESA" VARCHAR2 (50),
	"SITUACAO" VARCHAR2 (1),
	"OBSERVACAO" VARCHAR2 (2000),
	"DATA_PAGAMENTO_BASE" NUMBER,
PRIMARY KEY ("COD_EMPRESA","COD_DESPESA") 
) 
/

CREATE TABLE "TBCONDICAO_PAGAMENTO" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CONDICAO_PAG" NUMBER NOT NULL ,
	"NOME_CONDICAO_PAG" VARCHAR2 (50),
	"SITUACAO" VARCHAR2 (1),
	"OBSERVACOES" VARCHAR2 (2000),
PRIMARY KEY ("COD_EMPRESA","COD_CONDICAO_PAG") 
) 
/

CREATE TABLE "TBSERVICOS2" (
	"COD_SERVICO_TERCEIRO" NUMBER NOT NULL ,
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_TERCEIRO" NUMBER NOT NULL ,
	"COD_SERVICO" NUMBER NOT NULL ,
	"NOME_SERVICO_TERCEIRO" VARCHAR2 (50),
	"SITUACAO" VARCHAR2 (1),
	"VALOR" NUMBER(6,2),
	"TEMPO_DURACAO_BASE" NUMBER(2,2),
	"OBSERVACAO" VARCHAR2 (2000),
PRIMARY KEY ("COD_SERVICO_TERCEIRO","COD_EMPRESA","COD_TERCEIRO") 
) 
/

CREATE TABLE "TBTERCEIROS" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_TERCEIRO" NUMBER NOT NULL ,
	"NOME_TERCEIRO" VARCHAR2 (50),
	"CNPJ" VARCHAR2 (14),
	"SITUACAO" VARCHAR2 (1),
	"OBSERVACOES" VARCHAR2 (2000),
	"ENDERECO" VARCHAR2 (50),
	"CIDADE" VARCHAR2 (30),
	"CEP" VARCHAR2 (9),
	"BAIRRO" VARCHAR2 (50),
	"NUMERO" NUMBER,
PRIMARY KEY ("COD_EMPRESA","COD_TERCEIRO") 
) 
/

CREATE TABLE "TBHEADER_ORCAMENTO" (
	"COD_ORCAMENTO" NUMBER NOT NULL ,
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CLIENTE" NUMBER NOT NULL ,
	"DESCRICAO" VARCHAR2 (50),
	"SITUACAO" VARCHAR2 (1),
	"DATA_INICIAL_VIGENCIA" DATE,
	"DATA_FINAL_VIGENCIA" VARCHAR2 (30),
	"OBSERVACOES" VARCHAR2 (2000),
	"VALOR_TOTAL" NUMBER(6,2),
	"VALOR_DESCONTO" NUMBER(6,2),
	"DATA_CADASTRO" DATE,
	"MOTIVO_DESCONTO" VARCHAR2 (2000),
PRIMARY KEY ("COD_ORCAMENTO","COD_EMPRESA","COD_CLIENTE") 
) 
/

CREATE TABLE "TBITENS_RELACIONAMENTO" (
	"COD_ORCAMENTO" NUMBER NOT NULL ,
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CLIENTE" NUMBER NOT NULL ,
	"COD_SERVICO" NUMBER NOT NULL ,
	"VALOR_INDIVIDUAL" NUMBER(6,2),
	"TEM_SERV_TERCEIRO" VARCHAR2 (1),
	"COD_SERVICO_TERCEIRO" NUMBER,
	"VLR_SERVICO_TERCEIRO" NUMBER(6,2),
	"QUANTIDADE" VARCHAR2 (30),
PRIMARY KEY ("COD_ORCAMENTO","COD_EMPRESA","COD_CLIENTE","COD_SERVICO") 
) 
/

CREATE TABLE "TBHEADERORDEM_SERVICO" (
	"COD_OS" NUMBER NOT NULL ,
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CLIENTE" NUMBER NOT NULL ,
	"SITUACAO" VARCHAR2 (1),
	"VALOR_TOTAL" NUMBER(6,2),
	"VALOR_DESCONTO" NUMBER(6,2),
	"DATA_INICIO" DATE,
	"DATA_PREVISAO_FIM" DATE,
	"OBSERVACOES" VARCHAR2 (2000),
	"TEM_ORCAMENTO_RELACIONADO" VARCHAR2 (1),
	"COD_ORCAMENTO_RELAC" NUMBER,
	"MOTIVO_DESCONTO" VARCHAR2 (2000),
	"USUARIO_LIBEROU_DESC" NUMBER,
	"USUARIO_EXE" VARCHAR2 (50),
PRIMARY KEY ("COD_OS","COD_EMPRESA","COD_CLIENTE") 
) 
/

CREATE TABLE "TBHEADERITENS_OS" (
	"COD_SERVICO" NUMBER NOT NULL ,
	"COD_OS" NUMBER NOT NULL ,
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CLIENTE" NUMBER NOT NULL ,
	"VALOR_SERV_INDIVIDUAL" NUMBER(6,2),
	"QUANTIDADE_SERVICO" NUMBER,
	"TEM_SERV_TERCEIRO" VARCHAR2 (1),
	"VALOR_SERV_TERCEIRO" NUMBER(6,2),
	"COD_SERVICO_TERCEIRO" NUMBER,
PRIMARY KEY ("COD_SERVICO","COD_OS","COD_EMPRESA","COD_CLIENTE") 
) 
/

CREATE TABLE "TBCONTAS_RECEBER" (
	"COD_OS" NUMBER NOT NULL ,
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_CLIENTE" NUMBER NOT NULL ,
	"COD_TP_PAGAMENTO" NUMBER NOT NULL ,
	"TOTAL_RECEBER" NUMBER(6,2),
	"SITUACAO" VARCHAR2 (1),
	"COD_CONDICAO_PAGAMENTO" NUMBER,
	"PRAZO1" DATE,
	"PRAZO2" DATE,
	"PRAZO3" VARCHAR2 (30),
	"DATA_PAGAMENTO" DATE,
	"COD_BANCO_RECEBIMENTO" NUMBER,
	"COD_AGENCIA_RECEBIMENTO" NUMBER,
	"COD_CONTA_RECEBIMENTO" NUMBER,
	"OBSERVACAO" VARCHAR2 (30),
PRIMARY KEY ("COD_OS","COD_EMPRESA","COD_CLIENTE") 
) 
/

CREATE TABLE "TBCONTAS_PAGAR" (
	"COD_EMPRESA" NUMBER NOT NULL ,
	"COD_DESPESA" NUMBER NOT NULL ,
	"VALOR_DESPESA" VARCHAR2 (30),
	"SITUACAO" VARCHAR2 (1),
	"DATA_PAGAMENTO" DATE,
	"DATA_CADASTRO" DATE,
PRIMARY KEY ("COD_EMPRESA","COD_DESPESA") 
) 
/

CREATE TABLE "TBCONTROLE_ACESSO" (
	"COD_USUARIO" NUMBER NOT NULL ,
	"CADASTRO_CLIENTES" VARCHAR2 (1),
	"CADASTRO_USUARIO" VARCHAR2 (1),
	"CADASTRO_SERVICO" VARCHAR2 (1),
	"AADSTRO_TIPOS_PAGAMENTO" VARCHAR2 (1),
	"CADASTRO_DESPESAS" VARCHAR2 (1),
	"CADASTRO_CONDICOES_PAG" VARCHAR2 (1),
	"CADASTRO_TERCEIROS" VARCHAR2 (1),
	"CADASTRO_EMPRESA" VARCHAR2 (1),
	"CADASTRO_FUNCAO" VARCHAR2 (1),
	"CONSULTA_SALDO_DEVEDOR" VARCHAR2 (1),
	"CONSULTA_CONTAS_A_PAGAR" VARCHAR2 (1),
	"CONSULTA_USUARIO_PRODUTIVIDADE" VARCHAR2 (1),
	"CONSULTA_CLIENTES_XFATURAS" VARCHAR2 (1),
	"ONSULTA_FATURAMENTO" VARCHAR2 (1),
	"GERA_ORCAMENTO" VARCHAR2 (1),
	"GERA_PRESTACAO_SERV" VARCHAR2 (1),
	"AGENDA_CONTAS_PAGAR" VARCHAR2 (1),
	"BAIXA_SALDO_DEVEDOR" VARCHAR2 (1),
	"MANUTENCAO_EM_TITULOS" VARCHAR2 (1),
PRIMARY KEY ("COD_USUARIO") 
) 
/

CREATE TABLE "TBCIDADES" (
	"COD_CIDADE" NUMBER NOT NULL ,
	"NOME" VARCHAR2 (50),
	"COD_IBGE" NUMBER,
	"UF" VARCHAR2 (2),
	"PAIS" VARCHAR2 (50),
PRIMARY KEY ("COD_CIDADE") 
) 
/

CREATE TABLE "TBBANCOS" (
	"COD_BANCO" VARCHAR2 (30) NOT NULL ,
	"NOME" VARCHAR2 (50),
	"SITE_BANCO" VARCHAR2 (200),
	"" VARCHAR2 (30),
PRIMARY KEY ("COD_BANCO") 
) 
/


-- CREATE ALTERNATE KEYS SECTION


-- CREATE INDEXES SECTION


-- CREATE FOREIGN KEYS SECTION

ALTER TABLE "TBHEADER_ORCAMENTO" ADD  FOREIGN KEY ("COD_EMPRESA","COD_CLIENTE") REFERENCES "TBCLIENTE" ("COD_EMPRESA","COD_CLIENTE") 
/

ALTER TABLE "TBHEADERORDEM_SERVICO" ADD  FOREIGN KEY ("COD_EMPRESA","COD_CLIENTE") REFERENCES "TBCLIENTE" ("COD_EMPRESA","COD_CLIENTE") 
/

ALTER TABLE "TBCLIENTE" ADD  FOREIGN KEY ("COD_EMPRESA") REFERENCES "TBEMPRESA" ("COD_EMPRESA") 
/

ALTER TABLE "TBSERVICOS" ADD  FOREIGN KEY ("COD_EMPRESA") REFERENCES "TBEMPRESA" ("COD_EMPRESA") 
/

ALTER TABLE "TBTIPO_PAGAMENTO" ADD  FOREIGN KEY ("COD_EMPRESA") REFERENCES "TBEMPRESA" ("COD_EMPRESA") 
/

ALTER TABLE "TBDESPESAS" ADD  FOREIGN KEY ("COD_EMPRESA") REFERENCES "TBEMPRESA" ("COD_EMPRESA") 
/

ALTER TABLE "TBCONDICAO_PAGAMENTO" ADD  FOREIGN KEY ("COD_EMPRESA") REFERENCES "TBEMPRESA" ("COD_EMPRESA") 
/

ALTER TABLE "TBTERCEIROS" ADD  FOREIGN KEY ("COD_EMPRESA") REFERENCES "TBEMPRESA" ("COD_EMPRESA") 
/

ALTER TABLE "TBCONTROLE_ACESSO" ADD  FOREIGN KEY ("COD_USUARIO") REFERENCES "TBUSUARIO" ("COD_USUARIO") 
/

ALTER TABLE "TBITENS_RELACIONAMENTO" ADD  FOREIGN KEY ("COD_SERVICO") REFERENCES "TBSERVICOS" ("COD_SERVICO") 
/

ALTER TABLE "TBHEADERITENS_OS" ADD  FOREIGN KEY ("COD_SERVICO") REFERENCES "TBSERVICOS" ("COD_SERVICO") 
/

ALTER TABLE "TBSERVICOS2" ADD  FOREIGN KEY ("COD_SERVICO") REFERENCES "TBSERVICOS" ("COD_SERVICO") 
/

ALTER TABLE "TBCONTAS_RECEBER" ADD  FOREIGN KEY ("COD_TP_PAGAMENTO") REFERENCES "TBTIPO_PAGAMENTO" ("COD_TP_PAGAMENTO") 
/

ALTER TABLE "TBCONTAS_PAGAR" ADD  FOREIGN KEY ("COD_EMPRESA","COD_DESPESA") REFERENCES "TBDESPESAS" ("COD_EMPRESA","COD_DESPESA") 
/

ALTER TABLE "TBSERVICOS2" ADD  FOREIGN KEY ("COD_EMPRESA","COD_TERCEIRO") REFERENCES "TBTERCEIROS" ("COD_EMPRESA","COD_TERCEIRO") 
/

ALTER TABLE "TBITENS_RELACIONAMENTO" ADD  FOREIGN KEY ("COD_ORCAMENTO","COD_EMPRESA","COD_CLIENTE") REFERENCES "TBHEADER_ORCAMENTO" ("COD_ORCAMENTO","COD_EMPRESA","COD_CLIENTE") 
/

ALTER TABLE "TBHEADERITENS_OS" ADD  FOREIGN KEY ("COD_OS","COD_EMPRESA","COD_CLIENTE") REFERENCES "TBHEADERORDEM_SERVICO" ("COD_OS","COD_EMPRESA","COD_CLIENTE") 
/

ALTER TABLE "TBCONTAS_RECEBER" ADD  FOREIGN KEY ("COD_OS","COD_EMPRESA","COD_CLIENTE") REFERENCES "TBHEADERORDEM_SERVICO" ("COD_OS","COD_EMPRESA","COD_CLIENTE") 
/

ALTER TABLE "TBCLIENTE" ADD  FOREIGN KEY ("COD_CIDADE") REFERENCES "TBCIDADES" ("COD_CIDADE") 
/

ALTER TABLE "TBCLIENTE" ADD  FOREIGN KEY ("COD_BANCO") REFERENCES "TBBANCOS" ("COD_BANCO") 
/


-- CREATE OBJECT TABLES SECTION


-- CREATE XMLTYPE TABLES SECTION


-- CREATE PROCEDURES SECTION


-- CREATE FUNCTIONS SECTION


-- CREATE VIEWS SECTION


-- CREATE SEQUENCES SECTION


-- CREATE TRIGGERS FROM REFERENTIAL INTEGRITY SECTION


-- CREATE USER TRIGGERS SECTION


-- CREATE PACKAGES SECTION


-- CREATE SYNONYMS SECTION


-- CREATE ROLES SECTION


-- ROLES PERMISSIONS SECTION

/* ROLES PERMISSIONS */


-- USER PERMISSIONS SECTION

/* USERS PERMISSIONS */


-- CREATE TABLE COMMENTS SECTION


-- CREATE ATTRIBUTE COMMENTS SECTION

