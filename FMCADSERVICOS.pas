unit FMCADSERVICOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOCADASTRO, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TFMCADSERVICOS1 = class(TFMPADRAOCADASTRO1)
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
    Label9: TLabel;
    Label10: TLabel;
    LBL_SERV_TERCEIROS: TLabel;
    DBC_SERV_TERCEIROS: TDBComboBox;
    Label11: TLabel;
    Label12: TLabel;
    LBLSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    DBTXTCOD_SERVICO: TDBEdit;
    QRYSERVICO: TZQuery;
    DSSERVICO: TDataSource;
    QRYSERVICOCOD_EMPRESA: TFloatField;
    QRYSERVICOCOD_SERVICO: TFloatField;
    QRYSERVICONOME_SERVICO: TWideStringField;
    QRYSERVICOSITUACAO: TWideStringField;
    QRYSERVICOVALOR: TFloatField;
    QRYSERVICOTEMPO_DURACAO_BASE: TFloatField;
    QRYSERVICOOBSERVACAO: TWideStringField;
    QRYSERVICOTEM_SERVI_OS_TERCEIRO: TWideStringField;
    DBGRIDTABELADBTableView1COD_SERVICO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_SERVICO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1SITUACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1VALOR: TcxGridDBColumn;
    DBGRIDTABELADBTableView1OBSERVACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1TEM_SERVI_OS_TERCEIRO: TcxGridDBColumn;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure DBC_SERV_TERCEIROSChange(Sender: TObject);
    procedure CARREGA_GRID;
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
    FUNCTION  EXISTE_SERV_EM_MOV:BOOLEAN;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADSERVICOS1: TFMCADSERVICOS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMCADSERVICOS1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
    QRYSERVICO.Prior;
end;

procedure TFMCADSERVICOS1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
  //DBTXTCOD_FUNCAOExit(SELF);
  HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

  QRYSERVICO.CANCEL;
  DBC_SITUACAOCHANGE(SELF);
  DBC_SERV_TERCEIROSChange(SELF);
  DBTXTNOME_SERV.READONLY := FALSE;
end;

procedure TFMCADSERVICOS1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
  HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYSERVICO.EDIT;
   IF EXISTE_SERV_EM_MOV THEN
   BEGIN
      DBTXTNOME_SERV.READONLY := TRUE;
      DBTXTVALOR.SETFOCUS;
   END
   ELSE
   BEGIN
      DBTXTNOME_SERV.SETFOCUS;
   END;
end;

procedure TFMCADSERVICOS1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;

   IF EXISTE_SERV_EM_MOV THEN
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
  QRYSERVICO.EDIT;
  QRYSERVICOSITUACAO.ASSTRING := 'E';
  QRYSERVICO.POST;
  QRYSERVICO.FIRST;

  MDPRINCIPAL.COMMIT;

  PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADSERVICOS1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
   //TXTDESC_FUNCAO.Text := '';
   HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                      BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                       BTNCANCELAR, BTNEXLCUIR, PNDADOS);

    QRYSERVICO.CLOSE;
    QRYSERVICO.OPEN;
    QRYSERVICO.INSERT;
    QRYSERVICOCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
    QRYSERVICOSITUACAO.AsString := 'A';
    QRYSERVICOTEM_SERVI_OS_TERCEIRO.AsString := 'N';
    DBC_SITUACAOChange(SELF);
    DBC_SERV_TERCEIROSChange(SELF);

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT NVL(MAX(COD_SERVICO),0)+1 COD_SERVICO FROM TBSERVICOS');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.Open;


    QRYSERVICOCOD_SERVICO.AsInteger := QRYAUX.FieldByName('COD_SERVICO').AsInteger;
    DBTXTNOME_SERV.SETFOCUS;
end;

procedure TFMCADSERVICOS1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
   QRYSERVICO.Next;
end;

procedure TFMCADSERVICOS1.BTNSALVARClick(Sender: TObject);
begin
  inherited;
  IF QRYSERVICOSITUACAO.ASSTRING = 'I' THEN
   BEGIN
     IF EXISTE_SERV_EM_MOV THEN
     BEGIN
       APPLICATION.MessageBox('O serviço não pode ser inativado pois já está sendo utilizado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       ABORT;
     END;
   END;


   if TRIM(QRYSERVICONOME_SERVICO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o nome do serviço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME_SERV.SetFocus;
      ABORT;
   END;
   if TRIM(QRYSERVICOVALOR.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o valor do serviço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTVALOR.SetFocus;
      ABORT;
   END;
   {if TRIM(QRYSERVICOTEMPO_DURACAO_BASE.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o tempo de duração do serviço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTTEMPO_DURACAO.SetFocus;
      ABORT;
   END;}
   if TRIM(QRYSERVICOSITUACAO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a situação do serviço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SITUACAO.SetFocus;
      ABORT;
   END;
   IF TRIM(QRYSERVICOTEM_SERVI_OS_TERCEIRO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar se o serviço possui serviços de terceitos',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SERV_TERCEIROS.SetFocus;
      ABORT;
   END;

   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

     QRYSERVICO.POST;
     MDPRINCIPAL.COMMIT;
     DBTXTNOME_SERV.READONLY := FALSE;
end;

procedure TFMCADSERVICOS1.CARREGA_GRID;
begin
   QRYSERVICO.Close;
   QRYSERVICO.SQL.Clear;
   QRYSERVICO.SQL.Add('SELECT * FROM TBSERVICOS');
   QRYSERVICO.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYSERVICO.SQL.Add('      SITUACAO    <> ''E'' AND ');
   QRYSERVICO.SQL.Add('      UPPER(NOME_SERVICO) LIKE UPPER(:PNOME)');
   QRYSERVICO.SQL.Add('ORDER BY COD_SERVICO');
   QRYSERVICO.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYSERVICO.ParamByName('PNOME').AsString := '%'+TXTPESQUISA_PRINCIPAL.Text+'%';
   QRYSERVICO.Open;
end;

procedure TFMCADSERVICOS1.DBC_SERV_TERCEIROSChange(Sender: TObject);
begin
  inherited;
  if DBC_SERV_TERCEIROS.Text  = 'S' then
   BEGIN
      LBL_SERV_TERCEIROS.Caption := 'Sim'
   END
   ELSE if DBC_SERV_TERCEIROS.Text  = 'N' then
   BEGIN
      LBL_SERV_TERCEIROS.Caption := 'Não'
   END
   ELSE
      LBL_SERV_TERCEIROS.Caption := ''
end;

procedure TFMCADSERVICOS1.DBC_SITUACAOChange(Sender: TObject);
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

procedure TFMCADSERVICOS1.DBGRIDTABELADBTableView1DblClick(Sender: TObject);
begin
  inherited;
   DBC_SITUACAOChange(SELF);
   DBC_SERV_TERCEIROSChange(SELF);
end;

function TFMCADSERVICOS1.EXISTE_SERV_EM_MOV: BOOLEAN;
begin
   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.ADD('SELECT SUM(X.QTDE) "QTDE"');
   QRYAUX.SQL.ADD('FROM (SELECT COUNT(1) QTDE');
   QRYAUX.SQL.ADD('       FROM TBITENS_ORCAMENTO A, TBHEADER_ORCAMENTO B');
   QRYAUX.SQL.ADD('       WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.ADD('             A.COD_SERVICO = :PCOD_SERVICO AND');
   QRYAUX.SQL.ADD('             B.COD_ORCAMENTO = A.COD_ORCAMENTO AND');
   QRYAUX.SQL.ADD('             B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYAUX.SQL.ADD('             B.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYAUX.SQL.ADD('             B.SITUACAO = ''A''');
   QRYAUX.SQL.ADD('       UNION ALL');
   QRYAUX.SQL.ADD('       SELECT COUNT(1) QTDE');
   QRYAUX.SQL.ADD('       FROM TBHEADERITENS_OS A, TBHEADERORDEM_SERVICO O');
   QRYAUX.SQL.ADD('       WHERE A.COD_SERVICO = :PCOD_SERVICO AND');
   QRYAUX.SQL.ADD('             A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.ADD('             O.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYAUX.SQL.ADD('             O.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYAUX.SQL.ADD('             O.COD_OS = A.COD_OS AND');
   QRYAUX.SQL.ADD('             O.SITUACAO = ''A'') X');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_SERVICO').AsInteger := QRYSERVICOCOD_SERVICO.AsInteger;
   QRYAUX.OPEN;

   EXISTE_SERV_EM_MOV := FALSE;
   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     EXISTE_SERV_EM_MOV := TRUE;
   END;

end;

procedure TFMCADSERVICOS1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMCADSERVICOS1.FormShow(Sender: TObject);
begin
  inherited;
   QRYSERVICO.Active := TRUE;
   DBC_SITUACAOChange(SELF);
   DBC_SERV_TERCEIROSChange(SELF);
end;

procedure TFMCADSERVICOS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('8');
end;

procedure TFMCADSERVICOS1.PGPRINCIPALChange(Sender: TObject);
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
    DBC_SITUACAOCHANGE(SELF);
    DBC_SERV_TERCEIROSCHANGE(SELF);
  END;
end;

procedure TFMCADSERVICOS1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
   CARREGA_GRID;
end;

end.
