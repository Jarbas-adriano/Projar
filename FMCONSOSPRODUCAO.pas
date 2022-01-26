unit FMCONSOSPRODUCAO;

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
  TFMCONSOSPRODUCAO1 = class(TFMPADRAOFILTRO1)
    RGSELECAO: TRadioGroup;
    GB_ESPECIFICO: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_N1: TFloatField;
    QRYGRID: TZQuery;
    QRYGRIDCOD_OS: TFloatField;
    QRYGRIDCOD_EMPRESA: TFloatField;
    QRYGRIDCOD_CLIENTE: TFloatField;
    QRYGRIDSITUACAO: TWideStringField;
    QRYGRIDVALOR_TOTAL: TFloatField;
    QRYGRIDVALOR_DESCONTO: TFloatField;
    QRYGRIDDATA_INICIO: TDateTimeField;
    QRYGRIDDATA_PREVISAO_FIM: TDateTimeField;
    QRYGRIDOBSERVACOES: TWideStringField;
    QRYGRIDTEM_ORCAMENTO_RELACIONADO: TWideStringField;
    QRYGRIDCOD_ORCAMENTO_RELAC: TFloatField;
    QRYGRIDMOTIVO_DESCONTO: TWideStringField;
    QRYGRIDUSUARIO_LIBEROU_DESC: TFloatField;
    QRYGRIDUSUARIO_EXE: TWideStringField;
    QRYGRIDDATA_TERMINO: TDateTimeField;
    QRYGRIDNOME_NOME_FANTASIA_CLIENTE: TWideStringField;
    QRYGRIDCOD_USUARIO_RESPONSAVEL: TFloatField;
    DSGRID: TDataSource;
    cxGrid1DBTableView1VALOR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_INICIO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_PREVISAO_FIM: TcxGridDBColumn;
    cxGrid1DBTableView1OBSERVACOES: TcxGridDBColumn;
    cxGrid1DBTableView1TEM_ORCAMENTO_RELACIONADO: TcxGridDBColumn;
    cxGrid1DBTableView1COD_ORCAMENTO_RELAC: TcxGridDBColumn;
    cxGrid1DBTableView1MOTIVO_DESCONTO: TcxGridDBColumn;
    cxGrid1DBTableView1USUARIO_EXE: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_NOME_FANTASIA_CLIENTE: TcxGridDBColumn;
    QRYPARAMPARAM_N2: TFloatField;
    GroupBox1: TGroupBox;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    QRYPARAMPARAM_C1: TWideStringField;
    cxGrid2DBChartView1Series1: TcxGridDBChartSeries;
    QRYTOTAIS: TZQuery;
    DSTOTAIS: TDataSource;
    QRYTOTAISQTDE: TFloatField;
    QRYTOTAISNOME_NOME_FANTASIA_CLIENTE: TWideStringField;
    QRYTOTAISCOD_CLIENTE: TFloatField;
    procedure RGSELECAOClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    PROCEDURE CARREGA_GRID;
    procedure BTNEXPORTARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCONSOSPRODUCAO1: TFMCONSOSPRODUCAO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMCONSOSPRODUCAO1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
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

procedure TFMCONSOSPRODUCAO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.Cancel;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;

   RGSELECAO.ItemIndex := 1;
   RGSELECAOClick(SELF);

   BTNCONFIRMAR.Enabled := FALSE;
   BTNEXPORTAR.Enabled  := FALSE;

   TXTCLIENTE.Text := '';
   QRYGRID.Close;
end;

procedure TFMCONSOSPRODUCAO1.BTNCONFIRMARClick(Sender: TObject);
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
  CARREGA_GRID;
  BTNCONFIRMAR.Enabled := FALSE;

end;

procedure TFMCONSOSPRODUCAO1.BTNEXPORTARClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  SAVEDIALOG.FileName := 'Consulta de OS em Produção';
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
procedure TFMCONSOSPRODUCAO1.CARREGA_GRID;
begin
   QRYGRID.CLOSE;
   QRYGRID.SQL.Clear;
   QRYGRID.SQL.Add('SELECT * FROM TBHEADERORDEM_SERVICO A');
   QRYGRID.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYGRID.SQL.Add('      (A.COD_CLIENTE = :PCOD_CLIENTE OR :PCOD_CLIENTE = 0) AND ');
   QRYGRID.SQL.Add('      A.SITUACAO = ''A''');
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

   if RGSELECAO.ItemIndex = 1 then
   BEGIN
     cxGrid1DBTableView1NOME_NOME_FANTASIA_CLIENTE.Visible := FALSE;
   END
   ELSE
   BEGIN
      cxGrid1DBTableView1NOME_NOME_FANTASIA_CLIENTE.Visible := TRUE;
   END;

   QRYTOTAIS.Close;
   QRYTOTAIS.SQL.Clear;
   QRYTOTAIS.SQL.ADD('SELECT COUNT(1) "QTDE", A.NOME_NOME_FANTASIA_CLIENTE, A.COD_CLIENTE');
   QRYTOTAIS.SQL.ADD('FROM TBHEADERORDEM_SERVICO A');
   QRYTOTAIS.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYTOTAIS.SQL.ADD('     (A.COD_CLIENTE = :PCOD_CLIENTE OR :PCOD_CLIENTE = 0) AND');
   QRYTOTAIS.SQL.ADD('     A.SITUACAO = ''A''');
   QRYTOTAIS.SQL.ADD('GROUP BY A.NOME_NOME_FANTASIA_CLIENTE, A.COD_CLIENTE');
   QRYTOTAIS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYTOTAIS.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
   QRYTOTAIS.Open;

   {QRYPARAMPARAM_N2.AsInteger := QRYAUX.FieldByName('QTDE').AsInteger;
   QRYPARAMPARAM_C1.AsString  := QRYAUX.FieldByName('NOME_NOME_FANTASIA_CLIENTE').ASSTRING;}
end;

procedure TFMCONSOSPRODUCAO1.DBTXTCOD_CLIENTEExit(Sender: TObject);
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

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Cliente não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_CLIENTE.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTCLIENTE.Text := QRYAUX.FieldByName('NOME_NOME_FANTASIA').AsString;
        BTNCONFIRMAR.Enabled := TRUE;
        BTNEXPORTAR.Enabled  := TRUE;
      END;
    END
    ELSE
       TXTCLIENTE.Text := '';

end;

procedure TFMCONSOSPRODUCAO1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMCONSOSPRODUCAO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('38');
end;

procedure TFMCONSOSPRODUCAO1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  QRYGRID.Close;
  QRYPARAM.Cancel;
  QRYPARAM.Close;
  QRYPARAM.Open;
  QRYPARAM.Insert;
  QRYTOTAIS.Close;

  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_CLIENTE.Enabled  := FALSE;
     BIB_BUSCA_CLIENTE.Enabled := FALSE;
     QRYPARAMPARAM_N1.Clear;
     TXTCLIENTE.Text := '';
     BTNCONFIRMAR.Enabled := TRUE;
     BTNEXPORTAR.Enabled  := TRUE;
     BTNCONFIRMAR.SetFocus;
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
