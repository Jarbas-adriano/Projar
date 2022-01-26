unit FMMOVSERV_TERCEIROS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFMMOVSERV_TERCEIROS1 = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    Label27: TLabel;
    Label7: TLabel;
    LBLTEM_SERV_TERC: TLabel;
    DBTXTCOD_SERVICO: TDBEdit;
    BTNBUSCA_SERV: TBitBtn;
    TXTNOME_SERVICO: TEdit;
    DBTXTVALOR_SERVICO: TDBEdit;
    DBTXTQUANTIDADE: TDBEdit;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYAUX: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_N2: TFloatField;
    QRYPARAMPARAM_N3: TFloatField;
    procedure DBTXTCOD_SERVICOExit(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNBUSCA_SERVClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure DBTXTQUANTIDADEExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    B_CONTINUA : BOOLEAN;
  end;

var
  FMMOVSERV_TERCEIROS1: TFMMOVSERV_TERCEIROS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMPADRAOFILTRO, FMPADRAOCONSULTA;

procedure TFMMOVSERV_TERCEIROS1.BTNBUSCA_SERVClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_SERVICO_TERCEIRO', 'COD_SERVICO_TERCEIRO "Codigo", NOME_SERVICO_TERCEIRO "Nome",''R$'' ||VALOR "Valor serviço",NOME_TERCEIRO_RESP "Nome do Terceiro"',
        S_FILTRO, 'Nome do serviço', 'COD_SERVICO_TERCEIRO',
        'TBSERVICOS2', 'S', 'Serviços', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_SERVICOExit(SELF);
  END;
end;

procedure TFMMOVSERV_TERCEIROS1.BTNCANCELARClick(Sender: TObject);
begin
   QRYPARAM.Cancel;
   QRYPARAM.Close;
   QRYPARAM.OPEN;
   QRYPARAM.Insert;

   B_CONTINUA := FALSE;
   TXTNOME_SERVICO.Text := '';
   DBTXTCOD_SERVICO.SetFocus;
end;

procedure TFMMOVSERV_TERCEIROS1.BTNCONFIRMARClick(Sender: TObject);
begin
   IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
   BEGIN
     MessageDlg('Informe um serviço de terceiro para continuar.',mtInformation,[MBOK],0);
     DBTXTCOD_SERVICO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N3.ASINTEGER = 0 THEN
   BEGIN
     MessageDlg('A quantidade informada deve ser maior do que 0.',mtInformation,[MBOK],0);
     DBTXTQUANTIDADE.SETFOCUS;
     ABORT;
   END;

   B_CONTINUA := TRUE;
   CLOSE;
end;

procedure TFMMOVSERV_TERCEIROS1.DBTXTCOD_SERVICOExit(Sender: TObject);
begin
    IF QRYPARAMPARAM_N1.ASSTRING <> '' THEN
    BEGIN
      QRYAUX.CLOSE;
      QRYAUX.SQL.CLEAR;
      QRYAUX.SQL.ADD('SELECT NOME_SERVICO_TERCEIRO,VALOR');
      QRYAUX.SQL.ADD('FROM TBSERVICOS2');
      QRYAUX.SQL.ADD('WHERE COD_EMPRESA            = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.ADD('      COD_SERVICO_TERCEIRO   = :PCOD_SERVICO  AND ');
      QRYAUX.SQL.ADD('      SITUACAO               = ''A'' ');
      QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
      QRYAUX.PARAMBYNAME('PCOD_SERVICO').ASINTEGER := QRYPARAMPARAM_N1.ASINTEGER;
      QRYAUX.OPEN;

      IF QRYAUX.ISEMPTY THEN
      BEGIN
        APPLICATION.MessageBox('Serviço não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_SERVICO.SETFOCUS;
        ABORT;
      END
      ELSE
      BEGIN
        TXTNOME_SERVICO.TEXT := QRYAUX.FIELDBYNAME('NOME_SERVICO_TERCEIRO').ASSTRING;
        QRYPARAMPARAM_N2.ASFLOAT := QRYAUX.FIELDBYNAME('VALOR').ASFLOAT;
        DBTXTQUANTIDADE.SetFocus;
      END;
    END
    ELSE
    BEGIN
        TXTNOME_SERVICO.TEXT := '';
    END;
end;

procedure TFMMOVSERV_TERCEIROS1.DBTXTQUANTIDADEExit(Sender: TObject);
begin
   IF QRYPARAMPARAM_N1.ASSTRING  <>  '' THEN
   BEGIN
     IF QRYPARAMPARAM_N1.ASINTEGER <= 0 THEN
     BEGIN
       MessageDlg('A quantidade não pode ser igual ou menor a 0!',mtInformation,[MBOK],0);
       if DBTXTQUANTIDADE.CanFocus then
          DBTXTQUANTIDADE.SETFOCUS;
       ABORT;
     END;
   END;
end;

procedure TFMMOVSERV_TERCEIROS1.FormShow(Sender: TObject);
begin
   BTNCANCELARCLICK(SELF);
end;

end.
