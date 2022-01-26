unit FMCADUSUARIO;

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
  TFMCADUSUARIO1 = class(TFMPADRAOCADASTRO1)
    QRYUSUARIO: TZQuery;
    DSUSUARIO: TDataSource;
    Label4: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    DBTXTNOME: TDBEdit;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTSENHA: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBTXTEMAIL: TDBEdit;
    Label9: TLabel;
    LBL_TIPO_USUARIO: TLabel;
    CB_TIPO_USUARIO: TDBComboBox;
    Label8: TLabel;
    DBTXTOBSERVACAO: TDBMemo;
    LBLCOD_PROPRIET: TLabel;
    BIB_BUSCA_FUNCAO: TBitBtn;
    TXTDESC_FUNCAO: TEdit;
    QRYUSUARIOCPF: TWideStringField;
    QRYUSUARIONOME: TWideStringField;
    QRYUSUARIOTIPO_USUARIO: TWideStringField;
    QRYUSUARIOSENHA: TWideStringField;
    QRYUSUARIOEMAIL: TWideStringField;
    QRYUSUARIODATA_CADASTRO: TDateTimeField;
    QRYUSUARIOSITUACAO: TWideStringField;
    QRYUSUARIOOBSERVACAO: TWideStringField;
    QRYUSUARIOCOD_FUNCAO: TFloatField;
    QRYUSUARIOCOD_EMPRESA: TFloatField;
    DBTXTCOD_FUNCAO: TDBEdit;
    DBTXTCPF: TDBEdit;
    DBGRIDTABELADBTableView1CPF: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME: TcxGridDBColumn;
    DBGRIDTABELADBTableView1TIPO_USUARIO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1EMAIL: TcxGridDBColumn;
    lbllogin: TLabel;
    Label12: TLabel;
    DBTXTLOGIN: TDBEdit;
    QRYUSUARIOLOGIN: TWideStringField;
    QRYUSUARIOCOD_USUARIO: TFloatField;
    QRYUSUARIOPODE_EXCLUIR: TWideStringField;
    procedure FormShow(Sender: TObject);
    PROCEDURE CARREGA_GRID;
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure BTNANTERIORClick(Sender: TObject);
    procedure CB_TIPO_USUARIOChange(Sender: TObject);
    procedure DBGRIDTABELADblClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure QRYUSUARIOAfterInsert(DataSet: TDataSet);
    procedure BIB_BUSCA_FUNCAOClick(Sender: TObject);
    procedure DBTXTCOD_FUNCAOExit(Sender: TObject);
    procedure DBTXTCPFExit(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    procedure DBTXTEMAILExit(Sender: TObject);
    procedure QRYUSUARIOBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    PROCEDURE VERIFICA_LOGIN;
    procedure DBTXTLOGINExit(Sender: TObject);
    procedure DBTXTSENHAExit(Sender: TObject);
    PROCEDURE VERIFICAR_DUPLICIDADE_CPF;
    procedure MNUAJUDAClick(Sender: TObject);
    function EXISTE_USUARIO_MOV :BOOLEAN;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADUSUARIO1: TFMCADUSUARIO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMCADUSUARIO1.BIB_BUSCA_FUNCAOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
    S_FILTRO := 'COD_EMPRESA = '+IntToStr(EMPRESA_ATUAL);

     // FMPADRAOCONSULTA1.QRY.CLOSE;
      IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
            'NOME', 'COD_FUNCAO "Codigo", NOME "Nome"',
            S_FILTRO, 'Nome', 'COD_FUNCAO',
            'TBFUNCAO', 'S', 'Funções', TRUE
         ) THEN
      BEGIN
         DBTXTCOD_FUNCAO.Text := INTTOSTR(FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER);
         DBTXTCOD_FUNCAOExit(SELF);
         SELECTNEXT(BIB_BUSCA_funcao, TRUE, TRUE);
      END;
end;

procedure TFMCADUSUARIO1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
 //  QRYUSUARIO.Fields.Add();
  QRYUSUARIO.Prior;
end;

procedure TFMCADUSUARIO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
  DBTXTCOD_FUNCAOExit(SELF);
  HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

  QRYUSUARIO.CANCEL;
  CB_TIPO_USUARIOChange(SELF);
  DBTXTCPF.READONLY   := FALSE;
end;

procedure TFMCADUSUARIO1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
  IF TIPO_USUARIO = 'NORMAL' then
  BEGIN
    APPLICATION.MessageBox('Usuários do tipo <NORMAL> não podem efetuar edições no cadastro de usuários',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;


  HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);
  DBTXTCPF.READONLY   := TRUE;


  { IF TIPO_USUARIO = 'NORMAL' then
   BEGIN
     DBTXTSENHA.READONLY := TRUE;
     DBTXTCPF.ReadOnly   := TRUE;
     DBTXTNOME.ReadOnly  := TRUE;
     DBTXTLOGIN.ReadOnly := TRUE;
     DBTXTEMAIL.ReadOnly := TRUE;
     CB_TIPO_USUARIO.ReadOnly := TRUE;
     DBTXTCOD_FUNCAO.ReadOnly := TRUE;
     BIB_BUSCA_FUNCAO.Enabled := FALSE;
   END
   ELSE
   BEGIN
     DBTXTSENHA.READONLY := FALSE;
     DBTXTCPF.ReadOnly   := FALSE;
     DBTXTNOME.ReadOnly  := FALSE;
     DBTXTLOGIN.ReadOnly := FALSE;
     DBTXTEMAIL.ReadOnly := FALSE;
     CB_TIPO_USUARIO.ReadOnly := FALSE;
     DBTXTCOD_FUNCAO.ReadOnly := FALSE;
     BIB_BUSCA_FUNCAO.Enabled := TRUE;
   END; }
   QRYUSUARIO.EDIT;
   DBTXTCPF.SetFocus;
end;

procedure TFMCADUSUARIO1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;
 IF TIPO_USUARIO = 'NORMAL' then
  BEGIN
    APPLICATION.MessageBox('Usuários do tipo <NORMAL> não podem efetuar exclusões no cadastro de usuários',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

   IF EXISTE_USUARIO_MOV THEN
   BEGIN
     APPLICATION.MessageBox('O usuário não pode ser excluído pois já possui movimentações ativa ligadas a ele.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     ABORT;
   END;


 IF QRYUSUARIO.IsEmpty THEN
  BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluído!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF QRYUSUARIOPODE_EXCLUIR.ASSTRING = 'N' THEN
  BEGIN
    APPLICATION.MessageBox('O registro é um superusuário e não pode ser excluído',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF ((QRYUSUARIOCOD_EMPRESA.AsInteger = EMPRESA_ATUAL) and (QRYUSUARIOCOD_USUARIO.AsInteger = ICOD_USUARIO_ATUAL)) then
  BEGIN
    APPLICATION.MessageBox('Você não pode excluir o usuário em que você está logado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;

  QRYUSUARIO.Edit;
  QRYUSUARIOSITUACAO.AsString := 'E';
  QRYUSUARIO.Post;
  QRYUSUARIO.Next;
 //QRYUSUARIO.Delete;

  MDPRINCIPAL.COMMIT;

  PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADUSUARIO1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
  IF TIPO_USUARIO = 'NORMAL' then
  BEGIN
    APPLICATION.MessageBox('Usuários do tipo <NORMAL> não podem efetuar inserções no cadastro de usuários',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

 TXTDESC_FUNCAO.Text := '';
 HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                    BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                     BTNCANCELAR, BTNEXLCUIR, PNDADOS);

  QRYUSUARIO.CLOSE;
  QRYUSUARIO.OPEN;
  QRYUSUARIO.INSERT;
  QRYUSUARIOCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
  QRYUSUARIODATA_CADASTRO.AsDateTime := DATE;
  QRYUSUARIOSITUACAO.ASSTRING     := 'A';
  CB_TIPO_USUARIOChange(SELF);
  DBTXTCPF.SETFOCUS;
end;

procedure TFMCADUSUARIO1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
   QRYUSUARIO.Next;
end;

procedure TFMCADUSUARIO1.BTNSALVARClick(Sender: TObject);
begin
  inherited;
{  QRYAUX.Close;
  QRYAUX.SQL.Clear;
  QRYAUX.SQL.Add('SELECT FUNADICIONACARACTERCPF(:PCPF) "CPF" FROM DUAL');
  QRYAUX.ParamByName('PCPF').AsString := DBTXTCPF.Text; 
  QRYAUX.Open;

  QRYUSUARIOCPF.AsString := QRYAUX.FieldByName('CPF').AsString;  }
  
  if TRIM(QRYUSUARIOCPF.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o CPF',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCPF.SetFocus;
      ABORT;
   END;
   if TRIM(QRYUSUARIONOME.AsString) = '' then
   BEGIN 
      APPLICATION.MessageBox('É obrigatório informar o Nome do Usuário',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME.SetFocus;
      ABORT;
   END;


   if TRIM(QRYUSUARIOLOGIN.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o login do usuário',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTLOGIN.SetFocus;
      ABORT;
   END;

   if TRIM(QRYUSUARIOSENHA.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a senha do usuário',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTSENHA.SetFocus;
      ABORT;
   END;

   IF LENGTH(TRIM(QRYUSUARIOSENHA.ASSTRING)) < 6  THEN
   BEGIN
      APPLICATION.MessageBox('A senha do usuário deve conter mais do que 6 caracteres.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTSENHA.SetFocus;
      ABORT;
   END;

   VERIFICA_LOGIN;
   VERIFICAR_DUPLICIDADE_CPF;

   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

     QRYUSUARIO.POST;
     MDPRINCIPAL.COMMIT;
     DBTXTCPF.READONLY   := FALSE;
end;

procedure TFMCADUSUARIO1.CARREGA_GRID;
begin
   QRYUSUARIO.Close;
   QRYUSUARIO.SQL.Clear;
   QRYUSUARIO.SQL.Add('SELECT * FROM TBUSUARIO ');
   QRYUSUARIO.SQL.Add('WHERE COD_EMPRESA = :PEMP AND ');
   QRYUSUARIO.SQL.Add('      SITUACAO <> ''E''  ');
   if TXTPESQUISA_PRINCIPAL.Text <> '' then
   BEGIN
     QRYUSUARIO.SQL.Add('AND UPPER(NOME) LIKE ''%'+TXTPESQUISA_PRINCIPAL.Text+'%'' ');
    // QRYUSUARIO.ParamByName('PNOME').ASSTRING := TXTPESQUISA_PRINCIPAL.Text;
   END;
   QRYUSUARIO.ParamByName('PEMP').AsInteger := EMPRESA_ATUAL;
   QRYUSUARIO.Open;
end;

procedure TFMCADUSUARIO1.CB_TIPO_USUARIOChange(Sender: TObject);
begin
  inherited;
  if CB_TIPO_USUARIO.Text = 'G' then
  BEGIN
     LBL_TIPO_USUARIO.Caption := 'Gerência';
  END
  ELSE if CB_TIPO_USUARIO.Text = 'D' then
  BEGIN
      LBL_TIPO_USUARIO.Caption := 'Diretoria';
  END
  ELSE if CB_TIPO_USUARIO.Text = 'N' then
  BEGIN
      LBL_TIPO_USUARIO.Caption := 'Normal' ;
  END
  ELSE if CB_TIPO_USUARIO.Text = '' then
  BEGIN
    LBL_TIPO_USUARIO.Caption := ''
  END;


end;

procedure TFMCADUSUARIO1.DBGRIDTABELADblClick(Sender: TObject);
begin
  inherited;
  DBTXTCPF.Text := QRYUSUARIOCPF.AsString;
  CB_TIPO_USUARIOChange(SELF);
  DBTXTCOD_FUNCAOExit(self);
  PGPRINCIPAL.ActivePage := TSCADASTRO;
end;

procedure TFMCADUSUARIO1.DBGRIDTABELADBTableView1DblClick(Sender: TObject);
begin
  inherited;
  PGPRINCIPALChange(SELF);
end;

procedure TFMCADUSUARIO1.DBTXTCOD_FUNCAOExit(Sender: TObject);
begin
  inherited;
   if DBTXTCOD_FUNCAO.Text <> '' then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT NOME');
     QRYAUX.SQL.Add('FROM TBFUNCAO');
     QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PEMP AND ');
     QRYAUX.SQL.Add('      COD_FUNCAO  = :PCOD_FUNCAO');
     QRYAUX.ParamByName('PEMP').AsInteger := EMPRESA_ATUAL;
     QRYAUX.ParamByName('PCOD_FUNCAO').AsInteger := STRTOINT(DBTXTCOD_FUNCAO.Text);
     QRYAUX.Open;
     if QRYAUX.IsEmpty then
     BEGIN
       APPLICATION.MessageBox('Função não encontrada',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       DBTXTCOD_FUNCAO.SetFocus;
       TXTDESC_FUNCAO.Text := '';
       abort;
     END
     ELSE
     BEGIN
       TXTDESC_FUNCAO.Text := QRYAUX.FieldByName('NOME').AsString;
     END;
   END
   ELSE
      TXTDESC_FUNCAO.Text := '';
end;

procedure TFMCADUSUARIO1.DBTXTCPFExit(Sender: TObject);
VAR S_CPF :STRING;
    S_CPF_VALIDACAO :STRING;

begin
  inherited;
  IF QRYUSUARIOCPF.ASSTRING <> '' THEN
  BEGIN
    S_CPF := STRINGREPLACE(STRINGREPLACE(QRYUSUARIOCPF.ASSTRING, '-', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]);
    // AQUI VOU VALIDAR O CPF QUE SE FOR 000000 ELE VAI DEIXAR INSERIR
    S_CPF_VALIDACAO := S_CPF;
    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT RPAD(:PCPF,11,0) "CPF" FROM DUAL');
    QRYAUX.ParamByName('PCPF').AsString := S_CPF_VALIDACAO;
    QRYAUX.Open;
    S_CPF_VALIDACAO := QRYAUX.FIELDBYNAME('CPF').AsString;
    IF S_CPF_VALIDACAO <> '00000000000' then
    BEGIN
    //------------------------------
      IF NOT VALIDAR_CPF(S_CPF) then
      BEGIN
        APPLICATION.MessageBox('CPF inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCPF.SETFOCUS;
        ABORT;
      END;
    END;
  END;
  VERIFICAR_DUPLICIDADE_CPF;

end;

procedure TFMCADUSUARIO1.DBTXTEMAILExit(Sender: TObject);
begin
  inherited;
  IF QRYUSUARIOEMAIL.ASSTRING <> '' THEN
  BEGIN
    IF NOT VALIDAR_EMAIL(QRYUSUARIOEMAIL.ASSTRING) THEN
    BEGIN
      APPLICATION.MessageBox('Email inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTEMAIL.SETFOCUS;
      ABORT;
    END;
  END;
end;

procedure TFMCADUSUARIO1.DBTXTLOGINExit(Sender: TObject);
begin
  inherited;
   VERIFICA_LOGIN;
end;

procedure TFMCADUSUARIO1.DBTXTSENHAExit(Sender: TObject);
begin
  inherited;
   IF QRYUSUARIOSENHA.ASSTRING <> '' THEN
   BEGIN
     IF LENGTH(TRIM(QRYUSUARIOSENHA.ASSTRING)) < 6  THEN
     BEGIN
        APPLICATION.MessageBox('A senha do usuário deve conter mais do que 6 caracteres.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTSENHA.SetFocus;
        ABORT;
     END;
   END;

end;

function TFMCADUSUARIO1.EXISTE_USUARIO_MOV: BOOLEAN;
begin
    QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.Add('SELECT SUM(X.QTDE) "QTDE"');
   QRYAUX.SQL.Add('FROM (SELECT COUNT(1) QTDE');
   QRYAUX.SQL.Add('       FROM TBHEADER_ORCAMENTO A');
   QRYAUX.SQL.Add('       WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('             A.COD_USUARIO_RESPONSAVEL = :PCOD_USUARIO AND');
   QRYAUX.SQL.Add('             A.SITUACAO = ''A''');
   QRYAUX.SQL.Add('       UNION ALL');
   QRYAUX.SQL.Add('       SELECT COUNT(1) QTDE');
   QRYAUX.SQL.Add('       FROM TBHEADERORDEM_SERVICO A');
   QRYAUX.SQL.Add('       WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('             A.COD_USUARIO_RESPONSAVEL = :PCOD_USUARIO AND');
   QRYAUX.SQL.Add('             A.SITUACAO = ''A'') X');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_USUARIO').AsInteger := QRYUSUARIOCOD_USUARIO.AsInteger;
   QRYAUX.OPEN;

   EXISTE_USUARIO_MOV := FALSE;
   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     EXISTE_USUARIO_MOV := TRUE;
   END;

end;

procedure TFMCADUSUARIO1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMCADUSUARIO1.FormShow(Sender: TObject);
begin
  inherited;
  DSPADRAO.DataSet := QRYUSUARIO;
//  DBTXTCPF.Field.EditMask := '000-000-000-00;1;_';
  PGPRINCIPALChange(SELF);
  MONTACAMPOSQUERY(QRYUSUARIO);
end;

procedure TFMCADUSUARIO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('7');
end;

procedure TFMCADUSUARIO1.PGPRINCIPALChange(Sender: TObject);
begin
  inherited;
  if (QRYUSUARIO.State = DSINSERT) OR (QRYUSUARIO.State = DSEDIT) then
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
    CB_TIPO_USUARIOChange(SELF);
    DBTXTCOD_FUNCAOExit(SELF);
  END;

end;

procedure TFMCADUSUARIO1.QRYUSUARIOAfterInsert(DataSet: TDataSet);
begin
  inherited;
  QRYUSUARIOTIPO_USUARIO.Value := 'N';
end;

procedure TFMCADUSUARIO1.QRYUSUARIOBeforePost(DataSet: TDataSet);
begin
  inherited;
     QRYAUX.CLOSE;
     QRYAUX.SQL.CLEAR;
     QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE"');
     QRYAUX.SQL.ADD('FROM TBUSUARIO A');
     QRYAUX.SQL.ADD('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
     QRYAUX.SQL.ADD('      COD_USUARIO = :PCOD_USUARIO ');
     QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
     QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER  := QRYUSUARIOCOD_USUARIO.ASINTEGER;
     QRYAUX.OPEN;

     IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER = 0 THEN
     BEGIN
        QRYAUX.CLOSE;
        QRYAUX.SQL.CLEAR;
        QRYAUX.SQL.ADD('SELECT NVL(MAX(A.COD_USUARIO), 0) + 1 "COD_USUARIO"');
        QRYAUX.SQL.ADD('FROM TBUSUARIO A');
        QRYAUX.SQL.ADD('WHERE COD_EMPRESA = :PCOD_EMPRESA');
        QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
        QRYAUX.OPEN;

        QRYUSUARIOCOD_USUARIO.ASINTEGER := QRYAUX.FIELDBYNAME('COD_USUARIO').ASINTEGER;
     END;
end;

procedure TFMCADUSUARIO1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
   CARREGA_GRID;
end;

procedure TFMCADUSUARIO1.VERIFICAR_DUPLICIDADE_CPF;
begin
 // VERIFICAR SE JA NÃO CPF CADASTRADO
   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE" FROM TBUSUARIO A');
   QRYAUX.SQL.ADD('WHERE A.CPF = FUNRETIRACARACTERCPF(:PCPF) AND ');
   QRYAUX.SQL.ADD('      A.SITUACAO    <> ''E'' AND ');
   QRYAUX.SQL.ADD('      A.COD_USUARIO <> :PCOD_USUARIO AND');
   QRYAUX.SQL.ADD('      A.CPF <> ''00000000000''');
   QRYAUX.PARAMBYNAME('PCPF').ASSTRING        := QRYUSUARIOCPF.ASSTRING;
   QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := QRYUSUARIOCOD_USUARIO.ASINTEGER;
   QRYAUX.OPEN;

   IF QRYAUX.FieldByName('QTDE').AsInteger > 0 then
   BEGIN
     MESSAGEDLG('CPF já existente, por favor cadastre outro para prosseguir!',MTINFORMATION,[MBOK],1);
     DBTXTCPF.SETFOCUS;
     ABORT;
   END;
end;

procedure TFMCADUSUARIO1.VERIFICA_LOGIN;
begin
  // VERIFICO AQUI SÓ OS USUÁRIO QUE SÃO DIFERENTE DO USUÁRIO DE ALTERAÇÃO
   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE" FROM TBUSUARIO A');
   QRYAUX.SQL.ADD('WHERE UPPER(A.LOGIN) = UPPER(:PLOGIN) AND ');
   QRYAUX.SQL.ADD('      A.SITUACAO    <> ''E'' AND ');
   QRYAUX.SQL.ADD('      A.COD_USUARIO <> :PCOD_USUARIO');
   QRYAUX.PARAMBYNAME('PLOGIN').ASSTRING        := QRYUSUARIOLOGIN.ASSTRING;
   QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := QRYUSUARIOCOD_USUARIO.ASINTEGER;
   QRYAUX.OPEN;

   IF QRYAUX.FieldByName('QTDE').AsInteger > 0 then
   BEGIN
     MESSAGEDLG('Login já existente, por favor cadastre outro para prosseguir!',MTINFORMATION,[MBOK],1);
     DBTXTLOGIN.SETFOCUS;
     ABORT;
   END;

end;

end.
