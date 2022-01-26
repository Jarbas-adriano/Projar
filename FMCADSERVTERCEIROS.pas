unit FMCADSERVTERCEIROS;

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
  TFMCADSERVTERCEIROS1 = class(TFMPADRAOCADASTRO1)
    Label27: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    DBTXTNOME_SERV: TDBEdit;
    Label2: TLabel;
    DBTXTVALOR: TDBEdit;
    Label4: TLabel;
    Label25: TLabel;
    DBTXTOBSERVACAO: TDBMemo;
    Label11: TLabel;
    Label12: TLabel;
    LBLSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    DBTXTCODIGO: TDBEdit;
    LBLCOD_PROPRIET: TLabel;
    BIBBUSCA_TERCEIRO: TBitBtn;
    TXTNOME_TERCEIRO: TEdit;
    DBTXTCOD_TERCEIRO: TDBEdit;
    Label10: TLabel;
    QRYSERVICO: TZQuery;
    QRYSERVICOCOD_SERVICO_TERCEIRO: TFloatField;
    QRYSERVICOCOD_EMPRESA: TFloatField;
    QRYSERVICOCOD_TERCEIRO: TFloatField;
    QRYSERVICONOME_SERVICO_TERCEIRO: TWideStringField;
    QRYSERVICOSITUACAO: TWideStringField;
    QRYSERVICOVALOR: TFloatField;
    QRYSERVICOOBSERVACAO: TWideStringField;
    DSSERVICO: TDataSource;
    DBGRIDTABELADBTableView1COD_SERVICO_TERCEIRO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1COD_TERCEIRO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_SERVICO_TERCEIRO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1SITUACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1VALOR: TcxGridDBColumn;
    DBGRIDTABELADBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    QRYSERVICOTEMPO_DURACAO_BASE: TFloatField;
    QRYSERVICONOME_TERCEIRO: TStringField;
    QRYSERVICONOME_TERCEIRO_RESP: TWideStringField;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BIBBUSCA_TERCEIROClick(Sender: TObject);
    procedure DBTXTCOD_TERCEIROExit(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    PROCEDURE CARREGA_GRID;
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure QRYSERVICOCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
    FUNCTION EXISTE_SERV_TERC_MOV :BOOLEAN;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADSERVTERCEIROS1: TFMCADSERVTERCEIROS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMCADSERVTERCEIROS1.BIBBUSCA_TERCEIROClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'RAZAO_SOCIAL', 'COD_TERCEIRO "Codigo", NOME_FANTASIA "Nome Fantasia", RAZAO_SOCIAL "Razão Social"',
        S_FILTRO, 'Razão Social:', 'RAZAO_SOCIAL',
        'TBTERCEIROS', 'S', 'Terceiros', TRUE
     ) THEN
  BEGIN
     QRYSERVICOCOD_TERCEIRO.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_TERCEIROExit(SELF);
  END;
end;

procedure TFMCADSERVTERCEIROS1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
    QRYSERVICO.Prior;
end;

procedure TFMCADSERVTERCEIROS1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYSERVICO.CANCEL;
   DBC_SITUACAOChange(SELF);
   DBTXTNOME_SERV.ReadOnly    := FALSE;
   DBTXTCOD_TERCEIRO.ReadOnly := FALSE;
   BIBBUSCA_TERCEIRO.Enabled  := TRUE;
end;

procedure TFMCADSERVTERCEIROS1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
   HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYSERVICO.EDIT;
   IF EXISTE_SERV_TERC_MOV THEN
   BEGIN
       DBTXTNOME_SERV.ReadOnly    := TRUE;
       DBTXTCOD_TERCEIRO.ReadOnly := TRUE;
       BIBBUSCA_TERCEIRO.Enabled := FALSE;
       DBTXTVALOR.SETFOCUS;
   END
   ELSE
   BEGIN
      DBTXTNOME_SERV.SetFocus;
   END;
end;

procedure TFMCADSERVTERCEIROS1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;
  IF EXISTE_SERV_TERC_MOV THEN
   BEGIN
     APPLICATION.MessageBox('O serviço não pode ser excluído pois já está sendo utilizado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     ABORT;
   END;


  IF QRYSERVICO.IsEmpty THEN
  BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluido!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;

 //QRYSERVICO.Delete;

  QRYSERVICO.Edit;
  QRYSERVICOSITUACAO.AsString := 'E';
  QRYSERVICO.Post;
  QRYSERVICO.FIRST;
  //QRYTERCEIRO.Delete;

  MDPRINCIPAL.COMMIT;
  PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);

  //MDPRINCIPAL.COMMIT;

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADSERVTERCEIROS1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
   HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                      BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                       BTNCANCELAR, BTNEXLCUIR, PNDADOS);

    QRYSERVICO.CLOSE;
    QRYSERVICO.OPEN;
    QRYSERVICO.INSERT;
    QRYSERVICOCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
    QRYSERVICOSITUACAO.AsString := 'A';
    TXTNOME_TERCEIRO.Text := '';
    //QRYSERVICOTEM_SERVI_OS_TERCEIRO.AsString := 'N';
    DBC_SITUACAOChange(SELF);
    //DBC_SERV_TERCEIROSChange(SELF);

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT NVL(MAX(COD_SERVICO_TERCEIRO),0)+1 COD_SERVICO_TERCEIRO FROM TBSERVICOS2');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.Open;


    QRYSERVICOCOD_SERVICO_TERCEIRO.AsInteger := QRYAUX.FieldByName('COD_SERVICO_TERCEIRO').AsInteger;
    DBTXTCOD_TERCEIRO.SETFOCUS;
end;

procedure TFMCADSERVTERCEIROS1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
  QRYSERVICO.Next;
end;

procedure TFMCADSERVTERCEIROS1.BTNSALVARClick(Sender: TObject);
begin
  inherited;

  IF QRYSERVICOSITUACAO.AsString = 'I' then
  BEGIN
    IF EXISTE_SERV_TERC_MOV THEN
     BEGIN
       APPLICATION.MessageBox('O serviço não pode ser inativado pois já está sendo utilizado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       ABORT;
     END;
  END;

   if TRIM(QRYSERVICOCOD_TERCEIRO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o terceiro',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCOD_TERCEIRO.SetFocus;
      ABORT;
   END;

   if TRIM(QRYSERVICONOME_SERVICO_TERCEIRO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o nome do serviço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME_SERV.SetFocus;
      ABORT;
   END;

   if TRIM(QRYSERVICOVALOR.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o valor',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTVALOR.SetFocus;
      ABORT;
   END;

   if TRIM(QRYSERVICOSITUACAO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a situação do serviço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SITUACAO.SetFocus;
      ABORT;
   END;

   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

     QRYSERVICONOME_TERCEIRO_RESP.ASSTRING := TXTNOME_TERCEIRO.TEXT;
     QRYSERVICO.POST;
     MDPRINCIPAL.COMMIT;
     DBTXTNOME_SERV.ReadOnly    := FALSE;
     DBTXTCOD_TERCEIRO.ReadOnly := FALSE;
     BIBBUSCA_TERCEIRO.Enabled  := TRUE;
end;

procedure TFMCADSERVTERCEIROS1.CARREGA_GRID;
begin
   QRYSERVICO.Close;
   QRYSERVICO.SQL.Clear;
   QRYSERVICO.SQL.Add('SELECT A.*');
   QRYSERVICO.SQL.Add('FROM TBSERVICOS2 A');
   QRYSERVICO.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYSERVICO.SQL.Add('      UPPER(A.NOME_SERVICO_TERCEIRO) LIKE :PNOME AND ');
   QRYSERVICO.SQL.Add('      A.SITUACAO <> ''E'' ');
   QRYSERVICO.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYSERVICO.ParamByName('PNOME').AsString := '%'+TXTPESQUISA_PRINCIPAL.Text+'%';
   QRYSERVICO.Open;
end;

procedure TFMCADSERVTERCEIROS1.DBC_SITUACAOChange(Sender: TObject);
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

procedure TFMCADSERVTERCEIROS1.DBGRIDTABELADBTableView1DblClick(
  Sender: TObject);
begin
  inherited;
   DBTXTCOD_TERCEIROExit(SELF);
   DBC_SITUACAOChange(SELF);
end;

procedure TFMCADSERVTERCEIROS1.DBTXTCOD_TERCEIROExit(Sender: TObject);
begin
  inherited;
    if QRYSERVICOCOD_TERCEIRO.AsInteger <> 0 then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT * ');
      QRYAUX.SQL.Add('FROM TBTERCEIROS');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA AND ');
      QRYAUX.SQL.Add('      COD_TERCEIRO = :PCOD_TERCEIRO AND');
      QRYAUX.SQL.Add('      SITUACAO     = ''A''             ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_TERCEIRO').AsInteger := QRYSERVICOCOD_TERCEIRO.AsInteger;
      QRYAUX.Open;

      if QRYAUX.RecordCount = 0 then
      BEGIN
         APPLICATION.MessageBox('Terceiro não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
         DBTXTCOD_TERCEIRO.SetFocus;
         abort;
      END
      ELSE
      BEGIN
         TXTNOME_TERCEIRO.Text := QRYAUX.FieldByName('RAZAO_SOCIAL').AsString;
      END;
    END
    ELSE
    BEGIN
       TXTNOME_TERCEIRO.Text := '';
    END;

end;

function TFMCADSERVTERCEIROS1.EXISTE_SERV_TERC_MOV: BOOLEAN;
begin
   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.Add('SELECT SUM(X.QTDE) "QTDE"');
   QRYAUX.SQL.Add('FROM (SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.Add('       FROM TBITENS_ORCAMENTO_TERCEIRO A, TBHEADER_ORCAMENTO B');
   QRYAUX.SQL.Add('       WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('             A.COD_SERVICO_TERC = :PCOD_SERV_TERC AND');
   QRYAUX.SQL.Add('             B.COD_ORCAMENTO = A.COD_ORCAMENTO AND');
   QRYAUX.SQL.Add('             B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             B.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYAUX.SQL.Add('             B.SITUACAO = ''A''');
   QRYAUX.SQL.Add('       UNION ALL');
   QRYAUX.SQL.Add('       SELECT COUNT(1) QTDE');
   QRYAUX.SQL.Add('       FROM TBITENS_ORCAMENTO A, TBHEADER_ORCAMENTO B');
   QRYAUX.SQL.Add('       WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('             A.COD_SERVICO_TERCEIRO = :PCOD_SERV_TERC AND');
   QRYAUX.SQL.Add('             B.COD_ORCAMENTO = A.COD_ORCAMENTO AND');
   QRYAUX.SQL.Add('             B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             B.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYAUX.SQL.Add('             B.SITUACAO = ''A'') X');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_SERV_TERC').AsInteger := QRYSERVICOCOD_SERVICO_TERCEIRO.AsInteger;
   QRYAUX.OPEN;

   EXISTE_SERV_TERC_MOV := FALSE;
   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     EXISTE_SERV_TERC_MOV := TRUE;
   END;
end;

procedure TFMCADSERVTERCEIROS1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMCADSERVTERCEIROS1.FormShow(Sender: TObject);
begin
  inherited;
   QRYSERVICO.Active := TRUE;
   DBC_SITUACAOChange(SELF);
   DBTXTCOD_TERCEIROExit(SELF);
end;

procedure TFMCADSERVTERCEIROS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('13');
end;

procedure TFMCADSERVTERCEIROS1.PGPRINCIPALChange(Sender: TObject);
begin
  inherited;
  if (QRYSERVICO.State = DSINSERT) OR (QRYSERVICO.State = DSEDIT) then
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
    DBTXTCOD_TERCEIROExit(SELF);
  END;

end;

procedure TFMCADSERVTERCEIROS1.QRYSERVICOCalcFields(DataSet: TDataSet);
begin
  inherited;
    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT RAZAO_SOCIAL ');
    QRYAUX.SQL.Add('FROM TBTERCEIROS');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA AND ');
    QRYAUX.SQL.Add('      COD_TERCEIRO = :PCOD_TERCEIRO AND');
    QRYAUX.SQL.Add('      SITUACAO     = ''A''             ');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.ParamByName('PCOD_TERCEIRO').AsInteger := QRYSERVICOCOD_TERCEIRO.AsInteger;
    QRYAUX.Open;

    QRYSERVICONOME_TERCEIRO.AsString := QRYAUX.FieldByName('RAZAO_SOCIAL').AsString;
end;

procedure TFMCADSERVTERCEIROS1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
   CARREGA_GRID;
end;

end.
