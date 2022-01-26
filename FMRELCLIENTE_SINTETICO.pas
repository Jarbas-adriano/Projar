unit FMRELCLIENTE_SINTETICO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Buttons, frxClass, frxDBSet;

type
  TFMRELCLIENTE_SINTETICO1 = class(TFMPADRAOGERAL1)
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    frxCliente_sintetico: TfrxReport;
    RGSELECAO: TRadioGroup;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    DSPARAM: TDataSource;
    FRXDBHEADER_EMPRESA: TfrxDBDataset;
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
    QRYCLIENTES: TZQuery;
    FRXCLIENTES: TfrxDBDataset;
    QRYCLIENTESCOD_EMPRESA: TFloatField;
    QRYCLIENTESCOD_CLIENTE: TFloatField;
    QRYCLIENTESCOD_CIDADE: TFloatField;
    QRYCLIENTESNOME_NOME_FANTASIA: TWideStringField;
    QRYCLIENTESRAZAO_SOCIAL: TWideStringField;
    QRYCLIENTESCPF: TWideStringField;
    QRYCLIENTESCNPJ: TWideStringField;
    QRYCLIENTESTIPO_PESSOA: TWideStringField;
    QRYCLIENTESENDERECO: TWideStringField;
    QRYCLIENTESNUMERO: TFloatField;
    QRYCLIENTESBAIRRO: TWideStringField;
    QRYCLIENTESCOMPLEMENTO: TWideStringField;
    QRYCLIENTESCEP: TWideStringField;
    QRYCLIENTESRAMO_ATIVIDADE: TWideStringField;
    QRYCLIENTESDATA_CADASTRO: TDateTimeField;
    QRYCLIENTESEMAIL: TWideStringField;
    QRYCLIENTESCOD_BANCO: TWideStringField;
    QRYCLIENTESCOD_AGENCIA: TFloatField;
    QRYCLIENTESCOD_CONTA_BANCO: TFloatField;
    QRYCLIENTESOBSERVACAO: TWideStringField;
    QRYCLIENTESREGISTRO_JUNTA: TWideStringField;
    QRYCLIENTESQUANTIDADE_FUNCIONARIOS: TFloatField;
    QRYCLIENTESCAPITAL_REGISTRADO: TFloatField;
    QRYCLIENTESINSCRICAO_ESTADUAL: TWideStringField;
    QRYCLIENTESTELEFONE_CELULAR: TWideStringField;
    QRYCLIENTESTELEFONE_FIXO: TWideStringField;
    QRYCLIENTESDATA_NASCIMENTO: TDateTimeField;
    QRYCLIENTESFACEBOOK: TWideStringField;
    QRYCLIENTESWHATS_APP: TWideStringField;
    QRYCLIENTESCONTATO_PRINCIPAL: TWideStringField;
    QRYCLIENTESSITUACAO: TWideStringField;
    QRYCLIENTESCNPJ_CPF: TWideStringField;
    QRYCLIENTESNOME_RAMO_ATIVIDADE: TWideStringField;
    QRYCLIENTESENDERECO_CONCATENADO: TWideStringField;
    QRYCLIENTESDESC_SITUACAO: TWideStringField;
    QRYEMPRESACNPJ: TWideStringField;
    procedure RGSELECAOClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMRELCLIENTE_SINTETICO1: TFMRELCLIENTE_SINTETICO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMRELCLIENTE_SINTETICO1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_NOME_FANTASIA', 'COD_CLIENTE "Codigo", NOME_NOME_FANTASIA "Nome Cliente", DECODE(TIPO_PESSOA,''F'',''Fisica'',''J'',''Juridica'') "Tipo Pessoa"',
        S_FILTRO, 'Nome do cliente', 'NOME_NOME_FANTASIA',
        'TBCLIENTE', 'S', 'Clientes', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_CLIENTEExit(SELF);
  END;
end;

procedure TFMRELCLIENTE_SINTETICO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;
   RGSELECAO.ItemIndex := 0;
   RGSELECAOClick(SELF);

end;

procedure TFMRELCLIENTE_SINTETICO1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;

  IF RGSELECAO.ITEMINDEX = 1 THEN
  BEGIN
     IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe um cliente para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_CLIENTE.SETFOCUS;
       ABORT;
     END;
  END;

  QRYEMPRESA.CLOSE;
  QRYEMPRESA.SQL.Clear;
  QRYEMPRESA.SQL.Add('SELECT * FROM TBEMPRESA');
  QRYEMPRESA.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
  QRYEMPRESA.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYEMPRESA.Open;

  QRYCLIENTES.Close;
  QRYCLIENTES.SQL.Clear;
  QRYCLIENTES.SQL.Add('SELECT A.*, NVL(A.CPF, A.CNPJ) CNPJ_CPF, B.NOME NOME_RAMO_ATIVIDADE,');
  QRYCLIENTES.SQL.Add('       A.ENDERECO || '','' || A.BAIRRO || '','' || A.NUMERO || '' - '' || C.NOME || '','' || C.UF ENDERECO_CONCATENADO,');
  QRYCLIENTES.SQL.Add('       DECODE(A.SITUACAO, ''A'', ''Ativo'', ''I'', ''Inativo'') DESC_SITUACAO');
  QRYCLIENTES.SQL.Add('FROM TBCLIENTE A, TBRAMOATIVIDADE B, TBCIDADES C');
  QRYCLIENTES.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYCLIENTES.SQL.Add('     (A.COD_CLIENTE = :PCOD_CLIENTE OR :PCOD_CLIENTE = 0) AND');
  QRYCLIENTES.SQL.Add('      A.SITUACAO = ''A''AND');
  QRYCLIENTES.SQL.Add('      B.RAMOATIVIDADE = A.RAMO_ATIVIDADE AND');
  QRYCLIENTES.SQL.Add('      C.COD_IBGE = A.COD_CIDADE');
  QRYCLIENTES.SQL.Add('ORDER BY A.COD_CLIENTE');
  QRYCLIENTES.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYCLIENTES.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
  QRYCLIENTES.Open;

  frxCliente_sintetico.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxCliente_sintetico.PrepareReport();
  frxCliente_sintetico.ShowReport();
  close;
  //frxCliente_sintetico.Free;
end;

procedure TFMRELCLIENTE_SINTETICO1.DBTXTCOD_CLIENTEExit(Sender: TObject);
begin
  inherited;
  IF QRYPARAMPARAM_N1.ASSTRING <> '' then
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_NOME_FANTASIA');
      QRYAUX.SQL.Add('FROM TBCLIENTE');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_CLIENTE  = :PCOD_CLIENTE  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := QRYPARAMPARAM_N1.AsInteger;
      QRYAUX.Open;

      IF QRYAUX.ISEMPTY THEN
      BEGIN
        APPLICATION.MessageBox('Cliente não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_CLIENTE.SETFOCUS;
        ABORT;
      END
      ELSE
      BEGIN
        TXTCLIENTE.TEXT := QRYAUX.FIELDBYNAME('NOME_NOME_FANTASIA').ASSTRING;
        BTNCONFIRMAR.Enabled := TRUE;
        BTNCONFIRMAR.SetFocus;
      END;
    END
    ELSE
       TXTCLIENTE.TEXT := '';
end;

procedure TFMRELCLIENTE_SINTETICO1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMRELCLIENTE_SINTETICO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('44');
end;

procedure TFMRELCLIENTE_SINTETICO1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  if RGSELECAO.ItemIndex = 0 then
  BEGIN
     DBTXTCOD_CLIENTE.ENABLED  := FALSE;
     BIB_BUSCA_CLIENTE.ENABLED := FALSE;
     QRYPARAMPARAM_N1.CLEAR;
     TXTCLIENTE.TEXT := '';
     BTNCONFIRMAR.ENABLED := TRUE;
  END
  ELSE
  BEGIN
     DBTXTCOD_CLIENTE.Enabled  := TRUE;
     BIB_BUSCA_CLIENTE.Enabled := TRUE;
     DBTXTCOD_CLIENTE.SetFocus;
     TXTCLIENTE.TEXT := '';
     BTNCONFIRMAR.Enabled := FALSE;
  END;
end;

end.
