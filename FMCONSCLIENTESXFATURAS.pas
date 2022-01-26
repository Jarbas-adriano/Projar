unit FMCONSCLIENTESXFATURAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOFILTRO, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.Menus, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons, cxContainer,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.ComCtrls,
  Vcl.Imaging.jpeg,CXGRIDEXPORTLINK,ShellAPI;

type
  TFMCONSCLIENTESXFATURAS1 = class(TFMPADRAOFILTRO1)
    RGSELECAO: TRadioGroup;
    GB_ESPECIFICO: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    GB_PERIODO: TGroupBox;
    Label1: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    Label2: TLabel;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    GroupBox1: TGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    DSPARAM: TDataSource;
    QRYGRID: TZQuery;
    DSGRID: TDataSource;
    QRYGRID2: TZQuery;
    DSGRID2: TDataSource;
    QRYGRIDCOD_EMPRESA: TFloatField;
    QRYGRIDCOD_CLIENTE: TFloatField;
    QRYGRIDCOD_CIDADE: TFloatField;
    QRYGRIDNOME_NOME_FANTASIA: TWideStringField;
    QRYGRIDRAZAO_SOCIAL: TWideStringField;
    QRYGRIDCPF: TWideStringField;
    QRYGRIDCNPJ: TWideStringField;
    QRYGRIDTIPO_PESSOA: TWideStringField;
    QRYGRIDENDERECO: TWideStringField;
    QRYGRIDNUMERO: TFloatField;
    QRYGRIDBAIRRO: TWideStringField;
    QRYGRIDCOMPLEMENTO: TWideStringField;
    QRYGRIDCEP: TWideStringField;
    QRYGRIDRAMO_ATIVIDADE: TWideStringField;
    QRYGRIDDATA_CADASTRO: TDateTimeField;
    QRYGRIDEMAIL: TWideStringField;
    QRYGRIDCOD_BANCO: TWideStringField;
    QRYGRIDCOD_AGENCIA: TFloatField;
    QRYGRIDCOD_CONTA_BANCO: TFloatField;
    QRYGRIDOBSERVACAO: TWideStringField;
    QRYGRIDREGISTRO_JUNTA: TWideStringField;
    QRYGRIDQUANTIDADE_FUNCIONARIOS: TFloatField;
    QRYGRIDCAPITAL_REGISTRADO: TFloatField;
    QRYGRIDINSCRICAO_ESTADUAL: TWideStringField;
    QRYGRIDTELEFONE_CELULAR: TWideStringField;
    QRYGRIDTELEFONE_FIXO: TWideStringField;
    QRYGRIDDATA_NASCIMENTO: TDateTimeField;
    QRYGRIDFACEBOOK: TWideStringField;
    QRYGRIDWHATS_APP: TWideStringField;
    QRYGRIDCONTATO_PRINCIPAL: TWideStringField;
    QRYGRIDSITUACAO: TWideStringField;
    cxGrid1DBTableView1COD_CLIENTE: TcxGridDBColumn;
    cxGrid1DBTableView1NOME_NOME_FANTASIA: TcxGridDBColumn;
    QRYGRID2COD_OS: TFloatField;
    QRYGRID2COD_EMPRESA: TFloatField;
    QRYGRID2COD_CLIENTE: TFloatField;
    QRYGRID2COD_TP_PAGAMENTO: TFloatField;
    QRYGRID2TOTAL_PARCELA: TFloatField;
    QRYGRID2SITUACAO: TWideStringField;
    QRYGRID2COD_CONDICAO_PAGAMENTO: TFloatField;
    QRYGRID2DATA_PAGAMENTO: TDateTimeField;
    QRYGRID2COD_BANCO_RECEBIMENTO: TFloatField;
    QRYGRID2COD_AGENCIA_RECEBIMENTO: TFloatField;
    QRYGRID2COD_CONTA_RECEBIMENTO: TFloatField;
    QRYGRID2OBSERVACAO: TWideStringField;
    QRYGRID2SEQUENCIA: TFloatField;
    QRYGRID2DATA_VENCIMENTO: TDateTimeField;
    cxGridDBTableView1COD_OS: TcxGridDBColumn;
    cxGridDBTableView1TOTAL_PARCELA: TcxGridDBColumn;
    cxGridDBTableView1DATA_PAGAMENTO: TcxGridDBColumn;
    cxGridDBTableView1SEQUENCIA: TcxGridDBColumn;
    cxGridDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    cxGrid1DBTableView1DATA_CADASTRO: TcxGridDBColumn;
    cxGrid1DBTableView1EMAIL: TcxGridDBColumn;
    cxGrid1DBTableView1TELEFONE_CELULAR: TcxGridDBColumn;
    cxGrid1DBTableView1WHATS_APP: TcxGridDBColumn;
    cxGrid1DBTableView1CONTATO_PRINCIPAL: TcxGridDBColumn;
    QRYGRID2DESC_SITUACAO: TStringField;
    cxGridDBTableView1DESC_SITUACAO: TcxGridDBColumn;
    QRYGRID2VALOR_REAL_RECEBIDO: TFloatField;
    cxGridDBTableView1VALOR_REAL_RECEBIDO: TcxGridDBColumn;
    Label18: TLabel;
    Label3: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RGSELECAOClick(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure CARREGAR_GRID;
    procedure QRYGRIDAfterScroll(DataSet: TDataSet);
    procedure BTNEXPORTARClick(Sender: TObject);
    procedure QRYGRID2CalcFields(DataSet: TDataSet);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCONSCLIENTESXFATURAS1: TFMCONSCLIENTESXFATURAS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMCONSCLIENTESXFATURAS1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
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
procedure TFMCONSCLIENTESXFATURAS1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   QRYGRID.CLOSE;
   QRYGRID2.CLOSE;
   TXTCLIENTE.TEXT := '';
   BTNCONFIRMAR.ENABLED := FALSE;
   RGSELECAO.ITEMINDEX := 1;
   RGSELECAOCLICK(SELF);
   QRYPARAMPARAM_D1.ASDATETIME := DATE-30;
   QRYPARAMPARAM_D2.ASDATETIME := DATE;

end;

procedure TFMCONSCLIENTESXFATURAS1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
 IF RGSELECAO.ITEMINDEX = 1 THEN
  BEGIN
     IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe um cliente para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_CLIENTE .SETFOCUS;
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

  CARREGAR_GRID;
end;

procedure TFMCONSCLIENTESXFATURAS1.BTNEXPORTARClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  SAVEDIALOG.FileName := 'Consulta Faturas do cliente '+QRYGRIDNOME_NOME_FANTASIA.AsString;
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName,cxGrid2, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName,cxGrid2, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName,cxGrid2, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName,cxGrid2, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;
procedure TFMCONSCLIENTESXFATURAS1.CARREGAR_GRID;
begin
   QRYGRID.CLOSE;
   QRYGRID.SQL.Clear;
   QRYGRID.SQL.Add('SELECT * FROM TBCLIENTE A');
   QRYGRID.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYGRID.SQL.Add('      (A.COD_CLIENTE = :PCOD_CLIENTE OR 0 = :PCOD_CLIENTE) AND');
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
end;

procedure TFMCONSCLIENTESXFATURAS1.DBTXTCOD_CLIENTEExit(Sender: TObject);
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
        DBTXTDATA_INICIAL.SetFocus;
      END;
    END
    ELSE
     TXTCLIENTE.Text := '';
end;

procedure TFMCONSCLIENTESXFATURAS1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMCONSCLIENTESXFATURAS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('34');
end;

procedure TFMCONSCLIENTESXFATURAS1.QRYGRID2CalcFields(DataSet: TDataSet);
begin
  inherited;
   IF QRYGRID2SITUACAO.ASSTRING = 'E' THEN
   BEGIN
      QRYGRID2DESC_SITUACAO.AsString := 'Em Aberto';
   END
   ELSE
   BEGIN
      QRYGRID2DESC_SITUACAO.AsString := 'Pago';
   END;
end;

procedure TFMCONSCLIENTESXFATURAS1.QRYGRIDAfterScroll(DataSet: TDataSet);
begin
  inherited;
   if NOT DataSet.ControlsDisabled then
   BEGIN
     QRYGRID2.Close;
     QRYGRID2.SQL.Clear;
     QRYGRID2.SQL.Add('SELECT *');
     QRYGRID2.SQL.Add('FROM TBCONTAS_RECEBER A');
     QRYGRID2.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
     QRYGRID2.SQL.Add('      A.COD_CLIENTE = :PCOD_CLIENTE AND');
     QRYGRID2.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND ');
     QRYGRID2.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL');
     QRYGRID2.SQL.Add('ORDER BY A.COD_OS,A.SEQUENCIA,A.DATA_VENCIMENTO');
     QRYGRID2.ParamByName('PCOD_EMPRESA').AsInteger := QRYGRIDCOD_EMPRESA.AsInteger;
     QRYGRID2.ParamByName('PCOD_CLIENTE').AsInteger := QRYGRIDCOD_CLIENTE.AsInteger;
     QRYGRID2.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.ASDATETIME;
     QRYGRID2.ParamByName('PDATA_FINAL').AsDateTime  := QRYPARAMPARAM_D2.ASDATETIME;
     QRYGRID2.Open;
   END;
end;

procedure TFMCONSCLIENTESXFATURAS1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  QRYGRID.CLOSE;
  QRYGRID2.CLOSE;
  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_CLIENTE.ENABLED  := FALSE;
     BIB_BUSCA_CLIENTE.ENABLED := FALSE;
     QRYPARAMPARAM_N1.CLEAR;
     TXTCLIENTE.TEXT := '';
     BTNCONFIRMAR.ENABLED := TRUE;
     BTNEXPORTAR.ENABLED  := TRUE;
     DBTXTDATA_INICIAL.SETFOCUS;
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
