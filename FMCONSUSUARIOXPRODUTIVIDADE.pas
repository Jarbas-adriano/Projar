unit FMCONSUSUARIOXPRODUTIVIDADE;

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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.Mask,
  Vcl.ComCtrls, Vcl.Imaging.jpeg,CXGRIDEXPORTLINK,ShellAPI, ZStoredProcedure,
  cxGridChartView, cxGridDBChartView;

type
  TFMCONSUSUARIOXPRODUTIVIDADE1 = class(TFMPADRAOFILTRO1)
    RGSELECAO: TRadioGroup;
    GB_ESPECIFICO: TGroupBox;
    GB_PERIODO: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    Label4: TLabel;
    DBTXTCOD_USUARIO: TDBEdit;
    BIB_BUSCA_USUARIO: TBitBtn;
    TXTUSUARIO: TEdit;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    PCCONS_USUARIO_X_PRODUTIVIDADE: TZStoredProc;
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
    QRYGRIDNOME: TWideStringField;
    DSGRID: TDataSource;
    cxGrid1DBTableView1NUM1: TcxGridDBColumn;
    cxGrid1DBTableView1NUM2: TcxGridDBColumn;
    cxGrid1DBTableView1NUM3: TcxGridDBColumn;
    cxGrid1DBTableView1NUM4: TcxGridDBColumn;
    cxGrid1DBTableView1NOME: TcxGridDBColumn;
    cxGrid1DBTableView1NUM6: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    ScrollBox1: TScrollBox;
    cxGrid2: TcxGrid;
    cxGrid2DBChartView1: TcxGridDBChartView;
    cxGrid2DBChartView1Series1: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series2: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series3: TcxGridDBChartSeries;
    cxGrid2DBChartView1Series4: TcxGridDBChartSeries;
    cxGrid2Level1: TcxGridLevel;
    Label18: TLabel;
    Label3: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure RGSELECAOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNEXPORTARClick(Sender: TObject);
    procedure DBTXTCOD_USUARIOExit(Sender: TObject);
    procedure BIB_BUSCA_USUARIOClick(Sender: TObject);
    procedure CARREGAR_GRID;
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCONSUSUARIOXPRODUTIVIDADE1: TFMCONSUSUARIOXPRODUTIVIDADE1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.BIB_BUSCA_USUARIOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME', 'COD_USUARIO "Codigo", NOME "Nome Usuário"',
        S_FILTRO, 'Nome do usúario', 'NOME',
        'TBUSUARIO', 'S', 'Usuários', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_USUARIOExit(SELF);
  END;
end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.BTNCANCELARClick(Sender: TObject);
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

   TXTUSUARIO.Text := '';

   QRYGRID.Close;
end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
  IF RGSELECAO.ITEMINDEX = 1 THEN
  BEGIN
     IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe um usuário para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_USUARIO.SETFOCUS;
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
   BTNCONFIRMAR.Enabled := FALSE;
end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.BTNEXPORTARClick(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  SAVEDIALOG.FileName := 'Consulta Usuário X Produtividade';
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

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.CARREGAR_GRID;
begin
//
   PCCONS_USUARIO_X_PRODUTIVIDADE.ParamByName('PCOD_TERMINAL').AsString   :=  BUSCANOME_COMPUTADOR;
   PCCONS_USUARIO_X_PRODUTIVIDADE.ParamByName('PCOD_APLICACAO').AsString  := 'FMCONSUSUARIOXPRODUTIVIDADE';
   PCCONS_USUARIO_X_PRODUTIVIDADE.ParamByName('PCOD_EMPRESA').ASINTEGER   := EMPRESA_ATUAL;
   PCCONS_USUARIO_X_PRODUTIVIDADE.ParamByName('PCOD_USUARIO').ASINTEGER   := QRYPARAMPARAM_N1.AsInteger;
   PCCONS_USUARIO_X_PRODUTIVIDADE.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.ASDATETIME;
   PCCONS_USUARIO_X_PRODUTIVIDADE.ParamByName('PDATA_FINAL').ASDATETIME   := QRYPARAMPARAM_D2.ASDATETIME;
   PCCONS_USUARIO_X_PRODUTIVIDADE.PREPARE;
   PCCONS_USUARIO_X_PRODUTIVIDADE.ExecProc;
   PCCONS_USUARIO_X_PRODUTIVIDADE.Unprepare;

   QRYGRID.Close;
   QRYGRID.SQL.Clear;
   QRYGRID.SQL.Add('SELECT A.*,B.NOME FROM TBTEMPORARIA A,TBUSUARIO B');
   QRYGRID.SQL.Add('WHERE A.CODTERMINAL   = :PCOD_TERMINAL AND');
   QRYGRID.SQL.Add('      A.COD_APLICACAO = :PCOD_APLICACAO AND ');
   QRYGRID.SQL.Add('      B.COD_EMPRESA = A.NUM5 AND');
   QRYGRID.SQL.Add('      B.COD_USUARIO = A.NUM6 AND ');
   QRYGRID.SQL.Add('      B.SITUACAO =''A''');
   QRYGRID.SQL.Add('ORDER BY A.NUM6');
   QRYGRID.PARAMBYNAME('PCOD_TERMINAL').AsString := BUSCANOME_COMPUTADOR;
   QRYGRID.PARAMBYNAME('PCOD_APLICACAO').AsString := 'FMCONSUSUARIOXPRODUTIVIDADE';
   QRYGRID.Open;

   IF QRYGRID.ISEMPTY THEN
   BEGIN
     MESSAGEDLG('Nenhum registro foi encontrado!.',mtInformation,[MBOK],1);
     IF DBTXTCOD_USUARIO.CANFOCUS THEN
        DBTXTCOD_USUARIO.SETFOCUS;
     ABORT;
   END;

   if RGSELECAO.ItemIndex = 1 then
   BEGIN
     cxGrid1DBTableView1NOME.Visible := FALSE;
   END
   ELSE
   BEGIN
      cxGrid1DBTableView1NOME.Visible := TRUE;
   END;

end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.DBTXTCOD_USUARIOExit(Sender: TObject);
begin
  inherited;
   if QRYPARAMPARAM_N1.AsString  <> '' then
   BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME');
      QRYAUX.SQL.Add('FROM TBUSUARIO');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_USUARIO  = :PCOD_USUARIO  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_USUARIO').AsInteger := QRYPARAMPARAM_N1.AsInteger;
      QRYAUX.Open;

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Usuário não encontrado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_USUARIO.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTUSUARIO.Text := QRYAUX.FieldByName('NOME').AsString;
        BTNCONFIRMAR.Enabled := TRUE;
        BTNEXPORTAR.Enabled  := TRUE;
      END;
    END
    ELSE
       TXTUSUARIO.Text := '';

end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('42');
end;

procedure TFMCONSUSUARIOXPRODUTIVIDADE1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  QRYGRID.Close;
  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_USUARIO.Enabled  := FALSE;
     BIB_BUSCA_USUARIO.Enabled := FALSE;
     QRYPARAMPARAM_N1.Clear;
     DBTXTDATA_INICIAL.SetFocus;
     TXTUSUARIO.Text := '';
     BTNCONFIRMAR.Enabled := TRUE;
     BTNEXPORTAR.Enabled  := TRUE;
  END
  ELSE
  BEGIN
     DBTXTCOD_USUARIO.Enabled  := TRUE;
     BIB_BUSCA_USUARIO.Enabled := TRUE;
     DBTXTCOD_USUARIO.SetFocus;
     BTNCONFIRMAR.Enabled := FALSE;
     BTNEXPORTAR.Enabled  := FALSE;
  END;
end;

end.
