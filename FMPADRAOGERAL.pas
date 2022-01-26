unit FMPADRAOGERAL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Vcl.Imaging.jpeg, Vcl.ComCtrls, cxStyles, cxClasses,SHELLAPI;

type
  TFMPADRAOGERAL1 = class(TForm)
    PNL_GERAL: TPanel;
    MNUGERAL: TMainMenu;
    MNUAJUDA: TMenuItem;
    PNL_EMPRESA: TPanel;
    Image1: TImage;
    LBLNOMEEMPRESA: TDBText;
    LBLCNPJ: TDBText;
    GB_PRINCIPAL: TGroupBox;
    QRYAUX: TZQuery;
    StatusBar1: TStatusBar;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    procedure FormShow(Sender: TObject);
    procedure BUSCA_EMPRESA;
    procedure Timer1Timer(Sender: TObject);
    PROCEDURE ABRIR_AJUDA(PPARAM_PDF :STRING);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMPADRAOGERAL1: TFMPADRAOGERAL1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMPADRAOGERAL1.ABRIR_AJUDA(PPARAM_PDF: STRING);
var s, result:String;
    path: array[0..250] of char;
begin
       //s:='/A page=27.5 "D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf"';
   s:='/A page='+PPARAM_PDF+' "D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf"';
   FindExecutable('D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf',nil,path);
   result := trim(StrPas(path));
   ShellExecute(handle,nil,pchar(result),pchar(s),nil,sw_show);
end;

procedure TFMPADRAOGERAL1.BUSCA_EMPRESA;
begin
    QRYAUX.CLOSE;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT * FROM TBEMPRESA ');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PEMP');
    QRYAUX.PARAMBYNAME('PEMP').AsInteger :=  EMPRESA_ATUAL;
    QRYAUX.OPEN;

    LBLNOMEEMPRESA.Caption := QRYAUX.FieldByName('NOME_FANTASIA').AsString;
    LBLCNPJ.Caption        := QRYAUX.FieldByName('CNPJ').AsString;
end;

procedure TFMPADRAOGERAL1.FormShow(Sender: TObject);
begin
   BUSCA_EMPRESA;
   StatusBar1.Panels.Items[0].Text := 'Nome do usuário: '+USUARIO_ATUAL;
   StatusBar1.Panels.ITEMS[1].Text := 'Tipo do Usuário: '+TIPO_USUARIO;
   StatusBar1.Panels.ITEMS[2].Text := 'Data atual: '+DATETOSTR(DATE);

end;

procedure TFMPADRAOGERAL1.Timer1Timer(Sender: TObject);
begin
 {  QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT TO_CHAR(SYSDATE,''HH24:MI'') HORA FROM DUAL ');
   QRYAUX.Open;
    StatusBar1.Panels.ITEMS[3].Text := 'Hora atual: '+QRYAUX.FIELDBYNAME('HORA').AsString;}
end;

end.
