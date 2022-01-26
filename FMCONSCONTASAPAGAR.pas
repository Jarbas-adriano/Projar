unit FMCONSCONTASAPAGAR;

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
  Vcl.ComCtrls, Vcl.Imaging.jpeg, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit,CXGRIDEXPORTLINK,ShellAPI,
  cxGridChartView, cxGridDBChartView;

type
  TFMCONSCONTASAPAGAR1 = class(TFMPADRAOFILTRO1)
    RGSELECAO: TRadioGroup;
    GB_ESPECIFICO: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_DESPESA: TDBEdit;
    BIB_BUSCA_DESPESA: TBitBtn;
    TXTNOME_DESPESA: TEdit;
    GB_PERIODO: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    QRYCONTAS_PAGAR: TZQuery;
    DSCONTAS_PAGAR: TDataSource;
    QRYCONTAS_PAGARCOD_EMPRESA: TFloatField;
    QRYCONTAS_PAGARCOD_DESPESA: TFloatField;
    QRYCONTAS_PAGARVALOR_DESPESA: TFloatField;
    QRYCONTAS_PAGARSITUACAO: TWideStringField;
    QRYCONTAS_PAGARDATA_PAGAMENTO: TDateTimeField;
    QRYCONTAS_PAGARDATA_CADASTRO: TDateTimeField;
    QRYCONTAS_PAGARSEQUENCIA: TFloatField;
    QRYCONTAS_PAGAROBSERVACAO: TWideStringField;
    QRYCONTAS_PAGARNUM_PARCELA: TFloatField;
    QRYCONTAS_PAGARDATA_VENCIMENTO: TDateTimeField;
    QRYCONTAS_PAGARNOME_DESPESA: TWideStringField;
    cxGrid1DBTableView1VALOR_DESPESA: TcxGridDBColumn;
    cxGrid1DBTableView1SITUACAO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1OBSERVACAO: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_PARCELA: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_DESPESA: TcxGridDBColumn;
    QRYCONTAS_PAGARDESC_SITUACAO: TStringField;
    cxGrid1DBTableView1DESC_SITUACAO: TcxGridDBColumn;
    QRYCONTAS_PAGARVALOR_REAL_PAGO: TFloatField;
    cxGrid1DBTableView1VALOR_REAL_PAGO: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBTXTTOT_VENCIDO: TDBEdit;
    DBTXTVLR_VENCER: TDBEdit;
    DBTXTTOT_GERAL: TDBEdit;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2DBChartView1Series1: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series2: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series3: TcxGridDBChartSeries;
    cxGrid2Level1: TcxGridLevel;
    QRYPARAMPARAM_N2: TFloatField;
    QRYPARAMPARAM_N3: TFloatField;
    QRYPARAMPARAM_N4: TFloatField;
    Label18: TLabel;
    Label7: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure RGSELECAOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBTXTCOD_DESPESAExit(Sender: TObject);
    procedure BIB_BUSCA_DESPESAClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure BTNEXPORTARClick(Sender: TObject);
    procedure QRYCONTAS_PAGARCalcFields(DataSet: TDataSet);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCONSCONTASAPAGAR1: TFMCONSCONTASAPAGAR1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMCONSCONTASAPAGAR1.BIB_BUSCA_DESPESAClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_DESPESA', 'COD_DESPESA "Codigo", NOME_DESPESA "Nome Despesa"',
        S_FILTRO, 'Nome da Despesa', 'NOME_DESPESA',
        'TBDESPESAS', 'S', 'Despesas', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_DESPESAExit(SELF);
  END;
end;

procedure TFMCONSCONTASAPAGAR1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.Cancel;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;

   QRYPARAMPARAM_D1.AsDateTime := DATE-30;
   QRYPARAMPARAM_D2.AsDateTime := DATE;


   RGSELECAO.ItemIndex := 1;
   RGSELECAOClick(SELF);

   BTNCONFIRMAR.Enabled := FALSE;
   BTNEXPORTAR.Enabled  := FALSE;

   TXTNOME_DESPESA.Text := '';
   QRYCONTAS_PAGAR.Close;


end;

procedure TFMCONSCONTASAPAGAR1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
  IF RGSELECAO.ITEMINDEX = 1 THEN
  BEGIN
     IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe uma despesa para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_DESPESA.SETFOCUS;
       ABORT;
     END;
  END;

  IF QRYPARAMPARAM_D1.ASSTRING = '' THEN
  BEGIN
     MESSAGEDLG('Informe uma data inicial para prosseguir!',MTINFORMATION,[MBOK],0);
     DBTXTDATA_INICIAL.SETFOCUS;
     ABORT;
  END;

  IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
  BEGIN
     MESSAGEDLG('Informe uma data final para prosseguir!',MTINFORMATION,[MBOK],0);
     DBTXTDATA_FINAL.SETFOCUS;
     ABORT;
  END;

  IF QRYPARAMPARAM_D1.ASDATETIME > QRYPARAMPARAM_D2.ASDATETIME THEN
  BEGIN
    MESSAGEDLG('A data inicial não pode maior do que a data final',MTINFORMATION,[MBOK],0);
    DBTXTDATA_INICIAL.SETFOCUS;
    ABORT;
  END;

   QRYCONTAS_PAGAR.Close;
   QRYCONTAS_PAGAR.SQL.Clear;
   QRYCONTAS_PAGAR.SQL.Add('SELECT A.*, B.NOME_DESPESA');
   QRYCONTAS_PAGAR.SQL.Add('FROM TBCONTAS_PAGAR A, TBDESPESAS B');
   QRYCONTAS_PAGAR.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYCONTAS_PAGAR.SQL.Add('     (A.COD_DESPESA = :PCOD_DESPESA OR :PCOD_DESPESA = 0) AND');
   QRYCONTAS_PAGAR.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
   QRYCONTAS_PAGAR.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL AND');
   QRYCONTAS_PAGAR.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYCONTAS_PAGAR.SQL.Add('      B.COD_DESPESA = A.COD_DESPESA');
   QRYCONTAS_PAGAR.SQL.Add('ORDER BY A.DATA_VENCIMENTO');
   QRYCONTAS_PAGAR.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
   QRYCONTAS_PAGAR.ParamByName('PCOD_DESPESA').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
   QRYCONTAS_PAGAR.ParamByName('PDATA_INICIAL').AsDateTime := QRYPARAMPARAM_D1.ASDATETIME;
   QRYCONTAS_PAGAR.ParamByName('PDATA_FINAL').AsDateTime   := QRYPARAMPARAM_D2.ASDATETIME;
   QRYCONTAS_PAGAR.Open;


   IF QRYCONTAS_PAGAR.ISEMPTY THEN
   BEGIN
     MESSAGEDLG('Nenhum registro foi encontrado!.',mtInformation,[MBOK],1);
     IF DBTXTCOD_DESPESA.CANFOCUS THEN
        DBTXTCOD_DESPESA.SETFOCUS;
     ABORT;
   END;

   IF RGSELECAO.ITEMINDEX = 1 THEN
   BEGIN
     CXGRID1DBTABLEVIEW1NOME_DESPESA.VISIBLE := FALSE;
   END
   ELSE
   BEGIN
      CXGRID1DBTABLEVIEW1NOME_DESPESA.VISIBLE := TRUE;
   END;


   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SUM(NVL(A.VALOR_REAL_PAGO,A.VALOR_DESPESA)) TOTAL');
   QRYAUX.SQL.Add('FROM TBCONTAS_PAGAR A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('     (A.COD_DESPESA = :PCOD_DESPESA OR :PCOD_DESPESA = 0) AND');
   QRYAUX.SQL.Add('      A.SITUACAO = ''P'' AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_DESPESA').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
   QRYAUX.ParamByName('PDATA_INICIAL').AsDateTime := QRYPARAMPARAM_D1.ASDATETIME;
   QRYAUX.ParamByName('PDATA_FINAL').AsDateTime   := QRYPARAMPARAM_D2.ASDATETIME;
   QRYAUX.Open;

   QRYPARAMPARAM_N2.AsFloat := QRYAUX.FieldByName('TOTAL').AsFloat;

   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SUM(NVL(A.VALOR_REAL_PAGO,A.VALOR_DESPESA)) TOTAL');
   QRYAUX.SQL.Add('FROM TBCONTAS_PAGAR A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('     (A.COD_DESPESA = :PCOD_DESPESA OR :PCOD_DESPESA = 0) AND');
   QRYAUX.SQL.Add('      A.SITUACAO = ''E'' AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_DESPESA').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
   QRYAUX.ParamByName('PDATA_INICIAL').AsDateTime := QRYPARAMPARAM_D1.ASDATETIME;
   QRYAUX.ParamByName('PDATA_FINAL').AsDateTime   := QRYPARAMPARAM_D2.ASDATETIME;
   QRYAUX.Open;

   QRYPARAMPARAM_N3.AsFloat := QRYAUX.FieldByName('TOTAL').AsFloat;

   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SUM(NVL(A.VALOR_REAL_PAGO,A.VALOR_DESPESA)) TOTAL');
   QRYAUX.SQL.Add('FROM TBCONTAS_PAGAR A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('     (A.COD_DESPESA = :PCOD_DESPESA OR :PCOD_DESPESA = 0) AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
   QRYAUX.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_DESPESA').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
   QRYAUX.ParamByName('PDATA_INICIAL').AsDateTime := QRYPARAMPARAM_D1.ASDATETIME;
   QRYAUX.ParamByName('PDATA_FINAL').AsDateTime   := QRYPARAMPARAM_D2.ASDATETIME;
   QRYAUX.Open;

   QRYPARAMPARAM_N4.AsFloat := QRYAUX.FieldByName('TOTAL').AsFloat;
end;

procedure TFMCONSCONTASAPAGAR1.BTNEXPORTARClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  SAVEDIALOG.FileName := 'Consulta a contas a pagar';
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

procedure TFMCONSCONTASAPAGAR1.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  //if(AViewInfo.GridRecord.Values[cxGrid1DBTableView1SITUACAO.Index] = 'E') then
  if(AViewInfo.GridRecord.Values[cxGrid1DBTableView1DATA_VENCIMENTO.Index] < DATE) then
  begin
    ACanvas.Brush.Color := CLRED;
    ACANVAS.FonT.Color  := clWhite;
    ACANVAS.Font.Style  := [FSBOLD];
  end;

  if(AViewInfo.GridRecord.Values[cxGrid1DBTableView1SITUACAO.Index] = 'P') then
  begin
    ACanvas.Brush.Color := clGreen;
    ACANVAS.FonT.Color  := clWhite;
    ACANVAS.Font.Style  := [FSBOLD];
  end;
end;

procedure TFMCONSCONTASAPAGAR1.DBTXTCOD_DESPESAExit(Sender: TObject);
begin
  inherited;
   if QRYPARAMPARAM_N1.AsInteger <> 0 then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_DESPESA');
      QRYAUX.SQL.Add('FROM TBDESPESAS');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_DESPESA  = :PCOD_DESPESA  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_DESPESA').AsInteger := QRYPARAMPARAM_N1.AsInteger;
      QRYAUX.Open;

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Despesa não encontrada',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_DESPESA.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTNOME_DESPESA.Text := QRYAUX.FieldByName('NOME_DESPESA').AsString;
        BTNCONFIRMAR.Enabled := TRUE;
        BTNEXPORTAR.Enabled  := TRUE;
      END;
    END
    ELSE
        TXTNOME_DESPESA.Text := '';
end;

procedure TFMCONSCONTASAPAGAR1.FormShow(Sender: TObject);
begin
  inherited;
  BTNCANCELARClick(SELF);
end;

procedure TFMCONSCONTASAPAGAR1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('35');
end;

procedure TFMCONSCONTASAPAGAR1.QRYCONTAS_PAGARCalcFields(DataSet: TDataSet);
begin
  inherited;
   IF QRYCONTAS_PAGARSITUACAO.ASSTRING = 'E' THEN
   BEGIN
      QRYCONTAS_PAGARDESC_SITUACAO.AsString := 'Em aberto';
   END
   ELSE IF QRYCONTAS_PAGARSITUACAO.ASSTRING = 'P' THEN
   BEGIN
      QRYCONTAS_PAGARDESC_SITUACAO.AsString := 'Pago';
   END;
end;

procedure TFMCONSCONTASAPAGAR1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  QRYCONTAS_PAGAR.CLOSE;
  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_DESPESA.Enabled  := FALSE;
     BIB_BUSCA_DESPESA.Enabled := FALSE;
     QRYPARAMPARAM_N1.Clear;
     DBTXTDATA_INICIAL.SetFocus;
     TXTNOME_DESPESA.Text := '';
     BTNCONFIRMAR.Enabled := TRUE;
     BTNEXPORTAR.Enabled  := TRUE;
  END
  ELSE
  BEGIN
     DBTXTCOD_DESPESA.Enabled  := TRUE;
     BIB_BUSCA_DESPESA.Enabled := TRUE;
     DBTXTCOD_DESPESA.SetFocus;
     BTNCONFIRMAR.Enabled := FALSE;
     BTNEXPORTAR.Enabled  := FALSE;
  END;

end;

end.
