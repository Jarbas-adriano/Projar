unit FMMOVBAIXASALDODEVEDOR2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFMBAIXASALDODEVEDOR2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBTXTVLR_RECEBIDO: TDBEdit;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    DSPARAM: TDataSource;
    Label9: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BCONTINUA :BOOLEAN;
    IVLR_PARCELA : REAL;
  end;

var
  FMBAIXASALDODEVEDOR2: TFMBAIXASALDODEVEDOR2;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL;

procedure TFMBAIXASALDODEVEDOR2.BTNCANCELARClick(Sender: TObject);
begin
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   BCONTINUA := FALSE;
   QRYPARAMPARAM_N1.ASFLOAT := IVLR_PARCELA;
   DBTXTVLR_RECEBIDO.SetFocus;
end;

procedure TFMBAIXASALDODEVEDOR2.BTNCONFIRMARClick(Sender: TObject);
begin
   IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
   BEGIN
     MESSAGEDLG('Informe o valor recebido para prosseguir.',MTINFORMATION,[MBOK],1);
     DBTXTVLR_RECEBIDO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N1.ASFLOAT < IVLR_PARCELA THEN
   BEGIN
     MESSAGEDLG('O valor recebido não pode ser menor do que o valor da parcela.',MTINFORMATION,[MBOK],1);
     DBTXTVLR_RECEBIDO.SETFOCUS;
     ABORT;
   END;

   BCONTINUA := TRUE;
   CLOSE;
end;

procedure TFMBAIXASALDODEVEDOR2.FormShow(Sender: TObject);
begin
   BTNCANCELARCLICK(SELF);
end;

end.
