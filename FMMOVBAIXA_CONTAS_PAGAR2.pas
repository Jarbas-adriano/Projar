unit FMMOVBAIXA_CONTAS_PAGAR2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TFMBAIXA_CONTAS_PAGAR2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    Label1: TLabel;
    DBTXTVLR_PAGO: TDBEdit;
    QRYPARAM: TZQuery;
    DSPARAM: TDataSource;
    QRYPARAMPARAM_N1: TFloatField;
    Label9: TLabel;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BCONTINUA :BOOLEAN;
    IVLR_PARCELA : REAL;
  end;

var
  FMBAIXA_CONTAS_PAGAR2: TFMBAIXA_CONTAS_PAGAR2;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMBAIXA_CONTAS_PAGAR2.BTNCANCELARClick(Sender: TObject);
begin
   QRYPARAM.CANCEL;
   QRYPARAM.CLOSE;
   QRYPARAM.OPEN;
   QRYPARAM.INSERT;
   BCONTINUA := FALSE;
   QRYPARAMPARAM_N1.ASFLOAT := IVLR_PARCELA;
   DBTXTVLR_PAGO.SetFocus;
end;

procedure TFMBAIXA_CONTAS_PAGAR2.BTNCONFIRMARClick(Sender: TObject);
begin
   IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
   BEGIN
     MESSAGEDLG('Informe o valor pago para prosseguir.',MTINFORMATION,[MBOK],1);
     DBTXTVLR_PAGO.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_N1.ASFLOAT < IVLR_PARCELA THEN
   BEGIN
     MESSAGEDLG('O valor pago não pode ser menor do que o valor da parcela.',MTINFORMATION,[MBOK],1);
     DBTXTVLR_PAGO.SETFOCUS;
     ABORT;
   END;

   BCONTINUA := TRUE;
   CLOSE;
end;

procedure TFMBAIXA_CONTAS_PAGAR2.FormShow(Sender: TObject);
begin
   BTNCANCELARCLICK(SELF);
end;

end.
