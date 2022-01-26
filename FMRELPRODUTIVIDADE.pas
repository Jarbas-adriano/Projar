unit FMRELPRODUTIVIDADE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.Buttons, frxClass, frxDBSet;

type
  TFMRELPRODUTIVIDADE1 = class(TFMPADRAOGERAL1)
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
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
    QRYPRODUTIVIDADE: TZQuery;
    QRYPRODUTIVIDADECOD_USUARIO: TFloatField;
    QRYPRODUTIVIDADENOME: TWideStringField;
    QRYPRODUTIVIDADEQTDE_SERVICO: TFloatField;
    QRYPRODUTIVIDADEQTDE_SERV_GERAL: TFloatField;
    QRYPRODUTIVIDADEPORCENTAGEM: TFloatField;
    FRXDBPRODUTIVIDADE: TfrxDBDataset;
    frxProdutividade: TfrxReport;
    QRYEMPRESACNPJ: TWideStringField;
    Label2: TLabel;
    Label18: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
  FMRELPRODUTIVIDADE1: TFMRELPRODUTIVIDADE1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMRELPRODUTIVIDADE1.BTNCANCELARClick(Sender: TObject);
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

procedure TFMRELPRODUTIVIDADE1.BTNCONFIRMARClick(Sender: TObject);
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

    QRYPRODUTIVIDADE.Close;
    QRYPRODUTIVIDADE.SQL.Clear;
    QRYPRODUTIVIDADE.SQL.Add('SELECT Z.*, TRUNC(((Z.QTDE_SERVICO * 100) / Z.QTDE_SERV_GERAL), 2) PORCENTAGEM');
    QRYPRODUTIVIDADE.SQL.Add('FROM (SELECT X.COD_USUARIO, X.NOME, X.QTDE_SERVICO,');
    QRYPRODUTIVIDADE.SQL.Add('              (SELECT SUM(C.QUANTIDADE_SERVICO) QTDE_SERVICO_GERAL');
    QRYPRODUTIVIDADE.SQL.Add('                FROM TBUSUARIO A, TBHEADERORDEM_SERVICO B, TBHEADERITENS_OS C');
    QRYPRODUTIVIDADE.SQL.Add('                WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
    QRYPRODUTIVIDADE.SQL.Add('                      B.COD_EMPRESA = A.COD_EMPRESA AND');
    QRYPRODUTIVIDADE.SQL.Add('                      B.DATA_INICIO >= :PDATA_INICIAL AND');
    QRYPRODUTIVIDADE.SQL.Add('                      B.DATA_INICIO <= :PDATA_FINAL AND');
    QRYPRODUTIVIDADE.SQL.Add('                      B.COD_USUARIO_RESPONSAVEL = A.COD_USUARIO AND');
    QRYPRODUTIVIDADE.SQL.Add('                      C.COD_OS = B.COD_OS AND');
    QRYPRODUTIVIDADE.SQL.Add('                      C.COD_EMPRESA = B.COD_EMPRESA AND');
    QRYPRODUTIVIDADE.SQL.Add('                      C.COD_CLIENTE = B.COD_CLIENTE) QTDE_SERV_GERAL');
    QRYPRODUTIVIDADE.SQL.Add('       FROM (SELECT A.COD_USUARIO, A.NOME, SUM(C.QUANTIDADE_SERVICO) QTDE_SERVICO');
    QRYPRODUTIVIDADE.SQL.Add('              FROM TBUSUARIO A, TBHEADERORDEM_SERVICO B, TBHEADERITENS_OS C');
    QRYPRODUTIVIDADE.SQL.Add('              WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
    QRYPRODUTIVIDADE.SQL.Add('                    B.COD_EMPRESA = A.COD_EMPRESA AND');
    QRYPRODUTIVIDADE.SQL.Add('                    B.DATA_INICIO >= :PDATA_INICIAL AND');
    QRYPRODUTIVIDADE.SQL.Add('                    B.DATA_INICIO <= :PDATA_FINAL AND');
    QRYPRODUTIVIDADE.SQL.Add('                    B.COD_USUARIO_RESPONSAVEL = A.COD_USUARIO AND');
    QRYPRODUTIVIDADE.SQL.Add('                    C.COD_OS = B.COD_OS AND');
    QRYPRODUTIVIDADE.SQL.Add('                    C.COD_EMPRESA = B.COD_EMPRESA AND');
    QRYPRODUTIVIDADE.SQL.Add('                    C.COD_CLIENTE = B.COD_CLIENTE');
    QRYPRODUTIVIDADE.SQL.Add('              GROUP BY A.COD_USUARIO, A.NOME) X) Z');
    QRYPRODUTIVIDADE.SQL.Add('ORDER BY COD_USUARIO');
    QRYPRODUTIVIDADE.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYPRODUTIVIDADE.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.AsDateTime;
    QRYPRODUTIVIDADE.ParamByName('PDATA_FINAL').ASDATETIME := QRYPARAMPARAM_D2.AsDateTime;
    QRYPRODUTIVIDADE.Open;

    frxProdutividade.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
    frxProdutividade.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
    frxProdutividade.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
    frxProdutividade.ShowReport();
    close;


end;

procedure TFMRELPRODUTIVIDADE1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMRELPRODUTIVIDADE1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('51');
end;

end.
