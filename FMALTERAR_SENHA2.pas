unit FMALTERAR_SENHA2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TFMALTERAR_SENHA21 = class(TForm)
    Panel1: TPanel;
    PNL_DADOS: TPanel;
    LBL_SENHA: TLabel;
    TXT_SENHA_ATUAL: TEdit;
    TXT_NOVA_SENHA: TEdit;
    Label1: TLabel;
    TXT_VER_NOVA_SENHA: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    QRYPARAM: TZQuery;
    QRYAUX: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_C1: TWideStringField;
    QRYPARAMPARAM_C2: TWideStringField;
    QRYPARAMPARAM_C3: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SLOGIN :STRING;
  end;

var
  FMALTERAR_SENHA21: TFMALTERAR_SENHA21;

implementation

{$R *.dfm}

uses DMPRINCIPAL;

procedure TFMALTERAR_SENHA21.BTNCANCELARClick(Sender: TObject);
begin
   TXT_SENHA_ATUAL.Text := '';
   TXT_NOVA_SENHA.Text  := '';
   TXT_VER_NOVA_SENHA.Text   := '';
   TXT_SENHA_ATUAL.SetFocus;
end;

procedure TFMALTERAR_SENHA21.BTNCONFIRMARClick(Sender: TObject);
VAR SSENHA :STRING;
begin
   IF TRIM(TXT_SENHA_ATUAL.TEXT)  = '' THEN
   BEGIN
     MessageDlg('Informe a senha atual para prosseguir.',mtInformation,[MBOK],0);
     TXT_SENHA_ATUAL.SETFOCUS;
     ABORT;
   END;

   IF TRIM(TXT_NOVA_SENHA.TEXT)  = '' THEN
   BEGIN
     MessageDlg('Informe a nova senha para prosseguir.',mtInformation,[MBOK],0);
     TXT_NOVA_SENHA.SETFOCUS;
     ABORT;
   END;

   IF TRIM(TXT_VER_NOVA_SENHA.TEXT)  = '' THEN
   BEGIN
     MessageDlg('Informe a verificação da nova senha para prosseguir.',mtInformation,[MBOK],0);
     TXT_VER_NOVA_SENHA.SETFOCUS;
     ABORT;
   END;


   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT SENHA FROM TBUSUARIO');
   QRYAUX.SQL.Add('WHERE LOGIN = :PLOGIN');
   QRYAUX.ParamByName('PLOGIN').AsString := SLOGIN;
   QRYAUX.Open;

   SSENHA := QRYAUX.FieldByName('SENHA').AsString;

   IF TRIM(TXT_SENHA_ATUAL.TEXT) <> SSENHA THEN
   BEGIN
     MessageDlg('A senha atual informada está incorreta.',mtInformation,[MBOK],0);
     TXT_SENHA_ATUAL.SETFOCUS;
     ABORT;
   END;

   IF Length(TRIM(TXT_SENHA_ATUAL.TEXT)) < 6  THEN
   BEGIN
     MessageDlg('A nova senha deve conter no mínimo 6 caracteres.',mtInformation,[MBOK],0);
     TXT_NOVA_SENHA.SETFOCUS;
     ABORT;
   END;

   IF TXT_SENHA_ATUAL.Text = TXT_NOVA_SENHA.Text THEN
   BEGIN
     MessageDlg('A nova senha não pode ser igual a senha atual.',mtInformation,[MBOK],0);
     TXT_NOVA_SENHA.SETFOCUS;
     TXT_VER_NOVA_SENHA.Text := '';
     ABORT;
   END;


   IF TXT_NOVA_SENHA.Text <> TXT_VER_NOVA_SENHA.Text THEN
   BEGIN
     MessageDlg('A verificação da nova senha está diferente da senha informada',mtInformation,[MBOK],0);
     TXT_VER_NOVA_SENHA.SETFOCUS;
     ABORT;
   END;
   TRY
     QRYAUX.CLOSE;
     QRYAUX.SQL.CLEAR;
     QRYAUX.SQL.ADD('UPDATE TBUSUARIO');
     QRYAUX.SQL.ADD('SET SENHA = :PSENHA');
     QRYAUX.SQL.ADD('WHERE LOGIN = :PCOD_USUARIO');
     QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASSTRING := SLOGIN;
     QRYAUX.PARAMBYNAME('PSENHA').ASSTRING       := TXT_NOVA_SENHA.TEXT;
     QRYAUX.EXECSQL;
     MDPRINCIPAL.COMMIT;
     MESSAGEDLG('Senha alterada com sucesso',mtInformation,[MBOK],0);
     BTNCANCELARCLICK(SELF);
     CLOSE;
   EXCEPT
   ON E:EXCEPTION DO
     BEGIN
        MDPRINCIPAL.ROLLBACK;
        MESSAGEDLG('Erro ao alterar senha. Erro: '+CHR(13)+E.Message,mtInformation,[MBOK],0);
        TXT_NOVA_SENHA.SetFocus;
        ABORT;
     END;
   END;
end;

procedure TFMALTERAR_SENHA21.FormShow(Sender: TObject);
begin
  BTNCANCELARClick(SELF);
end;

end.
