unit FMRELSERVICOS_QUANTIDADE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, Vcl.Buttons, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, frxClass, frxDBSet;

type
  TFMRELSERVICOS_QUANTIDADE1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    QRYSERVICOS: TZQuery;
    QRYSERVICOSPOSICAO: TFloatField;
    QRYSERVICOSCOD_SERVICO: TFloatField;
    QRYSERVICOSNOME_SERVICO: TWideStringField;
    QRYSERVICOSQTDE: TFloatField;
    FRXSERVICOS: TfrxDBDataset;
    frxServicos_quantidade: TfrxReport;
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
    QRYSERVICOSVLR_POR_SERV: TFloatField;
    QRYEMPRESACNPJ: TWideStringField;
    Label3: TLabel;
    Label1: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMRELSERVICOS_QUANTIDADE1: TFMRELSERVICOS_QUANTIDADE1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMRELSERVICOS_QUANTIDADE1.BTNCANCELARClick(Sender: TObject);
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

procedure TFMRELSERVICOS_QUANTIDADE1.BTNCONFIRMARClick(Sender: TObject);
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

  qryservicos.Close;
  QRYSERVICOS.SQL.Clear;
  QRYSERVICOS.SQL.Add('SELECT ROW_NUMBER()OVER (ORDER BY X.QTDE DESC) AS POSICAO, X.*');
  QRYSERVICOS.SQL.Add('FROM (SELECT C.COD_SERVICO, C.NOME_SERVICO, COUNT(B.COD_SERVICO) QTDE,');
  QRYSERVICOS.SQL.Add('              SUM(B.VALOR_SERV_INDIVIDUAL * QUANTIDADE_SERVICO) VLR_POR_SERV');
  QRYSERVICOS.SQL.Add('       FROM TBHEADERORDEM_SERVICO A, TBHEADERITENS_OS B, TBSERVICOS C');
  QRYSERVICOS.SQL.Add('       WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYSERVICOS.SQL.Add('             A.DATA_INICIO >= :PDATA_INICIAL AND');
  QRYSERVICOS.SQL.Add('             A.DATA_INICIO <= :PDATA_FINAL AND');
  QRYSERVICOS.SQL.Add('             B.COD_OS = A.COD_OS AND');
  QRYSERVICOS.SQL.Add('             B.COD_EMPRESA = A.COD_EMPRESA AND');
  QRYSERVICOS.SQL.Add('             B.COD_CLIENTE = A.COD_CLIENTE AND');
  QRYSERVICOS.SQL.Add('             C.COD_EMPRESA = B.COD_EMPRESA AND');
  QRYSERVICOS.SQL.Add('             C.COD_SERVICO = B.COD_SERVICO');
  QRYSERVICOS.SQL.Add('       GROUP BY C.COD_SERVICO, C.NOME_SERVICO) X');
  QRYSERVICOS.SQL.Add('ORDER BY POSICAO ASC, QTDE DESC');
  QRYSERVICOS.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
  QRYSERVICOS.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.AsDateTime;
  QRYSERVICOS.ParamByName('PDATA_FINAL').AsDateTime := QRYPARAMPARAM_D2.AsDateTime;;
  QRYSERVICOS.Open;

  frxServicos_quantidade.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxServicos_quantidade.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
  frxServicos_quantidade.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
  frxServicos_quantidade.ShowReport();
  close;
end;

procedure TFMRELSERVICOS_QUANTIDADE1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMRELSERVICOS_QUANTIDADE1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('52');
end;

end.
