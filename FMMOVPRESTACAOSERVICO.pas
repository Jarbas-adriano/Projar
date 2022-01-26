unit FMMOVPRESTACAOSERVICO;
 // ainda falta o relatorio de de presta��o de servi�o aqui    -- feito
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, Vcl.Buttons, Vcl.Mask, cxStyles, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ComCtrls, Vcl.Imaging.jpeg, ZStoredProcedure,
  frxClass, frxDBSet;

type
  TFMMOVPRESTACAOSERVICO1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    DBTXTCOD_OS: TDBEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label27: TLabel;
    DBTXTVALOR_COM_DESCONTO: TDBEdit;
    Label2: TLabel;
    DBTXTVLR_DESCONTO: TDBEdit;
    Label6: TLabel;
    DBTXTMOTIVO_DESCONTO: TDBMemo;
    GroupBox3: TGroupBox;
    DBGRID_ITENS_OS: TcxGrid;
    DBGRID_ITENS_OSDBTableView1: TcxGridDBTableView;
    DBGRID_ITENS_OSLevel1: TcxGridLevel;
    GroupBox4: TGroupBox;
    Panel4: TPanel;
    BTNFECHAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox5: TGroupBox;
    Label8: TLabel;
    DBTXTCOD_FORMA_PAGAMENTO: TDBEdit;
    BIB_BUSCA_FORMA_PGTO: TBitBtn;
    TXTDESC_FORMA_PGTO: TEdit;
    Label9: TLabel;
    DBTXTDATA_PGTO_BASE: TcxDBDateEdit;
    GroupBox6: TGroupBox;
    DBTXTDATA_INICIO: TDBEdit;
    QRYPARAM: TZQuery;
    QRYPARAMCOD_TERMINAL: TWideStringField;
    QRYPARAMCOD_APLIC_CHAMA: TWideStringField;
    QRYPARAMNOME_PARAM: TWideStringField;
    QRYPARAMPARAM_C1: TWideStringField;
    QRYPARAMPARAM_C2: TWideStringField;
    QRYPARAMPARAM_C3: TWideStringField;
    QRYPARAMPARAM_C4: TWideStringField;
    QRYPARAMPARAM_C5: TWideStringField;
    QRYPARAMPARAM_C6: TWideStringField;
    QRYPARAMPARAM_C7: TWideStringField;
    QRYPARAMPARAM_C8: TWideStringField;
    QRYPARAMPARAM_C9: TWideStringField;
    QRYPARAMPARAM_C10: TWideStringField;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_N2: TFloatField;
    QRYPARAMPARAM_N3: TFloatField;
    QRYPARAMPARAM_N4: TFloatField;
    QRYPARAMPARAM_N5: TFloatField;
    QRYPARAMPARAM_N6: TFloatField;
    QRYPARAMPARAM_N7: TFloatField;
    QRYPARAMPARAM_N8: TFloatField;
    QRYPARAMPARAM_N9: TFloatField;
    QRYPARAMPARAM_N10: TFloatField;
    QRYPARAMPARAM_N11: TFloatField;
    QRYPARAMPARAM_N12: TFloatField;
    QRYPARAMPARAM_N13: TFloatField;
    QRYPARAMPARAM_N14: TFloatField;
    QRYPARAMPARAM_N15: TFloatField;
    QRYPARAMPARAM_N16: TFloatField;
    QRYPARAMPARAM_N17: TFloatField;
    QRYPARAMPARAM_N18: TFloatField;
    QRYPARAMPARAM_N19: TFloatField;
    QRYPARAMPARAM_N20: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    QRYPARAMPARAM_D3: TDateTimeField;
    QRYPARAMPARAM_D4: TDateTimeField;
    QRYPARAMPARAM_D5: TDateTimeField;
    QRYPARAMPARAM_D6: TDateTimeField;
    QRYPARAMPARAM_D7: TDateTimeField;
    QRYPARAMPARAM_D8: TDateTimeField;
    QRYPARAMPARAM_D9: TDateTimeField;
    QRYPARAMPARAM_D10: TDateTimeField;
    QRYPARAMPARAM_N21: TFloatField;
    QRYPARAMPARAM_N22: TFloatField;
    QRYPARAMPARAM_N23: TFloatField;
    QRYPARAMPARAM_N24: TFloatField;
    QRYPARAMPARAM_N25: TFloatField;
    QRYPARAMPARAM_N26: TFloatField;
    QRYPARAMPARAM_N27: TFloatField;
    QRYPARAMPARAM_N28: TFloatField;
    QRYPARAMPARAM_N29: TFloatField;
    QRYPARAMPARAM_N30: TFloatField;
    QRYPARAMPARAM_D11: TDateTimeField;
    QRYPARAMPARAM_D12: TDateTimeField;
    QRYPARAMPARAM_D13: TDateTimeField;
    QRYPARAMPARAM_D14: TDateTimeField;
    QRYPARAMPARAM_D15: TDateTimeField;
    QRYPARAMPARAM_D16: TDateTimeField;
    QRYPARAMPARAM_D17: TDateTimeField;
    QRYPARAMPARAM_D18: TDateTimeField;
    QRYPARAMPARAM_D19: TDateTimeField;
    QRYPARAMPARAM_D20: TDateTimeField;
    QRYPARAMPARAM_N31: TFloatField;
    QRYPARAMPARAM_N32: TFloatField;
    QRYPARAMPARAM_N33: TFloatField;
    QRYPARAMPARAM_N34: TFloatField;
    QRYPARAMPARAM_N35: TFloatField;
    QRYPARAMPARAM_C11: TWideStringField;
    QRYPARAMPARAM_C12: TWideStringField;
    QRYPARAMPARAM_C13: TWideStringField;
    QRYPARAMPARAM_C14: TWideStringField;
    QRYPARAMPARAM_C15: TWideStringField;
    QRYPARAMPARAM_C16: TWideStringField;
    QRYPARAMPARAM_C17: TWideStringField;
    QRYPARAMPARAM_C18: TWideStringField;
    QRYPARAMPARAM_C19: TWideStringField;
    QRYPARAMPARAM_C20: TWideStringField;
    QRYPARAMPARAM_C21: TWideStringField;
    QRYPARAMPARAM_C22: TWideStringField;
    QRYPARAMPARAM_C23: TWideStringField;
    QRYPARAMPARAM_C24: TWideStringField;
    QRYPARAMPARAM_C25: TWideStringField;
    QRYPARAMPARAM_N36: TFloatField;
    QRYPARAMPARAM_N37: TFloatField;
    QRYPARAMPARAM_N38: TFloatField;
    QRYPARAMPARAM_N39: TFloatField;
    QRYPARAMPARAM_N40: TFloatField;
    QRYPARAMPARAM_N41: TFloatField;
    QRYPARAMPARAM_N42: TFloatField;
    QRYPARAMPARAM_N43: TFloatField;
    QRYPARAMPARAM_N44: TFloatField;
    QRYPARAMPARAM_N45: TFloatField;
    QRYPARAMPARAM_N46: TFloatField;
    QRYPARAMPARAM_N47: TFloatField;
    QRYPARAMPARAM_N48: TFloatField;
    QRYPARAMPARAM_N49: TFloatField;
    QRYPARAMPARAM_N50: TFloatField;
    QRYPARAMPARAM_N51: TFloatField;
    QRYPARAMPARAM_N52: TFloatField;
    QRYPARAMPARAM_N53: TFloatField;
    QRYPARAMPARAM_N54: TFloatField;
    QRYPARAMPARAM_N55: TFloatField;
    QRYPARAMPARAM_N56: TFloatField;
    QRYPARAMPARAM_N57: TFloatField;
    QRYPARAMPARAM_N58: TFloatField;
    QRYPARAMPARAM_N59: TFloatField;
    QRYPARAMPARAM_N60: TFloatField;
    QRYPARAMPARAM_C26: TWideStringField;
    QRYPARAMPARAM_C100: TWideStringField;
    DSPARAM: TDataSource;
    DBTXTCLIENTE: TDBEdit;
    DBTXTOBSERVACAO: TDBEdit;
    QRYHEADER_OS: TZQuery;
    QRYHEADER_OSCOD_OS: TFloatField;
    QRYHEADER_OSCOD_EMPRESA: TFloatField;
    QRYHEADER_OSCOD_CLIENTE: TFloatField;
    QRYHEADER_OSSITUACAO: TWideStringField;
    QRYHEADER_OSVALOR_TOTAL: TFloatField;
    QRYHEADER_OSVALOR_DESCONTO: TFloatField;
    QRYHEADER_OSDATA_INICIO: TDateTimeField;
    QRYHEADER_OSDATA_PREVISAO_FIM: TDateTimeField;
    QRYHEADER_OSOBSERVACOES: TWideStringField;
    QRYHEADER_OSTEM_ORCAMENTO_RELACIONADO: TWideStringField;
    QRYHEADER_OSCOD_ORCAMENTO_RELAC: TFloatField;
    QRYHEADER_OSMOTIVO_DESCONTO: TWideStringField;
    QRYHEADER_OSUSUARIO_LIBEROU_DESC: TFloatField;
    QRYHEADER_OSUSUARIO_EXE: TWideStringField;
    QRYHEADER_OSNOME_NOME_FANTASIA: TWideStringField;
    QRYITENS: TZQuery;
    QRYITENSCOD_SERVICO: TFloatField;
    QRYITENSCOD_OS: TFloatField;
    QRYITENSCOD_EMPRESA: TFloatField;
    QRYITENSCOD_CLIENTE: TFloatField;
    QRYITENSVALOR_SERV_INDIVIDUAL: TFloatField;
    QRYITENSQUANTIDADE_SERVICO: TFloatField;
    QRYITENSTEM_SERV_TERCEIRO: TWideStringField;
    QRYITENSVALOR_SERV_TERCEIRO: TFloatField;
    QRYITENSCOD_SERVICO_TERCEIRO: TFloatField;
    QRYITENSNOME_SERVICO: TWideStringField;
    DSITENS: TDataSource;
    DBGRID_ITENS_OSDBTableView1COD_SERVICO: TcxGridDBColumn;
    DBGRID_ITENS_OSDBTableView1VALOR_SERV_INDIVIDUAL: TcxGridDBColumn;
    DBGRID_ITENS_OSDBTableView1QUANTIDADE_SERVICO: TcxGridDBColumn;
    DBGRID_ITENS_OSDBTableView1NOME_SERVICO: TcxGridDBColumn;
    QRYITENSTOTAL: TFloatField;
    DBGRID_ITENS_OSDBTableView1TOTAL: TcxGridDBColumn;
    DBGRID_PGTODBTableView1: TcxGridDBTableView;
    DBGRID_PGTOLevel1: TcxGridLevel;
    DBGRID_PGTO: TcxGrid;
    PCGERA_CONTAS_RECEBER: TZStoredProc;
    Label7: TLabel;
    DBTXTQTDE_PARCELAS: TDBEdit;
    QRYPARCELAS_TEMP: TZQuery;
    QRYPARCELAS_TEMPNUM_PARCELAS: TFloatField;
    QRYPARCELAS_TEMPVALOR_PARCELA: TFloatField;
    QRYPARCELAS_TEMPDATA_VENCIMENTO: TDateTimeField;
    DSPARCELA_TEMP: TDataSource;
    DBGRID_PGTODBTableView1NUM_PARCELAS: TcxGridDBColumn;
    DBGRID_PGTODBTableView1VALOR_PARCELA: TcxGridDBColumn;
    DBGRID_PGTODBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    BIB_BUSCA_OS: TBitBtn;
    QRYRELITENS_OS: TZQuery;
    QRYRELITENS_OSCOD_SERVICO: TFloatField;
    QRYRELITENS_OSCOD_OS: TFloatField;
    QRYRELITENS_OSCOD_EMPRESA: TFloatField;
    QRYRELITENS_OSCOD_CLIENTE: TFloatField;
    QRYRELITENS_OSVALOR_SERV_INDIVIDUAL: TFloatField;
    QRYRELITENS_OSQUANTIDADE_SERVICO: TFloatField;
    QRYRELITENS_OSTEM_SERV_TERCEIRO: TWideStringField;
    QRYRELITENS_OSVALOR_SERV_TERCEIRO: TFloatField;
    QRYRELITENS_OSCOD_SERVICO_TERCEIRO: TFloatField;
    QRYRELITENS_OSNOME_SERVICO: TWideStringField;
    QRYRELITENS_OSVLR_TOTAL: TFloatField;
    QRYRELHEADER_OS: TZQuery;
    QRYRELHEADER_OSCOD_OS: TFloatField;
    QRYRELHEADER_OSCOD_EMPRESA: TFloatField;
    QRYRELHEADER_OSCOD_CLIENTE: TFloatField;
    QRYRELHEADER_OSSITUACAO: TWideStringField;
    QRYRELHEADER_OSVALOR_TOTAL: TFloatField;
    QRYRELHEADER_OSVALOR_DESCONTO: TFloatField;
    QRYRELHEADER_OSDATA_INICIO: TDateTimeField;
    QRYRELHEADER_OSDATA_PREVISAO_FIM: TDateTimeField;
    QRYRELHEADER_OSOBSERVACOES: TWideStringField;
    QRYRELHEADER_OSTEM_ORCAMENTO_RELACIONADO: TWideStringField;
    QRYRELHEADER_OSCOD_ORCAMENTO_RELAC: TFloatField;
    QRYRELHEADER_OSMOTIVO_DESCONTO: TWideStringField;
    QRYRELHEADER_OSUSUARIO_LIBEROU_DESC: TFloatField;
    QRYRELHEADER_OSUSUARIO_EXE: TWideStringField;
    QRYRELHEADER_OSDATA_TERMINO: TDateTimeField;
    QRYRELHEADER_OSNOME_NOME_FANTASIA_CLIENTE: TWideStringField;
    QRYRELHEADER_OSCOD_USUARIO_RESPONSAVEL: TFloatField;
    QRYRELHEADER_OSNOME_NOME_FANTASIA: TWideStringField;
    QRYRELHEADER_OSCPF: TWideStringField;
    QRYRELHEADER_OSCNPJ: TWideStringField;
    QRYRELHEADER_OSTIPO_PESSOA: TWideStringField;
    QRYRELHEADER_OSENDERECO: TWideStringField;
    QRYRELHEADER_OSNUMERO: TFloatField;
    QRYRELHEADER_OSCOMPLEMENTO: TWideStringField;
    QRYRELHEADER_OSBAIRRO: TWideStringField;
    QRYRELHEADER_OSCEP: TWideStringField;
    QRYRELHEADER_OSEMAIL: TWideStringField;
    QRYRELHEADER_OSNOME_EMPRESA: TWideStringField;
    QRYRELHEADER_OSTELEFONE_CELULAR: TWideStringField;
    QRYRELHEADER_OSCIDADE: TWideStringField;
    QRYRELHEADER_OSUF: TWideStringField;
    FRXDBITENS: TfrxDBDataset;
    FRXDBHEADER: TfrxDBDataset;
    frxOS: TfrxReport;
    QRYRELPARCELAS: TZQuery;
    FRXDBPARCELAS: TfrxDBDataset;
    QRYRELPARCELASCOD_OS: TFloatField;
    QRYRELPARCELASCOD_EMPRESA: TFloatField;
    QRYRELPARCELASCOD_CLIENTE: TFloatField;
    QRYRELPARCELASCOD_TP_PAGAMENTO: TFloatField;
    QRYRELPARCELASTOTAL_PARCELA: TFloatField;
    QRYRELPARCELASSITUACAO: TWideStringField;
    QRYRELPARCELASCOD_CONDICAO_PAGAMENTO: TFloatField;
    QRYRELPARCELASDATA_PAGAMENTO: TDateTimeField;
    QRYRELPARCELASCOD_BANCO_RECEBIMENTO: TFloatField;
    QRYRELPARCELASCOD_AGENCIA_RECEBIMENTO: TFloatField;
    QRYRELPARCELASCOD_CONTA_RECEBIMENTO: TFloatField;
    QRYRELPARCELASOBSERVACAO: TWideStringField;
    QRYRELPARCELASSEQUENCIA: TFloatField;
    QRYRELPARCELASDATA_VENCIMENTO: TDateTimeField;
    QRYRELPARCELASNOME_TP_PAGAMENTO: TWideStringField;
    Label10: TLabel;
    Label18: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    PROCEDURE HABILITA_CAMPOS(PESTADO:BOOLEAN);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBTXTCOD_OSExit(Sender: TObject);
    PROCEDURE CARREGA_ITENS;
    procedure BIB_BUSCA_FORMA_PGTOClick(Sender: TObject);
    procedure DBTXTCOD_FORMA_PAGAMENTOExit(Sender: TObject);
    procedure DBTXTQTDE_PARCELASExit(Sender: TObject);
    procedure CARREGA_PARCELAS;
    procedure BTNFECHARClick(Sender: TObject);
    procedure BIB_BUSCA_OSClick(Sender: TObject);
    procedure CARREGAR_RELATORIO;
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMOVPRESTACAOSERVICO1: TFMMOVPRESTACAOSERVICO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOFILTRO, FMPADRAOCONSULTA;

{ TFMMOVPRESTACAOSERVICO1 }

procedure TFMMOVPRESTACAOSERVICO1.BIB_BUSCA_FORMA_PGTOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_TP_PAGAMENTO', 'COD_TP_PAGAMENTO "Codigo",  NOME_TP_PAGAMENTO "Nome", QTDE_DIAS_ENTRE_FATURAS "Qtde dias entre faturas"',
        S_FILTRO, 'Nome do tipo do Pagamento', 'COD_TP_PAGAMENTO',
        'TBTIPO_PAGAMENTO', 'S', 'Tipos de Pagamento', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N5.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_FORMA_PAGAMENTOExit(self);
  END;
end;
procedure TFMMOVPRESTACAOSERVICO1.BIB_BUSCA_OSClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
 S_FILTRO := 'COD_EMPRESA = '+INTTOSTR(EMPRESA_ATUAL)+
             'AND SITUACAO = ''A''' ;
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_NOME_FANTASIA_CLIENTE', 'COD_OS "Codigo", NOME_NOME_FANTASIA_CLIENTE "Nome Cliente",'+
        'DATA_INICIO "Data In�cio", ''R$'' ||VALOR_TOTAL "Valor Total", ''R$'' ||VALOR_DESCONTO "Valor Desconto"',
        S_FILTRO, 'Nome', 'COD_OS',
        'TBHEADERORDEM_SERVICO', 'S', 'Ordem de Servi�o', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_OSExit(SELF);
  END;
end;

procedure TFMMOVPRESTACAOSERVICO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.Cancel;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;

   HABILITA_CAMPOS(FALSE);
   DBTXTCOD_OS.SetFocus;
   QRYITENS.Close;
   QRYHEADER_OS.Close;
   QRYPARCELAS_TEMP.Close;
   TXTDESC_FORMA_PGTO.Text := '';


end;

procedure TFMMOVPRESTACAOSERVICO1.BTNFECHARClick(Sender: TObject);
begin
  inherited;
  IF QRYPARAMPARAM_N5.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma forma de pagamento para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_FORMA_PAGAMENTO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data base de pagamento  para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_PGTO_BASE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASDATETIME < DATE THEN
   BEGIN
     MessageDlg('A data Base de pagamento n�o pode ser menor do que a data atual!',mtInformation,[MBOK],0);
     DBTXTDATA_PGTO_BASE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N6.AsString = '' THEN
   BEGIN
     MessageDlg('Informe a quantidade de parcelas para prosseguir!',mtInformation,[MBOK],0);
     DBTXTQTDE_PARCELAS.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N6.ASINTEGER <= 0 THEN
   BEGIN
     MessageDlg('A quantidade de parcelas n�o pode ser igual ou menor a 0!',mtInformation,[MBOK],0);
     DBTXTQTDE_PARCELAS.SETFOCUS;
     ABORT;
   END;

   IF QRYPARCELAS_TEMP.IsEmpty THEN
   BEGIN
     MessageDlg('As parcelas ainda n�o foram geradas, por favor gere-as para prosseguir!',mtInformation,[MBOK],0);
     DBTXTQTDE_PARCELAS.SETFOCUS;
     ABORT;
   END;

   TRY
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_TERMINAL').AsString     := BUSCANOME_COMPUTADOR;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_APLICACAO').AsString    := 'FMMOVPRESTACAOSERVICO';
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_EMPRESA').ASINTEGER     := EMPRESA_ATUAL;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_OS').ASINTEGER          := QRYPARAMPARAM_N1.AsInteger;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_CLIENTE').ASINTEGER     := QRYPARAMPARAM_N10.AsInteger;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_TIPO_PGTO').ASINTEGER   := QRYPARAMPARAM_N5.AsInteger;
    PCGERA_CONTAS_RECEBER.ParamByName('PVLR_TOTAL_DESPESA').ASFLOAT := QRYPARAMPARAM_N2.ASFLOAT;
    PCGERA_CONTAS_RECEBER.ParamByName('PQTDE_PARCELAS').ASINTEGER   := QRYPARAMPARAM_N6.ASINTEGER;
    PCGERA_CONTAS_RECEBER.ParamByName('PDATA_PAGAMENTO').ASDATETIME := QRYPARAMPARAM_D2.AsDateTime;
    PCGERA_CONTAS_RECEBER.ParamByName('PEFETIVO').ASSTRING          := 'S';
    PCGERA_CONTAS_RECEBER.Prepare;
    PCGERA_CONTAS_RECEBER.ExecProc;
    PCGERA_CONTAS_RECEBER.Unprepare;

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('COMMIT');
    QRYAUX.ExecSQL;
    CARREGAR_RELATORIO;
    //CARREGA_PARCELAS;
   EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MESSAGEDLG('Erro ao finalizar a presta��o de servi�o. Erro :'+e.Message,mtInformation,[MBOK],1);
        MDPRINCIPAL.ROLLBACK;
        abort;
     END;
    END;
   BTNCANCELARClick(SELF);
end;

procedure TFMMOVPRESTACAOSERVICO1.CARREGAR_RELATORIO;
begin
   QRYRELHEADER_OS.CLOSE;
   QRYRELHEADER_OS.SQL.CLEAR;
   QRYRELHEADER_OS.SQL.ADD('SELECT A.*,B.NOME_NOME_FANTASIA, B.CPF, NVL(B.CNPJ,B.CPF) "CNPJ",');
   QRYRELHEADER_OS.SQL.ADD('       B.TIPO_PESSOA, B.ENDERECO, B.NUMERO, B.COMPLEMENTO, B.BAIRRO,');
   QRYRELHEADER_OS.SQL.ADD('       B.CEP, B.EMAIL,C.RAZAO_SOCIAL "NOME_EMPRESA",');
   QRYRELHEADER_OS.SQL.ADD('       B.TELEFONE_CELULAR,D.NOME CIDADE,D.UF');
   QRYRELHEADER_OS.SQL.ADD('FROM TBHEADERORDEM_SERVICO A, TBCLIENTE B , TBEMPRESA C, TBCIDADES D');
   QRYRELHEADER_OS.SQL.ADD('WHERE A.COD_OS      = :PCOD_OS AND');
   QRYRELHEADER_OS.SQL.ADD('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYRELHEADER_OS.SQL.ADD('      A.COD_CLIENTE = :PCOD_CLIENTE AND');
   QRYRELHEADER_OS.SQL.ADD('      B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYRELHEADER_OS.SQL.ADD('      B.COD_CLIENTE = A.COD_CLIENTE AND ');
   QRYRELHEADER_OS.SQL.ADD('      C.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYRELHEADER_OS.SQL.ADD('      D.COD_IBGE    = B.COD_CIDADE');
   QRYRELHEADER_OS.PARAMBYNAME('PCOD_OS').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELHEADER_OS.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   QRYRELHEADER_OS.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N10.ASINTEGER;
   QRYRELHEADER_OS.OPEN;
   QRYRELHEADER_OS.ACTIVE := TRUE;


   QRYRELITENS_OS.CLOSE;
   QRYRELITENS_OS.SQL.CLEAR;
   QRYRELITENS_OS.SQL.ADD('SELECT A.*, B.NOME_SERVICO, A.VALOR_SERV_INDIVIDUAL * A.QUANTIDADE_SERVICO VLR_TOTAL');
   QRYRELITENS_OS.SQL.ADD('FROM TBHEADERITENS_OS A,TBSERVICOS B ');
   QRYRELITENS_OS.SQL.ADD('WHERE A.COD_OS        = :PCOD_OS AND');
   QRYRELITENS_OS.SQL.ADD('      A.COD_EMPRESA   = :PCOD_EMPRESA AND');
   QRYRELITENS_OS.SQL.ADD('      A.COD_CLIENTE   = :PCOD_CLIENTE AND');
   QRYRELITENS_OS.SQL.ADD('      B.COD_EMPRESA   = A.COD_EMPRESA AND ');
   QRYRELITENS_OS.SQL.ADD('      B.COD_SERVICO   = A.COD_SERVICO ');
   QRYRELITENS_OS.PARAMBYNAME('PCOD_OS').ASINTEGER        := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELITENS_OS.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   QRYRELITENS_OS.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N10.ASINTEGER;
   QRYRELITENS_OS.OPEN;
   QRYRELITENS_OS.ACTIVE := TRUE;

   QRYRELPARCELAS.Close;
   QRYRELPARCELAS.SQL.Clear;
   QRYRELPARCELAS.SQL.Add('SELECT A.*,B.NOME_TP_PAGAMENTO');
   QRYRELPARCELAS.SQL.Add('FROM TBCONTAS_RECEBER A,TBTIPO_PAGAMENTO B');
   QRYRELPARCELAS.SQL.Add('WHERE A.COD_OS = :PCOD_OS AND');
   QRYRELPARCELAS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYRELPARCELAS.SQL.Add('      A.COD_CLIENTE = :PCOD_CLIENTE AND');
   QRYRELPARCELAS.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYRELPARCELAS.SQL.Add('      B.COD_TP_PAGAMENTO = A.COD_CONDICAO_PAGAMENTO');
   QRYRELPARCELAS.SQL.Add('ORDER BY A.DATA_VENCIMENTO');
   QRYRELPARCELAS.PARAMBYNAME('PCOD_OS').ASINTEGER        := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELPARCELAS.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   QRYRELPARCELAS.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N10.ASINTEGER;
   QRYRELPARCELAS.OPEN;
   QRYRELPARCELAS.ACTIVE := TRUE;

   // chamo duas vezes para via da empresa e do cliente
   frxOS.ShowReport;
   //frxOS.ShowReport;
end;

procedure TFMMOVPRESTACAOSERVICO1.CARREGA_ITENS;
begin
   QRYITENS.Close;
   QRYITENS.SQL.Clear;
   QRYITENS.SQL.Add('SELECT A.*, A.VALOR_SERV_INDIVIDUAL * A.QUANTIDADE_SERVICO TOTAL,B.NOME_SERVICO');
   QRYITENS.SQL.Add('FROM TBHEADERITENS_OS A, TBSERVICOS B');
   QRYITENS.SQL.Add('WHERE A.COD_OS = :PCOD_OS AND');
   QRYITENS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYITENS.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYITENS.SQL.Add('      B.COD_SERVICO = A.COD_SERVICO');
   QRYITENS.ParamByName('PCOD_OS').AsInteger      := QRYPARAMPARAM_N1.AsInteger;
   QRYITENS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYITENS.Open;

end;

procedure TFMMOVPRESTACAOSERVICO1.CARREGA_PARCELAS;
begin
   QRYPARCELAS_TEMP.Close;
   QRYPARCELAS_TEMP.SQL.Clear;
   QRYPARCELAS_TEMP.SQL.Add('SELECT A.NUM4 NUM_PARCELAS, A.NUM3 VALOR_PARCELA, A.DATA1 DATA_VENCIMENTO');
   QRYPARCELAS_TEMP.SQL.Add('FROM TBTEMPORARIA A');
   QRYPARCELAS_TEMP.SQL.Add('WHERE A.CODTERMINAL = :PCOD_TERMINAL AND');
   QRYPARCELAS_TEMP.SQL.Add('      A.COD_APLICACAO = :PCOD_APLICACAO');
   QRYPARCELAS_TEMP.SQL.Add('ORDER BY A.NUM4');
   QRYPARCELAS_TEMP.ParamByName('PCOD_TERMINAL').AsString  := BUSCANOME_COMPUTADOR;
   QRYPARCELAS_TEMP.ParamByName('PCOD_APLICACAO').AsString := 'FMMOVPRESTACAOSERVICO';
   QRYPARCELAS_TEMP.Open;
end;

procedure TFMMOVPRESTACAOSERVICO1.DBTXTCOD_FORMA_PAGAMENTOExit(Sender: TObject);
begin
  inherited;
  if QRYPARAMPARAM_N5.AsInteger <> 0 then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_TP_PAGAMENTO');
      QRYAUX.SQL.Add('FROM TBTIPO_PAGAMENTO');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_TP_PAGAMENTO  = :PCOD_TP_PAGAMENTO  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger      := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_TP_PAGAMENTO').AsInteger := QRYPARAMPARAM_N5.AsInteger;
      QRYAUX.Open;

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Tipo de pagamento n�o encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_FORMA_PAGAMENTO.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTDESC_FORMA_PGTO.Text := QRYAUX.FieldByName('NOME_TP_PAGAMENTO').AsString;
        DBTXTDATA_PGTO_BASE.SetFocus;
      END;
    END
    ELSE
    BEGIN
       TXTDESC_FORMA_PGTO.Text := '';
    END;
end;

procedure TFMMOVPRESTACAOSERVICO1.DBTXTCOD_OSExit(Sender: TObject);
begin
  inherited;

   {IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma ordem de servi�o para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_OS.SETFOCUS;
     ABORT;
   END;}
   IF QRYPARAMPARAM_N1.ASSTRING <> '' THEN
   BEGIN
     QRYHEADER_OS.CLOSE;
     QRYHEADER_OS.SQL.Clear;
     QRYHEADER_OS.SQL.Add('SELECT A.*,B.NOME_NOME_FANTASIA');
     QRYHEADER_OS.SQL.Add('FROM TBHEADERORDEM_SERVICO A, TBCLIENTE B');
     QRYHEADER_OS.SQL.Add('WHERE A.COD_OS = :PCOD_OS AND');
     QRYHEADER_OS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
     QRYHEADER_OS.SQL.Add('      A.SITUACAO    = ''A'' AND');
     QRYHEADER_OS.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
     QRYHEADER_OS.SQL.Add('      B.COD_CLIENTE = A.COD_CLIENTE  ');
     QRYHEADER_OS.ParamByName('PCOD_OS').AsInteger := QRYPARAMPARAM_N1.AsInteger;
     QRYHEADER_OS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
     QRYHEADER_OS.Open;

     if QRYHEADER_OS.IsEmpty then
     BEGIN
        MessageDlg('Ordem de servi�o n�o encontrada.Favor informe uma ordem de servi�o v�lida para prosseguir!',mtInformation,[MBOK],0);
       DBTXTCOD_OS.SETFOCUS;
       ABORT;
     END;

     QRYPARAMPARAM_C1.AsString   := QRYHEADER_OSNOME_NOME_FANTASIA.AsString;
     QRYPARAMPARAM_D1.AsDateTime := QRYHEADER_OSDATA_INICIO.AsDateTime;
     QRYPARAMPARAM_N2.AsFloat    := QRYHEADER_OSVALOR_TOTAL.AsFloat;
     QRYPARAMPARAM_N3.AsFloat    := QRYHEADER_OSVALOR_DESCONTO.AsFloat;
     QRYPARAMPARAM_C26.AsString  := QRYHEADER_OSMOTIVO_DESCONTO.AsSTRING;
     QRYPARAMPARAM_C2.AsString   := QRYHEADER_OSOBSERVACOES.AsString;
     QRYPARAMPARAM_D2.AsDateTime := DATE;
     QRYPARAMPARAM_N10.AsInteger := QRYHEADER_OSCOD_CLIENTE.AsInteger;
     CARREGA_ITENS;
     HABILITA_CAMPOS(TRUE);
     IF DBTXTCOD_FORMA_PAGAMENTO.CANFOCUS THEN
        DBTXTCOD_FORMA_PAGAMENTO.SETFOCUS;
   END;


end;

procedure TFMMOVPRESTACAOSERVICO1.DBTXTQTDE_PARCELASExit(Sender: TObject);
begin
  inherited;
   IF QRYPARAMPARAM_N5.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma forma de pagamento para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_FORMA_PAGAMENTO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data base de pagamento  para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_PGTO_BASE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASDATETIME < DATE THEN
   BEGIN
     MessageDlg('A data Base de pagamento n�o pode ser menor do que a data atual!',mtInformation,[MBOK],0);
     DBTXTDATA_PGTO_BASE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N6.AsString = '' THEN
   BEGIN
     MessageDlg('Informe a quantidade de parcelas para prosseguir!',mtInformation,[MBOK],0);
     if DBTXTQTDE_PARCELAS.CanFocus then
        DBTXTQTDE_PARCELAS.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N6.ASINTEGER <= 0 THEN
   BEGIN
     MessageDlg('A quantidade de parcelas n�o pode ser igual ou menor a 0!',mtInformation,[MBOK],0);
     if DBTXTQTDE_PARCELAS.CanFocus then
        DBTXTQTDE_PARCELAS.SETFOCUS;
     ABORT;
   END;

  TRY
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_TERMINAL').AsString     := BUSCANOME_COMPUTADOR;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_APLICACAO').AsString    := 'FMMOVPRESTACAOSERVICO';
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_EMPRESA').ASINTEGER     := EMPRESA_ATUAL;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_OS').ASINTEGER          := QRYPARAMPARAM_N1.AsInteger;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_CLIENTE').ASINTEGER     := QRYPARAMPARAM_N10.AsInteger;
    PCGERA_CONTAS_RECEBER.ParamByName('PCOD_TIPO_PGTO').ASINTEGER   := QRYPARAMPARAM_N5.AsInteger;
    PCGERA_CONTAS_RECEBER.ParamByName('PVLR_TOTAL_DESPESA').ASFLOAT := QRYPARAMPARAM_N2.ASFLOAT;
    PCGERA_CONTAS_RECEBER.ParamByName('PQTDE_PARCELAS').ASINTEGER   := QRYPARAMPARAM_N6.ASINTEGER;
    PCGERA_CONTAS_RECEBER.ParamByName('PDATA_PAGAMENTO').ASDATETIME := QRYPARAMPARAM_D2.AsDateTime;
    PCGERA_CONTAS_RECEBER.ParamByName('PEFETIVO').ASSTRING          := 'N';
    PCGERA_CONTAS_RECEBER.Prepare;
    PCGERA_CONTAS_RECEBER.ExecProc;
    PCGERA_CONTAS_RECEBER.Unprepare;

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('COMMIT');
    QRYAUX.ExecSQL;
    CARREGA_PARCELAS;
  EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MESSAGEDLG('Erro ao gerar parcelas. Erro :'+e.Message,mtInformation,[MBOK],1);
        MDPRINCIPAL.ROLLBACK;
        abort;
     END;
   END;
end;

procedure TFMMOVPRESTACAOSERVICO1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMMOVPRESTACAOSERVICO1.HABILITA_CAMPOS(PESTADO: BOOLEAN);
begin
   DBTXTCOD_OS.Enabled  := NOT PESTADO;
   BIB_BUSCA_OS.Enabled := NOT PESTADO;
   DBTXTCLIENTE.Enabled := PESTADO;
   DBTXTDATA_INICIO.Enabled := PESTADO;
   DBTXTQTDE_PARCELAS.Enabled := PESTADO;
   DBTXTVALOR_COM_DESCONTO.Enabled := PESTADO;
   DBTXTVLR_DESCONTO.Enabled := PESTADO;
   DBTXTMOTIVO_DESCONTO.Enabled := PESTADO;
   DBTXTOBSERVACAO.Enabled := PESTADO;
   DBGRID_ITENS_OS.Enabled  := PESTADO;
   DBTXTCOD_FORMA_PAGAMENTO.ENABLED := PESTADO;
   DBTXTDATA_PGTO_BASE.Enabled    := PESTADO;
   BTNFECHAR.Enabled  := PESTADO;
   DBGRID_PGTO.Enabled := PESTADO;
   BIB_BUSCA_FORMA_PGTO.Enabled := PESTADO;
   TXTDESC_FORMA_PGTO.Enabled := PESTADO;
end;

procedure TFMMOVPRESTACAOSERVICO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('20');
end;

end.
