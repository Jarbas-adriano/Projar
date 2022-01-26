unit FMCADCONDICAOPGTO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOCADASTRO, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFMCADCONDICAOPGTO1 = class(TFMPADRAOCADASTRO1)
    Label27: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    DBTXTNOME_COND_PGTO: TDBEdit;
    DBTXTCOD_COND_PGTO: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    LBLSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    Label25: TLabel;
    DBTXTOBSERVACAO: TDBMemo;
    QRYCOND_PGTO: TZQuery;
    QRYCOND_PGTOCOD_EMPRESA: TFloatField;
    QRYCOND_PGTOCOD_CONDICAO_PAG: TFloatField;
    QRYCOND_PGTONOME_CONDICAO_PAG: TWideStringField;
    QRYCOND_PGTOSITUACAO: TWideStringField;
    QRYCOND_PGTOOBSERVACOES: TWideStringField;
    DSCOND_PGTO: TDataSource;
    DBGRIDTABELADBTableView1COD_CONDICAO_PAG: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_CONDICAO_PAG: TcxGridDBColumn;
    DBGRIDTABELADBTableView1SITUACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1OBSERVACOES: TcxGridDBColumn;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure CARREGA_GRID;
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADCONDICAOPGTO1: TFMCADCONDICAOPGTO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMCADCONDICAOPGTO1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
    QRYCOND_PGTO.Prior;
end;

procedure TFMCADCONDICAOPGTO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
  HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

  QRYCOND_PGTO.CANCEL;
  DBC_SITUACAOCHANGE(SELF);
end;

procedure TFMCADCONDICAOPGTO1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
  HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYCOND_PGTO.EDIT;
   DBTXTNOME_COND_PGTO.SetFocus;
end;

procedure TFMCADCONDICAOPGTO1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;
IF QRYCOND_PGTO.IsEmpty THEN
  BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluido!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;

 QRYCOND_PGTO.Delete;

  MDPRINCIPAL.COMMIT;

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADCONDICAOPGTO1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
   HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                      BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                       BTNCANCELAR, BTNEXLCUIR, PNDADOS);

    QRYCOND_PGTO.CLOSE;
    QRYCOND_PGTO.OPEN;
    QRYCOND_PGTO.INSERT;
    QRYCOND_PGTOCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
    QRYCOND_PGTOSITUACAO.AsString := 'A';
   // QRYCOND_PGTO.AsString := 'N';
    DBC_SITUACAOChange(SELF);

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT NVL(MAX(COD_CONDICAO_PAG),0)+1 COD_CONDICAO_PAG FROM TBCONDICAO_PAGAMENTO');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.Open;


    QRYCOND_PGTOCOD_CONDICAO_PAG.AsInteger := QRYAUX.FieldByName('COD_CONDICAO_PAG').AsInteger;
    DBTXTNOME_COND_PGTO.SETFOCUS;
end;

procedure TFMCADCONDICAOPGTO1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
  QRYCOND_PGTO.Next;
end;

procedure TFMCADCONDICAOPGTO1.BTNSALVARClick(Sender: TObject);
begin
  inherited;
   if TRIM(QRYCOND_PGTONOME_CONDICAO_PAG.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o nome da condição de pagamento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME_COND_PGTO.SetFocus;
      ABORT;
   END;
   if TRIM(QRYCOND_PGTOSITUACAO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a situação',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SITUACAO.SetFocus;
      ABORT;
   END;
   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYCOND_PGTO.POST;
   MDPRINCIPAL.COMMIT;
end;

procedure TFMCADCONDICAOPGTO1.CARREGA_GRID;
begin
   QRYCOND_PGTO.Close;
   QRYCOND_PGTO.SQL.Clear;
   QRYCOND_PGTO.SQL.Add('SELECT * FROM TBCONDICAO_PAGAMENTO');
   QRYCOND_PGTO.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYCOND_PGTO.SQL.Add('      UPPER(NOME_CONDICAO_PAG) LIKE :PNOME');
   QRYCOND_PGTO.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYCOND_PGTO.ParamByName('PNOME').AsString := '%'+TXTPESQUISA_PRINCIPAL.Text+'%';
   QRYCOND_PGTO.Open;
end;

procedure TFMCADCONDICAOPGTO1.DBC_SITUACAOChange(Sender: TObject);
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

procedure TFMCADCONDICAOPGTO1.DBGRIDTABELADBTableView1DblClick(Sender: TObject);
begin
  inherited;
  DBC_SITUACAOChange(SELF);
end;

procedure TFMCADCONDICAOPGTO1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMCADCONDICAOPGTO1.FormShow(Sender: TObject);
begin
  inherited;
   QRYCOND_PGTO.Active := TRUE;
   DBC_SITUACAOChange(SELF);

end;

procedure TFMCADCONDICAOPGTO1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
   CARREGA_GRID;
end;

end.
