unit FMMENU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, dxGDIPlusClasses, Vcl.Imaging.jpeg,
  Vcl.ComCtrls, cxStyles, cxClasses;

type
  TFMMENU1 = class(TFMPADRAOGERAL1)
    pnl_menu_lateral: TPanel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    PNL_PRINCIPAL: TPanel;
    PNL_SUB_CADASTRO: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    Image2: TImage;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    PNL_SUB_MOVIMENTACAO: TPanel;
    SpeedButton21: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    BTN_CONSULTAS: TSpeedButton;
    PNL_SUB_CONSULTA: TPanel;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton4: TSpeedButton;
    PNL_SUB_RELATORIO: TPanel;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton38: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    SpeedButton43: TSpeedButton;
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure PNL_PRINCIPALMouseEnter(Sender: TObject);
    procedure PNL_SUB_CONSULTASClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton16Click(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure SpeedButton20Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure k(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMENU1: TFMMENU1;
  b_expandido :boolean;

implementation

{$R *.dfm}

uses FMCADCLIENTE, FMCADSERVICOS, FMCADSERVTERCEIROS, FMCADTERCEIROS,
  FMMOVAGENDAMENTOCTAS, FMMOVORCAMENTO, FMCADCONDICAOPGTO, FMCADDESPESAS,
  FMCADTIPOPGTO, FMCADUSUARIO, UNROTINASGERAIS, DMPRINCIPAL, FMBACKUP,
  FMCONSCLIENTESXFATURAS, FMCONSCONTASAPAGAR, FMCONSFATPERIODO,
  FMCONSOSPRODUCAO, FMCONSSALDODEVEDOR, FMCONSUSUARIOXPRODUTIVIDADE, FMLOGIN,
  FMMOVBAIXA_CONTAS_PAGAR, FMMOVBAIXASALDODEVEDOR, FMMOVCONTROLEACESSO,
  FMMOVMANUTBANCARIA, FMMOVORDEMSAIDA, FMMOVORDEMSAIDA2, FMMOVPRESTACAOSERVICO,
  FMMOVSERV_TERCEIROS, FMPADRAOCADASTRO, FMPADRAOCONSULTA, FMPADRAOFILTRO,
  FMRELCLIENTE_ANALITICO, FMRELCLIENTE_SINTETICO, FMRELCLIENTES_DEVEDORES,
  FMRELCONTAS_DESPESAS, FMRELORDEM_SERVICO, FMRELOS_PENDENTES,
  FMRELPRODUTIVIDADE, FMRELSERVICOS_QUANTIDADE, FMRELUSUARIO;

procedure TFMMENU1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
   ABRIR_AJUDA('1');
end;

procedure TFMMENU1.PNL_PRINCIPALMouseEnter(Sender: TObject);
begin
  inherited;
  //  PNL_SUB_CADASTRO.Visible := NOT PNL_SUB_CADASTRO.Visible;
end;

procedure TFMMENU1.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_SERVICO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     Application.CreateForm(TFMCADSERVTERCEIROS1,FMCADSERVTERCEIROS1);
     FMCADSERVTERCEIROS1.ShowModal;
   FINALLY
      FMCADSERVTERCEIROS1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton11Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_SERVICO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

   TRY
     Application.CreateForm(TFMCADSERVICOS1,FMCADSERVICOS1);
     FMCADSERVICOS1.ShowModal;
   FINALLY
      FMCADSERVICOS1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton12Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CONSULTA_CLIENTES_XFATURAS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     Application.CreateForm(TFMCONSCLIENTESXFATURAS1,FMCONSCLIENTESXFATURAS1);
     FMCONSCLIENTESXFATURAS1.ShowModal;
   FINALLY
      FMCONSCLIENTESXFATURAS1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton13Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CONSULTA_CONTAS_A_PAGAR,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     Application.CreateForm(TFMCONSCONTASAPAGAR1,FMCONSCONTASAPAGAR1);
     FMCONSCONTASAPAGAR1.ShowModal;
   FINALLY
      FMCONSCONTASAPAGAR1.FREE;
   END;
end;

procedure TFMMENU1.k(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CONSULTA_USUARIO_PRODUTIVIDADE,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCONSUSUARIOXPRODUTIVIDADE1,FMCONSUSUARIOXPRODUTIVIDADE1);
     FMCONSUSUARIOXPRODUTIVIDADE1.ShowModal;
   FINALLY
      FMCONSUSUARIOXPRODUTIVIDADE1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CONSULTA_FATURAMENTO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     Application.CreateForm(TFMCONSFATPERIODO1,FMCONSFATPERIODO1);
     FMCONSFATPERIODO1.ShowModal;
   FINALLY
      FMCONSFATPERIODO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton16Click(Sender: TObject);
begin
  inherited;
  {QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_TIPOS_PAGAMENTO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCADTIPOPGTO1,FMCADTIPOPGTO1);
     FMCADTIPOPGTO1.ShowModal;
   FINALLY
      FMCADTIPOPGTO1.FREE;
   END;}
end;

procedure TFMMENU1.SpeedButton17Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CONSULTA_OS_PRODUCAO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     Application.CreateForm(TFMCONSOSPRODUCAO1,FMCONSOSPRODUCAO1);
     FMCONSOSPRODUCAO1.ShowModal;
   FINALLY
      FMCONSOSPRODUCAO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton18Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_DESPESAS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCADDESPESAS1,FMCADDESPESAS1);
     FMCADDESPESAS1.ShowModal;
   FINALLY
      FMCADDESPESAS1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton19Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_TERCEIROS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;



 TRY
     Application.CreateForm(TFMCADTERCEIROS1,FMCADTERCEIROS1);
     FMCADTERCEIROS1.ShowModal;
   FINALLY
      FMCADTERCEIROS1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton1Click(Sender: TObject);
begin
  inherited;

  PNL_SUB_CADASTRO.VISIBLE      := FALSE;
  PNL_SUB_CONSULTA.VISIBLE      := FALSE;
  PNL_SUB_MOVIMENTACAO.VISIBLE  := FALSE;
  PNL_SUB_RELATORIO.VISIBLE     := FALSE;

  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.FAZ_BACKUP,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

   TRY
     Application.CreateForm(TFMBACKUP1,FMBACKUP1);
     FMBACKUP1.ShowModal;
   FINALLY
      FMBACKUP1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton20Click(Sender: TObject);
begin
  inherited;

  {QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_CONDICOES_PAG,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     Application.CreateForm(TFMCADCONDICAOPGTO1,FMCADCONDICAOPGTO1);
     FMCADCONDICAOPGTO1.ShowModal;
   FINALLY
      FMCADCONDICAOPGTO1.FREE;
   END;}

  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_TIPOS_PAGAMENTO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCADTIPOPGTO1,FMCADTIPOPGTO1);
     FMCADTIPOPGTO1.ShowModal;
   FINALLY
      FMCADTIPOPGTO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton21Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.GERA_ORCAMENTO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     Application.CreateForm(TFMMOVORCAMENTO1,FMMOVORCAMENTO1);
     FMMOVORCAMENTO1.ShowModal;
   FINALLY
      FMMOVORCAMENTO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton22Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.GERA_PRESTACAO_SERV,''N'') LIBERACAO'); // se não poder gerar prestação de serviço não pode gerar ordem de serviço
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     Application.CreateForm(TFMMOVORDEMSAIDA1,FMMOVORDEMSAIDA1);
     FMMOVORDEMSAIDA1.ShowModal;
   FINALLY
      FMMOVORDEMSAIDA1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton23Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.GERA_PRESTACAO_SERV,''N'') LIBERACAO'); // se não poder gerar prestação de serviço não pode gerar ordem de serviço
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     Application.CreateForm(TFMMOVPRESTACAOSERVICO1,FMMOVPRESTACAOSERVICO1);
     FMMOVPRESTACAOSERVICO1.ShowModal;
   FINALLY
      FMMOVPRESTACAOSERVICO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton24Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.AGENDA_CONTAS_PAGAR,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMMOVAGENDAMENTOCTAS1,FMMOVAGENDAMENTOCTAS1);
     FMMOVAGENDAMENTOCTAS1.ShowModal;
   FINALLY
      FMMOVAGENDAMENTOCTAS1.FREE;
   END
end;

procedure TFMMENU1.SpeedButton25Click(Sender: TObject);
begin
  inherited;

  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.BAIXA_SALDO_DEVEDOR,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

   TRY
     Application.CreateForm(TFMMOVBAIXASALDODEVEDOR1,FMMOVBAIXASALDODEVEDOR1);
     FMMOVBAIXASALDODEVEDOR1.ShowModal;
   FINALLY
      FMMOVBAIXASALDODEVEDOR1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton26Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.MANUTENCAO_EM_TITULOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     Application.CreateForm(TFMMOVMANUTBANCARIA1,FMMOVMANUTBANCARIA1);
     FMMOVMANUTBANCARIA1.ShowModal;
   FINALLY
      FMMOVMANUTBANCARIA1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton27Click(Sender: TObject);
begin
  inherited;

  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.BAIXA_CONTAS_PAGAR,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

   TRY
     Application.CreateForm(TFMMOVBAIXA_CONTAS_PAGAR1,FMMOVBAIXA_CONTAS_PAGAR1);
     FMMOVBAIXA_CONTAS_PAGAR1.ShowModal;
   FINALLY
      FMMOVBAIXA_CONTAS_PAGAR1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton28Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.TIPO_USUARIO,''N'') TIPO_USUARIO');
  QRYAUX.SQL.ADD('FROM TBUSUARIO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário não cadastrado'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF  QRYAUX.FIELDBYNAME('TIPO_USUARIO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Esse aplicativo só é liberado para usuários da diretoria ou gerência.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     Application.CreateForm(TFMMOVCONTROLEACESSO1,FMMOVCONTROLEACESSO1);
     FMMOVCONTROLEACESSO1.ShowModal;
   FINALLY
      FMMOVCONTROLEACESSO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton2Click(Sender: TObject);
begin
  inherited;
   PNL_SUB_RELATORIO.TOP := 38;
   PNL_SUB_RELATORIO.WIDTH := 290;
   PNL_SUB_RELATORIO.HEIGHT := 439;
   PNL_SUB_RELATORIO.LEFT :=1;
   PNL_SUB_RELATORIO.VISIBLE := NOT PNL_SUB_RELATORIO.VISIBLE;

   IF PNL_SUB_RELATORIO.VISIBLE THEN
   BEGIN
      PNL_SUB_CADASTRO.VISIBLE      := FALSE;
      PNL_SUB_CONSULTA.VISIBLE      := FALSE;
      PNL_SUB_MOVIMENTACAO.VISIBLE  := FALSE;
   END;
end;

procedure TFMMENU1.SpeedButton35Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     //Application.CreateForm(TFMRELCLIENTE_SINTETICO1,FMRELCLIENTE_SINTETICO1);
     FMRELCLIENTE_SINTETICO1.ShowModal;
   FINALLY
      //FMRELCLIENTE_SINTETICO1.Free;
   END;
end;

procedure TFMMENU1.SpeedButton36Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     //Application.CreateForm(TFMRELOS_PENDENTES1,FMRELOS_PENDENTES1);
     FMRELOS_PENDENTES1.ShowModal;
   FINALLY
      //FMRELOS_PENDENTES1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton37Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;



  TRY
     //Application.CreateForm(TFMRELCLIENTE_ANALITICO1,FMRELCLIENTE_ANALITICO1);
     FMRELCLIENTE_ANALITICO1.ShowModal;
   FINALLY
      //FMRELCLIENTE_ANALITICO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton38Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     //Application.CreateForm(TFMRELCLIENTES_DEVEDORES1,FMRELCLIENTES_DEVEDORES1);
     FMRELCLIENTES_DEVEDORES1.ShowModal;
   FINALLY
      //FMRELCLIENTES_DEVEDORES1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton39Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     //Application.CreateForm(TFMRELCONTAS_DESPESAS1,FMRELCONTAS_DESPESAS1);
     FMRELCONTAS_DESPESAS1.ShowModal;
   FINALLY
      //FMRELCONTAS_DESPESAS1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton3Click(Sender: TObject);
begin
  inherited;
   PNL_SUB_MOVIMENTACAO.TOP := 87;
   PNL_SUB_MOVIMENTACAO.WIDTH := 241;
   PNL_SUB_MOVIMENTACAO.HEIGHT := 390;
   PNL_SUB_MOVIMENTACAO.LEFT :=1;
   PNL_SUB_MOVIMENTACAO.VISIBLE := NOT PNL_SUB_MOVIMENTACAO.VISIBLE;

   IF PNL_SUB_MOVIMENTACAO.VISIBLE THEN
   BEGIN
      PNL_SUB_CADASTRO.VISIBLE := FALSE;
      PNL_SUB_CONSULTA.VISIBLE     := FALSE;
      PNL_SUB_RELATORIO.VISIBLE      := FALSE;
   END;
end;

procedure TFMMENU1.SpeedButton40Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     //Application.CreateForm(TFMRELORDEM_SERVICO1,FMRELORDEM_SERVICO1);
     FMRELORDEM_SERVICO1.ShowModal;
   FINALLY
      //FMRELORDEM_SERVICO1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton41Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


  TRY
     //Application.CreateForm(TFMRELPRODUTIVIDADE1,FMRELPRODUTIVIDADE1);
     FMRELPRODUTIVIDADE1.ShowModal;
   FINALLY
      //FMRELPRODUTIVIDADE1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton42Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     //Application.CreateForm(TFMRELUSUARIO1,FMRELUSUARIO1);
     FMRELUSUARIO1.ShowModal;
   FINALLY
      //FreeAndNil(FMRELUSUARIO1);
   END;
end;

procedure TFMMENU1.SpeedButton43Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.EMITE_RELATORIOS,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;


   TRY
     //Application.CreateForm(TFMRELSERVICOS_QUANTIDADE1,FMRELSERVICOS_QUANTIDADE1);
     FMRELSERVICOS_QUANTIDADE1.ShowModal;
   FINALLY
      //FMRELSERVICOS_QUANTIDADE1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CONSULTA_SALDO_DEVEDOR,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCONSSALDODEVEDOR1,FMCONSSALDODEVEDOR1);
     FMCONSSALDODEVEDOR1.ShowModal;
   FINALLY
      FMCONSSALDODEVEDOR1.FREE;
   END;
end;

procedure TFMMENU1.PNL_SUB_CONSULTASClick(Sender: TObject);
begin
  inherited;
   PNL_SUB_CONSULTA.TOP := 145;
   PNL_SUB_CONSULTA.WIDTH := 251;
   PNL_SUB_CONSULTA.HEIGHT := 295;
   PNL_SUB_CONSULTA.LEFT :=1;
   PNL_SUB_CONSULTA.VISIBLE := NOT PNL_SUB_CONSULTA.VISIBLE;

   IF PNL_SUB_CONSULTA.VISIBLE THEN
   BEGIN
      PNL_SUB_CADASTRO.VISIBLE       := FALSE;
      PNL_SUB_MOVIMENTACAO.VISIBLE   := FALSE;
      PNL_SUB_RELATORIO.VISIBLE      := FALSE;
   END;
end;

procedure TFMMENU1.SpeedButton5Click(Sender: TObject);
begin
  inherited;
   PNL_SUB_CADASTRO.TOP := 49;
   PNL_SUB_CADASTRO.WIDTH := 270;
   PNL_SUB_CADASTRO.HEIGHT := 337;
   PNL_SUB_CADASTRO.LEFT :=1;
   PNL_SUB_CADASTRO.VISIBLE := NOT PNL_SUB_CADASTRO.VISIBLE;

   IF PNL_SUB_CADASTRO.VISIBLE THEN
   BEGIN
      PNL_SUB_MOVIMENTACAO.VISIBLE := FALSE;
      PNL_SUB_CONSULTA.VISIBLE     := FALSE;
      PNL_SUB_RELATORIO.VISIBLE      := FALSE;
   END;

end;

procedure TFMMENU1.SpeedButton6Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_CLIENTES,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCADCLIENTE1,FMCADCLIENTE1);
     FMCADCLIENTE1.ShowModal;
   FINALLY
      FMCADCLIENTE1.FREE;
   END;
end;

procedure TFMMENU1.SpeedButton7Click(Sender: TObject);
begin
  inherited;
   CLOSE;
end;

procedure TFMMENU1.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if b_expandido then
     pnl_menu_lateral.Width := 45
  else
     pnl_menu_lateral.Width := 145;

  b_expandido := NOT b_expandido;
end;

procedure TFMMENU1.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  QRYAUX.CLOSE;
  QRYAUX.SQL.CLEAR;
  QRYAUX.SQL.ADD('SELECT NVL(A.CADASTRO_USUARIO,''N'') LIBERACAO');
  QRYAUX.SQL.ADD('FROM TBCONTROLE_ACESSO A');
  QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
  QRYAUX.SQL.ADD('      A.COD_USUARIO = :PCOD_USUARIO');
  QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
  QRYAUX.PARAMBYNAME('PCOD_USUARIO').ASINTEGER := ICOD_USUARIO_ATUAL;
  QRYAUX.OPEN;

  IF QRYAUX.ISEMPTY THEN
  BEGIN
     MESSAGEDLG('O usuário atual ainda não está liberado para acessar os aplicativos do sistema.'+CHR(13)+
                 'Por favor, solicite a liberação dos aplicativos.',MTINFORMATION,[MBOK],1);
     ABORT;
  END
  ELSE
  BEGIN
     IF QRYAUX.FIELDBYNAME('LIBERACAO').ASSTRING = 'N' THEN
     BEGIN
        MESSAGEDLG('Você não tem permissão para acessar o aplicativo.'+CHR(13)+
        'Por favor, solicite a liberação do aplicativo.'
                   ,MTINFORMATION,[MBOK],1);
        ABORT;
     END;
  END;

  TRY
     Application.CreateForm(TFMCADUSUARIO1,FMCADUSUARIO1);
     FMCADUSUARIO1.ShowModal;
   FINALLY
      FMCADUSUARIO1.FREE;
   END;
end;

end.
