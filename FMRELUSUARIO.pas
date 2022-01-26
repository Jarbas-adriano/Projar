unit FMRELUSUARIO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Mask, frxClass, frxDBSet, frxExportPDF;

type
  TFMRELUSUARIO1 = class(TFMPADRAOGERAL1)
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    RGSELECAO: TRadioGroup;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_USUARIO: TDBEdit;
    BIB_BUSCA_USUARIO: TBitBtn;
    TXTUSUARIO: TEdit;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    DSPARAM: TDataSource;
    QRYEMPRESA: TZQuery;
    QRYEMPRESACOD_EMPRESA: TFloatField;
    QRYEMPRESARAZAO_SOCIAL: TWideStringField;
    QRYEMPRESANOME_FANTASIA: TWideStringField;
    QRYEMPRESAENDERECO: TWideStringField;
    QRYEMPRESACIDADE: TWideStringField;
    QRYEMPRESABAIRRO: TWideStringField;
    QRYEMPRESANUMERO: TFloatField;
    QRYEMPRESARAMO_ATIVIDADE: TWideStringField;
    QRYEMPRESANOME_RESPONSAVEL: TWideStringField;
    QRYEMPRESAOBSERVACAO: TWideStringField;
    QRYEMPRESADATA_CADASTRO: TDateTimeField;
    QRYEMPRESAIMG_LOGO: TBlobField;
    QRYEMPRESAUF: TWideStringField;
    QRYEMPRESATELEFONE: TWideStringField;
    FRXDBHEADER_EMPRESA: TfrxDBDataset;
    frxUsuario: TfrxReport;
    QRYUSUARIO: TZQuery;
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
    QRYUSUARIOCOD_USUARIO: TFloatField;
    QRYUSUARIOLOGIN: TWideStringField;
    QRYUSUARIODESC_TP_USUARIO: TWideStringField;
    FRXDBUSUARIO: TfrxDBDataset;
    QRYUSUARIOCPF_CONCAT: TWideStringField;
    QRYEMPRESACNPJ: TWideStringField;
    frxPDFExport1: TfrxPDFExport;
    procedure RGSELECAOClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBTXTCOD_USUARIOExit(Sender: TObject);
    procedure BIB_BUSCA_USUARIOClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMRELUSUARIO1: TFMRELUSUARIO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMRELUSUARIO1.BIB_BUSCA_USUARIOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME', 'COD_USUARIO "Codigo", NOME "Nome Usuário"',
        S_FILTRO, 'Nome do usuário', 'NOME',
        'TBUSUARIO', 'S', 'Usuários', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_USUARIOExit(SELF);
  END;
end;

procedure TFMRELUSUARIO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;
   RGSELECAO.ItemIndex := 0;
   RGSELECAOClick(SELF);
end;

procedure TFMRELUSUARIO1.BTNCONFIRMARClick(Sender: TObject);
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

  QRYEMPRESA.CLOSE;
  QRYEMPRESA.SQL.Clear;
  QRYEMPRESA.SQL.Add('SELECT * FROM TBEMPRESA');
  QRYEMPRESA.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
  QRYEMPRESA.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYEMPRESA.Open;

  QRYUSUARIO.Close;
  QRYUSUARIO.SQL.Clear;
  QRYUSUARIO.SQL.Add('SELECT A.*, DECODE(A.TIPO_USUARIO, ''G'', ''Gerência'', ''D'', ''Diretoria'', ''N'', ''Normal'') DESC_TP_USUARIO,');
  QRYUSUARIO.SQL.Add('       FUNADICIONACARACTERCPF(A.CPF) CPF_CONCAT ');
  QRYUSUARIO.SQL.Add('FROM TBUSUARIO A');
  QRYUSUARIO.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYUSUARIO.SQL.Add('     (A.COD_USUARIO = :PCOD_USUARIO OR :PCOD_USUARIO = 0) AND');
  QRYUSUARIO.SQL.Add('      A.SITUACAO = ''A''');
  QRYUSUARIO.SQL.Add('ORDER BY A.COD_USUARIO');
  QRYUSUARIO.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYUSUARIO.ParamByName('PCOD_USUARIO').AsInteger := QRYPARAMPARAM_N1.AsInteger;
  QRYUSUARIO.Open;

  frxUsuario.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxUsuario.ShowReport();
  close;
end;

procedure TFMRELUSUARIO1.DBTXTCOD_USUARIOExit(Sender: TObject);
begin
  inherited;
  IF QRYPARAMPARAM_N1.ASSTRING <> '' then
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

      IF QRYAUX.ISEMPTY THEN
      BEGIN
        APPLICATION.MessageBox('Usuário não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_USUARIO.SETFOCUS;
        ABORT;
      END
      ELSE
      BEGIN
        TXTUSUARIO.TEXT := QRYAUX.FIELDBYNAME('NOME').ASSTRING;
        BTNCONFIRMAR.Enabled := TRUE;
        BTNCONFIRMAR.SetFocus;
      END;
    END
    ELSE
    BEGIN
      TXTUSUARIO.TEXT := '';
    END;
End;

procedure TFMRELUSUARIO1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARCLICK(SELF);
end;

procedure TFMRELUSUARIO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('53');
end;

procedure TFMRELUSUARIO1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_USUARIO.ENABLED  := FALSE;
     BIB_BUSCA_USUARIO.ENABLED := FALSE;
     QRYPARAMPARAM_N1.CLEAR;
     TXTUSUARIO.TEXT := '';
     BTNCONFIRMAR.ENABLED := TRUE;
  END
  ELSE
  BEGIN
     DBTXTCOD_USUARIO.Enabled  := TRUE;
     BIB_BUSCA_USUARIO.Enabled := TRUE;
     DBTXTCOD_USUARIO.SetFocus;
     BTNCONFIRMAR.Enabled := FALSE;
  END;
end;

end.
