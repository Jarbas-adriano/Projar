unit FMMOVORDEMSAIDA2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFMMOVORDEMSAIDA_2 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    TXTMOTIVO: TMemo;
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    BCONTINUA : BOOLEAN;
  end;

var
  FMMOVORDEMSAIDA_2: TFMMOVORDEMSAIDA_2;


implementation

{$R *.dfm}

procedure TFMMOVORDEMSAIDA_2.BTNCANCELARClick(Sender: TObject);
begin
   BCONTINUA := FALSE;
   TXTMOTIVO.Text := '';
   TXTMOTIVO.SetFocus;
end;

procedure TFMMOVORDEMSAIDA_2.BTNCONFIRMARClick(Sender: TObject);
begin
   if TXTMOTIVO.Text = '' then
   BEGIN
      MESSAGEDLG('Informe um motivo para prosseguir!',mtInformation,[MBOK],1);
      TXTMOTIVO.SetFocus;
      ABORT;
   END;

   if Length(TRIM(TXTMOTIVO.Text)) < 10 then
   BEGIN
      MESSAGEDLG('Forneça mais detalhes do desconto para prosseguir!',mtInformation,[MBOK],1);
      TXTMOTIVO.SetFocus;
      ABORT;
   END;

   BCONTINUA := TRUE;
   CLOSE;
end;

procedure TFMMOVORDEMSAIDA_2.FormShow(Sender: TObject);
begin
   BTNCANCELARClick(SELF);
end;

end.
