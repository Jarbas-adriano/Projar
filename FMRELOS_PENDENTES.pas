unit FMRELOS_PENDENTES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  frxClass, frxDBSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, Vcl.Buttons;

type
  TFMRELOS_PENDENTES1 = class(TFMPADRAOGERAL1)
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
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
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    QRYOS_PENDENTES: TZQuery;
    QRYOS_PENDENTESCOD_OS: TFloatField;
    QRYOS_PENDENTESDATA_INICIO: TDateTimeField;
    QRYOS_PENDENTESCOD_CLIENTE: TFloatField;
    QRYOS_PENDENTESNOME_NOME_FANTASIA_CLIENTE: TWideStringField;
    QRYOS_PENDENTESVALOR_TOTAL: TFloatField;
    QRYOS_PENDENTESVALOR_DESCONTO: TFloatField;
    QRYOS_PENDENTESUSUARIO_EXE: TWideStringField;
    FRXDBOS_PENDENTES: TfrxDBDataset;
    frxOS_Pendentes: TfrxReport;
    QRYEMPRESACNPJ: TWideStringField;
    Label18: TLabel;
    Label1: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMRELOS_PENDENTES1: TFMRELOS_PENDENTES1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMRELOS_PENDENTES1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   //BTNCONFIRMAR.ENABLED := FALSE;
   QRYPARAMPARAM_D1.ASDATETIME := DATE-30;
   QRYPARAMPARAM_D2.ASDATETIME := DATE;
   DBTXTDATA_INICIAL.SETFOCUS;
end;

procedure TFMRELOS_PENDENTES1.BTNCONFIRMARClick(Sender: TObject);
begin
  inherited;
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

  QRYOS_PENDENTES.Close;
  QRYOS_PENDENTES.SQL.Clear;
  QRYOS_PENDENTES.SQL.Add('SELECT A.COD_OS, A.DATA_INICIO, A.COD_CLIENTE, A.NOME_NOME_FANTASIA_CLIENTE, A.VALOR_TOTAL, A.VALOR_DESCONTO,');
  QRYOS_PENDENTES.SQL.Add('       A.USUARIO_EXE');
  QRYOS_PENDENTES.SQL.Add('FROM TBHEADERORDEM_SERVICO A, TBCLIENTE B');
  QRYOS_PENDENTES.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYOS_PENDENTES.SQL.Add('      A.DATA_INICIO >=  :PDATA_INICIAL AND');
  QRYOS_PENDENTES.SQL.Add('      A.DATA_INICIO <=  :PDATA_FINAL AND');
  QRYOS_PENDENTES.SQL.Add('      A.SITUACAO = ''A'' AND');
  QRYOS_PENDENTES.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
  QRYOS_PENDENTES.SQL.Add('      B.COD_CLIENTE = A.COD_CLIENTE');
  QRYOS_PENDENTES.SQL.Add('ORDER BY A.COD_OS,A.DATA_INICIO ');
  QRYOS_PENDENTES.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYOS_PENDENTES.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.AsDateTime;
  QRYOS_PENDENTES.ParamByName('PDATA_FINAL').ASDATETIME := QRYPARAMPARAM_D2.AsDateTime;
  QRYOS_PENDENTES.Open;

  IF QRYOS_PENDENTES.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('Nenhum registro encontrado.',MTINFORMATION,[MBOK],1);
     ABORT;
  END;

  frxOS_Pendentes.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxOS_Pendentes.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
  frxOS_Pendentes.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
  frxOS_Pendentes.ShowReport();
  close;


end;

procedure TFMRELOS_PENDENTES1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARCLICK(SELF);
end;

procedure TFMRELOS_PENDENTES1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('50');
end;

end.
