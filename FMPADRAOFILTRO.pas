unit FMPADRAOFILTRO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.Imaging.jpeg,CXGRIDEXPORTLINK,ShellAPI;

type
  TFMPADRAOFILTRO1 = class(TFMPADRAOGERAL1)
    GBPRINCIPAL: TGroupBox;
    Panel1: TPanel;
    BTNCONFIRMAR: TBitBtn;
    Panel2: TPanel;
    BTNEXPORTAR: TBitBtn;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    BTNCANCELAR: TBitBtn;
    SaveDialog: TSaveDialog;
    PROCEDURE ABRIR_AJUDA(PPARAM_PDF :STRING);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMPADRAOFILTRO1: TFMPADRAOFILTRO1;

implementation

{$R *.dfm}

{ TFMPADRAOFILTRO1 }

procedure TFMPADRAOFILTRO1.ABRIR_AJUDA(PPARAM_PDF: STRING);
var s, result:String;
    path: array[0..250] of char;
begin
       //s:='/A page=27.5 "D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf"';
   s:='/A page='+PPARAM_PDF+' "D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf"';
   FindExecutable('D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf',nil,path);
   result := trim(StrPas(path));
   ShellExecute(handle,nil,pchar(result),pchar(s),nil,sw_show);
end;

end.
