unit FMMOVBAIXASALDODEVEDOR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TFMMOVBAIXASALDODEVEDOR1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    DBTXTCOD_OS: TDBEdit;
    TXTCLIENTE: TEdit;
    BIB_BUSCA_OS: TBitBtn;
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
    QRYHEADER_OSDATA_TERMINO: TDateTimeField;
    QRYHEADER_OSNOME_NOME_FANTASIA_CLIENTE: TWideStringField;
    QRYHEADER_OSNOME_NOME_FANTASIA: TWideStringField;
    QRYHEADER_OSNOME_TP_PAGAMENTO: TWideStringField;
    QRYPARCELAS: TZQuery;
    DSPARCELAS: TDataSource;
    QRYPARCELASCOD_OS: TFloatField;
    QRYPARCELASCOD_EMPRESA: TFloatField;
    QRYPARCELASCOD_CLIENTE: TFloatField;
    QRYPARCELASCOD_TP_PAGAMENTO: TFloatField;
    QRYPARCELASTOTAL_PARCELA: TFloatField;
    QRYPARCELASSITUACAO: TWideStringField;
    QRYPARCELASCOD_CONDICAO_PAGAMENTO: TFloatField;
    QRYPARCELASDATA_PAGAMENTO: TDateTimeField;
    QRYPARCELASCOD_BANCO_RECEBIMENTO: TFloatField;
    QRYPARCELASCOD_AGENCIA_RECEBIMENTO: TFloatField;
    QRYPARCELASCOD_CONTA_RECEBIMENTO: TFloatField;
    QRYPARCELASOBSERVACAO: TWideStringField;
    QRYPARCELASSEQUENCIA: TFloatField;
    QRYPARCELASDATA_VENCIMENTO: TDateTimeField;
    DBGRID_PARCELAS: TcxGrid;
    DBGRID_PARCELASDBTableView1: TcxGridDBTableView;
    DBGRID_PARCELASDBTableView1SEQUENCIA: TcxGridDBColumn;
    DBGRID_PARCELASDBTableView1TOTAL_PARCELA: TcxGridDBColumn;
    DBGRID_PARCELASDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    DBGRID_PARCELASLevel1: TcxGridLevel;
    QRYPARCELASDESC_SITUACAO: TStringField;
    DBGRID_PARCELASDBTableView1DESC_SITUACAO: TcxGridDBColumn;
    QRYPARCELASNOME_TP_PAGAMENTO: TWideStringField;
    DBGRID_PARCELASDBTableView1NOME_TP_PAGAMENTO: TcxGridDBColumn;
    QRYPARCELASVALOR_REAL_RECEBIDO: TFloatField;
    Label9: TLabel;
    procedure DBTXTCOD_OSExit(Sender: TObject);
    PROCEDURE CARREGAR_PARCELAS;
    procedure BIB_BUSCA_OSClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGRID_PARCELASDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure QRYPARCELASCalcFields(DataSet: TDataSet);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMOVBAIXASALDODEVEDOR1: TFMMOVBAIXASALDODEVEDOR1;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL, FMPADRAOFILTRO, FMPADRAOCONSULTA,
  FMMOVBAIXASALDODEVEDOR2;

procedure TFMMOVBAIXASALDODEVEDOR1.BIB_BUSCA_OSClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
 S_FILTRO := 'COD_EMPRESA = '+INTTOSTR(EMPRESA_ATUAL)+
             ' AND SITUACAO = ''F'' AND '+
             '1 <= (SELECT COUNT(1)'+
             '      FROM TBCONTAS_RECEBER B'+
             '      WHERE B.COD_OS = TBHEADERORDEM_SERVICO.COD_OS AND'+
             '            B.COD_EMPRESA = TBHEADERORDEM_SERVICO.COD_EMPRESA AND'+
             '            B.COD_CLIENTE = TBHEADERORDEM_SERVICO.COD_CLIENTE AND'+
             '            B.SITUACAO = ''E'')' ;
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        //'NOME_NOME_FANTASIA_CLIENTE', 'COD_OS "Codigo", NOME_NOME_FANTASIA_CLIENTE "Nome/Nome Fantasia" , TIP',
        'NOME_NOME_FANTASIA_CLIENTE', 'COD_OS "Codigo", NOME_NOME_FANTASIA_CLIENTE "Nome Cliente",'+
        'DATA_INICIO "Data Início", ''R$'' ||VALOR_TOTAL "Valor Total", ''R$'' ||VALOR_DESCONTO "Valor Desconto"',
        S_FILTRO, 'Nome', 'COD_OS',
        'TBHEADERORDEM_SERVICO', 'S', 'Ordem de Serviço', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_OSExit(SELF);
  END;
end;
procedure TFMMOVBAIXASALDODEVEDOR1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   QRYPARCELAS.CLOSE;
   TXTCLIENTE.TEXT := '';
   DBTXTCOD_OS.SETFOCUS;
   BTNCONFIRMAR.ENABLED := FALSE;
end;

procedure TFMMOVBAIXASALDODEVEDOR1.BTNCONFIRMARClick(Sender: TObject);
VAR
   BCONTINUA : BOOLEAN;
   IVLR_RECEBIDO :REAL;
begin
  inherited;

     If  MessageDlg('Você realmente deseja baixar a parcela número: '+
                    QRYPARCELASSEQUENCIA.AsString,mtConfirmation,[mbyes,mbno],0)=mryes   then
     BEGIN
      //
       BCONTINUA := FALSE;
       TRY
         APPLICATION.CREATEFORM(TFMBAIXASALDODEVEDOR2,FMBAIXASALDODEVEDOR2);
         FMBAIXASALDODEVEDOR2.IVLR_PARCELA := QRYPARCELASTOTAL_PARCELA.ASFLOAT;
         FMBAIXASALDODEVEDOR2.SHOWMODAL;
         IF FMBAIXASALDODEVEDOR2.BCONTINUA THEN
         BEGIN
           BCONTINUA := TRUE;
           IVLR_RECEBIDO := FMBAIXASALDODEVEDOR2.QRYPARAMPARAM_N1.ASFLOAT;
         END;
       FINALLY
         FMBAIXASALDODEVEDOR2.FREE;
       END;

       IF BCONTINUA THEN
       BEGIN
         TRY
          QRYAUX.Close;
          QRYAUX.SQL.Clear;
          QRYAUX.SQL.ADD('UPDATE TBCONTAS_RECEBER');
          QRYAUX.SQL.ADD('SET DATA_PAGAMENTO        = TRUNC(SYSDATE),');
          QRYAUX.SQL.ADD('    SITUACAO              = ''P'',');
          QRYAUX.SQL.ADD('    VALOR_REAL_RECEBIDO   = :PVALOR_REAL_RECEBIDO');
          QRYAUX.SQL.ADD('WHERE COD_OS           = :PCOD_OS AND');
          QRYAUX.SQL.ADD('      COD_EMPRESA      = :PCOD_EMPRESA AND ');
          QRYAUX.SQL.ADD('      COD_CLIENTE      = :PCOD_CLIENTE AND ');
          QRYAUX.SQL.ADD('      COD_TP_PAGAMENTO = :PCOD_TP_PAGAMENTO AND');
          QRYAUX.SQL.ADD('      SEQUENCIA        = :PSEQ');
          QRYAUX.ParamByName('PCOD_OS').AsInteger              := QRYPARAMPARAM_N1.AsInteger;
          QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger         := EMPRESA_ATUAL;
          QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger         := QRYPARCELASCOD_CLIENTE.AsInteger;
          QRYAUX.ParamByName('PCOD_TP_PAGAMENTO').AsInteger    := QRYPARCELASCOD_TP_PAGAMENTO.AsInteger;
          QRYAUX.ParamByName('PSEQ').AsInteger                 := QRYPARCELASSEQUENCIA.AsInteger;
          QRYAUX.ParamByName('PVALOR_REAL_RECEBIDO').ASFLOAT   := IVLR_RECEBIDO;
          QRYAUX.ExecSQL;
          MDPRINCIPAL.COMMIT;
          MESSAGEDLG('Parcela baixada com sucesso!.',
                      mtInformation,[MBOK],1);
          CARREGAR_PARCELAS;
         EXCEPT
           ON E:EXCEPTION DO
           BEGIN
              MDPRINCIPAL.ROLLBACK;
              MESSAGEDLG('Erro ao baixar a parcela selecionada. Erro :'+e.Message,mtInformation,[MBOK],1);
              abort;
           END;
         END;
       END;
     END;
end;

procedure TFMMOVBAIXASALDODEVEDOR1.CARREGAR_PARCELAS;
begin
   QRYPARCELAS.Close;
   QRYPARCELAS.SQL.Clear;
   QRYPARCELAS.SQL.Add('SELECT A.*,B.NOME_TP_PAGAMENTO ');
   QRYPARCELAS.SQL.Add('FROM TBCONTAS_RECEBER A, TBTIPO_PAGAMENTO B');
   QRYPARCELAS.SQL.Add('WHERE A.COD_OS      = :PCOD_OS AND ');
   QRYPARCELAS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYPARCELAS.SQL.Add('      A.COD_CLIENTE = :PCOD_CLIENTE AND');
   QRYPARCELAS.SQL.Add('      A.SITUACAO    = ''E''AND');
   QRYPARCELAS.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND ');
   QRYPARCELAS.SQL.Add('      B.COD_TP_PAGAMENTO = A.COD_TP_PAGAMENTO');
   QRYPARCELAS.ParamByName('PCOD_OS').AsInteger      := QRYPARAMPARAM_N1.AsInteger;
   QRYPARCELAS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYPARCELAS.ParamByName('PCOD_CLIENTE').AsInteger := QRYHEADER_OSCOD_CLIENTE.AsInteger;
   QRYPARCELAS.Open;
   if QRYPARCELAS.IsEmpty then
   BEGIN
      MESSAGEDLG('Não foram encontradas parcelas.',MTINFORMATION,[MBOK],1);
      BTNCANCELARClick(SELF);
      //DBTXTCOD_OS.SetFocus;
      //ABORT;
   END;
end;

procedure TFMMOVBAIXASALDODEVEDOR1.DBGRID_PARCELASDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
    IF(AVIEWINFO.GRIDRECORD.VALUES[DBGRID_PARCELASDBTABLEVIEW1DATA_VENCIMENTO.INDEX] < DATE) THEN
    BEGIN
      ACANVAS.BRUSH.COLOR := CLRED;
      ACANVAS.FONT.COLOR  := CLWHITE;
      ACANVAS.FONT.STYLE  := [FSBOLD];
    END;
end;

procedure TFMMOVBAIXASALDODEVEDOR1.DBTXTCOD_OSExit(Sender: TObject);
begin
  inherited;
 if QRYPARAMPARAM_N1.AsString <> '' then
   begin
       QRYHEADER_OS.CLOSE;
       QRYHEADER_OS.SQL.Clear;
       QRYHEADER_OS.SQL.Add('SELECT DISTINCT A.*, B.NOME_NOME_FANTASIA,D.NOME_TP_PAGAMENTO');
       QRYHEADER_OS.SQL.Add('FROM TBHEADERORDEM_SERVICO A, TBCLIENTE B,TBCONTAS_RECEBER C, TBTIPO_PAGAMENTO D');
       QRYHEADER_OS.SQL.Add('WHERE A.COD_OS      = :PCOD_OS AND');
       QRYHEADER_OS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
       QRYHEADER_OS.SQL.Add('      A.SITUACAO    = ''F'' AND');
       QRYHEADER_OS.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
       QRYHEADER_OS.SQL.Add('      B.COD_CLIENTE = A.COD_CLIENTE AND   ');
       QRYHEADER_OS.SQL.Add('      C.COD_OS = A.COD_OS AND');
       QRYHEADER_OS.SQL.Add('      C.COD_EMPRESA = A.COD_EMPRESA AND');
       QRYHEADER_OS.SQL.Add('      C.COD_CLIENTE = A.COD_CLIENTE AND');
       QRYHEADER_OS.SQL.Add('      D.COD_EMPRESA = C.COD_EMPRESA AND');
       QRYHEADER_OS.SQL.Add('      D.COD_TP_PAGAMENTO = C.COD_TP_PAGAMENTO');
       QRYHEADER_OS.ParamByName('PCOD_OS').AsInteger := QRYPARAMPARAM_N1.AsInteger;
       QRYHEADER_OS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
       QRYHEADER_OS.Open;

       if QRYHEADER_OS.IsEmpty then
       BEGIN
          MessageDlg('Ordem de serviço não encontrada. Favor informe uma ordem de serviço válida para prosseguir!',mtInformation,[MBOK],0);
         DBTXTCOD_OS.SETFOCUS;
         ABORT;
       END;

       TXTCLIENTE.Text := QRYHEADER_OSNOME_NOME_FANTASIA_CLIENTE.AsString;
       CARREGAR_PARCELAS;
       BTNCONFIRMAR.ENABLED := TRUE;
       BTNCONFIRMAR.SetFocus;
   end;
end;

procedure TFMMOVBAIXASALDODEVEDOR1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMMOVBAIXASALDODEVEDOR1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('23');
end;

procedure TFMMOVBAIXASALDODEVEDOR1.QRYPARCELASCalcFields(DataSet: TDataSet);
begin
  inherited;
   IF QRYPARCELASSITUACAO.ASSTRING = 'E' THEN
   BEGIN
      QRYPARCELASDESC_SITUACAO.AsString := 'Em aberto';
   END
   ELSE IF QRYPARCELASSITUACAO.ASSTRING = 'P' THEN
   BEGIN
      QRYPARCELASDESC_SITUACAO.AsString := 'Pago';
   END;

end;

end.
