unit FMROTINAS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ACBrBase, ACBrSocket, ACBrIBGE;

type
  TFMROTINAS1 = class(TForm)
    BTNCARREGA_CIDADES: TBitBtn;
    ACBrIBGE1: TACBrIBGE;
    QRYAUX: TZQuery;
     //procedure BitBtn1Click(Sender: TObject);
    PROCEDURE ACBrCEP1BuscaEfetuada(Sender : TObject) ;
    procedure BTNCARREGA_CIDADESClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMROTINAS1: TFMROTINAS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL;

procedure TFMROTINAS1.ACBrCEP1BuscaEfetuada(Sender: TObject);
var
  I : Integer ;
begin
  if ACBrIBGE1.Cidades.Count < 1 then
     MESSAGEDLG('Nenhum Registro encontrado',mtinformation,[MBOK],1)
  else
   begin
     For I := 0 to ACBrIBGE1.cidades.Count-1 do
     begin
       with ACBrIBGE1.cidades[I] do
       begin
       TRY
         QRYAUX.CLOSE;
         QRYAUX.SQL.CLEAR;
         QRYAUX.SQL.ADD('INSERT INTO TBCIDADES');
         QRYAUX.SQL.ADD('VALUES(:PCOD_IBGE,:PNOME,:PUF,:PPAIS,');
         QRYAUX.SQL.ADD(':PAREA,:PPOP,:PCOD_UF)');
         QRYAUX.PARAMBYNAME('PCOD_IBGE').ASINTEGER :=  CodMunicipio;
         QRYAUX.PARAMBYNAME('PNOME').ASSTRING         := Municipio;
         //QRYAUX.PARAMBYNAME('PCOD_IBGE').ASSTRING     := MunicipioIdx;
         QRYAUX.PARAMBYNAME('PUF').ASSTRING      := UF;
         QRYAUX.PARAMBYNAME('PPAIS').ASSTRING      := 'Brasil';
         QRYAUX.PARAMBYNAME('PAREA').AsFloat      :=  Area;
         QRYAUX.PARAMBYNAME('PPOP').AsFloat      :=  Populacao;
         QRYAUX.PARAMBYNAME('PCOD_UF').ASINTEGER      :=  CodUF;
         QRYAUX.ExecSQL;
         MDPRINCIPAL.COMMIT;
       EXCEPT
       ON E:EXCEPTION DO
       BEGIN
           MESSAGEDLG('Erro:' +e.Message,mtinformation,[MBOK],1) ;
           Abort;
       END;
       END;
       end ;
     end ;
   end ;

   MESSAGEDLG('Acabou',mtinformation,[MBOK],1);
 {
  Memo1.Lines.Add('');
  Memo1.Lines.Add('Resposta HTTP:');
  Memo1.Lines.AddStrings( ACBrIBGE1.RespHTTP );  }

end;


procedure TFMROTINAS1.BTNCARREGA_CIDADESClick(Sender: TObject);
begin
 ACBrIBGE1.BuscarPorUF('');
 ACBrCEP1BuscaEfetuada(SELF);
end;

end.
