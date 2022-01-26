unit FMRELORDEM_SERVICO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.Buttons, Vcl.Mask, frxClass,
  frxDBSet;

type
  TFMRELORDEM_SERVICO1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    DSPARAM: TDataSource;
    QRYOS: TZQuery;
    QRYOSDATA_INICIO: TDateTimeField;
    QRYOSDATA_TERMINO: TDateTimeField;
    QRYOSVALOR_TOTAL: TFloatField;
    QRYOSVALOR_DESCONTO: TFloatField;
    QRYOSDESC_SITUACAO: TWideStringField;
    frxOrdem_Servico: TfrxReport;
    FRXOS: TfrxDBDataset;
    QRYOSUSUARIO_EXE: TWideStringField;
    QRYOSCOD_CLIENTE: TFloatField;
    QRYOSNOME_NOME_FANTASIA_CLIENTE: TWideStringField;
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
    QRYOSCOD_OS: TFloatField;
    QRYEMPRESACNPJ: TWideStringField;
    Label18: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMRELORDEM_SERVICO1: TFMRELORDEM_SERVICO1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOCONSULTA;

procedure TFMRELORDEM_SERVICO1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
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
procedure TFMRELORDEM_SERVICO1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;
   BTNCONFIRMAR.Enabled := FALSE;
   QRYPARAMPARAM_D1.AsDateTime := DATE-30;
   QRYPARAMPARAM_D2.AsDateTime := DATE;
   TXTCLIENTE.Text := '';
   DBTXTCOD_CLIENTE.SetFocus;
end;

procedure TFMRELORDEM_SERVICO1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
   IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe um cliente para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_CLIENTE .SETFOCUS;
       ABORT;
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
    MESSAGEDLG('A data inicial não pode ser maior do que a data final',MTINFORMATION,[MBOK],0);
    DBTXTDATA_INICIAL.SETFOCUS;
    ABORT;
  END;

  QRYEMPRESA.CLOSE;
  QRYEMPRESA.SQL.Clear;
  QRYEMPRESA.SQL.Add('SELECT * FROM TBEMPRESA');
  QRYEMPRESA.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
  QRYEMPRESA.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYEMPRESA.Open;

  QRYOS.Close;
  QRYOS.SQL.Clear;
  QRYOS.SQL.Add('SELECT A.DATA_INICIO, A.DATA_TERMINO, A.VALOR_TOTAL, A.VALOR_DESCONTO,');
  QRYOS.SQL.Add('       DECODE(A.SITUACAO, ''A'', ''Em aberto'', ''F'', ''Finalizada'') DESC_SITUACAO, A.USUARIO_EXE, A.COD_CLIENTE,');
  QRYOS.SQL.Add('       A.NOME_NOME_FANTASIA_CLIENTE,A.COD_OS');
  QRYOS.SQL.Add('FROM TBHEADERORDEM_SERVICO A');
  QRYOS.SQL.Add('WHERE A.COD_CLIENTE = :PCOD_CLIENTE AND');
  QRYOS.SQL.Add('      A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYOS.SQL.Add('      A.DATA_INICIO >= :PDATA_INICIAL AND');
  QRYOS.SQL.Add('      A.DATA_INICIO <= :PDATA_FINAL');
  QRYOS.SQL.Add('ORDER BY A.COD_OS, A.DATA_TERMINO, A.VALOR_TOTAL, A.SITUACAO');
  QRYOS.ParamByName('PCOD_CLIENTE').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
  QRYOS.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
  QRYOS.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.AsDateTime;
  QRYOS.ParamByName('PDATA_FINAL').ASDATETIME   := QRYPARAMPARAM_D2.AsDateTime;
  QRYOS.Open;

  frxOrdem_Servico.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxOrdem_Servico.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
  frxOrdem_Servico.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
  frxOrdem_Servico.ShowReport();
  close;
end;

procedure TFMRELORDEM_SERVICO1.DBTXTCOD_CLIENTEExit(Sender: TObject);
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

procedure TFMRELORDEM_SERVICO1.FormShow(Sender: TObject);
begin
  inherited;
  BTNCANCELARClick(SELF);
end;

procedure TFMRELORDEM_SERVICO1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('49');
end;

end.
