unit FMRELCLIENTE_ANALITICO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  frxClass, frxDBSet, Vcl.Buttons, Vcl.Mask, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit;

type
  TFMRELCLIENTE_ANALITICO1 = class(TFMPADRAOGERAL1)
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
    FRXCLIENTES: TfrxDBDataset;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    DSPARAM: TDataSource;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    RGSELECAO: TRadioGroup;
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    QRYCLIENTESCOD_OS: TFloatField;
    QRYCLIENTESSEQUENCIA: TFloatField;
    QRYCLIENTESTOTAL_PARCELA: TFloatField;
    QRYCLIENTESDESC_SITUACAO_PARC: TWideStringField;
    QRYCLIENTES: TZQuery;
    QRYCLIENTESDATA_VENCIMENTO: TDateTimeField;
    QRYCLIENTESDATA_PAGAMENTO: TDateTimeField;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    QRYCLIENTESVALOR_REAL_RECEBIDO: TFloatField;
    frxCliente_analitico1: TfrxReport;
    frxCliente_analitico: TfrxReport;
    QRYEMPRESACNPJ: TWideStringField;
    Label18: TLabel;
    Label1: TLabel;
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure RGSELECAOClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMRELCLIENTE_ANALITICO1: TFMRELCLIENTE_ANALITICO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMRELCLIENTE_ANALITICO1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
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

procedure TFMRELCLIENTE_ANALITICO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;
   RGSELECAO.ItemIndex := 0;
   RGSELECAOClick(SELF);
   QRYPARAMPARAM_D1.ASDATETIME := DATE-30;
   QRYPARAMPARAM_D2.ASDATETIME := DATE;
end;

procedure TFMRELCLIENTE_ANALITICO1.BTNCONFIRMARClick(Sender: TObject);
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

  IF QRYPARAMPARAM_D1.ASSTRING = '' THEN
  BEGIN
     MESSAGEDLG('Informe uma data inicial para prosseguir!',MTINFORMATION,[MBOK],0);
     DBTXTDATA_INICIAL.SETFOCUS;
     ABORT;
  END;

  IF QRYPARAMPARAM_D2.ASSTRING = '' THEN
  BEGIN
     MESSAGEDLG('Informe uma data final para prosseguir!',MTINFORMATION,[MBOK],0);
     DBTXTDATA_FINAL.SETFOCUS;
     ABORT;
  END;

  IF QRYPARAMPARAM_D1.ASDATETIME > QRYPARAMPARAM_D2.ASDATETIME THEN
  BEGIN
    MESSAGEDLG('A data inicial não ser pode maior do que a data final',MTINFORMATION,[MBOK],0);
    DBTXTDATA_INICIAL.SETFOCUS;
    ABORT;
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
  QRYCLIENTES.SQL.Add('       DECODE(A.SITUACAO, ''A'', ''Ativo'', ''I'', ''Inativo'') DESC_SITUACAO,');
  QRYCLIENTES.SQL.Add('       D.COD_OS,D.SEQUENCIA, D.TOTAL_PARCELA,D.DATA_VENCIMENTO,D.DATA_PAGAMENTO,');
  QRYCLIENTES.SQL.Add('        DECODE(D.SITUACAO, ''E'', ''Em aberto'', ''P'', ''Pago'') DESC_SITUACAO_PARC,D.VALOR_REAL_RECEBIDO');
  QRYCLIENTES.SQL.Add('FROM TBCLIENTE A, TBRAMOATIVIDADE B, TBCIDADES C, TBCONTAS_RECEBER D');
  QRYCLIENTES.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYCLIENTES.SQL.Add('     (A.COD_CLIENTE = :PCOD_CLIENTE OR :PCOD_CLIENTE = 0) AND');
  QRYCLIENTES.SQL.Add('      A.SITUACAO = ''A''AND');
  QRYCLIENTES.SQL.Add('      B.RAMOATIVIDADE = A.RAMO_ATIVIDADE AND');
  QRYCLIENTES.SQL.Add('      C.COD_IBGE = A.COD_CIDADE AND');
  QRYCLIENTES.SQL.Add('      D.COD_EMPRESA(+) = A.COD_EMPRESA AND');
  QRYCLIENTES.SQL.Add('      D.COD_CLIENTE(+) = A.COD_CLIENTE AND');
  QRYCLIENTES.SQL.Add('      D.DATA_VENCIMENTO(+) >= :PDATA_INICIAL AND');
  QRYCLIENTES.SQL.Add('      D.DATA_VENCIMENTO(+) <= :PDATA_FINAL');
  QRYCLIENTES.SQL.Add('ORDER BY A.COD_CLIENTE,D.COD_OS,D.SEQUENCIA,D.DATA_VENCIMENTO');
  QRYCLIENTES.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
  QRYCLIENTES.ParamByName('PCOD_CLIENTE').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
  QRYCLIENTES.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.ASDATETIME;
  QRYCLIENTES.ParamByName('PDATA_FINAL').ASDATETIME   := QRYPARAMPARAM_D2.ASDATETIME;
  QRYCLIENTES.Open;


  frxCliente_analitico1.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxCliente_analitico1.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
  frxCliente_analitico1.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
  frxCliente_analitico1.ShowReport();
  close;
end;

procedure TFMRELCLIENTE_ANALITICO1.DBTXTCOD_CLIENTEExit(Sender: TObject);
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

procedure TFMRELCLIENTE_ANALITICO1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    //FMRELCLIENTE_ANALITICO1.Free;
end;

procedure TFMRELCLIENTE_ANALITICO1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMRELCLIENTE_ANALITICO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('45');
end;

procedure TFMRELCLIENTE_ANALITICO1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
 IF RGSELECAO.ITEMINDEX = 0 THEN
  BEGIN
     DBTXTCOD_CLIENTE.ENABLED  := FALSE;
     BIB_BUSCA_CLIENTE.ENABLED := FALSE;
     QRYPARAMPARAM_N1.CLEAR;
     TXTCLIENTE.TEXT := '';
     BTNCONFIRMAR.ENABLED := TRUE;
     DBTXTDATA_INICIAL.SETFOCUS;
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
