unit FMPADRAOCADASTRO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Buttons, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,SHELLAPI;

type
  TFMPADRAOCADASTRO1 = class(TForm)
    Panel1: TPanel;
    MNUGERAL: TMainMenu;
    MNUAJUDA: TMenuItem;
    PNL_EMPRESA: TPanel;
    Image1: TImage;
    LBLNOMEEMPRESA: TDBText;
    LBLCNPJ: TDBText;
    QRYAUX: TZQuery;
    DSPADRAO: TDataSource;
    PGPRINCIPAL: TPageControl;
    TSCONSULTA: TTabSheet;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    TXTPESQUISA_PRINCIPAL: TEdit;
    TSCADASTRO: TTabSheet;
    Panel2: TPanel;
    PGCADASTRO: TPageControl;
    BTNPESQUISAR: TBitBtn;
    BTNANTERIOR: TBitBtn;
    BTNPROXIMO: TBitBtn;
    SpeedButton2: TSpeedButton;
    BTNEDITAR: TBitBtn;
    BTNEXLCUIR: TBitBtn;
    BTNSALVAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    SpeedButton3: TSpeedButton;
    BTNINCLUIR: TBitBtn;
    PNDADOS: TPanel;
    LBL_CAMPO: TLabel;
    StatusBar1: TStatusBar;
    DBGRIDTABELADBTableView1: TcxGridDBTableView;
    DBGRIDTABELALevel1: TcxGridLevel;
    DBGRIDTABELA: TcxGrid;
     procedure BUSCA_EMPRESA;
    procedure FormShow(Sender: TObject);
    procedure PADRONIZADBEDIT;
    procedure HABILITABOTOES(OPERACAO: INTEGER; BTNPROXIMO, BTNANTERIOR,
      BTNINCLUIR, BTNEDITAR, BTNSALVAR, BTNCONSULTAR, BTNCANCELAR,BTNEXCLUIR: TBitBtn;
      PAINEL: TPanel);
      PROCEDURE MONTACOMBOCAMPOS(QUERY: TZQUERY; COMBO:TComboBox);
    PROCEDURE MONTACAMPOSQUERY( QUERY: TZQUERY);
    procedure BTNPESQUISARClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure DBGRIDTABELADBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    PROCEDURE ABRIR_AJUDA(PPARAM_PDF :STRING);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMPADRAOCADASTRO1: TFMPADRAOCADASTRO1;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL;

{ TForm1 }

procedure TFMPADRAOCADASTRO1.ABRIR_AJUDA(PPARAM_PDF: STRING);
var s, result:String;
    path: array[0..250] of char;
begin
       //s:='/A page=27.5 "D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf"';
   s:='/A page='+PPARAM_PDF+' "D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf"';
   FindExecutable('D:\TCC - Sistemas de Informação\Projeto TCC\Delphi - IDE\Projeto e Formulários\Ajuda.pdf',nil,path);
   result := trim(StrPas(path));
   ShellExecute(handle,nil,pchar(result),pchar(s),nil,sw_show);
end;

procedure TFMPADRAOCADASTRO1.BTNCANCELARClick(Sender: TObject);
begin
//
end;

procedure TFMPADRAOCADASTRO1.BTNEDITARClick(Sender: TObject);
begin
//
end;

procedure TFMPADRAOCADASTRO1.BTNEXLCUIRClick(Sender: TObject);
begin
//
end;

procedure TFMPADRAOCADASTRO1.BTNINCLUIRClick(Sender: TObject);
begin
//
end;

procedure TFMPADRAOCADASTRO1.BTNPESQUISARClick(Sender: TObject);
begin
   PGPRINCIPAL.ActivePage := TSCONSULTA;
   TXTPESQUISA_PRINCIPAL.Text := '';
  TXTPESQUISA_PRINCIPAL.SetFocus;
end;

procedure TFMPADRAOCADASTRO1.BTNSALVARClick(Sender: TObject);
begin
//
end;

procedure TFMPADRAOCADASTRO1.BUSCA_EMPRESA;
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

procedure TFMPADRAOCADASTRO1.DBGRIDTABELADBTableView1DblClick(Sender: TObject);
begin
   PGPRINCIPAL.ActivePage := TSCADASTRO;
end;

procedure TFMPADRAOCADASTRO1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   {IF KEY = VK_F2 THEN
   BEGIN
     IF BTNINCLUIR.ENABLED = TRUE THEN
        BTNINCLUIRCLICK(SELF);
   END
   ELSE IF KEY = VK_F3 THEN
   BEGIN
      IF BTNEDITAR.ENABLED = TRUE THEN
         BTNEDITARCLICK(SELF);
   END
   ELSE IF KEY = VK_F4 THEN
   BEGIN
       IF BTNEXLCUIR.ENABLED = TRUE THEN
          BTNEXLCUIRCLICK(SELF);
   END
   ELSE IF KEY = VK_F6 THEN
   BEGIN
       IF BTNSALVAR.ENABLED = TRUE THEN
          BTNSALVARCLICK(SELF);
   END
   ELSE IF KEY = VK_F7 THEN
   BEGIN
      IF BTNCANCELAR.ENABLED = TRUE THEN
         BTNCANCELARCLICK(SELF);
   END
   ELSE IF KEY = VK_F8 THEN
   BEGIN
      IF BTNPESQUISAR.ENABLED = TRUE THEN
         BTNPESQUISARCLICK(SELF);
   END; }

end;

procedure TFMPADRAOCADASTRO1.FormShow(Sender: TObject);
begin
   BUSCA_EMPRESA;
   PGPRINCIPAL.ActivePage := TSCONSULTA ;
   PADRONIZADBEDIT;
   StatusBar1.Panels.Items[0].Text := 'Nome do usuário: '+USUARIO_ATUAL;
   StatusBar1.Panels.ITEMS[1].Text := 'Tipo do Usuário: '+TIPO_USUARIO;
   StatusBar1.Panels.ITEMS[2].Text := 'Data atual: '+DATETOSTR(DATE);
   Timer1Timer(self);
end;

procedure TFMPADRAOCADASTRO1.HABILITABOTOES(OPERACAO: INTEGER; BTNPROXIMO,
  BTNANTERIOR, BTNINCLUIR, BTNEDITAR, BTNSALVAR, BTNCONSULTAR,
  BTNCANCELAR, BTNEXCLUIR: TBitBtn; PAINEL: TPanel);
VAR
     BHPROXIMO, BHANTERIOR, BHINCLUIR, BHEDITAR, BHSALVAR,
   BHCONSULTAR, BHATUALIZAR, BHCANCELAR, BHEXCLUIR :BOOLEAN;
begin
 /// INSERINDO  OU EDITANDO
  IF OPERACAO = 1 THEN
  BEGIN
    BHPROXIMO      := FALSE;
    BHANTERIOR     := FALSE;
    BHINCLUIR      := FALSE;
    BHEDITAR       := FALSE;
    BHSALVAR       := TRUE;
    BHCONSULTAR    := FALSE;
    BHATUALIZAR    := FALSE;
    BHCANCELAR     := TRUE;
    BHEXCLUIR      := FALSE;
    PAINEL.Enabled := TRUE;
  END;

  /// SALVAR  OU CANCELA
  IF OPERACAO = 2 THEN
  BEGIN
    BHPROXIMO      := TRUE;
    BHANTERIOR     := TRUE;
    BHINCLUIR      := TRUE;
    BHEDITAR       := TRUE;
    BHSALVAR       := FALSE;
    BHCONSULTAR    := TRUE;
    BHATUALIZAR    := TRUE;
    BHCANCELAR     := FALSE;
    BHEXCLUIR      := TRUE;
    PAINEL.Enabled := FALSE;
  END;


   BTNPROXIMO.Enabled   := BHPROXIMO;
   BTNANTERIOR.Enabled  := BHANTERIOR;
   BTNINCLUIR.Enabled   := BHINCLUIR;
   BTNEDITAR.Enabled    := BHEDITAR;
   BTNSALVAR.Enabled    := BHSALVAR;
   BTNCONSULTAR.Enabled := BHCONSULTAR;
   //BTNATUALIZAR.Enabled := BHATUALIZAR;
   BTNCANCELAR.Enabled  := BHCANCELAR;
   BTNEXCLUIR.Enabled   := BHEXCLUIR;

end;

procedure TFMPADRAOCADASTRO1.MONTACAMPOSQUERY(QUERY: TZQUERY);
VAR I: INTEGER;
begin
  { for I := 0 to (QUERY.FieldCount)-1 do
   IF QUERY.FIELDS[I].FIELDKIND = FKDATA THEN
    BEGIN
       IF QUERY.FIELDS[I].DISPLAYLABEL = QUERY.FIELDS[I].FIELDNAME THEN
          QRYTABELA.Fields.Add(QUERY.FIELDS[I].ParentField);
    END;  }
END;

procedure TFMPADRAOCADASTRO1.MONTACOMBOCAMPOS(QUERY: TZQUERY; COMBO: TComboBox);
VAR I :INTEGER;
begin
  FOR I := 0 TO (QUERY.FIELDCOUNT)-1 DO
  BEGIN
    IF QUERY.FIELDS[I].FIELDKIND = FKDATA THEN
    BEGIN
       IF QUERY.FIELDS[I].DISPLAYLABEL <> QUERY.FIELDS[I].FIELDNAME THEN
          COMBO.ITEMS.ADD(INTTOSTR(I) +' - '+ QUERY.FIELDS[I].DISPLAYLABEL);
    END;
  END;
  COMBO.ITEMINDEX := 0;
end;

procedure TFMPADRAOCADASTRO1.PADRONIZADBEDIT;
Var
i : Integer;
begin
  for i := 0 to ComponentCount -1 do
  if Components[i] is TDBEdit then
  begin
    TDBEdit(Components[i]).BevelInner  := bvLowered;
    TDBEdit(Components[i]).BevelKind   := bkFlat;
    TDBEdit(Components[i]).BorderStyle := bsNone;
  end;
END;

procedure TFMPADRAOCADASTRO1.Timer1Timer(Sender: TObject);
begin
{   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT TO_CHAR(SYSDATE,''HH24:MI'') HORA FROM DUAL ');
   QRYAUX.Open;
   StatusBar1.Panels.ITEMS[3].Text := 'Hora atual: '+QRYAUX.FIELDBYNAME('HORA').AsString;  }
end;

end.
