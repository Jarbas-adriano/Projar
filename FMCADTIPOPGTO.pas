unit FMCADTIPOPGTO;

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
  TFMCADTIPOPGTO1 = class(TFMPADRAOCADASTRO1)
    Label27: TLabel;
    DBTXTTELEFONE_CELULAR: TDBEdit;
    Label6: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    DBTXTNOME: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    LBLSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    GBDETALHES_PRAZO: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    DBTXTQTDE_DIAS: TDBEdit;
    QRYTP_PGTO: TZQuery;
    DSTP_PGTO: TDataSource;
    QRYTP_PGTOCOD_EMPRESA: TFloatField;
    QRYTP_PGTOCOD_TP_PAGAMENTO: TFloatField;
    QRYTP_PGTONOME_TP_PAGAMENTO: TWideStringField;
    QRYTP_PGTOSITUACAO: TWideStringField;
    QRYTP_PGTOQTDE_DIAS_ENTRE_FATURAS: TFloatField;
    DBGRIDTABELADBTableView1COD_TP_PAGAMENTO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_TP_PAGAMENTO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1SITUACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1QTDE_DIAS_ENTRE_FATURAS: TcxGridDBColumn;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    PROCEDURE CARREGA_GRID;
    procedure FormShow(Sender: TObject);
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADTIPOPGTO1: TFMCADTIPOPGTO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMCADTIPOPGTO1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
   QRYTP_PGTO.PRIOR;
end;

procedure TFMCADTIPOPGTO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
 HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

  QRYTP_PGTO.CANCEL;
  DBC_SITUACAOCHANGE(SELF);
end;

procedure TFMCADTIPOPGTO1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
  HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYTP_PGTO.EDIT;
   DBTXTNOME.SetFocus;
end;

procedure TFMCADTIPOPGTO1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;
  IF QRYTP_PGTO.IsEmpty THEN
  BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluido!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;

  QRYTP_PGTO.Edit;
  QRYTP_PGTOSITUACAO.AsString := 'E';
  QRYTP_PGTO.Post;
  QRYTP_PGTO.Next;

  MDPRINCIPAL.COMMIT;
  PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADTIPOPGTO1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
  //TXTDESC_FUNCAO.Text := '';
   HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                      BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                       BTNCANCELAR, BTNEXLCUIR, PNDADOS);

    QRYTP_PGTO.CLOSE;
    QRYTP_PGTO.OPEN;
    QRYTP_PGTO.INSERT;
    QRYTP_PGTOCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
    QRYTP_PGTOSITUACAO.AsString := 'A';
    DBC_SITUACAOChange(SELF);

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT NVL(MAX(COD_TP_PAGAMENTO),0)+1 COD_TP_PAGAMENTO FROM TBTIPO_PAGAMENTO');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.Open;


    QRYTP_PGTOCOD_TP_PAGAMENTO.AsInteger := QRYAUX.FieldByName('COD_TP_PAGAMENTO').AsInteger;
    DBTXTNOME.SETFOCUS;
end;

procedure TFMCADTIPOPGTO1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
   QRYTP_PGTO.Next;
end;

procedure TFMCADTIPOPGTO1.BTNSALVARClick(Sender: TObject);
begin
  inherited;
   if TRIM(QRYTP_PGTONOME_TP_PAGAMENTO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o nome do pagamento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTP_PGTOSITUACAO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a situação da condição de pagamento',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SITUACAO.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTP_PGTOQTDE_DIAS_ENTRE_FATURAS.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a quantidade de dias entre as faturas',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTQTDE_DIAS.SetFocus;
      ABORT;
   END;

   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYTP_PGTO.POST;
   MDPRINCIPAL.COMMIT;
end;

procedure TFMCADTIPOPGTO1.CARREGA_GRID;
begin
   QRYTP_PGTO.Close;
   QRYTP_PGTO.SQL.Clear;
   QRYTP_PGTO.SQL.Add('SELECT * FROM TBTIPO_PAGAMENTO');
   QRYTP_PGTO.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYTP_PGTO.SQL.Add('      SITUACAO <> ''E'' AND ');
   QRYTP_PGTO.SQL.Add('      UPPER(NOME_TP_PAGAMENTO) LIKE UPPER(:PNOME)');
   QRYTP_PGTO.SQL.Add('ORDER BY COD_TP_PAGAMENTO');
   QRYTP_PGTO.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYTP_PGTO.ParamByName('PNOME').AsString := '%'+TXTPESQUISA_PRINCIPAL.Text+'%';
   QRYTP_PGTO.Open;
end;

procedure TFMCADTIPOPGTO1.DBC_SITUACAOChange(Sender: TObject);
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

procedure TFMCADTIPOPGTO1.DBGRIDTABELADBTableView1DblClick(Sender: TObject);
begin
  inherited;
   DBC_SITUACAOChange(SELF);
end;

procedure TFMCADTIPOPGTO1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMCADTIPOPGTO1.FormShow(Sender: TObject);
begin
  inherited;
   QRYTP_PGTO.Active := TRUE;
   DBC_SITUACAOChange(SELF);
end;

procedure TFMCADTIPOPGTO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('10');
end;

procedure TFMCADTIPOPGTO1.PGPRINCIPALChange(Sender: TObject);
begin
  inherited;
  if (QRYTP_PGTO.State = DSINSERT) OR (QRYTP_PGTO.State = DSEDIT) then
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
    DBC_SITUACAOChange(SELF);
  END;
end;

procedure TFMCADTIPOPGTO1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
  CARREGA_GRID;
end;

end.
