unit FMCONSSALDODEVEDOR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOFILTRO, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Menus, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Imaging.jpeg,CXGRIDEXPORTLINK,ShellAPI, cxGridChartView,
  cxGridDBChartView;

type
  TFMCONSSALDODEVEDOR1 = class(TFMPADRAOFILTRO1)
    RGSELECAO: TRadioGroup;
    GB_ESPECIFICO: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    DSPARAM: TDataSource;
    QRYGRID: TZQuery;
    QRYGRIDCOD_OS: TFloatField;
    QRYGRIDCOD_TP_PAGAMENTO: TFloatField;
    QRYGRIDTOTAL_PARCELA: TFloatField;
    QRYGRIDCOD_CONDICAO_PAGAMENTO: TFloatField;
    QRYGRIDCOD_BANCO_RECEBIMENTO: TFloatField;
    QRYGRIDCOD_AGENCIA_RECEBIMENTO: TFloatField;
    QRYGRIDCOD_CONTA_RECEBIMENTO: TFloatField;
    QRYGRIDOBSERVACAO: TWideStringField;
    QRYGRIDSEQUENCIA: TFloatField;
    QRYGRIDDATA_VENCIMENTO: TDateTimeField;
    QRYGRIDNOME_TP_PAGAMENTO: TWideStringField;
    QRYGRIDNOME_NOME_FANTASIA: TWideStringField;
    QRYGRIDNOME_BANCO: TWideStringField;
    DSGRID: TDataSource;
    cxGrid1DBTableView1COD_OS: TcxGridDBColumn;
    cxGrid1DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1TOTAL_PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1OBSERVACAO: TcxGridDBColumn;
    cxGrid1DBTableView1SEQUENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_TP_PAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_NOME_FANTASIA: TcxGridDBColumn;
    QRYGRIDCOD_CLIENTE: TFloatField;
    QRYGRIDCOD_EMPRESA: TFloatField;
    QRYGRIDSITUACAO: TWideStringField;
    QRYGRIDDATA_PAGAMENTO: TDateTimeField;
    GroupBox1: TGroupBox;
    DBTXTTOT_VENCIDO: TDBEdit;
    DBTXTVLR_VENCER: TDBEdit;
    DBTXTTOT_GERAL: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    QRYPARAMPARAM_N2: TFloatField;
    QRYPARAMPARAM_N3: TFloatField;
    QRYPARAMPARAM_N4: TFloatField;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2DBChartView1Series1: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series2: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series3: TcxGridDBChartSeries;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure RGSELECAOClick(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure CARREGAR_GRID;
    procedure BTNEXPORTARClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure CARREGA_TOTAIS;
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCONSSALDODEVEDOR1: TFMCONSSALDODEVEDOR1;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL, FMPADRAOCONSULTA;

procedure TFMCONSSALDODEVEDOR1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_NOME_FANTASIA', 'COD_CLIENTE "Codigo", NOME_NOME_FANTASIA "Nome Cliente", DECODE(TIPO_PESSOA,''F'',''Fisica'',''J'',''Juridica'') "Tipo Pessoa"',
        S_FILTRO, 'Nome do cliente', 'NOME_NOME_FANTASIA',
        'TBCLIENTE', 'S', 'Clientes', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_CLIENTEExit(SELF);
  END;
end;

procedure TFMCONSSALDODEVEDOR1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.Cancel;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;
   QRYGRID.CLOSE;
   TXTCLIENTE.Text := '';
   BTNCONFIRMAR.Enabled := FALSE;
   RGSELECAO.ItemIndex := 1;
   RGSELECAOClick(SELF);
end;

procedure TFMCONSSALDODEVEDOR1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
 IF RGSELECAO.ITEMINDEX = 1 THEN
  BEGIN
     IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe um cliente para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_CLIENTE.SETFOCUS;
       ABORT;
     END;
  END;
  CARREGAR_GRID;

end;

procedure TFMCONSSALDODEVEDOR1.BTNEXPORTARClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  SAVEDIALOG.FileName := 'Consulta saldo devedor';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName,cxGrid1, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName,cxGrid1, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TFMCONSSALDODEVEDOR1.CARREGAR_GRID;
begin
   QRYGRID.Close;
   QRYGRID.SQL.Clear;
   QRYGRID.SQL.Add('SELECT A.*, B.NOME_TP_PAGAMENTO, C.NOME_NOME_FANTASIA, D.NOME_BANCO');
   QRYGRID.SQL.Add('FROM TBCONTAS_RECEBER A, TBTIPO_PAGAMENTO B, TBCLIENTE C, TBBANCO D');
   QRYGRID.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYGRID.SQL.Add('      (A.COD_CLIENTE = :PCOD_CLIENTE OR 0 = :PCOD_CLIENTE) AND');
   QRYGRID.SQL.Add('      A.SITUACAO = ''E'' AND');
   QRYGRID.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYGRID.SQL.Add('      B.COD_TP_PAGAMENTO = A.COD_CONDICAO_PAGAMENTO AND');
   QRYGRID.SQL.Add('      C.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYGRID.SQL.Add('      C.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYGRID.SQL.Add('      D.COD_BANCO = A.COD_BANCO_RECEBIMENTO');
   QRYGRID.SQL.Add('ORDER BY A.COD_OS,A.DATA_VENCIMENTO,A.COD_CLIENTE');
   QRYGRID.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYGRID.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
   QRYGRID.Open;

   IF QRYGRID.ISEMPTY THEN
   BEGIN
     MESSAGEDLG('Nenhum registro foi encontrado!.',mtInformation,[MBOK],1);
     IF DBTXTCOD_CLIENTE.CANFOCUS THEN
        DBTXTCOD_CLIENTE.SETFOCUS;
     ABORT;
   END;

   CARREGA_TOTAIS;
   IF RGSELECAO.ITEMINDEX = 1 THEN
   BEGIN
     CXGRID1DBTABLEVIEW1NOME_NOME_FANTASIA.VISIBLE := FALSE;
   END
   ELSE
   BEGIN
      CXGRID1DBTABLEVIEW1NOME_NOME_FANTASIA.VISIBLE := TRUE;
   END;
end;

procedure TFMCONSSALDODEVEDOR1.CARREGA_TOTAIS;
begin
   QRYAUX.CLOSE;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SUM(A.TOTAL_PARCELA) TOTAL');
   QRYAUX.SQL.Add('FROM TBCONTAS_RECEBER A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('      (A.COD_CLIENTE = :PCOD_CLIENTE OR 0 = :PCOD_CLIENTE) AND');
   QRYAUX.SQL.Add('      A.SITUACAO = ''E'' AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO < SYSDATE');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
   QRYAUX.Open;

   QRYPARAMPARAM_N2.AsFloat := QRYAUX.FieldByName('TOTAL').AsFloat;

   QRYAUX.CLOSE;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SUM(A.TOTAL_PARCELA) TOTAL');
   QRYAUX.SQL.Add('FROM TBCONTAS_RECEBER A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('      (A.COD_CLIENTE = :PCOD_CLIENTE OR 0 = :PCOD_CLIENTE) AND');
   QRYAUX.SQL.Add('      A.SITUACAO = ''E'' AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO >= SYSDATE');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
   QRYAUX.Open;

   QRYPARAMPARAM_N3.AsFloat := QRYAUX.FieldByName('TOTAL').AsFloat;

   QRYAUX.CLOSE;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SUM(A.TOTAL_PARCELA) TOTAL');
   QRYAUX.SQL.Add('FROM TBCONTAS_RECEBER A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('      (A.COD_CLIENTE = :PCOD_CLIENTE OR 0 = :PCOD_CLIENTE) AND');
   QRYAUX.SQL.Add('      A.SITUACAO = ''E''');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
   QRYAUX.Open;

   QRYPARAMPARAM_N4.AsFloat := QRYAUX.FieldByName('TOTAL').AsFloat;
end;

procedure TFMCONSSALDODEVEDOR1.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
    IF(AVIEWINFO.GRIDRECORD.VALUES[cxGrid1DBTableView1DATA_VENCIMENTO.INDEX] < DATE) THEN
    BEGIN
      ACANVAS.BRUSH.COLOR := CLRED;
      ACANVAS.FONT.COLOR  := CLWHITE;
      ACANVAS.FONT.STYLE  := [FSBOLD];
    END;
end;

procedure TFMCONSSALDODEVEDOR1.DBTXTCOD_CLIENTEExit(Sender: TObject);
begin
  inherited;
    IF QRYPARAMPARAM_N1.ASSTRING <> '' then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_NOME_FANTASIA');
      QRYAUX.SQL.Add('FROM TBCLIENTE');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_CLIENTE  = :PCOD_CLIENTE  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
      QRYAUX.Open;

      IF QRYAUX.ISEMPTY THEN
      BEGIN
        APPLICATION.MessageBox('Cliente não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_CLIENTE.SETFOCUS;
        ABORT;
      END
      ELSE
      BEGIN
        TXTCLIENTE.TEXT := QRYAUX.FIELDBYNAME('NOME_NOME_FANTASIA').ASSTRING;
        BTNCONFIRMAR.Enabled := TRUE;
        BTNEXPORTAR.Enabled  := TRUE;
        BTNCONFIRMAR.SetFocus;
      END;
    END
    ELSE
       TXTCLIENTE.TEXT := '';
end;

procedure TFMCONSSALDODEVEDOR1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMCONSSALDODEVEDOR1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('40');
end;

procedure TFMCONSSALDODEVEDOR1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  QRYGRID.CLOSE;
  QRYPARAM.Cancel;
  QRYPARAM.Close;
  QRYPARAM.Open;
  QRYPARAM.Insert;

  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_CLIENTE.ENABLED  := FALSE;
     BIB_BUSCA_CLIENTE.ENABLED := FALSE;
     QRYPARAMPARAM_N1.CLEAR;
     TXTCLIENTE.TEXT := '';
     BTNCONFIRMAR.ENABLED := TRUE;
     BTNEXPORTAR.ENABLED  := TRUE;
     BTNCONFIRMAR.SETFOCUS;
  END
  ELSE
  BEGIN
     DBTXTCOD_CLIENTE.Enabled  := TRUE;
     BIB_BUSCA_CLIENTE.Enabled := TRUE;
     DBTXTCOD_CLIENTE.SetFocus;
     BTNCONFIRMAR.Enabled := FALSE;
     BTNEXPORTAR.Enabled  := FALSE;
  END;
end;

end.
