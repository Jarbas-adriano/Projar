unit FMMOVORCAMENTO;

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
  TFMMOVORCAMENTO1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    Label11: TLabel;
    TXTSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    Label3: TLabel;
    DBTXTDESC_ORCAMENTO: TDBEdit;
    Label2: TLabel;
    DBTXTDATA_INICIO: TcxDBDateEdit;
    Label5: TLabel;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    Label6: TLabel;
    DBTXTCOD_SERVICO: TDBEdit;
    BTNBUSCA_SERV: TBitBtn;
    TXTNOME_SERVICO: TEdit;
    Label27: TLabel;
    DBTXTVALOR_SERVICO: TDBEdit;
    Label7: TLabel;
    DBTXTQUANTIDADE: TDBEdit;
    LBLSERV_TERC: TLabel;
    LBLTEM_SERV_TERC: TLabel;
    DBCTEM_SERV_TERCEIROS: TDBComboBox;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox3: TGroupBox;
    DBGRID_ITENS: TcxGrid;
    DBGRID_ITENSDBTableView1: TcxGridDBTableView;
    DBGRID_ITENSLevel1: TcxGridLevel;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    DBTXTTOTAL_SEM_DESC: TDBEdit;
    Label14: TLabel;
    DBTXTDESCONTO: TDBEdit;
    Label15: TLabel;
    DBTXTVLR_DESCONTO: TDBEdit;
    Label16: TLabel;
    DBTXTVLR_COM_DESC: TDBEdit;
    Panel3: TPanel;
    BTNFINALIZAR: TBitBtn;
    BTNCANCELAR_GERAL: TBitBtn;
    BTNEXCLUIR: TBitBtn;
    Panel4: TPanel;
    RGTIPO_ORCAMENTO: TRadioGroup;
    Label1: TLabel;
    DBTXTCOD_ORCAMENTO: TDBEdit;
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
    QRYHEADER_ORCAMENTO: TZQuery;
    Label9: TLabel;
    DBTXTVLR_ESTIMADO: TDBEdit;
    QRYITENS: TZQuery;
    DSITENS: TDataSource;
    DBGRID_ITENSDBTableView1NUM3: TcxGridDBColumn;
    DBGRID_ITENSDBTableView1NOME_SERVICO: TcxGridDBColumn;
    DBGRID_ITENSDBTableView1VLR_ITEM: TcxGridDBColumn;
    PCGERA_TOTAIS_ORCAMENTO: TZStoredProc;
    QRYHEADER_ORCAMENTOCOD_ORCAMENTO: TFloatField;
    QRYHEADER_ORCAMENTOCOD_EMPRESA: TFloatField;
    QRYHEADER_ORCAMENTOCOD_CLIENTE: TFloatField;
    QRYHEADER_ORCAMENTODESCRICAO: TWideStringField;
    QRYHEADER_ORCAMENTOSITUACAO: TWideStringField;
    QRYHEADER_ORCAMENTODATA_INICIAL_VIGENCIA: TDateTimeField;
    QRYHEADER_ORCAMENTODATA_FINAL_VIGENCIA: TDateTimeField;
    QRYHEADER_ORCAMENTOOBSERVACOES: TWideStringField;
    QRYHEADER_ORCAMENTOVALOR_TOTAL: TFloatField;
    QRYHEADER_ORCAMENTOVALOR_DESCONTO: TFloatField;
    QRYHEADER_ORCAMENTODATA_CADASTRO: TDateTimeField;
    QRYHEADER_ORCAMENTOMOTIVO_DESCONTO: TWideStringField;
    QRYITENSNUM2: TFloatField;
    QRYITENSNUM3: TFloatField;
    QRYITENSNUM4: TFloatField;
    QRYITENSNUM5: TFloatField;
    QRYITENSNOME_SERVICO: TWideStringField;
    QRYITENSTIPOREGISTRO: TWideStringField;
    QRYITENSVLR_ITEM: TFloatField;
    QRYITENSPERTENCE_SERV_TERCEIRO: TWideStringField;
    PCINSEREITENS_TEMP: TZStoredProc;
    DBGRID_ITENSDBTableView1PERTENCE_SERV_TERCEIRO: TcxGridDBColumn;
    frxOrcamento: TfrxReport;
    FRXDBITENS: TfrxDBDataset;
    FRXDBHEADER: TfrxDBDataset;
    QRYRELHEADER_ORCAMENTO: TZQuery;
    QRYRELHEADER_ORCAMENTOCOD_ORCAMENTO: TFloatField;
    QRYRELHEADER_ORCAMENTOCOD_EMPRESA: TFloatField;
    QRYRELHEADER_ORCAMENTOCOD_CLIENTE: TFloatField;
    QRYRELHEADER_ORCAMENTODESCRICAO: TWideStringField;
    QRYRELHEADER_ORCAMENTOSITUACAO: TWideStringField;
    QRYRELHEADER_ORCAMENTODATA_INICIAL_VIGENCIA: TDateTimeField;
    QRYRELHEADER_ORCAMENTODATA_FINAL_VIGENCIA: TDateTimeField;
    QRYRELHEADER_ORCAMENTOOBSERVACOES: TWideStringField;
    QRYRELHEADER_ORCAMENTOVALOR_TOTAL: TFloatField;
    QRYRELHEADER_ORCAMENTOVALOR_DESCONTO: TFloatField;
    QRYRELHEADER_ORCAMENTODATA_CADASTRO: TDateTimeField;
    QRYRELHEADER_ORCAMENTOMOTIVO_DESCONTO: TWideStringField;
    QRYRELHEADER_ORCAMENTONOME_NOME_FANTASIA: TWideStringField;
    QRYRELHEADER_ORCAMENTOCPF: TWideStringField;
    QRYRELHEADER_ORCAMENTOCNPJ: TWideStringField;
    QRYRELHEADER_ORCAMENTOTIPO_PESSOA: TWideStringField;
    QRYRELHEADER_ORCAMENTOENDERECO: TWideStringField;
    QRYRELHEADER_ORCAMENTONUMERO: TFloatField;
    QRYRELHEADER_ORCAMENTOCOMPLEMENTO: TWideStringField;
    QRYRELHEADER_ORCAMENTOBAIRRO: TWideStringField;
    QRYRELHEADER_ORCAMENTOCEP: TWideStringField;
    QRYRELHEADER_ORCAMENTOEMAIL: TWideStringField;
    QRYRELITENS_ORCAMENTO: TZQuery;
    QRYRELITENS_ORCAMENTOCOD_SERVICO: TFloatField;
    QRYRELITENS_ORCAMENTOCOD_ORCAMENTO: TFloatField;
    QRYRELITENS_ORCAMENTOCOD_EMPRESA: TFloatField;
    QRYRELITENS_ORCAMENTOCOD_CLIENTE: TFloatField;
    QRYRELITENS_ORCAMENTOVALOR_SERV_INDIVIDUAL: TFloatField;
    QRYRELITENS_ORCAMENTOQUANTIDADE_SERVICO: TFloatField;
    QRYRELITENS_ORCAMENTOTEM_SERV_TERCEIRO: TWideStringField;
    QRYRELITENS_ORCAMENTOVALOR_SERV_TERCEIRO: TFloatField;
    QRYRELITENS_ORCAMENTOCOD_SERVICO_TERCEIRO: TFloatField;
    QRYRELITENS_ORCAMENTOQTDE_SERV_TERCEIRO: TFloatField;
    QRYRELITENS_ORCAMENTONOME_SERVICO: TWideStringField;
    QRYRELHEADER_ORCAMENTONOME_EMPRESA: TWideStringField;
    QRYRELHEADER_ORCAMENTOTELEFONE_CELULAR: TWideStringField;
    QRYRELHEADER_ORCAMENTOCIDADE: TWideStringField;
    QRYRELHEADER_ORCAMENTOUF: TWideStringField;
    QRYRELITENS_ORCAMENTOVLR_TOTAL: TFloatField;
    QRYRELITENS_TERC_ORCAMENTO: TZQuery;
    FRXDBITENS_TERCEIRO: TfrxDBDataset;
    QRYHEADER_ORCAMENTOVALOR_SERV_TERCEIRO: TFloatField;
    QRYRELHEADER_ORCAMENTOVALOR_SERV_TERCEIRO: TFloatField;
    QRYHEADER_ORCAMENTOUSUA_RESPONSAVEL: TWideStringField;
    QRYRELHEADER_ORCAMENTOUSUA_RESPONSAVEL: TWideStringField;
    PCFINALIZA_ORCAMENTO: TZStoredProc;
    DBGRID_ITENSDBTableView1NUM4: TcxGridDBColumn;
    BTNINCLUIR_SERV_TERCEIRO: TBitBtn;
    QRYRELITENS_TERC_ORCAMENTOCOD_SERVICO_TERCEIRO: TFloatField;
    QRYRELITENS_TERC_ORCAMENTONOME_SERVICO_TERCEIRO: TWideStringField;
    QRYRELITENS_TERC_ORCAMENTOVALOR_SERV_TERCEIRO: TFloatField;
    QRYRELITENS_TERC_ORCAMENTOVLR_TOTAL: TFloatField;
    QRYRELITENS_TERC_ORCAMENTOQTDE_SERV_TERCEIRO: TFloatField;
    BIB_BUSCA_ORCAMENTO: TBitBtn;
    QRYHEADER_ORCAMENTOPORCENTAGEM_DESCONTO: TFloatField;
    GroupBox5: TGroupBox;
    Edit1: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    procedure FormShow(Sender: TObject);
    procedure RGTIPO_ORCAMENTOClick(Sender: TObject);
    procedure BTNCANCELAR_GERALClick(Sender: TObject);
    procedure DBTXTCOD_ORCAMENTOExit(Sender: TObject);
    procedure CARREGAR_ORCAMENTO;
    procedure HABILITARCAMPOS(PESTADO:BOOLEAN);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure DBTXTCOD_SERVICOExit(Sender: TObject);
    procedure DBCTEM_SERV_TERCEIROSChange(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure BTNBUSCA_SERVClick(Sender: TObject);
    procedure DELETA_TEMPORARIA;
    procedure CARREGA_ITENS;
    procedure CARREGA_TOTAIS;
    procedure DBTXTDESCONTOExit(Sender: TObject);
    procedure DBGRID_ITENSDBTableView1DblClick(Sender: TObject);
    procedure BTNEXCLUIRClick(Sender: TObject);
    procedure BTNFINALIZARClick(Sender: TObject);
    procedure DBGRID_ITENSDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure BTNINCLUIR_SERV_TERCEIROClick(Sender: TObject);
    procedure BIB_BUSCA_ORCAMENTOClick(Sender: TObject);
    procedure QRYPARAMAfterInsert(DataSet: TDataSet);
    procedure MNUAJUDAClick(Sender: TObject);
    procedure DBTXTQUANTIDADEExit(Sender: TObject);
  private
    procedure CARREGAR_TOTAIS;
    PROCEDURE CARREGAR_RELATORIO_ORCAMENTO;
    procedure VERIFICA_SIT_ORCAMENTOS;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMOVORCAMENTO1: TFMMOVORCAMENTO1;
  B_SERV_TERCEIRO : BOOLEAN;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL, FMPADRAOCONSULTA, FMMOVSERV_TERCEIROS;

procedure TFMMOVORCAMENTO1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_NOME_FANTASIA', 'COD_CLIENTE "Codigo", NOME_NOME_FANTASIA "Nome", DECODE(TIPO_PESSOA,''F'',''Fisica'',''J'',''Juridica'') "Tipo Pessoa"',
        S_FILTRO, 'Nome do cliente', 'COD_CLIENTE',
        'TBCLIENTE', 'S', 'Clientes', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N2.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_CLIENTEExit(SELF);
  END;
end;

procedure TFMMOVORCAMENTO1.BIB_BUSCA_ORCAMENTOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
 S_FILTRO := 'COD_EMPRESA = '+INTTOSTR(EMPRESA_ATUAL)+
             'AND SITUACAO = ''A''';
             //'AND DATA_FINAL_VIGENCIA >= SYSDATE' ;
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_NOME_FANTASIA_CLIENTE', 'COD_ORCAMENTO "Codigo", NOME_NOME_FANTASIA_CLIENTE "Nome Cliente",'+
        'DATA_INICIAL_VIGENCIA "Data Inicial Vigencia", DATA_FINAL_VIGENCIA  "Data Final Vigencia",'+
        '''R$'' || VALOR_TOTAL "Valor Total",''R$'' || VALOR_DESCONTO "Valor Desconto", DATA_CADASTRO "Dt. Cadastro"'
        ,S_FILTRO, 'Nome Cliente', 'COD_ORCAMENTO',
        'TBHEADER_ORCAMENTO', 'S', 'de Orçamentos', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_ORCAMENTOEXIT(SELF);
  END;
end;

procedure TFMMOVORCAMENTO1.BTNBUSCA_SERVClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_SERVICO', 'COD_SERVICO "Codigo", NOME_SERVICO "Nome",  ''R$'' ||VALOR "Valor serviço"',
        S_FILTRO, 'Nome do serviço', 'COD_SERVICO',
        'TBSERVICOS', 'S', 'Serviços', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N3.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_SERVICOExit(SELF);
  END;
end;
procedure TFMMOVORCAMENTO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAMPARAM_N3.CLEAR;
   QRYPARAMPARAM_N4.CLEAR;
   QRYPARAMPARAM_N5.CLEAR;
   QRYPARAMPARAM_C3.CLEAR;
   //QRYPARAMPARAM_C3.ASSTRING := 'N';
   //QRYPARAMPARAM_N7.Clear;
   DBCTEM_SERV_TERCEIROSChange(SELF);
   DBC_SITUACAOCHANGE(SELF);
   TXTNOME_SERVICO.TEXT := '';
   LBLSERV_TERC.Visible := TRUE;
   DBCTEM_SERV_TERCEIROS.Visible := TRUE;
   LBLTEM_SERV_TERC.Visible      := TRUE;
   B_SERV_TERCEIRO := FALSE;
   DBTXTCOD_SERVICO.Enabled := TRUE;
   DBTXTCOD_SERVICO.SetFocus;
    LBLTEM_SERV_TERC.CAPTION := '';

end;

procedure TFMMOVORCAMENTO1.BTNCANCELAR_GERALClick(Sender: TObject);
begin
  inherited;

  DELETA_TEMPORARIA;
  RGTIPO_ORCAMENTO.ITEMINDEX := 0;
  RGTIPO_ORCAMENTOCLICK(SELF);
  TXTCLIENTE.TEXT := '';
  TXTNOME_SERVICO.TEXT := '';
 // BTNFINALIZAR.ENABLED := FALSE;
  LBLSERV_TERC.VISIBLE := TRUE;
  DBCTEM_SERV_TERCEIROS.VISIBLE := TRUE;
  LBLTEM_SERV_TERC.VISIBLE      := TRUE;
  QRYITENS.CLOSE;
  B_SERV_TERCEIRO := FALSE;
  DBGRID_ITENS.Enabled := TRUE;
  LBLTEM_SERV_TERC.CAPTION := '';

end;

procedure TFMMOVORCAMENTO1.BTNCONFIRMARClick(Sender: TObject);
 VAR B_CONTINUA : BOOLEAN;
     ICOD_SERV_TERCEIRO,IQUANTIDADE : INTEGER;
     IVLR_SERV_TERCEIRO : REAL;
begin
  inherited;

  IF QRYPARAMPARAM_N2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe um cliente para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_CLIENTE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data inicial para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data final para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_FINAL.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASDATETIME > QRYPARAMPARAM_D2.ASDATETIME THEN
   BEGIN
     MessageDlg('A data Inicial não pode ser maior do que a Data Final',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N3.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe um serviço para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_SERVICO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N5.ASINTEGER <= 0 THEN
   BEGIN
     MessageDlg('A quantidade informada deve ser maior do que 0.',mtInformation,[MBOK],0);
     DBTXTQUANTIDADE.SETFOCUS;
     ABORT;
   END;

   IF NOT B_SERV_TERCEIRO then
   BEGIN
     IF QRYPARAMPARAM_C3.ASSTRING = 'S' THEN
     BEGIN
         TRY
           APPLICATION.CREATEFORM(TFMMOVSERV_TERCEIROS1,FMMOVSERV_TERCEIROS1);
           FMMOVSERV_TERCEIROS1.SHOWMODAL;
           IF FMMOVSERV_TERCEIROS1.B_CONTINUA THEN
           BEGIN
              ICOD_SERV_TERCEIRO  := FMMOVSERV_TERCEIROS1.QRYPARAMPARAM_N1.ASINTEGER;
              IQUANTIDADE         := FMMOVSERV_TERCEIROS1.QRYPARAMPARAM_N3.ASINTEGER;
              IVLR_SERV_TERCEIRO  := FMMOVSERV_TERCEIROS1.QRYPARAMPARAM_N2.ASFLOAT;

              TRY
                QRYAUX.Close;
                QRYAUX.SQL.Clear;
                QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
                QRYAUX.SQL.Add('FROM TBTEMPORARIA');
                QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
                QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
                QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
                QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
                QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
                QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
                QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := INTTOSTR(ICOD_SERV_TERCEIRO);
                QRYAUX.OPEN;

                IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER = 0 THEN
                BEGIN
                  QRYAUX.CLOSE;
                  QRYAUX.SQL.CLEAR;
                  QRYAUX.SQL.ADD('INSERT INTO TBTEMPORARIA(');
                  QRYAUX.SQL.ADD('CODTERMINAL,COD_APLICACAO,TIPOREGISTRO,CHAVE,');
                  QRYAUX.SQL.ADD('NUM1,NUM2,NUM3,NUM4,NUM5,ALFA2)');
                  QRYAUX.SQL.ADD('VALUES(');
                  QRYAUX.SQL.ADD(':PCODTERMINAL,:PCOD_APLICACAO,:PTIPOREGISTRO,:PCHAVE,');
                  QRYAUX.SQL.ADD(':PNUM1,:PNUM2,:PNUM3,:PNUM4,:PNUM5,:PALFA2)');
                  QRYAUX.PARAMBYNAME('PCODTERMINAL').ASSTRING   := BUSCANOME_COMPUTADOR;
                  QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
                  QRYAUX.PARAMBYNAME('PTIPOREGISTRO').ASSTRING  := 'S';  // SERVIÇO DE TERCEIRO
                  QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := IntToStr(ICOD_SERV_TERCEIRO);
                  QRYAUX.PARAMBYNAME('PNUM1').ASINTEGER         := EMPRESA_ATUAL;
                  QRYAUX.PARAMBYNAME('PNUM2').ASINTEGER         := QRYPARAMPARAM_N3.AsInteger; // SERVIÇO RELACIONADO.
                  QRYAUX.PARAMBYNAME('PNUM3').ASINTEGER         := ICOD_SERV_TERCEIRO;
                  QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT           := IVLR_SERV_TERCEIRO;
                  QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := IQUANTIDADE;
                  QRYAUX.PARAMBYNAME('PALFA2').ASSTRING        := 'P'; // flag para marcar que é serviço de terceiro
                  QRYAUX.EXECSQL;
                END
                ELSE
                BEGIN
                  QRYAUX.CLOSE;
                  QRYAUX.SQL.CLEAR;
                  QRYAUX.SQL.Add('UPDATE TBTEMPORARIA');
                  QRYAUX.SQL.Add('SET NUM4 = :PNUM4, ');
                  QRYAUX.SQL.Add('    NUM5 = :PNUM5');
                  QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
                  QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
                  QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
                  QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
                  QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
                  QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
                  QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := INTTOSTR(ICOD_SERV_TERCEIRO);
                  QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT         := IVLR_SERV_TERCEIRO;
                  QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := IQUANTIDADE;
                  QRYAUX.EXECSQL;
                END;

                MDPRINCIPAL.COMMIT;
              EXCEPT
               ON E:EXCEPTION DO
               BEGIN
                  MDPRINCIPAL.ROLLBACK;
                  MESSAGEDLG('Erro ao inserir serviço de terceiro no orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
                  DBTXTCOD_SERVICO.SETFOCUS;
                  ABORT;
               END;
             END;
           END;
         FINALLY
           FMMOVSERV_TERCEIROS1.FREE;
         END;
     END;
   END
   ELSE
   BEGIN
      ICOD_SERV_TERCEIRO  := QRYPARAMPARAM_N3.ASINTEGER;
      IQUANTIDADE         := QRYPARAMPARAM_N5.ASINTEGER;
      IVLR_SERV_TERCEIRO  := QRYPARAMPARAM_N4.ASFLOAT;

      TRY
        QRYAUX.Close;
        QRYAUX.SQL.Clear;
        QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
        QRYAUX.SQL.Add('FROM TBTEMPORARIA');
        QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
        QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
        QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
        QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
        QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
        QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
        QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := INTTOSTR(ICOD_SERV_TERCEIRO);
        QRYAUX.OPEN;

        IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
        BEGIN
          QRYAUX.CLOSE;
          QRYAUX.SQL.CLEAR;
          QRYAUX.SQL.Add('UPDATE TBTEMPORARIA');
          QRYAUX.SQL.Add('SET NUM4  = :PNUM4, ');
          QRYAUX.SQL.Add('    NUM5  = :PNUM5');
          //QRYAUX.SQL.Add('    ALFA3 = :PNUM5');
          QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
          QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
          QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
          QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
          QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := INTTOSTR(ICOD_SERV_TERCEIRO);
          QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT           := IVLR_SERV_TERCEIRO;
          QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := IQUANTIDADE;
          QRYAUX.EXECSQL;
        END;

        MDPRINCIPAL.COMMIT;
      EXCEPT
       ON E:EXCEPTION DO
       BEGIN
          MDPRINCIPAL.ROLLBACK;
          MESSAGEDLG('Erro ao alterar serviço de terceiro no orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
          DBTXTCOD_SERVICO.SETFOCUS;
          ABORT;
       END;
     END;
   END;
  // preciso colocar um campo com um total para calcular o valor do pedido com
  // os serviços de terceiros que não serão inseridos na header orçamento
  // é somente para ele(usuario) ter uma ideia do valor final
  // vou relacionar com um produto e mostrar na grid
  // depois inserir em uma tabela(orçamento ou nova)
  // para  no relatorio mostrar para ele uma estimativa
  // vou dar desconto somente nos serviços da empresa.
   IF NOT B_SERV_TERCEIRO then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
     QRYAUX.SQL.Add('FROM TBTEMPORARIA');
     QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
     QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
     QRYAUX.SQL.Add('      TIPOREGISTRO  = ''T'' AND');
     QRYAUX.SQL.Add('      CHAVE         = :PCHAVE ');
     QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
     QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
     QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := QRYPARAMPARAM_N1.ASSTRING+QRYPARAMPARAM_N3.ASSTRING;
     QRYAUX.OPEN;
     TRY
       IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
       BEGIN
          QRYAUX.CLOSE;
          QRYAUX.SQL.CLEAR;
          QRYAUX.SQL.Add('UPDATE TBTEMPORARIA');
          QRYAUX.SQL.Add('SET NUM4 = :PNUM4, ');
          QRYAUX.SQL.Add('    NUM5 = :PNUM5');
          QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
          QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
          QRYAUX.SQL.Add('      TIPOREGISTRO  = ''T'' AND');
          QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
          QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := QRYPARAMPARAM_N1.ASSTRING+QRYPARAMPARAM_N3.ASSTRING;
          QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT           := QRYPARAMPARAM_N4.ASFLOAT;
          QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := QRYPARAMPARAM_N5.ASINTEGER;
          QRYAUX.EXECSQL;

       END
       ELSE
       BEGIN
          QRYAUX.CLOSE;
          QRYAUX.SQL.CLEAR;
          QRYAUX.SQL.ADD('INSERT INTO TBTEMPORARIA(');
          QRYAUX.SQL.ADD('CODTERMINAL,COD_APLICACAO,TIPOREGISTRO,CHAVE,');
          QRYAUX.SQL.ADD('NUM1,NUM2,NUM3,NUM4,NUM5,ALFA1)');
          QRYAUX.SQL.ADD('VALUES(');
          QRYAUX.SQL.ADD(':PCODTERMINAL,:PCOD_APLICACAO,:PTIPOREGISTRO,:PCHAVE,');
          QRYAUX.SQL.ADD(':PNUM1,:PNUM2,:PNUM3,:PNUM4,:PNUM5,:PALFA1)');
          QRYAUX.PARAMBYNAME('PCODTERMINAL').ASSTRING   := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PTIPOREGISTRO').ASSTRING  := 'T';
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := QRYPARAMPARAM_N1.ASSTRING+QRYPARAMPARAM_N3.ASSTRING;  // ORÇAMENTO + COD_SERVICO
          QRYAUX.PARAMBYNAME('PNUM1').ASINTEGER         := EMPRESA_ATUAL;
          QRYAUX.PARAMBYNAME('PNUM2').ASINTEGER         := QRYPARAMPARAM_N1.ASINTEGER; // cod_cliente
          QRYAUX.PARAMBYNAME('PNUM3').ASINTEGER         := QRYPARAMPARAM_N3.ASINTEGER; // cod_servico
          QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT           := QRYPARAMPARAM_N4.ASFLOAT;   // valor_item
          QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := QRYPARAMPARAM_N5.ASINTEGER; // quantidade
          QRYAUX.PARAMBYNAME('PALFA1').ASSTRING         := QRYPARAMPARAM_C3.ASSTRING;  // tem serv_ terceiro
          QRYAUX.EXECSQL;
       END;
       MDPRINCIPAL.COMMIT;
     EXCEPT
       ON E:EXCEPTION DO
       BEGIN
          MDPRINCIPAL.ROLLBACK;
          MESSAGEDLG('Erro ao inserir/alterar serviço no orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
          DBTXTCOD_SERVICO.SetFocus;
          ABORT;
       END;
     END;
   END;
   BTNCANCELARCLICK(SELF);
   CARREGA_ITENS;
end;

procedure TFMMOVORCAMENTO1.BTNEXCLUIRClick(Sender: TObject);
begin
  inherited;
  IF NOT B_SERV_TERCEIRO then
  BEGIN
    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
    QRYAUX.SQL.Add('FROM TBTEMPORARIA');
    QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
    QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
    QRYAUX.SQL.Add('      TIPOREGISTRO  = ''T'' AND');
    QRYAUX.SQL.Add('      CHAVE         = :PCHAVE ');
    QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
    QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
    QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := QRYPARAMPARAM_N1.ASSTRING+QRYPARAMPARAM_N3.ASSTRING;
    QRYAUX.OPEN;
    if QRYAUX.FieldByName('QTDE').AsInteger > 0 then
    BEGIN
      If  MessageDlg('Você tem certeza que deseja excluir o serviço do orçamento?',mtConfirmation,[mbyes,mbno],0)=mryes
      then
      BEGIN
        TRY
          QRYAUX.Close;
          QRYAUX.SQL.Clear;
          QRYAUX.SQL.Add('DELETE');
          QRYAUX.SQL.Add('FROM TBTEMPORARIA');
          QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
          QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
          QRYAUX.SQL.Add('      TIPOREGISTRO  = ''T'' AND');
          QRYAUX.SQL.Add('      CHAVE         = :PCHAVE ');
          QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := QRYPARAMPARAM_N1.ASSTRING+QRYPARAMPARAM_N3.ASSTRING;
          QRYAUX.EXECSQL;
        EXCEPT
        ON E:EXCEPTION DO
          BEGIN
            MESSAGEDLG('Erro ao excluir serviço do orçamento.Erro: '+CHR(13)+E.Message,MTINFORMATION,[MBOK],1);
            MDPRINCIPAL.ROLLBACK;
            BTNCANCELARClick(SELF);
            DBTXTCOD_SERVICO.SetFocus;
            ABORT;
          END;
        END;
      END;
    END
    ELSE
    BEGIN
      MessageDlg('O item informado ainda não se encontra no orçamento',mtInformation,[MBOK],0);
      DBTXTCOD_SERVICO.SetFocus;
      BTNCANCELARClick(SELF);
      ABORT;
    END;
  END
  ELSE
  BEGIN
     If  MessageDlg('Você tem certeza que deseja excluir o serviço de terceiro do orçamento?',mtConfirmation,[mbyes,mbno],0)=mryes
     then
     BEGIN
       TRY
          QRYAUX.Close;
          QRYAUX.SQL.Clear;
          QRYAUX.SQL.Add('DELETE');
          QRYAUX.SQL.Add('FROM TBTEMPORARIA');
          QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
          QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
          QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
          QRYAUX.SQL.Add('      CHAVE         = :PCHAVE ');
          QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := QRYPARAMPARAM_N3.ASSTRING;
          QRYAUX.EXECSQL;

          QRYAUX.Close;
          QRYAUX.SQL.Clear;
          QRYAUX.SQL.Add('DELETE');
          QRYAUX.SQL.Add('FROM TBITENS_ORCAMENTO_TERCEIRO');
          QRYAUX.SQL.Add('WHERE COD_SERVICO_TERC   = :PCOD_SERV_TERC AND  ');
          QRYAUX.SQL.Add('      COD_ORCAMENTO      = :PCOD_ORCAMENTO AND');
          QRYAUX.SQL.Add('      COD_EMPRESA        = :PCOD_EMPRESA AND');
          QRYAUX.SQL.Add('      COD_CLIENTE        = :PCOD_CLIENTE ');
          QRYAUX.PARAMBYNAME('PCOD_SERV_TERC').ASINTEGER := QRYPARAMPARAM_N3.ASINTEGER;
          QRYAUX.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
          QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
          QRYAUX.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N2.ASINTEGER;
          QRYAUX.EXECSQL;
          MDPRINCIPAL.COMMIT;
       EXCEPT
       ON E:EXCEPTION DO
          BEGIN
            MDPRINCIPAL.ROLLBACK;
            MESSAGEDLG('Erro ao excluir serviço de terceiro do orçamento.Erro: '+CHR(13)+E.Message,MTINFORMATION,[MBOK],1);
            BTNCANCELARClick(SELF);
            DBTXTCOD_SERVICO.SetFocus;
            ABORT;
          END;
       END;
     END;
  END;
  BTNCANCELARClick(SELF);
  CARREGA_ITENS;
end;

procedure TFMMOVORCAMENTO1.BTNFINALIZARClick(Sender: TObject);
begin
  inherited;
  IF QRYPARAMPARAM_N2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe um cliente para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_CLIENTE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data inicial para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data final para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_FINAL.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASDATETIME < DATE THEN
   BEGIN
     MessageDlg('A data Inicial não pode ser menor do que a Data Atual',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASDATETIME > QRYPARAMPARAM_D2.ASDATETIME THEN
   BEGIN
     MessageDlg('A data Inicial não pode ser maior do que a Data Final',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;


   IF QRYITENS.ISEMPTY THEN
   BEGIN
     MessageDlg('Informe ao menos um serviço para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_SERVICO.SETFOCUS;
     ABORT;
   END;

   // VERIFICANDO SE TEM UM SERVIÇO DA EMPRESA

   QRYAUX.CLOSE;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.Add('FROM TBTEMPORARIA A');
   QRYAUX.SQL.Add('WHERE A.CODTERMINAL = :PCOD_TERMINAL AND');
   QRYAUX.SQL.Add('      A.COD_APLICACAO = :PCOD_APLICACAO AND');
   QRYAUX.SQL.Add('      A.TIPOREGISTRO = ''T''');
   QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
   QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
   QRYAUX.OPEN;

   if QRYAUX.FieldByName('QTDE').AsInteger = 0 then
   BEGIN
      MessageDlg('Informe ao menos um serviço da empresa para prosseguir',mtInformation,[MBOK],0);
      DBTXTCOD_SERVICO.SETFOCUS;
      ABORT;
   END;


   TRY
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PCOD_TERMINAL').ASSTRING          := BUSCANOME_COMPUTADOR;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PCOD_APLICACAO').ASSTRING         := 'FMMOVORCAMENTO';
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER          := EMPRESA_ATUAL;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER          := QRYPARAMPARAM_N2.ASINTEGER;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER        := QRYPARAMPARAM_N1.ASINTEGER;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PDESCRICAO_ORCAMENTO').ASSTRING   := QRYPARAMPARAM_C2.AsString;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PDATA_INICIO').ASDATETIME         := QRYPARAMPARAM_D1.ASDATETIME;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PDATA_FINAL').ASDATETIME          := QRYPARAMPARAM_D2.ASDATETIME;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PVALOR_TOTAL').ASFLOAT            := QRYPARAMPARAM_N9.ASFLOAT;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PVALOR_DESCONTO').ASFLOAT         := QRYPARAMPARAM_N8.ASFLOAT;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PVALOR_SERV_TERCEIRO').ASFLOAT    := QRYPARAMPARAM_N10.ASFLOAT;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PUSUA_RESPONSAVEL').ASSTRING      := USUARIO_ATUAL;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PCOD_USUARIO_RESPONSAVEL').ASINTEGER := ICOD_USUARIO_ATUAL;
      PCFINALIZA_ORCAMENTO.PARAMBYNAME('PPORCENTAGEM_DESCONTO').ASFLOAT   := QRYPARAMPARAM_N7.ASFLOAT;
      PCFINALIZA_ORCAMENTO.PREPARE;
      PCFINALIZA_ORCAMENTO.EXECPROC;
      PCFINALIZA_ORCAMENTO.UNPREPARE;
      MDPRINCIPAL.COMMIT;
   EXCEPT
   ON E:EXCEPTION DO
     BEGIN
        MDPRINCIPAL.ROLLBACK;
        MESSAGEDLG('Erro ao finalizar orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
        DBTXTCOD_CLIENTE.SetFocus;
        ABORT;
     END;
   END;
   CARREGAR_RELATORIO_ORCAMENTO;
   BTNCANCELAR_GERALCLICK(SELF);
end;

procedure TFMMOVORCAMENTO1.BTNINCLUIR_SERV_TERCEIROClick(Sender: TObject);
VAR  ICOD_SERV_TERCEIRO,IQUANTIDADE : INTEGER;
     IVLR_SERV_TERCEIRO : REAL;
begin
  inherited;
  IF QRYPARAMPARAM_N2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe um cliente para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_CLIENTE.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data inicial para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma data final para prosseguir',mtInformation,[MBOK],0);
     DBTXTDATA_FINAL.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASDATETIME > QRYPARAMPARAM_D2.ASDATETIME THEN
   BEGIN
     MessageDlg('A data Inicial não pode ser maior do que a Data Final',mtInformation,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

  TRY
   APPLICATION.CREATEFORM(TFMMOVSERV_TERCEIROS1,FMMOVSERV_TERCEIROS1);
   FMMOVSERV_TERCEIROS1.SHOWMODAL;
   IF FMMOVSERV_TERCEIROS1.B_CONTINUA THEN
   BEGIN
      ICOD_SERV_TERCEIRO  := FMMOVSERV_TERCEIROS1.QRYPARAMPARAM_N1.ASINTEGER;
      IQUANTIDADE         := FMMOVSERV_TERCEIROS1.QRYPARAMPARAM_N3.ASINTEGER;
      IVLR_SERV_TERCEIRO  := FMMOVSERV_TERCEIROS1.QRYPARAMPARAM_N2.ASFLOAT;

      TRY
        QRYAUX.Close;
        QRYAUX.SQL.Clear;
        QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
        QRYAUX.SQL.Add('FROM TBTEMPORARIA');
        QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
        QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
        QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
        QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
        QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
        QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
        QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := INTTOSTR(ICOD_SERV_TERCEIRO);
        QRYAUX.OPEN;

        IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER = 0 THEN
        BEGIN
          QRYAUX.CLOSE;
          QRYAUX.SQL.CLEAR;
          QRYAUX.SQL.ADD('INSERT INTO TBTEMPORARIA(');
          QRYAUX.SQL.ADD('CODTERMINAL,COD_APLICACAO,TIPOREGISTRO,CHAVE,');
          QRYAUX.SQL.ADD('NUM1,NUM2,NUM3,NUM4,NUM5,ALFA2,ALFA4)');
          QRYAUX.SQL.ADD('VALUES(');
          QRYAUX.SQL.ADD(':PCODTERMINAL,:PCOD_APLICACAO,:PTIPOREGISTRO,:PCHAVE,');
          QRYAUX.SQL.ADD(':PNUM1,:PNUM2,:PNUM3,:PNUM4,:PNUM5,:PALFA2,''I'')');
          QRYAUX.PARAMBYNAME('PCODTERMINAL').ASSTRING   := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PTIPOREGISTRO').ASSTRING  := 'S';  // SERVIÇO DE TERCEIRO
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := IntToStr(ICOD_SERV_TERCEIRO);
          QRYAUX.PARAMBYNAME('PNUM1').ASINTEGER         := EMPRESA_ATUAL;
          QRYAUX.PARAMBYNAME('PNUM2').ASINTEGER         := QRYPARAMPARAM_N3.AsInteger; // SERVIÇO RELACIONADO.
          QRYAUX.PARAMBYNAME('PNUM3').ASINTEGER         := ICOD_SERV_TERCEIRO;
          QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT           := IVLR_SERV_TERCEIRO;
          QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := IQUANTIDADE;
          QRYAUX.PARAMBYNAME('PALFA2').ASSTRING         := 'P'; // flag para marcar que é serviço de terceiro e é individual
          QRYAUX.EXECSQL;
        END
        ELSE
        BEGIN
          QRYAUX.CLOSE;
          QRYAUX.SQL.CLEAR;
          QRYAUX.SQL.Add('UPDATE TBTEMPORARIA');
          QRYAUX.SQL.Add('SET NUM4 = :PNUM4, ');
          QRYAUX.SQL.Add('    NUM5 = :PNUM5');
          QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
          QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO AND');
          QRYAUX.SQL.Add('      TIPOREGISTRO  = ''S'' AND');
          QRYAUX.SQL.Add('      CHAVE         = :PCHAVE  ');
          QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
          QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
          QRYAUX.PARAMBYNAME('PCHAVE').ASSTRING         := INTTOSTR(ICOD_SERV_TERCEIRO);
          QRYAUX.PARAMBYNAME('PNUM4').ASFLOAT         := IVLR_SERV_TERCEIRO;
          QRYAUX.PARAMBYNAME('PNUM5').ASINTEGER         := IQUANTIDADE;
          QRYAUX.EXECSQL;
        END;

        MDPRINCIPAL.COMMIT;
      EXCEPT
       ON E:EXCEPTION DO
       BEGIN
          MDPRINCIPAL.ROLLBACK;
          MESSAGEDLG('Erro ao inserir serviço de terceiro no orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
          DBTXTCOD_SERVICO.SETFOCUS;
          ABORT;
       END;
     END;
   END;
  FINALLY
   FMMOVSERV_TERCEIROS1.FREE;
  END;
   BTNCANCELARCLICK(SELF);
   CARREGA_ITENS;
end;

procedure TFMMOVORCAMENTO1.CARREGAR_ORCAMENTO;
begin
   TRY
     IF QRYPARAMPARAM_N1.ASSTRING <> '' THEN
     BEGIN
        IF RGTIPO_ORCAMENTO.ITEMINDEX = 1 THEN
        BEGIN
          QRYHEADER_ORCAMENTO.CLOSE;
          QRYHEADER_ORCAMENTO.SQL.CLEAR;
          QRYHEADER_ORCAMENTO.SQL.ADD('SELECT * FROM TBHEADER_ORCAMENTO');
          QRYHEADER_ORCAMENTO.SQL.ADD('WHERE COD_EMPRESA   = :PCOD_EMPRESA AND ');
          QRYHEADER_ORCAMENTO.SQL.ADD('      COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
           QRYHEADER_ORCAMENTO.SQL.ADD('     SITUACAO      = ''A''');
          QRYHEADER_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
          QRYHEADER_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
          QRYHEADER_ORCAMENTO.OPEN;


        IF QRYHEADER_ORCAMENTO.ISEMPTY THEN
        BEGIN
          MESSAGEDLG('Orçamento não informado, por favor informe um orçamento válido para prosseguir',MTINFORMATION,[MBOK],1);
          DBTXTCOD_ORCAMENTO.SetFocus;
          ABORT;
        END;
        {ELSE
        BEGIN
          HABILITARCAMPOS(TRUE);
          IF QRYHEADER_ORCAMENTODATA_FINAL_VIGENCIA.ASDATETIME < DATE THEN
          BEGIN
            // AQUI TENHO QUE INATIVAR O ORÇAMENTO SE ELE JA ESTA FORA DO PRAZO E AINDA ESTA ATIVO
            IF QRYHEADER_ORCAMENTOSITUACAO.ASSTRING = 'A' THEN
            BEGIN
              TRY
                 QRYAUX.CLOSE;
                 QRYAUX.SQL.CLEAR;
                 QRYAUX.SQL.ADD('UPDATE TBHEADER_ORCAMENTO');
                 QRYAUX.SQL.ADD('SET SITUACAO = ''I'' ');
                 QRYAUX.SQL.ADD('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
                 QRYAUX.SQL.ADD('      COD_ORCAMENTO = :PCOD_ORCAMENTO');
                 QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
                 QRYAUX.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
                 QRYAUX.EXECSQL;
                 MDPRINCIPAL.COMMIT;
                 // RECARREGA A QUERY POR QUE FIZ O UPDATE
                 QRYHEADER_ORCAMENTO.CLOSE;
                 QRYHEADER_ORCAMENTO.SQL.CLEAR;
                 QRYHEADER_ORCAMENTO.SQL.ADD('SELECT * FROM TBHEADER_ORCAMENTO');
                 QRYHEADER_ORCAMENTO.SQL.ADD('WHERE COD_EMPRESA  = :PCOD_EMPRESA AND ');
                 QRYHEADER_ORCAMENTO.SQL.ADD('      COD_ORCAMENTO = :PCOD_ORCAMENTO');
                 QRYHEADER_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
                 QRYHEADER_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
                 QRYHEADER_ORCAMENTO.OPEN;
               EXCEPT
                 ON E:EXCEPTION DO
                 BEGIN
                   MESSAGEDLG('Erro ao verificar situação do orçamento. Erro: '+CHR(13)+E.Message,MTINFORMATION,[MBOK],1);
                   MDPRINCIPAL.ROLLBACK;
                   DBTXTCOD_ORCAMENTO.SETFOCUS;
                   ABORT;
                 END;
               END;
               HABILITARCAMPOS(FALSE);
            END
            ELSE
            BEGIN
               HABILITARCAMPOS(TRUE);
            END;
          END;

            IF QRYHEADER_ORCAMENTOSITUACAO.ASSTRING  = 'A' THEN
            BEGIN
               HABILITARCAMPOS(TRUE);
            END
            ELSE
            BEGIN
               HABILITARCAMPOS(FALSE);
            END; }
            HABILITARCAMPOS(TRUE);
            QRYPARAMPARAM_N2.ASINTEGER  := QRYHEADER_ORCAMENTOCOD_CLIENTE.ASINTEGER;
            QRYPARAMPARAM_C1.ASSTRING   := QRYHEADER_ORCAMENTOSITUACAO.ASSTRING;
            QRYPARAMPARAM_C2.ASSTRING   := QRYHEADER_ORCAMENTODESCRICAO.ASSTRING;
            QRYPARAMPARAM_D1.ASDATETIME := QRYHEADER_ORCAMENTODATA_INICIAL_VIGENCIA.ASDATETIME;
            QRYPARAMPARAM_D2.ASDATETIME := QRYHEADER_ORCAMENTODATA_FINAL_VIGENCIA.ASDATETIME;
            QRYPARAMPARAM_N7.AsFloat    := QRYHEADER_ORCAMENTOPORCENTAGEM_DESCONTO.ASFLOAT;
            DBTXTCOD_CLIENTEEXIT(SELF);
            DBC_SITUACAOCHANGE(SELF);
           // DBGRID_ITENS.Enabled := FALSE;

            PCINSEREITENS_TEMP.ParamByName('PCOD_TERMINAL').AsString    := BUSCANOME_COMPUTADOR;
            PCINSEREITENS_TEMP.ParamByName('PCOD_APLICACAO').AsString   := 'FMMOVORCAMENTO';
            PCINSEREITENS_TEMP.ParamByName('PCOD_EMPRESA').ASINTEGER    := EMPRESA_ATUAL;
            PCINSEREITENS_TEMP.ParamByName('PCOD_ORCAMENTO').ASINTEGER  := QRYPARAMPARAM_N1.ASINTEGER;
            PCINSEREITENS_TEMP.ParamByName('PCOD_CLIENTE').ASINTEGER    := QRYPARAMPARAM_N2.ASINTEGER;
            PCINSEREITENS_TEMP.Prepare;
            PCINSEREITENS_TEMP.ExecProc;
            PCINSEREITENS_TEMP.Unprepare;

            IF RGTIPO_ORCAMENTO.ITEMINDEX = 0 THEN
            BEGIN
               // HABILITA_CAMPOS(FALSE);
               DBTXTCOD_CLIENTE.ENABLED := TRUE;
               BIB_BUSCA_CLIENTE.ENABLED := TRUE;
                //DBTXTCOD_ORCAMENTO.SetFocus;
            END
            ELSE IF RGTIPO_ORCAMENTO.ITEMINDEX = 1 THEN
            BEGIN
                // HABILITA_CAMPOS(TRUE);
                DBTXTCOD_CLIENTE.ENABLED := FALSE;
                BIB_BUSCA_CLIENTE.ENABLED := FALSE;
                 //DBTXTCOD_CLIENTE.SetFocus;
            END;

            CARREGA_ITENS;
            IF DBTXTCOD_SERVICO.CANFOCUS THEN
               DBTXTCOD_SERVICO.SETFOCUS;
          END;
        END;
     //END;
   EXCEPT
   on E:EABORT DO
   BEGIN
     //
   END;
   ON E:EXCEPTION DO
     BEGIN
        MDPRINCIPAL.ROLLBACK;
        MESSAGEDLG('Erro ao carregar orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
        if DBTXTCOD_CLIENTE.CanFocus then
           DBTXTCOD_CLIENTE.SetFocus;
        ABORT;
     END;
   END;
end;

procedure TFMMOVORCAMENTO1.CARREGAR_RELATORIO_ORCAMENTO;
begin
   QRYRELHEADER_ORCAMENTO.CLOSE;
   QRYRELHEADER_ORCAMENTO.SQL.CLEAR;
   QRYRELHEADER_ORCAMENTO.SQL.ADD('SELECT A.*,B.NOME_NOME_FANTASIA, B.CPF, NVL(B.CNPJ,B.CPF) "CNPJ",');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('       B.TIPO_PESSOA, B.ENDERECO, B.NUMERO, B.COMPLEMENTO, B.BAIRRO,');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('       B.CEP, B.EMAIL,C.RAZAO_SOCIAL "NOME_EMPRESA",');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('       B.TELEFONE_CELULAR,D.NOME CIDADE,D.UF');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('FROM TBHEADER_ORCAMENTO A, TBCLIENTE B , TBEMPRESA C, TBCIDADES D');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('WHERE A.COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('      A.COD_CLIENTE = :PCOD_CLIENTE AND');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('      B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('      B.COD_CLIENTE = A.COD_CLIENTE AND ');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('      C.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYRELHEADER_ORCAMENTO.SQL.ADD('      D.COD_IBGE    = B.COD_CIDADE');
   QRYRELHEADER_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELHEADER_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   QRYRELHEADER_ORCAMENTO.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N2.ASINTEGER;
   QRYRELHEADER_ORCAMENTO.OPEN;


   QRYRELITENS_ORCAMENTO.CLOSE;
   QRYRELITENS_ORCAMENTO.SQL.CLEAR;
   QRYRELITENS_ORCAMENTO.SQL.ADD('SELECT A.*, B.NOME_SERVICO, A.VALOR_SERV_INDIVIDUAL * A.QUANTIDADE_SERVICO VLR_TOTAL');
   QRYRELITENS_ORCAMENTO.SQL.ADD('FROM TBITENS_ORCAMENTO A,TBSERVICOS B ');
   QRYRELITENS_ORCAMENTO.SQL.ADD('WHERE A.COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
   QRYRELITENS_ORCAMENTO.SQL.ADD('      A.COD_EMPRESA   = :PCOD_EMPRESA AND');
   QRYRELITENS_ORCAMENTO.SQL.ADD('      A.COD_CLIENTE   = :PCOD_CLIENTE AND');
   QRYRELITENS_ORCAMENTO.SQL.ADD('      B.COD_EMPRESA   = A.COD_EMPRESA AND ');
   QRYRELITENS_ORCAMENTO.SQL.ADD('      B.COD_SERVICO   = A.COD_SERVICO ');
   QRYRELITENS_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELITENS_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   QRYRELITENS_ORCAMENTO.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N2.ASINTEGER;
   QRYRELITENS_ORCAMENTO.OPEN;

   {QRYRELITENS_TERC_ORCAMENTO.CLOSE;
   QRYRELITENS_TERC_ORCAMENTO.SQL.CLEAR;
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('SELECT A.*, B.NOME_SERVICO_TERCEIRO, A.VALOR_SERV_TERCEIRO * A.QTDE_SERV_TERCEIRO VLR_TOTAL');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('FROM TBITENS_ORCAMENTO A,TBSERVICOS2 B ');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('WHERE A.COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      A.COD_EMPRESA   = :PCOD_EMPRESA AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      A.COD_CLIENTE   = :PCOD_CLIENTE AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      B.COD_EMPRESA   = A.COD_EMPRESA AND ');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      B.COD_SERVICO_TERCEIRO = A.COD_SERVICO_TERCEIRO ');
   QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N2.ASINTEGER;
   QRYRELITENS_TERC_ORCAMENTO.OPEN;}

   QRYRELITENS_TERC_ORCAMENTO.CLOSE;
   QRYRELITENS_TERC_ORCAMENTO.SQL.CLEAR;
   {QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('SELECT B.COD_SERVICO_TERCEIRO, B.NOME_SERVICO_TERCEIRO, A.QTDE_SERV_TERCEIRO,');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('       A.VALOR_SERV_TERCEIRO,A.VALOR_SERV_TERCEIRO * A.QTDE_SERV_TERCEIRO VLR_TOTAL');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('FROM TBITENS_ORCAMENTO A,TBSERVICOS2 B ');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('WHERE A.COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      A.COD_EMPRESA   = :PCOD_EMPRESA AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      A.COD_CLIENTE   = :PCOD_CLIENTE AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      B.COD_EMPRESA   = A.COD_EMPRESA AND ');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      B.COD_SERVICO_TERCEIRO = A.COD_SERVICO_TERCEIRO ');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('UNION ALL');  }
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('SELECT DISTINCT B.COD_SERVICO_TERCEIRO, B.NOME_SERVICO_TERCEIRO, Z.NUM5 QTDE_SERV_TERCEIRO, B.VALOR VALOR_SERV_TERCEIRO, Z.NUM4 * Z.NUM5 VLR_TOTAL');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('FROM TBTEMPORARIA Z, TBSERVICOS2 B');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('WHERE Z.CODTERMINAL = :PCOD_TERMINAL AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      Z.COD_APLICACAO = ''FMMOVORCAMENTO'' AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      Z.NUM1 = :PCOD_EMPRESA AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      Z.TIPOREGISTRO = ''S'' AND');
   //QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      Z.NUM3 = :PCOD_CLIENTE AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      B.COD_EMPRESA = Z.NUM1 AND');
   QRYRELITENS_TERC_ORCAMENTO.SQL.ADD('      B.COD_SERVICO_TERCEIRO = Z.NUM3');
   QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_TERMINAL').ASSTRING   := BUSCANOME_COMPUTADOR;
   //QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
   QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   //QRYRELITENS_TERC_ORCAMENTO.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER   := QRYPARAMPARAM_N2.ASINTEGER;
   QRYRELITENS_TERC_ORCAMENTO.OPEN;

   frxOrcamento.ShowReport;
end;

procedure TFMMOVORCAMENTO1.CARREGAR_TOTAIS;
begin

end;

procedure TFMMOVORCAMENTO1.CARREGA_ITENS;
begin
    CARREGA_TOTAIS;
    QRYITENS.CLOSE;
    QRYITENS.SQL.CLEAR;
    QRYITENS.SQL.ADD('SELECT X.* FROM (SELECT A.NUM2, A.NUM3, A.NUM4, A.NUM5, B.NOME_SERVICO, A.TIPOREGISTRO,');
    QRYITENS.SQL.ADD('                        A.NUM4 * A.NUM5 "VLR_ITEM",''N'' PERTENCE_SERV_TERCEIRO');
    QRYITENS.SQL.ADD('                FROM TBTEMPORARIA A, TBSERVICOS B');
    QRYITENS.SQL.ADD('                WHERE A.CODTERMINAL = :PCOD_TERMINAL AND');
    QRYITENS.SQL.ADD('                      A.COD_APLICACAO = :PCOD_APLICACAO AND');
    QRYITENS.SQL.ADD('                      A.TIPOREGISTRO = ''T'' AND -- NORMAL -(ITEM DO ORÇAMENTO)');
    QRYITENS.SQL.ADD('                      B.COD_EMPRESA = A.NUM1 AND');
    QRYITENS.SQL.ADD('                      B.COD_SERVICO = A.NUM3 AND');
    QRYITENS.SQL.ADD('                      B.SITUACAO = ''A''');
    QRYITENS.SQL.ADD('                UNION ALL');
    QRYITENS.SQL.ADD('                SELECT A.NUM2, A.NUM3, A.NUM4, A.NUM5, B.NOME_SERVICO_TERCEIRO, A.TIPOREGISTRO,');
    QRYITENS.SQL.ADD('                       A.NUM4 * A.NUM5 "VLR_ITEM",a.alfa2');
    QRYITENS.SQL.ADD('                FROM TBTEMPORARIA A, TBSERVICOS2 B');
    QRYITENS.SQL.ADD('                WHERE A.CODTERMINAL = :PCOD_TERMINAL AND');
    QRYITENS.SQL.ADD('                      A.COD_APLICACAO = :PCOD_APLICACAO AND');
    QRYITENS.SQL.ADD('                      A.TIPOREGISTRO = ''S'' AND');
    QRYITENS.SQL.ADD('                      B.COD_EMPRESA = A.NUM1 AND');
    QRYITENS.SQL.ADD('                      B.COD_SERVICO_TERCEIRO = A.NUM3 AND');
    QRYITENS.SQL.ADD('                      B.SITUACAO = ''A''');
    QRYITENS.SQL.ADD('               UNION ALL');
    QRYITENS.SQL.ADD('                SELECT J.COD_CLIENTE, J.COD_SERVICO, J.VALOR_SERV_INDIVIDUAL, J.QUANTIDADE_SERVICO,');
    QRYITENS.SQL.ADD('                       K.NOME_SERVICO, ''A'', J.VALOR_SERV_INDIVIDUAL * J.QUANTIDADE_SERVICO,''N''');
    QRYITENS.SQL.ADD('                FROM TBITENS_ORCAMENTO J, TBSERVICOS K');
    QRYITENS.SQL.ADD('                WHERE J.COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
    QRYITENS.SQL.ADD('                      J.COD_EMPRESA = :PCOD_EMPRESA AND');
    QRYITENS.SQL.ADD('                      J.COD_CLIENTE = :PCOD_CLIENTE AND');
    QRYITENS.SQL.ADD('                      K.COD_EMPRESA = J.COD_EMPRESA AND');
    QRYITENS.SQL.ADD('                      K.COD_SERVICO = J.COD_SERVICO AND');
    QRYITENS.SQL.ADD('                      K.SITUACAO = ''A'')X');
    QRYITENS.SQL.ADD('ORDER BY X.TIPOREGISTRO DESC,X.NUM3,X.NUM2,X.PERTENCE_SERV_TERCEIRO                      ');
    {QRYITENS.SQL.ADD('                UNION ALL');
    QRYITENS.SQL.ADD('                SELECT F.COD_CLIENTE, F.COD_SERVICO_TERCEIRO, F.VALOR_SERV_TERCEIRO, F.QTDE_SERV_TERCEIRO,');
    QRYITENS.SQL.ADD('                       Z.NOME_SERVICO_TERCEIRO, ''H'', F.VALOR_SERV_TERCEIRO * F.QTDE_SERV_TERCEIRO,''P''');
    QRYITENS.SQL.ADD('                FROM TBITENS_ORCAMENTO F, TBSERVICOS2 Z');
    QRYITENS.SQL.ADD('                WHERE F.COD_ORCAMENTO = :PCOD_ORCAMENTO AND');
    QRYITENS.SQL.ADD('                      F.COD_EMPRESA = :PCOD_EMPRESA AND');
    QRYITENS.SQL.ADD('                      F.COD_CLIENTE = :PCOD_CLIENTE AND');
    QRYITENS.SQL.ADD('                      Z.COD_EMPRESA = F.COD_EMPRESA AND');
    QRYITENS.SQL.ADD('                      Z.COD_SERVICO_TERCEIRO = F.COD_SERVICO_TERCEIRO AND');
    QRYITENS.SQL.ADD('                       Z.SITUACAO = ''A'') X');
    QRYITENS.SQL.ADD('ORDER BY X.TIPOREGISTRO,X.NUM3,X.NUM2,X.PERTENCE_SERV_TERCEIRO                      '); }
    QRYITENS.PARAMBYNAME('PCOD_TERMINAL').ASSTRING    := BUSCANOME_COMPUTADOR;
    QRYITENS.PARAMBYNAME('PCOD_APLICACAO').ASSTRING   := 'FMMOVORCAMENTO';
    {QRYITENS.PARAMBYNAME('PCOD_ORCAMENTO').ASINTEGER  := QRYPARAMPARAM_N1.AsInteger;
    QRYITENS.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER    := EMPRESA_ATUAL;
    QRYITENS.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER    := QRYPARAMPARAM_N2.AsInteger; }
    QRYITENS.OPEN;

end;

procedure TFMMOVORCAMENTO1.CARREGA_TOTAIS;
begin
   TRY
      PCGERA_TOTAIS_ORCAMENTO.ParamByName('PCOD_TERMINAL').AsString  := BUSCANOME_COMPUTADOR;
      PCGERA_TOTAIS_ORCAMENTO.ParamByName('PCOD_APLICACAO').AsString := 'FMMOVORCAMENTO';
      PCGERA_TOTAIS_ORCAMENTO.ParamByName('PCOD_EMPRESA').ASINTEGER  := EMPRESA_ATUAL;
      PCGERA_TOTAIS_ORCAMENTO.ParamByName('PPORCENTAGEM_DESCONTO').ASFLOAT  := QRYPARAMPARAM_N7.AsFloat;
      PCGERA_TOTAIS_ORCAMENTO.Prepare;
      PCGERA_TOTAIS_ORCAMENTO.ExecProc;
      QRYPARAMPARAM_N6.AsFloat  := PCGERA_TOTAIS_ORCAMENTO.ParamByName('PVALOR_TOTAL_SEM_DESCONTO').ASFLOAT;
      QRYPARAMPARAM_N8.AsFloat  := PCGERA_TOTAIS_ORCAMENTO.ParamByName('PVALOR_DESCONTO').ASFLOAT;
      QRYPARAMPARAM_N10.AsFloat := PCGERA_TOTAIS_ORCAMENTO.ParamByName('PVALOR_ESTIMADO').ASFLOAT;
      QRYPARAMPARAM_N9.AsFloat  := PCGERA_TOTAIS_ORCAMENTO.ParamByName('PVALOR_TOTAL_COM_DESCONTO').ASFLOAT;
      PCGERA_TOTAIS_ORCAMENTO.Unprepare;
      MDPRINCIPAL.COMMIT;
   EXCEPT
   ON E:EXCEPTION DO
     BEGIN
        MDPRINCIPAL.ROLLBACK;
        MESSAGEDLG('Erro ao calcular totais do orçamento. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
        DBTXTCOD_SERVICO.SetFocus;
        ABORT;
     END;
   END;

end;

procedure TFMMOVORCAMENTO1.DBCTEM_SERV_TERCEIROSChange(Sender: TObject);
begin
  inherited;
  if DBCTEM_SERV_TERCEIROS.Text = 'S'  then
  BEGIN
     LBLTEM_SERV_TERC.CAPTION := 'Sim';
  END
  ELSE IF DBCTEM_SERV_TERCEIROS.Text = 'N' then
  BEGIN
     LBLTEM_SERV_TERC.CAPTION := 'Não';
  END
  ELSE
  BEGIN
     LBLTEM_SERV_TERC.CAPTION := ' ';
  END;
end;

procedure TFMMOVORCAMENTO1.DBC_SITUACAOChange(Sender: TObject);
begin
  inherited;
 if DBC_SITUACAO.Text = 'A' then
  BEGIN
    TXTSITUACAO.Caption := 'Ativo';
  END
  ELSE if DBC_SITUACAO.Text = 'I' then
  BEGIN
    TXTSITUACAO.Caption := 'Inativo';
  END
  ELSE
  BEGIN
    TXTSITUACAO.Caption := '';
  END;
end;

procedure TFMMOVORCAMENTO1.DBGRID_ITENSDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if(AViewInfo.GridRecord.Values[DBGRID_ITENSDBTableView1PERTENCE_SERV_TERCEIRO.Index] = 'P') then
  begin
    ACanvas.Brush.Color := CLRED;
    ACANVAS.FonT.Color  := clWhite;
    ACANVAS.Font.Style  := [FSBOLD];
  end;
end;

procedure TFMMOVORCAMENTO1.DBGRID_ITENSDBTableView1DblClick(Sender: TObject);
begin
  inherited;
   if not QRYITENS.IsEmpty then
   begin
     BTNCONFIRMAR.ENABLED := TRUE;
     BTNINCLUIR_SERV_TERCEIRO.ENABLED := TRUE;
     BTNEXCLUIR.ENABLED   := TRUE;
     DBTXTCOD_SERVICO.ENABLED := FALSE;
     IF QRYITENSTIPOREGISTRO.ASSTRING = 'T' THEN
     BEGIN
        LBLSERV_TERC.VISIBLE          := TRUE;
        DBCTEM_SERV_TERCEIROS.VISIBLE := TRUE;
        LBLTEM_SERV_TERC.VISIBLE      := TRUE;
        B_SERV_TERCEIRO               := FALSE;
        //QRYPARAMPARAM_C3.AsString     := QRYITEN
     END
     ELSE
     BEGIN
        LBLSERV_TERC.VISIBLE := FALSE;
        DBCTEM_SERV_TERCEIROS.VISIBLE := FALSE;
        LBLTEM_SERV_TERC.VISIBLE      := FALSE;
        B_SERV_TERCEIRO      := TRUE;
     END;
     QRYPARAMPARAM_N3.ASINTEGER := QRYITENSNUM3.ASINTEGER;
     DBTXTCOD_SERVICOEXIT(SELF);
     QRYPARAMPARAM_N5.ASINTEGER := QRYITENSNUM5.ASINTEGER;
   end;
end;

procedure TFMMOVORCAMENTO1.DBTXTCOD_CLIENTEExit(Sender: TObject);
begin
  inherited;
    if QRYPARAMPARAM_N2.ASSTRING <> '' then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_NOME_FANTASIA');
      QRYAUX.SQL.Add('FROM TBCLIENTE');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_CLIENTE  = :PCOD_CLIENTE  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N2.AsInteger;
      QRYAUX.Open;

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Cliente não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_CLIENTE.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTCLIENTE.Text := QRYAUX.FieldByName('NOME_NOME_FANTASIA').AsString;
        DBTXTDESC_ORCAMENTO.SETFOCUS;
      END;
    END
    ELSE
    BEGIN
       TXTCLIENTE.Text := '';
    END;
end;

procedure TFMMOVORCAMENTO1.DBTXTCOD_ORCAMENTOExit(Sender: TObject);
begin
  inherited;
   CARREGAR_ORCAMENTO;
end;

procedure TFMMOVORCAMENTO1.DBTXTCOD_SERVICOExit(Sender: TObject);
begin
  inherited;
  IF QRYPARAMPARAM_N3.ASSTRING <> '' then
    BEGIN
      IF NOT B_SERV_TERCEIRO THEN
        BEGIN
        QRYAUX.CLOSE;
        QRYAUX.SQL.CLEAR;
        QRYAUX.SQL.ADD('SELECT NOME_SERVICO,VALOR,TEM_SERVI_OS_TERCEIRO');
        QRYAUX.SQL.ADD('FROM TBSERVICOS');
        QRYAUX.SQL.ADD('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
        QRYAUX.SQL.ADD('      COD_SERVICO  = :PCOD_SERVICO  AND ');
        QRYAUX.SQL.ADD('      SITUACAO     = ''A'' ');
        QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
        QRYAUX.PARAMBYNAME('PCOD_SERVICO').ASINTEGER := QRYPARAMPARAM_N3.ASINTEGER;
        QRYAUX.OPEN;

        if QRYAUX.IsEmpty then
        BEGIN
          APPLICATION.MessageBox('Serviço não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
          DBTXTCOD_SERVICO.SETFOCUS;
          BTNCANCELARClick(SELF);
          ABORT;
        END
        ELSE
        BEGIN
          TXTNOME_SERVICO.TEXT := QRYAUX.FIELDBYNAME('NOME_SERVICO').ASSTRING;
          QRYPARAMPARAM_N4.ASFLOAT := QRYAUX.FIELDBYNAME('VALOR').ASFLOAT;
          QRYPARAMPARAM_C3.ASSTRING := QRYAUX.FIELDBYNAME('TEM_SERVI_OS_TERCEIRO').ASSTRING;
          DBCTEM_SERV_TERCEIROSCHANGE(SELF);
          DBTXTQUANTIDADE.SETFOCUS;
        END;
      END
      ELSE
      BEGIN
        QRYAUX.CLOSE;
        QRYAUX.SQL.CLEAR;
        QRYAUX.SQL.ADD('SELECT NOME_SERVICO_TERCEIRO,VALOR');
        QRYAUX.SQL.ADD('FROM TBSERVICOS2');
        QRYAUX.SQL.ADD('WHERE COD_EMPRESA            = :PCOD_EMPRESA  AND ');
        QRYAUX.SQL.ADD('      COD_SERVICO_TERCEIRO   = :PCOD_SERVICO  AND ');
        QRYAUX.SQL.ADD('      SITUACAO               = ''A'' ');
        QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
        QRYAUX.PARAMBYNAME('PCOD_SERVICO').ASINTEGER := QRYPARAMPARAM_N3.ASINTEGER;
        QRYAUX.OPEN;

        IF QRYAUX.ISEMPTY THEN
        BEGIN
          APPLICATION.MessageBox('Serviço não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
          DBTXTCOD_SERVICO.SETFOCUS;
          ABORT;
        END
        ELSE
        BEGIN
          TXTNOME_SERVICO.TEXT := QRYAUX.FIELDBYNAME('NOME_SERVICO_TERCEIRO').ASSTRING;
          QRYPARAMPARAM_N4.ASFLOAT := QRYAUX.FIELDBYNAME('VALOR').ASFLOAT;
          DBTXTQUANTIDADE.SETFOCUS;
        END;
      END;
    END
    ELSE
    BEGIN
      TXTNOME_SERVICO.TEXT := '';
      QRYPARAMPARAM_N4.CLEAR;
      QRYPARAMPARAM_N5.CLEAR;
    END;
end;

procedure TFMMOVORCAMENTO1.DBTXTDESCONTOExit(Sender: TObject);
begin
  inherited;
  if QRYPARAMPARAM_N7.AsFloat > 100 then
  BEGIN
    MESSAGEDLG('Você não pode dar um desconto maior do que 100%.',mtInformation,[MBOK],1);
    DBTXTDESCONTO.SetFocus;
    Abort;
  END;

  CARREGA_ITENS;
end;

procedure TFMMOVORCAMENTO1.DBTXTQUANTIDADEExit(Sender: TObject);
begin
  inherited;
   {IF QRYPARAMPARAM_N5.ASINTEGER <= 0 THEN
   BEGIN
     MessageDlg('A quantidade não pode ser igual ou menor a 0!',mtInformation,[MBOK],0);
     if DBTXTQUANTIDADE.CanFocus then
        DBTXTQUANTIDADE.SETFOCUS;
     ABORT;
   END; }
end;

procedure TFMMOVORCAMENTO1.DELETA_TEMPORARIA;
begin
   TRY
        QRYAUX.CLOSE;
        QRYAUX.SQL.CLEAR;
        QRYAUX.SQL.Add('DELETE TBTEMPORARIA');
        QRYAUX.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND  ');
        QRYAUX.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO ');
        QRYAUX.PARAMBYNAME('PCOD_TERMINAL').ASSTRING  := BUSCANOME_COMPUTADOR;
        QRYAUX.PARAMBYNAME('PCOD_APLICACAO').ASSTRING := 'FMMOVORCAMENTO';
        QRYAUX.EXECSQL;

        MDPRINCIPAL.COMMIT;
   EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MDPRINCIPAL.ROLLBACK;
        MESSAGEDLG('Erro ao deletar temporaria. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
        BTNCANCELAR_GERAL.SETFOCUS;
        ABORT;
     END;
   END;
end;

procedure TFMMOVORCAMENTO1.FormShow(Sender: TObject);
begin
  inherited;
  VERIFICA_SIT_ORCAMENTOS;
  BTNCANCELAR_GERALClick(SELF);

end;

procedure TFMMOVORCAMENTO1.HABILITARCAMPOS(PESTADO: BOOLEAN);
begin
   DBTXTCOD_ORCAMENTO.Enabled     := NOT PESTADO;
   DBTXTCOD_CLIENTE.Enabled       := PESTADO;
   //DBC_SITUACAO.Enabled           := PESTADO;
   DBC_SITUACAO.Enabled           := FALSE;
   DBTXTDESC_ORCAMENTO.Enabled    := PESTADO;
   DBTXTDATA_INICIO.Enabled       := PESTADO;
   DBTXTDATA_FINAL.Enabled        := PESTADO;
   DBTXTCOD_SERVICO.Enabled       := PESTADO;
   DBTXTVALOR_SERVICO.Enabled     := PESTADO;
   DBTXTQUANTIDADE.Enabled        := PESTADO;
   DBCTEM_SERV_TERCEIROS.Enabled  := PESTADO;
   BTNCONFIRMAR.Enabled           := PESTADO;
   BTNINCLUIR_SERV_TERCEIRO.ENABLED := PESTADO;
   BTNEXCLUIR.Enabled             := PESTADO;
   BTNCANCELAR.Enabled            := PESTADO;
   DBTXTVALOR_SERVICO.Enabled     := PESTADO;
   DBTXTTOTAL_SEM_DESC.Enabled    := PESTADO;
   DBTXTDESC_ORCAMENTO.Enabled    := PESTADO;
   DBTXTVLR_DESCONTO.Enabled      := PESTADO;
   DBTXTVLR_COM_DESC.Enabled      := PESTADO;
   BTNFINALIZAR.Enabled           := PESTADO;
   DBTXTDESCONTO.Enabled          := PESTADO;
   DBTXTVLR_ESTIMADO.Enabled      := PESTADO;
   BIB_BUSCA_CLIENTE.Enabled := PESTADO;
   BTNBUSCA_SERV.Enabled    := PESTADO;
end;

procedure TFMMOVORCAMENTO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('14');
end;

procedure TFMMOVORCAMENTO1.QRYPARAMAfterInsert(DataSet: TDataSet);
begin
  inherited;
   QRYPARAMPARAM_N6.AsInteger := 0;
   QRYPARAMPARAM_N8.AsInteger := 0;
   QRYPARAMPARAM_N9.AsInteger := 0;
   QRYPARAMPARAM_N10.AsInteger := 0;
end;

procedure TFMMOVORCAMENTO1.RGTIPO_ORCAMENTOClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;

   QRYITENS.Close;

   QRYPARAMPARAM_N7.ASFLOAT := 0;
   TXTCLIENTE.TEXT := '';
   BIB_BUSCA_ORCAMENTO.Enabled := FALSE;
   IF RGTIPO_ORCAMENTO.ITEMINDEX = 0 THEN
   BEGIN
      DBTXTCOD_ORCAMENTO.ENABLED := FALSE;
      QRYAUX.CLOSE;
      QRYAUX.SQL.CLEAR;
      QRYAUX.SQL.ADD('SELECT NVL(MAX(A.COD_ORCAMENTO), 0) + 1 COD_ORCAMENTO');
      QRYAUX.SQL.ADD('FROM TBHEADER_ORCAMENTO A');
      QRYAUX.SQL.ADD('WHERE COD_EMPRESA = :PCOD_EMPRESA');
      QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
      QRYAUX.OPEN;
      QRYPARAMPARAM_N1.ASINTEGER := QRYAUX.FIELDBYNAME('COD_ORCAMENTO').ASINTEGER;
      QRYPARAMPARAM_C1.ASSTRING := 'A';
      QRYPARAMPARAM_D1.ASDATETIME := DATE;
      QRYPARAMPARAM_D2.ASDATETIME := DATE+15;
      DBC_SITUACAOCHANGE(SELF);
      HABILITARCAMPOS(TRUE);
      DBTXTCOD_CLIENTE.SETFOCUS;
      DBTXTCOD_CLIENTE.ENABLED := TRUE;
      BIB_BUSCA_CLIENTE.ENABLED := TRUE;
   END
   ELSE IF RGTIPO_ORCAMENTO.ITEMINDEX = 1 THEN
   BEGIN
      HABILITARCAMPOS(FALSE);
      DBTXTCOD_ORCAMENTO.SetFocus;
      BIB_BUSCA_ORCAMENTO.Enabled := TRUE;
      DBTXTCOD_CLIENTE.ENABLED := FALSE;
      BIB_BUSCA_CLIENTE.ENABLED := FALSE;
   END;
end;

procedure TFMMOVORCAMENTO1.VERIFICA_SIT_ORCAMENTOS;
begin
   TRY
     QRYAUX.CLOSE;
     QRYAUX.SQL.CLEAR;
     QRYAUX.SQL.ADD('UPDATE TBHEADER_ORCAMENTO');
     QRYAUX.SQL.ADD('SET SITUACAO = ''I'' ');
     QRYAUX.SQL.ADD('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
     QRYAUX.SQL.ADD('      DATA_FINAL_VIGENCIA < SYSDATE');
     QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
     QRYAUX.EXECSQL;
     MDPRINCIPAL.COMMIT;

  EXCEPT
   ON E:EXCEPTION DO
   BEGIN
     MESSAGEDLG('Erro ao verificar situação dos orçamentos. Erro: '+CHR(13)+E.Message,MTINFORMATION,[MBOK],1);
     MDPRINCIPAL.ROLLBACK;
     DBTXTCOD_ORCAMENTO.SETFOCUS;
     ABORT;
   END;
  END;
end;

end.
