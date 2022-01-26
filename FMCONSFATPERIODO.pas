unit FMCONSFATPERIODO;
// FATURAMENTO
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOFILTRO, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Menus, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.ExtCtrls, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.ComCtrls,
  Vcl.Imaging.jpeg, ZStoredProcedure,CXGRIDEXPORTLINK,ShellAPI, cxGridChartView,
  cxGridDBChartView;

type
  TFMCONSFATPERIODO1 = class(TFMPADRAOFILTRO1)
    GB_PERIODO: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    PCCONS_FATURAMENTO: TZStoredProc;
    QRYGRID: TZQuery;
    QRYGRIDCODTERMINAL: TWideStringField;
    QRYGRIDCOD_APLICACAO: TWideStringField;
    QRYGRIDTIPOREGISTRO: TWideStringField;
    QRYGRIDCHAVE: TWideStringField;
    QRYGRIDORDEM: TWideStringField;
    QRYGRIDALFA1: TWideStringField;
    QRYGRIDALFA2: TWideStringField;
    QRYGRIDALFA3: TWideStringField;
    QRYGRIDALFA4: TWideStringField;
    QRYGRIDALFA5: TWideStringField;
    QRYGRIDALFA6: TWideStringField;
    QRYGRIDALFA7: TWideStringField;
    QRYGRIDALFA8: TWideStringField;
    QRYGRIDALFA9: TWideStringField;
    QRYGRIDALFA10: TWideStringField;
    QRYGRIDALFA11: TWideStringField;
    QRYGRIDALFA12: TWideStringField;
    QRYGRIDALFA13: TWideStringField;
    QRYGRIDALFA14: TWideStringField;
    QRYGRIDALFA15: TWideStringField;
    QRYGRIDALFA16: TWideStringField;
    QRYGRIDALFA17: TWideStringField;
    QRYGRIDALFA18: TWideStringField;
    QRYGRIDALFA19: TWideStringField;
    QRYGRIDALFA20: TWideStringField;
    QRYGRIDNUM1: TFloatField;
    QRYGRIDNUM2: TFloatField;
    QRYGRIDNUM3: TFloatField;
    QRYGRIDNUM4: TFloatField;
    QRYGRIDNUM5: TFloatField;
    QRYGRIDNUM6: TFloatField;
    QRYGRIDNUM7: TFloatField;
    QRYGRIDNUM8: TFloatField;
    QRYGRIDNUM9: TFloatField;
    QRYGRIDNUM10: TFloatField;
    QRYGRIDNUM11: TFloatField;
    QRYGRIDNUM12: TFloatField;
    QRYGRIDNUM13: TFloatField;
    QRYGRIDNUM14: TFloatField;
    QRYGRIDNUM15: TFloatField;
    QRYGRIDNUM16: TFloatField;
    QRYGRIDNUM17: TFloatField;
    QRYGRIDNUM18: TFloatField;
    QRYGRIDNUM19: TFloatField;
    QRYGRIDNUM20: TFloatField;
    QRYGRIDNUM21: TFloatField;
    QRYGRIDNUM22: TFloatField;
    QRYGRIDNUM23: TFloatField;
    QRYGRIDNUM24: TFloatField;
    QRYGRIDNUM25: TFloatField;
    QRYGRIDNUM26: TFloatField;
    QRYGRIDNUM27: TFloatField;
    QRYGRIDNUM28: TFloatField;
    QRYGRIDNUM29: TFloatField;
    QRYGRIDNUM30: TFloatField;
    QRYGRIDDATA1: TDateTimeField;
    QRYGRIDDATA2: TDateTimeField;
    QRYGRIDDATA3: TDateTimeField;
    QRYGRIDDATA4: TDateTimeField;
    QRYGRIDDATA5: TDateTimeField;
    QRYGRIDDATA6: TDateTimeField;
    QRYGRIDDATA7: TDateTimeField;
    QRYGRIDDATA8: TDateTimeField;
    QRYGRIDDATA9: TDateTimeField;
    QRYGRIDDATA10: TDateTimeField;
    QRYGRIDALFA99: TWideStringField;
    QRYGRIDALFA98: TWideStringField;
    QRYGRIDNUM31: TFloatField;
    QRYGRIDNUM32: TFloatField;
    QRYGRIDNUM33: TFloatField;
    QRYGRIDNUM34: TFloatField;
    QRYGRIDNUM35: TFloatField;
    QRYGRIDNUM36: TFloatField;
    QRYGRIDNUM37: TFloatField;
    QRYGRIDNUM38: TFloatField;
    QRYGRIDNUM39: TFloatField;
    QRYGRIDNUM40: TFloatField;
    DSGRID: TDataSource;
    cxGrid1DBTableView1NUM1: TcxGridDBColumn;
    cxGrid1DBTableView1NUM2: TcxGridDBColumn;
    cxGrid1DBTableView1NUM3: TcxGridDBColumn;
    cxGrid1DBTableView1NUM4: TcxGridDBColumn;
    cxGrid1DBTableView1NUM5: TcxGridDBColumn;
    cxGrid1DBTableView1NUM6: TcxGridDBColumn;
    cxGrid1DBTableView1NUM7: TcxGridDBColumn;
    cxGrid1DBTableView1NUM8: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2DBChartView1Series1: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series2: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series3: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series4: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series5: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series6: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series7: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series8: TcxGridDBChartSeries;
    Label18: TLabel;
    Label3: TLabel;
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure CARREGA_GRID;
    procedure FormShow(Sender: TObject);
    procedure BTNEXPORTARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCONSFATPERIODO1: TFMCONSFATPERIODO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMCONSFATPERIODO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;

   QRYPARAMPARAM_D1.ASDATETIME := DATE-30;
   QRYPARAMPARAM_D2.ASDATETIME := DATE;

    QRYGRID.CLOSE;
    DBTXTDATA_INICIAL.SETFOCUS;
end;

procedure TFMCONSFATPERIODO1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
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

  CARREGA_GRID;
  // AQUI TENHO QUE PEGAR OS BOLETOS- AS DESPESAS PARA VER O FATURAMENTO.
  // VER TBM OS BOLETOS EM ABERTO PARA TER UMA ESTIMATIVA.
  // FIZ NA PROCEDURE;

end;

procedure TFMCONSFATPERIODO1.BTNEXPORTARClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  SAVEDIALOG.FileName := 'Consulta Faturamento';
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

procedure TFMCONSFATPERIODO1.CARREGA_GRID;
begin
  PCCONS_FATURAMENTO.ParamByName('PCOD_TERMINAL').AsString   :=  BUSCANOME_COMPUTADOR;
  PCCONS_FATURAMENTO.ParamByName('PCOD_APLICACAO').AsString  :=  'FMCONSFATPERIODO';
  PCCONS_FATURAMENTO.ParamByName('PCOD_EMPRESA').ASINTEGER   :=  EMPRESA_ATUAL;
  PCCONS_FATURAMENTO.ParamByName('PDATA_INICIAL').ASDATETIME :=  QRYPARAMPARAM_D1.AsDateTime;
  PCCONS_FATURAMENTO.ParamByName('PDATA_FINAL').ASDATETIME   :=  QRYPARAMPARAM_D2.AsDateTime;
  PCCONS_FATURAMENTO.Prepare;
  PCCONS_FATURAMENTO.ExecProc;
  PCCONS_FATURAMENTO.Unprepare;

  QRYGRID.Close;
  QRYGRID.SQL.Clear;
  QRYGRID.SQL.Add('SELECT * FROM TBTEMPORARIA A');
  QRYGRID.SQL.Add('WHERE A.CODTERMINAL = :PCOD_TERMINAL AND ');
  QRYGRID.SQL.Add('      A.COD_APLICACAO = :PCOD_APLICACAO');
  QRYGRID.ParamByName('PCOD_TERMINAL').AsString  := BUSCANOME_COMPUTADOR;
  QRYGRID.ParamByName('PCOD_APLICACAO').AsString := 'FMCONSFATPERIODO';
  QRYGRID.Open;

  IF QRYGRID.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('Nenhum registro foi encontrado!.',mtInformation,[MBOK],1);
     IF DBTXTDATA_INICIAL.CANFOCUS THEN
        DBTXTDATA_INICIAL.SETFOCUS;
     ABORT;
   END;
//
end;

procedure TFMCONSFATPERIODO1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(self);
end;

procedure TFMCONSFATPERIODO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('37');
end;

end.
