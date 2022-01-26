unit FMCADDESPESAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOCADASTRO, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.Mask, Vcl.Imaging.jpeg, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFMCADDESPESAS1 = class(TFMPADRAOCADASTRO1)
    Label27: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    DBTXTNOME_DESPESA: TDBEdit;
    Label2: TLabel;
    DBTXTVALOR: TDBEdit;
    Label4: TLabel;
    Label8: TLabel;
    Label25: TLabel;
    DBTXTOBSERVACAO: TDBMemo;
    Label11: TLabel;
    Label12: TLabel;
    LBLSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    DBTXTCODIGO: TDBEdit;
    Label7: TLabel;
    DBTXTDATA_PGTO: TcxDBDateEdit;
    QRYDESPESAS: TZQuery;
    QRYDESPESASCOD_EMPRESA: TFloatField;
    QRYDESPESASCOD_DESPESA: TFloatField;
    QRYDESPESASNOME_DESPESA: TWideStringField;
    QRYDESPESASSITUACAO: TWideStringField;
    QRYDESPESASOBSERVACAO: TWideStringField;
    QRYDESPESASVALOR: TFloatField;
    DSDESPESAS: TDataSource;
    DBGRIDTABELADBTableView1COD_DESPESA: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_DESPESA: TcxGridDBColumn;
    DBGRIDTABELADBTableView1SITUACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1OBSERVACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1VALOR: TcxGridDBColumn;
    DBGRIDTABELADBTableView1DATA_PAGAMENTO_BASE: TcxGridDBColumn;
    QRYDESPESASDATA_PAGAMENTO_BASE: TDateTimeField;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    PROCEDURE CARREGA_GRID;
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
    FUNCTION  EXISTE_DESPESA_MOV :BOOLEAN;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADDESPESAS1: TFMCADDESPESAS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMCADDESPESAS1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
   QRYDESPESAS.Prior;
end;

procedure TFMCADDESPESAS1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
  HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

  QRYDESPESAS.CANCEL;
  DBC_SITUACAOCHANGE(SELF);
  DBTXTNOME_DESPESA.READONLY := FALSE;
end;

procedure TFMCADDESPESAS1.BTNEDITARClick(Sender: TObject);
begin
  inherited;

  HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYDESPESAS.EDIT;
   IF EXISTE_DESPESA_MOV THEN
   BEGIN
      DBTXTNOME_DESPESA.ReadOnly := TRUE;
      DBTXTVALOR.SETFOCUS;
   END
   ELSE
   BEGIN
      DBTXTNOME_DESPESA.SetFocus;
   END;
end;

procedure TFMCADDESPESAS1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;

   IF EXISTE_DESPESA_MOV THEN
   BEGIN
     APPLICATION.MessageBox('A despesa não pode ser excluída pois já está sendo utilizada.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     ABORT;
   END;

  IF QRYDESPESAS.IsEmpty THEN
  BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluido!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;

  //QRYDESPESAS.Delete;

  QRYDESPESAS.Edit;
  QRYDESPESASSITUACAO.AsString := 'E';
  QRYDESPESAS.Post;
  QRYDESPESAS.First;

  MDPRINCIPAL.COMMIT;

  PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADDESPESAS1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
   HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                      BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                       BTNCANCELAR, BTNEXLCUIR, PNDADOS);

    QRYDESPESAS.CLOSE;
    QRYDESPESAS.OPEN;
    QRYDESPESAS.INSERT;
    QRYDESPESASCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
    QRYDESPESASSITUACAO.AsString := 'A';
    DBC_SITUACAOChange(SELF);

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT NVL(MAX(COD_DESPESA),0)+1 COD_DESPESA FROM TBDESPESAS');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.Open;


    QRYDESPESASCOD_DESPESA.AsInteger := QRYAUX.FieldByName('COD_DESPESA').AsInteger;
    DBTXTNOME_DESPESA.SETFOCUS;
end;

procedure TFMCADDESPESAS1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
   QRYDESPESAS.Next;
end;

procedure TFMCADDESPESAS1.BTNSALVARClick(Sender: TObject);
begin
  inherited;
   IF QRYDESPESASSITUACAO.ASSTRING = 'I' then
   BEGIN
     IF EXISTE_DESPESA_MOV THEN
     BEGIN
       APPLICATION.MessageBox('A despesa não pode ser inativada pois já está sendo utilizada.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       ABORT;
     END;
   END;

   if TRIM(QRYDESPESASNOME_DESPESA.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o nome da despesa',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME_DESPESA.SetFocus;
      ABORT;
   END;
   if TRIM(QRYDESPESASSITUACAO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a situação da despesa',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SITUACAO.SetFocus;
      ABORT;
   END;
    if TRIM(QRYDESPESASVALOR.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o valor da despesa',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTVALOR.SetFocus;
      ABORT;
   END;
   if TRIM(QRYDESPESASDATA_PAGAMENTO_BASE.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar data inicial de pagamento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTDATA_PGTO.SetFocus;
      ABORT;
   END
   ELSE
   BEGIN
      if QRYDESPESASDATA_PAGAMENTO_BASE.AsDateTime < DATE then
      BEGIN
        APPLICATION.MessageBox('A data inicial de pagamento não pode ser menor do que a data atual!.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTDATA_PGTO.SetFocus;
        ABORT;
      END;
   END;
   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYDESPESAS.POST;
   MDPRINCIPAL.COMMIT;
   DBTXTNOME_DESPESA.READONLY := FALSE;
end;

procedure TFMCADDESPESAS1.CARREGA_GRID;
begin
   QRYDESPESAS.Close;
   QRYDESPESAS.SQL.Clear;
   QRYDESPESAS.SQL.Add('SELECT * FROM TBDESPESAS');
   QRYDESPESAS.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYDESPESAS.SQL.Add('      SITUACAO <> ''E'' AND ');
   QRYDESPESAS.SQL.Add('      UPPER(NOME_DESPESA) LIKE UPPER(:PNOME)');
   QRYDESPESAS.SQL.Add('ORDER BY COD_DESPESA');
   QRYDESPESAS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYDESPESAS.ParamByName('PNOME').AsString := '%'+TXTPESQUISA_PRINCIPAL.Text+'%';
   QRYDESPESAS.Open;
end;

procedure TFMCADDESPESAS1.DBC_SITUACAOChange(Sender: TObject);
begin
  inherited;
   if DBC_SITUACAO.Text  = 'A' then
   BEGIN
      LBLSITUACAO.Caption := 'Ativo'
   END
   ELSE if DBC_SITUACAO.Text  = 'I' then
   BEGIN
      LBLSITUACAO.Caption := 'Inativo'
   END
   ELSE
      LBLSITUACAO.Caption := ''
end;

procedure TFMCADDESPESAS1.DBGRIDTABELADBTableView1DblClick(Sender: TObject);
begin
  inherited;
   DBC_SITUACAOChange(SELF);
end;

function TFMCADDESPESAS1.EXISTE_DESPESA_MOV: BOOLEAN;
begin
   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.Add('FROM TBCONTAS_PAGAR A');
   QRYAUX.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('      A.COD_DESPESA = :PCOD_DESPESA AND');
   QRYAUX.SQL.Add('      A.SITUACAO = ''E''');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_DESPESA').AsInteger := QRYDESPESASCOD_DESPESA.AsInteger;
   QRYAUX.OPEN;

   EXISTE_DESPESA_MOV := FALSE;
   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     EXISTE_DESPESA_MOV := TRUE;
   END;
end;

procedure TFMCADDESPESAS1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF PGPRINCIPAL.ACTIVEPAGE = TSCADASTRO THEN
  BEGIN
     IF KEY = VK_F2 THEN
     BEGIN
       IF BTNINCLUIR.ENABLED = TRUE THEN
          BTNINCLUIRCLICK(SELF);
     END
     ELSE IF KEY = VK_F3 THEN
     BEGIN
        IF BTNEDITAR.ENABLED = TRUE THEN
           BTNEDITARCLICK(SELF);
     END
     ELSE IF KEY = VK_F4 THEN
     BEGIN
         IF BTNEXLCUIR.ENABLED = TRUE THEN
            BTNEXLCUIRCLICK(SELF);
     END
     ELSE IF KEY = VK_F6 THEN
     BEGIN
         IF BTNSALVAR.ENABLED = TRUE THEN
            BTNSALVARCLICK(SELF);
     END
     ELSE IF KEY = VK_F7 THEN
     BEGIN
        IF BTNCANCELAR.ENABLED = TRUE THEN
           BTNCANCELARCLICK(SELF);
     END
     ELSE IF KEY = VK_F8 THEN
     BEGIN
        IF BTNPESQUISAR.ENABLED = TRUE THEN
           BTNPESQUISARCLICK(SELF);
     END;
  END;
end;

procedure TFMCADDESPESAS1.FormShow(Sender: TObject);
begin
  inherited;
   QRYDESPESAS.Active := TRUE;
   DBC_SITUACAOChange(SELF);
end;

procedure TFMCADDESPESAS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('9');
end;

procedure TFMCADDESPESAS1.PGPRINCIPALChange(Sender: TObject);
begin
  inherited;
  if (QRYDESPESAS.State = DSINSERT) OR (QRYDESPESAS.State = DSEDIT) then
  begin
    IF PGPRINCIPAL.ActivePage <> TSCADASTRO THEN
    BEGIN
      APPLICATION.MessageBox('Não é possivel alterar de abas quando estiver em modo de Inserção ou Edição.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      PGPRINCIPAL.ActivePage := TSCADASTRO;
      ABORT;
    END;
  end;

  if PGPRINCIPAL.ActivePage = TSCONSULTA then
  BEGIN
    TXTPESQUISA_PRINCIPAL.Text := '';
    CARREGA_GRID;
  END
  ELSE
  BEGIN
    DBC_SITUACAOCHANGE(SELF);
  END;
end;

procedure TFMCADDESPESAS1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
   CARREGA_GRID;
end;

end.
