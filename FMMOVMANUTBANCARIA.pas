unit FMMOVMANUTBANCARIA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ComCtrls, Vcl.Imaging.jpeg;

type
  TFMMOVMANUTBANCARIA1 = class(TFMPADRAOGERAL1)
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBTXTCOD_OS: TDBEdit;
    TXTCLIENTE: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBGRID_PARCELAS: TcxGrid;
    DBGRID_PARCELASDBTableView1: TcxGridDBTableView;
    DBGRID_PARCELASLevel1: TcxGridLevel;
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    LBLSITUACAO: TLabel;
    Label8: TLabel;
    DBTXTVLR_TOTAL: TDBEdit;
    DBC_SITUACAO: TDBComboBox;
    DBTXTNOVA_DATA: TcxDBDateEdit;
    Label4: TLabel;
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
    DBTXTCOND_PAGAMENTO: TDBEdit;
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
    QRYHEADER_OSNOME_NOME_FANTASIA: TWideStringField;
    QRYHEADER_OSNOME_TP_PAGAMENTO: TWideStringField;
    QRYPARCELAS: TZQuery;
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
    DSPARCELAS: TDataSource;
    DBGRID_PARCELASDBTableView1TOTAL_PARCELA: TcxGridDBColumn;
    DBGRID_PARCELASDBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    DBGRID_PARCELASDBTableView1SEQUENCIA: TcxGridDBColumn;
    DBGRID_PARCELASDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    BIB_BUSCA_OS: TBitBtn;
    Label2: TLabel;
    DBGRID_PARCELASDBTableView1DESC_SITUACAO: TcxGridDBColumn;
    QRYPARCELASDESC_SITUACAO: TStringField;
    DBGRID_PARCELASDBTableView1SITUACAO: TcxGridDBColumn;
    Label3: TLabel;
    DBTXTVLR_RECEBER: TDBEdit;
    QRYPARCELASVALOR_REAL_RECEBIDO: TFloatField;
    QRYPARCELASVLR_REAL: TFloatField;
    Label9: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    PROCEDURE HABILITA_CAMPOS(PESTADO:BOOLEAN);
    procedure DBTXTCOD_OSExit(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure CARREGAR_PARCELAS;
    procedure DBGRID_PARCELASDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure BIB_BUSCA_OSClick(Sender: TObject);
    procedure QRYPARCELASCalcFields(DataSet: TDataSet);
    procedure QRYPARCELASAfterScroll(DataSet: TDataSet);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMOVMANUTBANCARIA1: TFMMOVMANUTBANCARIA1;
  ICOD_CLIENTE: INTEGER;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL, FMPADRAOCONSULTA;

procedure TFMMOVMANUTBANCARIA1.BIB_BUSCA_OSClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
 S_FILTRO := 'COD_EMPRESA = '+INTTOSTR(EMPRESA_ATUAL)+
             'AND SITUACAO = ''F''' ;
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        //'NOME_NOME_FANTASIA_CLIENTE', 'COD_OS "Codigo", NOME_NOME_FANTASIA_CLIENTE "Nome"',
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

procedure TFMMOVMANUTBANCARIA1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   HABILITA_CAMPOS(FALSE);
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   QRYPARCELAS.CLOSE;
   DBC_SITUACAOCHANGE(SELF);
   TXTCLIENTE.Text := '';
   DBTXTCOD_OS.SETFOCUS;
end;

procedure TFMMOVMANUTBANCARIA1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
   if QRYPARCELASSITUACAO.AsString <> 'E' then
   BEGIN
      MESSAGEDLG('A parcela deve estar na situação <E>- Em aberto , para poder ter a data de vencimento alterada',
      mtInformation,[MBOK],1);
      DBGRID_PARCELAS.SetFocus;
      ABORT;
   END
   ELSE
   BEGIN
     IF QRYPARAMPARAM_D1.ASDATETIME = QRYPARCELASDATA_VENCIMENTO.ASDATETIME THEN
     BEGIN
        MESSAGEDLG('A nova data de vencimento deve ser diferente da data atual da parcela',
                    mtInformation,[MBOK],1);
      DBGRID_PARCELAS.SetFocus;
      ABORT;
     END;

     IF QRYPARAMPARAM_D1.ASDATETIME < DATE THEN
     BEGIN
        MESSAGEDLG('A nova data de vencimento não pode ser menor do que a data atual',
                    mtInformation,[MBOK],1);
      DBTXTNOVA_DATA.SetFocus;
      ABORT;
     END;

     If  MessageDlg('Você realmente deseja alterar a parcela número: '+
                    QRYPARCELASSEQUENCIA.AsString,mtConfirmation,[mbyes,mbno],0)=mryes   then
     BEGIN
      //
       TRY
        QRYAUX.Close;
        QRYAUX.SQL.Clear;
        QRYAUX.SQL.ADD('UPDATE TBCONTAS_RECEBER');
        QRYAUX.SQL.ADD('SET DATA_VENCIMENTO     = :PDATA_VENCIMENTO,');
        //QRYAUX.SQL.ADD('    VALOR_REAL_RECEBIDO = :PVALOR_REAL_RECEBIDO,');
        QRYAUX.SQL.ADD('    TOTAL_PARCELA       = :PVALOR_REAL_RECEBIDO');
        QRYAUX.SQL.ADD('WHERE COD_OS            = :PCOD_OS AND');
        QRYAUX.SQL.ADD('      COD_EMPRESA       = :PCOD_EMPRESA AND ');
        QRYAUX.SQL.ADD('      COD_CLIENTE       = :PCOD_CLIENTE AND ');
        QRYAUX.SQL.ADD('      COD_TP_PAGAMENTO  = :PCOD_TP_PAGAMENTO AND');
        QRYAUX.SQL.ADD('      SEQUENCIA         = :PSEQ');
        QRYAUX.ParamByName('PCOD_OS').AsInteger            := QRYPARAMPARAM_N1.AsInteger;
        QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger       := EMPRESA_ATUAL;
        QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger       := QRYPARCELASCOD_CLIENTE.AsInteger;
        QRYAUX.ParamByName('PCOD_TP_PAGAMENTO').AsInteger  := QRYPARCELASCOD_TP_PAGAMENTO.AsInteger;
        QRYAUX.ParamByName('PSEQ').AsInteger               := QRYPARCELASSEQUENCIA.AsInteger;
        QRYAUX.ParamByName('PDATA_VENCIMENTO').ASDATETIME  := QRYPARAMPARAM_D1.AsDateTime;
        QRYAUX.ParamByName('PVALOR_REAL_RECEBIDO').ASFLOAT := QRYPARAMPARAM_N3.AsFloat;
        QRYAUX.ExecSQL;
        MDPRINCIPAL.COMMIT;
        MESSAGEDLG('Parcela alterada com sucesso!.',
                    mtInformation,[MBOK],1);
        CARREGAR_PARCELAS;
       EXCEPT
         ON E:EXCEPTION DO
         BEGIN
            MDPRINCIPAL.ROLLBACK;
            MESSAGEDLG('Erro ao alterar data de vencimento da parcela selecionada. Erro :'+e.Message,mtInformation,[MBOK],1);
            abort;
         END;
       END;
     END;
   END;
end;

procedure TFMMOVMANUTBANCARIA1.CARREGAR_PARCELAS;
begin
//;
   QRYPARCELAS.Close;
   QRYPARCELAS.SQL.Clear;
   QRYPARCELAS.SQL.Add('SELECT A.*, NVL(A.VALOR_REAL_RECEBIDO,A.TOTAL_PARCELA) VLR_REAL ');
   QRYPARCELAS.SQL.Add('FROM TBCONTAS_RECEBER A');
   QRYPARCELAS.SQL.Add('WHERE A.COD_OS      = :PCOD_OS AND ');
   QRYPARCELAS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYPARCELAS.SQL.Add('      A.COD_CLIENTE = :PCOD_CLIENTE');
   QRYPARCELAS.SQL.Add('ORDER BY SEQUENCIA,DATA_VENCIMENTO,DATA_PAGAMENTO');
   QRYPARCELAS.ParamByName('PCOD_OS').AsInteger      := QRYPARAMPARAM_N1.AsInteger;
   QRYPARCELAS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYPARCELAS.ParamByName('PCOD_CLIENTE').AsInteger := QRYHEADER_OSCOD_CLIENTE.AsInteger;
   QRYPARCELAS.Open;


end;

procedure TFMMOVMANUTBANCARIA1.DBC_SITUACAOChange(Sender: TObject);
begin
  inherited;
   if DBC_SITUACAO.Text = 'A' then
   BEGIN
     LBLSITUACAO.Caption := 'Em aberto';
   END
   ELSE if DBC_SITUACAO.Text = 'F' then
   BEGIN
      LBLSITUACAO.Caption := 'Finalizada';
   END
   ELSE
      LBLSITUACAO.Caption := '';
end;

procedure TFMMOVMANUTBANCARIA1.DBGRID_PARCELASDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  IF(AVIEWINFO.GRIDRECORD.VALUES[DBGRID_PARCELASDBTABLEVIEW1SITUACAO.INDEX] = 'P') THEN
  BEGIN
    ACANVAS.BRUSH.COLOR := CLGREEN;
    ACANVAS.FONT.COLOR  := CLWHITE;
    ACANVAS.FONT.STYLE  := [FSBOLD];
  END;
  IF NOT (AVIEWINFO.GRIDRECORD.VALUES[DBGRID_PARCELASDBTableView1SITUACAO.INDEX] = 'P') THEN
  BEGIN
    IF(AVIEWINFO.GRIDRECORD.VALUES[DBGRID_PARCELASDBTABLEVIEW1DATA_VENCIMENTO.INDEX] < DATE) THEN
    BEGIN
      ACANVAS.BRUSH.COLOR := CLRED;
      ACANVAS.FONT.COLOR  := CLWHITE;
      ACANVAS.FONT.STYLE  := [FSBOLD];
    END;
  END;
end;

procedure TFMMOVMANUTBANCARIA1.DBTXTCOD_OSExit(Sender: TObject);
begin
  inherited;
  {IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe uma ordem de serviço para prosseguir',mtInformation,[MBOK],0);
     DBTXTCOD_OS.SETFOCUS;
     ABORT;
   END;}
   IF QRYPARAMPARAM_N1.ASSTRING <> '' THEN
   BEGIN
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

       TXTCLIENTE.TEXT             := QRYHEADER_OSNOME_NOME_FANTASIA.ASSTRING;
       QRYPARAMPARAM_N2.ASFLOAT    := QRYHEADER_OSVALOR_TOTAL.ASFLOAT;
       QRYPARAMPARAM_C1.ASSTRING   := QRYHEADER_OSSITUACAO.ASSTRING;
       QRYPARAMPARAM_C2.ASSTRING   := QRYHEADER_OSNOME_TP_PAGAMENTO.ASSTRING;
       ICOD_CLIENTE                := QRYHEADER_OSCOD_CLIENTE.ASINTEGER;
       HABILITA_CAMPOS(TRUE);
       DBC_SITUACAOCHANGE(SELF);
       CARREGAR_PARCELAS;
       QRYPARAMPARAM_D1.ASDATETIME := DATE;
       DBTXTNOVA_DATA.SETFOCUS;
   end;
end;

procedure TFMMOVMANUTBANCARIA1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMMOVMANUTBANCARIA1.HABILITA_CAMPOS(PESTADO: BOOLEAN);
begin
   DBTXTCOD_OS.Enabled         := NOT PESTADO;
   BIB_BUSCA_OS.Enabled        := NOT PESTADO;
   //BIBPONTOS_PRINCIPAL.Enabled := NOT PESTADO;
   TXTCLIENTE.Enabled          := PESTADO;
   DBTXTVLR_TOTAL.Enabled      := PESTADO;
   DBC_SITUACAO.Enabled        := FALSE;
   DBTXTCOND_PAGAMENTO.Enabled := PESTADO;
   DBTXTNOVA_DATA.Enabled      := PESTADO;
   BTNCONFIRMAR.Enabled        := PESTADO;
   DBTXTVLR_RECEBER.Enabled    := PESTADO;
   DBGRID_PARCELAS.Enabled     := PESTADO;


end;

procedure TFMMOVMANUTBANCARIA1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('25');
end;

procedure TFMMOVMANUTBANCARIA1.QRYPARCELASAfterScroll(DataSet: TDataSet);
begin
  inherited;
   QRYPARAMPARAM_N3.AsFloat := QRYPARCELASTOTAL_PARCELA.AsFloat;
end;

procedure TFMMOVMANUTBANCARIA1.QRYPARCELASCalcFields(DataSet: TDataSet);
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
