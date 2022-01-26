unit FMRELCONTAS_DESPESAS;

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
  TFMRELCONTAS_DESPESAS1 = class(TFMPADRAOGERAL1)
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
    DSPARAM: TDataSource;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTDATA_INICIAL: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    QRYDESPESAS: TZQuery;
    QRYDESPESASCOD_DESPESA: TFloatField;
    QRYDESPESASNOME_DESPESA: TWideStringField;
    QRYDESPESASVALOR_DESPESA: TFloatField;
    QRYDESPESASNUM_PARCELA: TFloatField;
    QRYDESPESASDATA_VENCIMENTO: TDateTimeField;
    QRYDESPESASDATA_PAGAMENTO: TDateTimeField;
    QRYDESPESASDESC_SITUCAO: TWideStringField;
    DSDESPESAS: TDataSource;
    FRXDBDESPESAS: TfrxDBDataset;
    frxContas_despesas: TfrxReport;
    QRYDESPESASVALOR_REAL_PAGO: TFloatField;
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
  FMRELCONTAS_DESPESAS1: TFMRELCONTAS_DESPESAS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMRELCONTAS_DESPESAS1.BTNCANCELARClick(Sender: TObject);
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

procedure TFMRELCONTAS_DESPESAS1.BTNCONFIRMARClick(Sender: TObject);
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

    QRYDESPESAS.Close;
    QRYDESPESAS.SQL.Clear;
    QRYDESPESAS.SQL.Add('SELECT B.COD_DESPESA, B.NOME_DESPESA, A.VALOR_DESPESA, A.NUM_PARCELA, A.DATA_VENCIMENTO, TRUNC(A.DATA_PAGAMENTO) DATA_PAGAMENTO,');
    QRYDESPESAS.SQL.Add('       DECODE(A.SITUACAO, ''P'', ''Pago'', ''E'', ''Em aberto'') DESC_SITUCAO,A.VALOR_REAL_PAGO');
    QRYDESPESAS.SQL.Add('FROM TBCONTAS_PAGAR A, TBDESPESAS B');
    QRYDESPESAS.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
    QRYDESPESAS.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
    QRYDESPESAS.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL AND');
    QRYDESPESAS.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND');
    QRYDESPESAS.SQL.Add('      B.COD_DESPESA = A.COD_DESPESA');
    QRYDESPESAS.SQL.Add('ORDER BY A.COD_DESPESA,A.DATA_VENCIMENTO');
    QRYDESPESAS.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
    QRYDESPESAS.ParamByName('PDATA_INICIAL').ASDATETIME := QRYPARAMPARAM_D1.AsDateTime;
    QRYDESPESAS.ParamByName('PDATA_FINAL').ASDATETIME   := QRYPARAMPARAM_D2.AsDateTime;
    QRYDESPESAS.Open;

    if QRYDESPESAS.IsEmpty then
    BEGIN
      MESSAGEDLG('Nenhum registro foi encontrado.',MTINFORMATION,[MBOK],1);
      Abort;
    END;

    frxContas_despesas.Variables['USUA_EMISSAO'] := QUOTEDSTR(USUARIO_ATUAL);
    frxContas_despesas.Variables['DATA_INICIAL'] := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D1.AsDateTime));
    frxContas_despesas.Variables['DATA_FINAL']   := QUOTEDSTR(DATETOSTR(QRYPARAMPARAM_D2.AsDateTime));
    frxContas_despesas.ShowReport();
    close;
end;

procedure TFMRELCONTAS_DESPESAS1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
end;

procedure TFMRELCONTAS_DESPESAS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('48');
end;

end.
