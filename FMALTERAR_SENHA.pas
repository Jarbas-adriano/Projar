unit FMALTERAR_SENHA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, cxStyles, cxClasses,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls;

type
  TFMALTERAR_SENHA1 = class(TFMPADRAOGERAL1)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMALTERAR_SENHA1: TFMALTERAR_SENHA1;

implementation

{$R *.dfm}

end.
