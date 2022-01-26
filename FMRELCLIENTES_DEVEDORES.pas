unit FMRELCLIENTES_DEVEDORES;

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
  TFMRELCLIENTES_DEVEDORES1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
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
    QRYCLIENTES_DEVEDORES: TZQuery;
    QRYCLIENTES_DEVEDORESCOD_CLIENTE: TFloatField;
    QRYCLIENTES_DEVEDORESNOME_NOME_FANTASIA: TWideStringField;
    QRYCLIENTES_DEVEDORESTOTAL_VENCIDO: TFloatField;
    QRYCLIENTES_DEVEDORESQTDE_PARCELAS_ABERTO: TFloatField;
    QRYCLIENTES_DEVEDORESQTDE_DIAS_PRIM_PARC: TFloatField;
    FRXCLIENTES_DEVEDORES: TfrxDBDataset;
    frxCli_devedores: TfrxReport;
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
  FMRELCLIENTES_DEVEDORES1: TFMRELCLIENTES_DEVEDORES1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMRELCLIENTES_DEVEDORES1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   //BTNCONFIRMAR.ENABLED := FALSE;
   QRYPARAMPARAM_D1.ASDATETIME := DATE-30;
   QRYPARAMPARAM_D2.ASDATETIME := DATE;
   DBTXTDATA_FINAL.Enabled := FALSE;
   DBTXTDATA_INICIAL.SETFOCUS;
end;

procedure TFMRELCLIENTES_DEVEDORES1.BTNCONFIRMARClick(Sender: TObject);
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

  QRYCLIENTES_DEVEDORES.Close;
  QRYCLIENTES_DEVEDORES.SQL.Clear;
  QRYCLIENTES_DEVEDORES.SQL.Add('SELECT B.COD_CLIENTE, B.NOME_NOME_FANTASIA, SUM(A.TOTAL_PARCELA) TOTAL_VENCIDO,');
  QRYCLIENTES_DEVEDORES.SQL.Add('       COUNT(A.SEQUENCIA) QTDE_PARCELAS_ABERTO,');
  QRYCLIENTES_DEVEDORES.SQL.Add('       TRUNC(ABS(MIN(A.DATA_VENCIMENTO) - SYSDATE)) QTDE_DIAS_PRIM_PARC');
  QRYCLIENTES_DEVEDORES.SQL.Add('FROM TBCONTAS_RECEBER A, TBCLIENTE B');
  QRYCLIENTES_DEVEDORES.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
  QRYCLIENTES_DEVEDORES.SQL.Add('      A.SITUACAO = ''E'' AND');
  QRYCLIENTES_DEVEDORES.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
  QRYCLIENTES_DEVEDORES.SQL.Add('      A.DATA_VENCIMENTO < TRUNC(SYSDATE) AND');
  QRYCLIENTES_DEVEDORES.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
  QRYCLIENTES_DEVEDORES.SQL.Add('      B.COD_CLIENTE = A.COD_CLIENTE');
  QRYCLIENTES_DEVEDORES.SQL.Add('GROUP BY B.COD_CLIENTE, B.NOME_NOME_FANTASIA');
  QRYCLIENTES_DEVEDORES.SQL.Add('ORDER BY B.COD_CLIENTE');
  QRYCLIENTES_DEVEDORES.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
  QRYCLIENTES_DEVEDORES.ParamByName('PDATA_INICIAL').AsDateTime := QRYPARAMPARAM_D1.AsDateTime;
  QRYCLIENTES_DEVEDORES.Open;

  IF QRYCLIENTES_DEVEDORES.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('Nenhum registro encontrado.',MTINFORMATION,[MBOK],1);
     ABORT;
  END;

  frxCli_devedores.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
  frxCli_devedores.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
  frxCli_devedores.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
  frxCli_devedores.ShowReport();
  close;
end;

procedure TFMRELCLIENTES_DEVEDORES1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMRELCLIENTES_DEVEDORES1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('47');
end;

end.
