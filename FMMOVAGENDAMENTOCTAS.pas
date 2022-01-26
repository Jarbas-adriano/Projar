unit FMMOVAGENDAMENTOCTAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ComCtrls, Vcl.Imaging.jpeg, ZStoredProcedure;

type
  TFMMOVAGENDAMENTOCTAS1 = class(TFMPADRAOGERAL1)
    Panel1: TPanel;
    Label4: TLabel;
    DBTXTCOD_DESPESA: TDBEdit;
    BIB_BUSCA_DESPESA: TBitBtn;
    TXTNOME_DESPESA: TEdit;
    Label3: TLabel;
    DBTXTVLR_TOTAL: TDBEdit;
    Label1: TLabel;
    DBTXTQTDE_PARCELAS: TDBEdit;
    Label2: TLabel;
    DBTXTDATA_PGTO: TcxDBDateEdit;
    DBTXTOBSERVACAO: TDBMemo;
    Label5: TLabel;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_N2: TFloatField;
    QRYPARAMPARAM_N3: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_C100: TWideStringField;
    QRYPARAMPARAM_C1: TWideStringField;
    Label6: TLabel;
    DBTXTTIPO_PGTO: TDBEdit;
    BIBBUSCA_TP_PGTO: TBitBtn;
    TXTNOME_TP_PGTO: TEdit;
    QRYPARAMPARAM_N4: TFloatField;
    GroupBox1: TGroupBox;
    DBGRIDPGTO: TcxGrid;
    DBGRIDPGTODBTableView1: TcxGridDBTableView;
    DBGRIDPGTOLevel1: TcxGridLevel;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    BIBPONTOS_PRINCIPAL: TBitBtn;
    PCGERA_CONTAS_PAGAR: TZStoredProc;
    QRYGRID: TZQuery;
    DSGRID: TDataSource;
    QRYGRIDNUM3: TFloatField;
    QRYGRIDNUM4: TFloatField;
    QRYGRIDDATA1: TDateTimeField;
    DBGRIDPGTODBTableView1NUM3: TcxGridDBColumn;
    DBGRIDPGTODBTableView1NUM4: TcxGridDBColumn;
    DBGRIDPGTODBTableView1DATA1: TcxGridDBColumn;
    Label10: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    procedure BIB_BUSCA_DESPESAClick(Sender: TObject);
    procedure DBTXTCOD_DESPESAExit(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBTXTTIPO_PGTOExit(Sender: TObject);
    procedure BIBBUSCA_TP_PGTOClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure BIBPONTOS_PRINCIPALClick(Sender: TObject);
    procedure carrega_grid;
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  // NESTE APLICATIVO O CLIENTE VAI DIGITAR O VALOR E A QUANTIDADE DE PARCELAS E EU VOU GERAR O VALOR DE ACORDO COM AS PARCELAS E A DATA DE PAGAMENTO INFORMADA.
var
  FMMOVAGENDAMENTOCTAS1: TFMMOVAGENDAMENTOCTAS1;
  ISEQUENCIA :INTEGER;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL, FMPADRAOCONSULTA;

procedure TFMMOVAGENDAMENTOCTAS1.BIBBUSCA_TP_PGTOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_TP_PAGAMENTO', 'COD_TP_PAGAMENTO "Codigo",  NOME_TP_PAGAMENTO "Nome do Tipo de Pagamento"',
        S_FILTRO, 'Nome do tipo do Pagamento', 'COD_TP_PAGAMENTO',
        'TBTIPO_PAGAMENTO', 'S', 'Tipos de Pagamento', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N4.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTTIPO_PGTOExit(self);
  END;
end;
procedure TFMMOVAGENDAMENTOCTAS1.BIBPONTOS_PRINCIPALClick(Sender: TObject);
begin
  inherited;
  if TRIM(QRYPARAMPARAM_N1.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o codigo da despesa',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCOD_DESPESA.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_N2.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o valor',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTVLR_TOTAL.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_N3.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a quantidade de parcelas',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTQTDE_PARCELAS.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_D1.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a data do vencimento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTDATA_PGTO.SetFocus;
      ABORT;
   END;
   if QRYPARAMPARAM_D1.AsDateTime < DATE then
   BEGIN
      APPLICATION.MessageBox('A data de vencimento não pode ser menor do que a data atual',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTDATA_PGTO.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_N4.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o tipo do pagamento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTTIPO_PGTO.SetFocus;
      ABORT;
   END;

   TRY
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_TERMINAL').ASSTRING       := BUSCANOME_COMPUTADOR;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_APLICACAO').ASSTRING      := 'FMMOVAGENDAMENTOCTAS';
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER       := EMPRESA_ATUAL;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_DESPESA').ASINTEGER       := QRYPARAMPARAM_N1.ASINTEGER;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_TIPO_PGTO').ASINTEGER     := QRYPARAMPARAM_N4.ASINTEGER;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PVLR_TOTAL_DESPESA').ASFLOAT   := QRYPARAMPARAM_N2.ASFLOAT;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PQTDE_PARCELAS').ASINTEGER     := QRYPARAMPARAM_N3.ASINTEGER;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PDATA_PAGAMENTO').ASDATETIME   := QRYPARAMPARAM_D1.ASDATETIME;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('POBSERVACAO').ASSTRING         := QRYPARAMPARAM_C100.ASSTRING;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PEFETIVO').ASSTRING            := 'N';
     PCGERA_CONTAS_PAGAR.PREPARE;
     PCGERA_CONTAS_PAGAR.EXECPROC;
     ISEQUENCIA :=  PCGERA_CONTAS_PAGAR.PARAMBYNAME('PSEQUENCIA').ASINTEGER;
     PCGERA_CONTAS_PAGAR.UNPREPARE;
     MDPRINCIPAL.COMMIT;
   EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MESSAGEDLG('Erro ao fazer o agendamento de contas a pagar. Erro :'+e.Message,mtInformation,[MBOK],1);
        MDPRINCIPAL.ROLLBACK;
        abort;
     END;
   END;
   DBTXTCOD_DESPESA.Enabled    := FALSE;
   DBTXTVLR_TOTAL.Enabled      := FALSE;
   DBTXTDATA_PGTO.Enabled      := FALSE;
   DBTXTTIPO_PGTO.Enabled      := FALSE;
   DBTXTQTDE_PARCELAS.Enabled  := FALSE;
   BTNCONFIRMAR.ENABLED        := TRUE;
   BIBPONTOS_PRINCIPAL.Enabled := FALSE;
   DBTXTOBSERVACAO.SetFocus;
   CARREGA_GRID;
end;

procedure TFMMOVAGENDAMENTOCTAS1.BIB_BUSCA_DESPESAClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_DESPESA', 'COD_DESPESA "Codigo", NOME_DESPESA "Nome da Despesa"',
        S_FILTRO, 'Nome da Despesa', 'COD_DESPESA',
        'TBDESPESAS', 'S', 'Despesas', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_DESPESAExit(SELF);
  END;
end;

procedure TFMMOVAGENDAMENTOCTAS1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   TXTNOME_DESPESA.TEXT := '';
   TXTNOME_TP_PGTO.TEXT := '';
   QRYPARAMPARAM_D1.ASDATETIME := DATE;
   BTNCONFIRMAR.ENABLED := FALSE;
   DBTXTCOD_DESPESA.ENABLED    := TRUE;
   DBTXTVLR_TOTAL.ENABLED      := TRUE;
   DBTXTDATA_PGTO.ENABLED      := TRUE;
   DBTXTTIPO_PGTO.ENABLED      := TRUE;
   DBTXTQTDE_PARCELAS.ENABLED  := TRUE;
   BIBPONTOS_PRINCIPAL.ENABLED := TRUE;
   QRYGRID.CLOSE;
   DBTXTCOD_DESPESA.SETFOCUS;
end;

procedure TFMMOVAGENDAMENTOCTAS1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
  if TRIM(QRYPARAMPARAM_N1.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o codigo da despesa',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCOD_DESPESA.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_N2.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o valor',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTVLR_TOTAL.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_N3.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a quantidade de parcelas',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTQTDE_PARCELAS.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_D1.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a data do vencimento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTDATA_PGTO.SetFocus;
      ABORT;
   END;
   if QRYPARAMPARAM_D1.AsDateTime < DATE then
   BEGIN
      APPLICATION.MessageBox('A data de vencimento não pode ser menor do que a data atual',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTDATA_PGTO.SetFocus;
      ABORT;
   END;
   if TRIM(QRYPARAMPARAM_N4.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o tipo do pagamento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTTIPO_PGTO.SetFocus;
      ABORT;
   END;

   TRY
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_TERMINAL').ASSTRING       := BUSCANOME_COMPUTADOR;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_APLICACAO').ASSTRING      := 'FMMOVAGENDAMENTOCTAS';
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER       := EMPRESA_ATUAL;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_DESPESA').ASINTEGER       := QRYPARAMPARAM_N1.ASINTEGER;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PCOD_TIPO_PGTO').ASINTEGER     := QRYPARAMPARAM_N4.ASINTEGER;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PVLR_TOTAL_DESPESA').ASFLOAT   := QRYPARAMPARAM_N2.ASFLOAT;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PQTDE_PARCELAS').ASINTEGER     := QRYPARAMPARAM_N3.ASINTEGER;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PDATA_PAGAMENTO').ASDATETIME   := QRYPARAMPARAM_D1.ASDATETIME;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('POBSERVACAO').ASSTRING         := QRYPARAMPARAM_C100.ASSTRING;
     PCGERA_CONTAS_PAGAR.PARAMBYNAME('PEFETIVO').ASSTRING            := 'S';
     PCGERA_CONTAS_PAGAR.PREPARE;
     PCGERA_CONTAS_PAGAR.EXECPROC;
     ISEQUENCIA :=  PCGERA_CONTAS_PAGAR.PARAMBYNAME('PSEQUENCIA').ASINTEGER;
     PCGERA_CONTAS_PAGAR.UNPREPARE;
     MDPRINCIPAL.COMMIT;
      MESSAGEDLG('Contas a pagar geradas com sucesso.',mtInformation,[MBOK],1);
   EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MESSAGEDLG('Erro ao fazer o agendamento de contas a pagar. Erro :'+e.Message,mtInformation,[MBOK],1);
        MDPRINCIPAL.ROLLBACK;
     END;
   END;
   BTNCANCELARClick(SELF);
end;

procedure TFMMOVAGENDAMENTOCTAS1.carrega_grid;
begin
   QRYGRID.Close;
   QRYGRID.SQL.Clear;
   QRYGRID.SQL.Add('SELECT NUM3, NUM4, DATA1');
   QRYGRID.SQL.Add('FROM TBTEMPORARIA');
   QRYGRID.SQL.Add('WHERE CODTERMINAL   = :PCOD_TERMINAL AND ');
   QRYGRID.SQL.Add('      COD_APLICACAO = :PCOD_APLICACAO');
   QRYGRID.SQL.Add('ORDER BY NUM4,DATA1');
   QRYGRID.ParamByName('PCOD_TERMINAL').AsString     := BUSCANOME_COMPUTADOR;
   QRYGRID.ParamByName('PCOD_APLICACAO').AsString  := 'FMMOVAGENDAMENTOCTAS';
   QRYGRID.Open;
end;

procedure TFMMOVAGENDAMENTOCTAS1.DBTXTCOD_DESPESAExit(Sender: TObject);
begin
  inherited;
    if QRYPARAMPARAM_N1.AsInteger <> 0 then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_DESPESA,VALOR,DATA_PAGAMENTO_BASE');
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
        TXTNOME_DESPESA.TEXT := QRYAUX.FIELDBYNAME('NOME_DESPESA').ASSTRING;
        QRYPARAMPARAM_N2.ASSTRING := QRYAUX.FIELDBYNAME('VALOR').ASSTRING;
        QRYPARAMPARAM_D1.AsDateTime := QRYAUX.FieldByName('DATA_PAGAMENTO_BASE').AsDateTime;
        DBTXTVLR_TOTAL.SetFocus;
      END;
    END
    ELSE
       TXTNOME_DESPESA.Text := '';

end;

procedure TFMMOVAGENDAMENTOCTAS1.DBTXTTIPO_PGTOExit(Sender: TObject);
begin
  inherited;
   if QRYPARAMPARAM_N4.AsInteger <> 0 then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_TP_PAGAMENTO');
      QRYAUX.SQL.Add('FROM TBTIPO_PAGAMENTO');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA       = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_TP_PAGAMENTO  = :PCOD_TP_PAGAMENTO  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_TP_PAGAMENTO').AsInteger := QRYPARAMPARAM_N4.AsInteger;
      QRYAUX.Open;

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Condição de pagamento não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTTIPO_PGTO.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTNOME_TP_PGTO.Text := QRYAUX.FieldByName('NOME_TP_PAGAMENTO').AsString;
        BIBPONTOS_PRINCIPALClick(SELF);
        BIBPONTOS_PRINCIPALClick(SELF);
      END;
    END;
end;

procedure TFMMOVAGENDAMENTOCTAS1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMMOVAGENDAMENTOCTAS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
     ABRIR_AJUDA('27');
end;

end.
