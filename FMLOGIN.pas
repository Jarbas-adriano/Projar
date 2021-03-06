unit FMLOGIN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, sSkinManager, acPNG, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Vcl.Mask, dxGDIPlusClasses;

type
  TFMLOGIN1 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    PNL_DADOS: TPanel;
    PANEL_BOTAO: TPanel;
    BTNOK: TBitBtn;
    BTNFECHAR: TBitBtn;
    LBL_USUARIO: TLabel;
    LBL_SENHA: TLabel;
    TXT_SENHA: TEdit;
    IMG_PRINCIPAL: TImage;
    QRYAUX: TZQuery;
    TXTUSUARIO: TEdit;
    BTNALTERAR_SENHA: TBitBtn;
    procedure BTNFECHARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BTNOKClick(Sender: TObject);
    procedure BTNALTERAR_SENHAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMLOGIN1: TFMLOGIN1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS, FMCADUSUARIO, FMCADCLIENTE, FMMENU,
  FMMOVORCAMENTO, FMMOVPRESTACAOSERVICO, FMCADCONDICAOPGTO, FMCADDESPESAS,
  FMCADSERVICOS, FMCADSERVTERCEIROS, FMCADTERCEIROS, FMCADTIPOPGTO,
  FMCONSCLIENTESXFATURAS, FMCONSCONTASAPAGAR, FMMOVORDEMSAIDA, FMCONSFATPERIODO,
  FMCONSOSPRODUCAO, FMCONSSALDODEVEDOR, FMCONSUSUARIOXPRODUTIVIDADE,
  FMMOVAGENDAMENTOCTAS, FMMOVBAIXASALDODEVEDOR, FMMOVCONTROLEACESSO,
  FMMOVMANUTBANCARIA, FMBACKUP, FMMOVBAIXA_CONTAS_PAGAR, FMRELCLIENTE_SINTETICO,
  FMRELUSUARIO, FMRELORDEM_SERVICO, FMRELSERVICOS_QUANTIDADE,
  FMRELCLIENTES_DEVEDORES, FMRELPRODUTIVIDADE, FMRELCONTAS_DESPESAS,
  FMRELOS_PENDENTES, FMRELCLIENTE_ANALITICO, FMALTERAR_SENHA2;

procedure TFMLOGIN1.BTNALTERAR_SENHAClick(Sender: TObject);
begin
   IF TRIM(TXTUSUARIO.TEXT) = '' THEN
   BEGIN
      APPLICATION.MESSAGEBOX('Informe o login para realizar a altera??o da senha.','Aten??o',MB_ICONEXCLAMATION+MB_OK);
      TXTUSUARIO.SETFOCUS;
      ABORT;
   END;

   TRY
     APPLICATION.CreateForm(TFMALTERAR_SENHA21,FMALTERAR_SENHA21);
     FMALTERAR_SENHA21.SLOGIN := TXTUSUARIO.TEXT;
     FMALTERAR_SENHA21.ShowModal;
   FINALLY
     FMALTERAR_SENHA21.Free;
   END;

end;

procedure TFMLOGIN1.BTNFECHARClick(Sender: TObject);
begin
  TXTUSUARIO.Text := '';
  TXT_SENHA.Text   := '';
  TXTUSUARIO.SetFocus;
end;

procedure TFMLOGIN1.BTNOKClick(Sender: TObject);
begin
   IF TRIM(TXTUSUARIO.TEXT) = '' THEN
   BEGIN
      APPLICATION.MESSAGEBOX('Login n?o informado.','Aten??o',MB_ICONEXCLAMATION+MB_OK);
      TXTUSUARIO.SETFOCUS;
      ABORT;
   END;

   IF TRIM(TXT_SENHA.TEXT) = '' THEN
   BEGIN
      APPLICATION.MESSAGEBOX('Senha n?o informada.','Aten??o',MB_ICONEXCLAMATION+MB_OK);
      TXT_SENHA.SETFOCUS;
      ABORT;
   END;

   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE" FROM TBUSUARIO A');
   QRYAUX.SQL.Add('WHERE UPPER(A.LOGIN) = UPPER(:PCOD_USUARIO) AND ');
   QRYAUX.SQL.Add('      A.SITUACAO     = ''A'' ');
   QRYAUX.ParamByName('PCOD_USUARIO').AsString := TXTUSUARIO.Text;
   QRYAUX.Open;
   if QRYAUX.FieldByName('QTDE').AsInteger = 0 then
   BEGIN
     APPLICATION.MESSAGEBOX('Usu?rio n?o encontrado ou inativo.','Aten??o',MB_ICONEXCLAMATION+MB_OK);
     TXTUSUARIO.SETFOCUS;
     ABORT;
   END;

   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT A.SENHA FROM TBUSUARIO A');
   QRYAUX.SQL.Add('WHERE UPPER(A.LOGIN) = UPPER(:PCOD_USUARIO) AND ');
   QRYAUX.SQL.Add('      A.SITUACAO     = ''A'' ');
   QRYAUX.ParamByName('PCOD_USUARIO').AsString := TXTUSUARIO.Text;
   QRYAUX.Open;
   if QRYAUX.FieldByName('SENHA').asString <> TXT_SENHA.Text then
   BEGIN
     APPLICATION.MESSAGEBOX('Senha incorreta','Aten??o',MB_ICONEXCLAMATION+MB_OK);
     TXT_SENHA.Text := '';
     TXT_SENHA.SETFOCUS;
     ABORT;
   END;

   BUSCA_EMPRESA_USUARIO(TXTUSUARIO.Text);
   // APPLICATION.MESSAGEBOX('Tudo Certo','Aten??o',MB_ICONEXCLAMATION+MB_OK);

   {TRY
     Application.CreateForm(TFMCADCLIENTE1,FMCADCLIENTE1);
     FMCADCLIENTE1.ShowModal;
   FINALLY
      FMCADCLIENTE1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMCADUSUARIO1,FMCADUSUARIO1);
     FMCADUSUARIO1.ShowModal;
   FINALLY
      FMCADUSUARIO1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMMOVBAIXA_CONTAS_PAGAR1,FMMOVBAIXA_CONTAS_PAGAR1);
     FMMOVBAIXA_CONTAS_PAGAR1.ShowModal;
   FINALLY
      FMMOVBAIXA_CONTAS_PAGAR1.FREE;
   END;}
   {TRY
     Application.CreateForm(TFMMOVORCAMENTO1,FMMOVORCAMENTO1);
     FMMOVORCAMENTO1.ShowModal;
   FINALLY
      FMMOVORCAMENTO1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMMOVORDEMSAIDA1,FMMOVORDEMSAIDA1);
     FMMOVORDEMSAIDA1.ShowModal;
   FINALLY
      FMMOVORDEMSAIDA1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMMOVPRESTACAOSERVICO1,FMMOVPRESTACAOSERVICO1);
     FMMOVPRESTACAOSERVICO1.ShowModal;
   FINALLY
      FMMOVPRESTACAOSERVICO1.FREE;
   END;}
   {TRY
     Application.CreateForm(TFMMOVMANUTBANCARIA1,FMMOVMANUTBANCARIA1);
     FMMOVMANUTBANCARIA1.ShowModal;
   FINALLY
      FMMOVMANUTBANCARIA1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMMOVBAIXASALDODEVEDOR1,FMMOVBAIXASALDODEVEDOR1);
     FMMOVBAIXASALDODEVEDOR1.ShowModal;
   FINALLY
      FMMOVBAIXASALDODEVEDOR1.FREE;
   END;}
   {TRY
     Application.CreateForm(TFMMOVCONTROLEACESSO1,FMMOVCONTROLEACESSO1);
     FMMOVCONTROLEACESSO1.ShowModal;
   FINALLY
      FMMOVCONTROLEACESSO1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMCONSCONTASAPAGAR1,FMCONSCONTASAPAGAR1);
     FMCONSCONTASAPAGAR1.ShowModal;
   FINALLY
      FMCONSCONTASAPAGAR1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMCONSUSUARIOXPRODUTIVIDADE1,FMCONSUSUARIOXPRODUTIVIDADE1);
     FMCONSUSUARIOXPRODUTIVIDADE1.ShowModal;
   FINALLY
      FMCONSUSUARIOXPRODUTIVIDADE1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMCONSFATPERIODO1,FMCONSFATPERIODO1);
     FMCONSFATPERIODO1.ShowModal;
   FINALLY
      FMCONSFATPERIODO1.FREE;
   END;  }

   {TRY
     Application.CreateForm(TFMCONSOSPRODUCAO1,FMCONSOSPRODUCAO1);
     FMCONSOSPRODUCAO1.ShowModal;
   FINALLY
      FMCONSOSPRODUCAO1.FREE;
   END; }

   {TRY
     Application.CreateForm(TFMCONSSALDODEVEDOR1,FMCONSSALDODEVEDOR1);
     FMCONSSALDODEVEDOR1.ShowModal;
   FINALLY
      FMCONSSALDODEVEDOR1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMCONSCLIENTESXFATURAS1,FMCONSCLIENTESXFATURAS1);
     FMCONSCLIENTESXFATURAS1.ShowModal;
   FINALLY
      FMCONSCLIENTESXFATURAS1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMRELCLIENTE_SINTETICO1,FMRELCLIENTE_SINTETICO1);
     FMRELCLIENTE_SINTETICO1.ShowModal;
   FINALLY
      FMRELCLIENTE_SINTETICO1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMRELUSUARIO1,FMRELUSUARIO1);
     FMRELUSUARIO1.ShowModal;
   FINALLY
      FMRELUSUARIO1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMRELORDEM_SERVICO1,FMRELORDEM_SERVICO1);
     FMRELORDEM_SERVICO1.ShowModal;
   FINALLY
      FMRELORDEM_SERVICO1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMRELSERVICOS_QUANTIDADE1,FMRELSERVICOS_QUANTIDADE1);
     FMRELSERVICOS_QUANTIDADE1.ShowModal;
   FINALLY
      FMRELSERVICOS_QUANTIDADE1.FREE;
   END; }

   {TRY
     Application.CreateForm(TFMRELCLIENTES_DEVEDORES1,FMRELCLIENTES_DEVEDORES1);
     FMRELCLIENTES_DEVEDORES1.ShowModal;
   FINALLY
      FMRELCLIENTES_DEVEDORES1.FREE;
   END; }

   {TRY
     Application.CreateForm(TFMRELPRODUTIVIDADE1,FMRELPRODUTIVIDADE1);
     FMRELPRODUTIVIDADE1.ShowModal;
   FINALLY
      FMRELPRODUTIVIDADE1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMREL,FMRELPRODUTIVIDADE1);
     FMRELPRODUTIVIDADE1.ShowModal;
   FINALLY
      FMRELPRODUTIVIDADE1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMRELCONTAS_DESPESAS1,FMRELCONTAS_DESPESAS1);
     FMRELCONTAS_DESPESAS1.ShowModal;
   FINALLY
      FMRELCONTAS_DESPESAS1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMRELOS_PENDENTES1,FMRELOS_PENDENTES1);
     FMRELOS_PENDENTES1.ShowModal;
   FINALLY
      FMRELOS_PENDENTES1.FREE;
   END; }

   {TRY
     Application.CreateForm(TFMRELCLIENTE_ANALITICO1,FMRELCLIENTE_ANALITICO1);
     FMRELCLIENTE_ANALITICO1.ShowModal;
   FINALLY
      FMRELCLIENTE_ANALITICO1.FREE;
   END;}




  // apresenta??o prototipo ---------------------------------

  TRY
     Application.CreateForm(TFMMENU1,FMMENU1);
     FMMENU1.ShowModal;
   FINALLY
      FMMENU1.FREE;
   END;


  { TRY
     Application.CreateForm(TFMCADCLIENTE1,FMCADCLIENTE1);
     FMCADCLIENTE1.ShowModal;
   FINALLY
      FMCADCLIENTE1.FREE;
   END;  }

   {TRY
     Application.CreateForm(TFMCADSERVICOS1,FMCADSERVICOS1);
     FMCADSERVICOS1.ShowModal;
   FINALLY
      FMCADSERVICOS1.FREE;
   END;}

   {TRY
     Application.CreateForm(TFMCADSERVTERCEIROS1,FMCADSERVTERCEIROS1);
     FMCADSERVTERCEIROS1.ShowModal;
   FINALLY
      FMCADSERVTERCEIROS1.FREE;
   END;}


   ///------------------------------
  {TRY
     Application.CreateForm(TFMMOVAGENDAMENTOCTAS1,FMMOVAGENDAMENTOCTAS1);
     FMMOVAGENDAMENTOCTAS1.ShowModal;
   FINALLY
      FMMOVAGENDAMENTOCTAS1.FREE;
   END;}

 {  TRY
     Application.CreateForm(TFMMENU1,FMMENU1);
     FMMENU1.ShowModal;
   FINALLY
      FMMENU1.FREE;
   END; }

   {TRY
     Application.CreateForm(TFMMOVPRESTACAOSERVICO1,FMMOVPRESTACAOSERVICO1);
     FMMOVPRESTACAOSERVICO1.ShowModal;
   FINALLY
      FMMOVPRESTACAOSERVICO1.FREE;
   END; }

   CLOSE;
end;

procedure TFMLOGIN1.FormShow(Sender: TObject);
begin
   BTNFECHARClick(SELF);
   {TXTUSUARIO.Text := 'JARBAS';
   TXT_SENHA.Text  := 'jarbas';
   BTNOKClick(SELF);}

end;

end.
