unit FMCADTERCEIROS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOCADASTRO, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, Vcl.Imaging.jpeg, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TFMCADTERCEIROS1 = class(TFMPADRAOCADASTRO1)
    Label27: TLabel;
    Label6: TLabel;
    DBTXTCODIGO: TDBEdit;
    Label5: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBTXTRAZAO_SOCIAL: TDBEdit;
    DBTXTCNPJ: TDBEdit;
    DBTXTENDERECO: TDBEdit;
    DBTXTNUMERO: TDBEdit;
    DBTXTBAIRRO: TDBEdit;
    DBTXTCEP: TDBEdit;
    Label2: TLabel;
    Label4: TLabel;
    DBTXTNOME_FANTASIA: TDBEdit;
    Label25: TLabel;
    DBTXTOBSERVACAO: TDBMemo;
    QRYTERCEIRO: TZQuery;
    DSTERCEIRO: TDataSource;
    QRYTERCEIROCOD_EMPRESA: TFloatField;
    QRYTERCEIROCOD_TERCEIRO: TFloatField;
    QRYTERCEIRONOME_FANTASIA: TWideStringField;
    QRYTERCEIROSITUACAO: TWideStringField;
    QRYTERCEIROOBSERVACOES: TWideStringField;
    QRYTERCEIROENDERECO: TWideStringField;
    QRYTERCEIROCEP: TWideStringField;
    QRYTERCEIROBAIRRO: TWideStringField;
    QRYTERCEIRONUMERO: TFloatField;
    QRYTERCEIRORAZAO_SOCIAL: TWideStringField;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBL_CIDADE: TDBLookupComboBox;
    DBTXTUF: TDBEdit;
    DBTXTPAIS: TDBEdit;
    QRYCIDADE: TZQuery;
    QRYCIDADECOD_IBGE: TFloatField;
    QRYCIDADENOME: TWideStringField;
    QRYCIDADEUF: TWideStringField;
    QRYCIDADEPAIS: TWideStringField;
    QRYCIDADEAREA: TFloatField;
    QRYCIDADEPOPULACAO: TFloatField;
    QRYCIDADECOD_UF: TFloatField;
    DSCIDADE: TDataSource;
    QRYTERCEIROCOD_CIDADE: TFloatField;
    Label11: TLabel;
    Label9: TLabel;
    LBLSITUACAO: TLabel;
    DBC_SITUACAO: TDBComboBox;
    QRYTERCEIROCNPJ: TWideStringField;
    DBGRIDTABELADBTableView1COD_TERCEIRO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_FANTASIA: TcxGridDBColumn;
    DBGRIDTABELADBTableView1SITUACAO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    PROCEDURE CARREGA_CIDADES;
    procedure FormShow(Sender: TObject);
    procedure DBC_SITUACAOChange(Sender: TObject);
    procedure DBTXTCNPJExit(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure CARREGA_GRID;
    procedure TXTPESQUISA_PRINCIPALChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure DBTXTCEPExit(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
    FUNCTION  EXISTE_SERV_TERCEIRO_MOV :BOOLEAN;
    PROCEDURE VERIFICA_DUPLICIDADE_CADASTRO;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADTERCEIROS1: TFMCADTERCEIROS1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, UNROTINASGERAIS;

procedure TFMCADTERCEIROS1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
   QRYTERCEIRO.Prior;
end;

procedure TFMCADTERCEIROS1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
 HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

  QRYTERCEIRO.CANCEL;
  DBC_SITUACAOCHANGE(SELF);

  DBTXTCNPJ.READONLY := FALSE;
  DBTXTRAZAO_SOCIAL.READONLY := FALSE;
  //DBTXTCNPJ.READONLY := FALSE;
end;

procedure TFMCADTERCEIROS1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
  DBTXTCNPJ.READONLY := TRUE;
  DBTXTRAZAO_SOCIAL.READONLY := TRUE;
  //DBTXTCNPJ.READONLY := TRUE;
  HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);
   CARREGA_CIDADES;
   QRYTERCEIRO.EDIT;
   DBTXTNOME_FANTASIA.SETFOCUS;
end;

procedure TFMCADTERCEIROS1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;
   IF EXISTE_SERV_TERCEIRO_MOV THEN
   BEGIN
     APPLICATION.MessageBox('O terceiro não pode ser excluído pois já está sendo utilizado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     ABORT;
   END;

  IF QRYTERCEIRO.IsEmpty THEN
  BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluido!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;


  QRYTERCEIRO.Edit;
  QRYTERCEIROSITUACAO.AsString := 'E';
  QRYTERCEIRO.Post;
  QRYTERCEIRO.FIRST;
  //QRYTERCEIRO.Delete;

  MDPRINCIPAL.COMMIT;
  PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);
  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADTERCEIROS1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
   HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                      BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                       BTNCANCELAR, BTNEXLCUIR, PNDADOS);

    QRYTERCEIRO.CLOSE;
    QRYTERCEIRO.OPEN;
    QRYTERCEIRO.INSERT;
    QRYTERCEIROCOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
    QRYTERCEIROSITUACAO.AsString := 'A';
    DBC_SITUACAOChange(SELF);

    QRYAUX.Close;
    QRYAUX.SQL.Clear;
    QRYAUX.SQL.Add('SELECT NVL(MAX(COD_TERCEIRO),0)+1 COD_TERCEIRO FROM TBTERCEIROS');
    QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA');
    QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
    QRYAUX.Open;

    CARREGA_CIDADES;
    QRYTERCEIROCOD_TERCEIRO.AsInteger := QRYAUX.FieldByName('COD_TERCEIRO').AsInteger;
    DBTXTCNPJ.SETFOCUS;
end;

procedure TFMCADTERCEIROS1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
   QRYTERCEIRO.Next;
end;

procedure TFMCADTERCEIROS1.BTNSALVARClick(Sender: TObject);
begin
  inherited;

   IF QRYTERCEIROSITUACAO.AsString = 'I' then
   BEGIN
    IF EXISTE_SERV_TERCEIRO_MOV THEN
     BEGIN
       APPLICATION.MessageBox('O terceiro não pode ser inativado pois já está sendo utilizado.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       ABORT;
     END;
   END;

   if TRIM(QRYTERCEIROCNPJ.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o CNPJ do terceiro',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCNPJ.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTERCEIRORAZAO_SOCIAL.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a razão social do terceiro',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTRAZAO_SOCIAL.SetFocus;
      ABORT;
   END;
    if TRIM(QRYTERCEIRONOME_FANTASIA.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o nome fantasia do terceiro',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNOME_FANTASIA.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTERCEIROENDERECO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o endereço',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTENDERECO.SetFocus;
      ABORT;
   END;

   if TRIM(QRYTERCEIRONUMERO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o número',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTNUMERO.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTERCEIROBAIRRO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o bairro',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTBAIRRO.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTERCEIROCEP.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar o CEP',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCEP.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTERCEIROCOD_CIDADE.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a cidade do terceiro',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBL_CIDADE.SetFocus;
      ABORT;
   END;
   if TRIM(QRYTERCEIROSITUACAO.AsString) = '' then
   BEGIN
      APPLICATION.MessageBox('É obrigatório informar a situação',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_SITUACAO.SetFocus;
      ABORT;
   END;

   VERIFICA_DUPLICIDADE_CADASTRO;
   HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYTERCEIRO.POST;
   MDPRINCIPAL.COMMIT;
   DBTXTCNPJ.READONLY := FALSE;
   DBTXTRAZAO_SOCIAL.READONLY := FALSE;
   //DBTXTCNPJ.READONLY := FALSE;
end;

procedure TFMCADTERCEIROS1.CARREGA_CIDADES;
begin
   QRYCIDADE.CLOSE;
   QRYCIDADE.SQL.Clear;
   QRYCIDADE.SQL.Add('SELECT * FROM TBCIDADES');
   {if QRYTERCEIROCOD_CIDADE.ASINTEGER <> 0 then
   BEGIN
     QRYCIDADE.SQL.Add('WHERE COD_IBGE  = :PCOD_CIDADE');
     QRYCIDADE.ParamByName('PCOD_CIDADE').ASINTEGER := QRYTERCEIROCOD_CIDADE.ASINTEGER;
   END; }
   QRYCIDADE.Open;
end;

procedure TFMCADTERCEIROS1.CARREGA_GRID;
begin
   QRYTERCEIRO.Close;
   QRYTERCEIRO.SQL.Clear;
   QRYTERCEIRO.SQL.Add('SELECT * FROM TBTERCEIROS');
   QRYTERCEIRO.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA AND ');
   QRYTERCEIRO.SQL.Add('      SITUACAO <> ''E'' AND ');
   QRYTERCEIRO.SQL.Add('      (UPPER(NOME_FANTASIA) LIKE :PNOME OR ');
   QRYTERCEIRO.SQL.Add('       UPPER(RAZAO_SOCIAL)  LIKE :PNOME )');
   QRYTERCEIRO.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYTERCEIRO.ParamByName('PNOME').AsString := '%'+TXTPESQUISA_PRINCIPAL.Text+'%';
   QRYTERCEIRO.Open;
end;

procedure TFMCADTERCEIROS1.DBC_SITUACAOChange(Sender: TObject);
begin
  inherited;
  if DBC_SITUACAO.Text  = 'A' then
   BEGIN
      LBLSITUACAO.Caption := 'Ativo'
   END
   ELSE if DBC_SITUACAO.Text  = 'I' then
   BEGIN
      LBLSITUACAO.Caption := 'Inativo'
   END
   ELSE
      LBLSITUACAO.Caption := ''
end;

procedure TFMCADTERCEIROS1.DBTXTCEPExit(Sender: TObject);
VAR
SCEP :STRING;
begin
  inherited;
 SCEP := STRINGREPLACE(STRINGREPLACE(QRYTERCEIROCEP.ASSTRING, '-', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]);
 IF TRIM(SCEP) <> '' THEN
 BEGIN
   IF LENGTH(TRIM(SCEP)) < 8 THEN
   BEGIN
      APPLICATION.MessageBox('O cep informado deve conter 8 dígitos',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCEP.SETFOCUS;
      ABORT;
   END;
 END;
end;

procedure TFMCADTERCEIROS1.DBTXTCNPJExit(Sender: TObject);
VAR S_CNPJ :STRING;
begin
  inherited;
  IF QRYTERCEIROCNPJ.ASSTRING <> '' THEN
  BEGIN
    S_CNPJ := STRINGREPLACE(STRINGREPLACE(STRINGREPLACE(QRYTERCEIROCNPJ.ASSTRING, '/', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]), '-', '',[RFREPLACEALL, RFIGNORECASE]);
    if NOT VALIDAR_CNPJ(S_CNPJ) then
    BEGIN
      APPLICATION.MessageBox('CNPJ inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCNPJ.SETFOCUS;
      ABORT;
    END;
    VERIFICA_DUPLICIDADE_CADASTRO;
  END;
end;
FUNCTION TFMCADTERCEIROS1.EXISTE_SERV_TERCEIRO_MOV :BOOLEAN;
begin
//
   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.Add('SELECT SUM(X.QTDE) "QTDE"');
   QRYAUX.SQL.Add('FROM (SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.Add('       FROM TBTERCEIROS T, TBSERVICOS2 S, TBITENS_ORCAMENTO_TERCEIRO A, TBHEADER_ORCAMENTO B');
   QRYAUX.SQL.Add('       WHERE T.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('             T.COD_TERCEIRO = :PCOD_TERCEIRO AND');
   QRYAUX.SQL.Add('             S.COD_EMPRESA = T.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             S.COD_TERCEIRO = T.COD_TERCEIRO AND');
   QRYAUX.SQL.Add('             A.COD_EMPRESA = S.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             A.COD_SERVICO_TERC = S.COD_SERVICO_TERCEIRO AND');
   QRYAUX.SQL.Add('             B.COD_ORCAMENTO = A.COD_ORCAMENTO AND');
   QRYAUX.SQL.Add('             B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             B.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYAUX.SQL.Add('             B.SITUACAO = ''A''');
   QRYAUX.SQL.Add('       UNION ALL');
   QRYAUX.SQL.Add('       SELECT COUNT(1) QTDE');
   QRYAUX.SQL.Add('       FROM TBTERCEIROS T, TBSERVICOS2 S, TBITENS_ORCAMENTO A, TBHEADER_ORCAMENTO B');
   QRYAUX.SQL.Add('       WHERE T.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.Add('             T.COD_TERCEIRO = :PCOD_TERCEIRO AND');
   QRYAUX.SQL.Add('             S.COD_EMPRESA = T.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             S.COD_TERCEIRO = T.COD_TERCEIRO AND');
   QRYAUX.SQL.Add('             A.COD_EMPRESA = S.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             A.COD_SERVICO_TERCEIRO = S.COD_SERVICO_TERCEIRO AND');
   QRYAUX.SQL.Add('             B.COD_ORCAMENTO = A.COD_ORCAMENTO AND');
   QRYAUX.SQL.Add('             B.COD_EMPRESA = A.COD_EMPRESA AND');
   QRYAUX.SQL.Add('             B.COD_CLIENTE = A.COD_CLIENTE AND');
   QRYAUX.SQL.Add('             B.SITUACAO = ''A'') X');
   QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
   QRYAUX.ParamByName('PCOD_TERCEIRO').AsInteger := QRYTERCEIROCOD_TERCEIRO.AsInteger;
   QRYAUX.OPEN;

   EXISTE_SERV_TERCEIRO_MOV := FALSE;
   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     EXISTE_SERV_TERCEIRO_MOV := TRUE;
   END;
end;

procedure TFMCADTERCEIROS1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  IF PGPRINCIPAL.ACTIVEPAGE = TSCADASTRO THEN
  BEGIN
     IF KEY = VK_F2 THEN
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
     END;
  END;
end;

procedure TFMCADTERCEIROS1.FormShow(Sender: TObject);
begin
  inherited;
   QRYTERCEIRO.Active := TRUE;
   DBC_SITUACAOChange(SELF);
   CARREGA_CIDADES;
end;

procedure TFMCADTERCEIROS1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('11');
end;

procedure TFMCADTERCEIROS1.PGPRINCIPALChange(Sender: TObject);
begin
  inherited;
  if (QRYTERCEIRO.State = DSINSERT) OR (QRYTERCEIRO.State = DSEDIT) then
  begin
    IF PGPRINCIPAL.ActivePage <> TSCADASTRO THEN
    BEGIN
      APPLICATION.MessageBox('Não é possivel alterar de abas quando estiver em modo de Inserção ou Edição.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      PGPRINCIPAL.ActivePage := TSCADASTRO;
      ABORT;
    END;
  end;

  if PGPRINCIPAL.ActivePage = TSCONSULTA then
  BEGIN
    TXTPESQUISA_PRINCIPAL.Text := '';
    CARREGA_GRID;
  END
  ELSE
  BEGIN
    DBC_SITUACAOChange(SELF);
    //DBTXTCOD_FUNCAOExit(SELF);
  END;
end;

procedure TFMCADTERCEIROS1.TXTPESQUISA_PRINCIPALChange(Sender: TObject);
begin
  inherited;
   CARREGA_GRID;
end;

procedure TFMCADTERCEIROS1.VERIFICA_DUPLICIDADE_CADASTRO;
begin
     QRYAUX.CLOSE;
     QRYAUX.SQL.CLEAR;
     QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE" FROM TBTERCEIROS A');
     QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
     QRYAUX.SQL.ADD('      A.CNPJ = :PCNPJ AND ');
     QRYAUX.SQL.ADD('      A.SITUACAO    <> ''E'' AND ');
     QRYAUX.SQL.ADD('      A.COD_TERCEIRO <> :PCOD_TERCEIRO');
     QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
     QRYAUX.PARAMBYNAME('PCNPJ').ASSTRING        := QRYTERCEIROCNPJ.ASSTRING;
     QRYAUX.PARAMBYNAME('PCOD_TERCEIRO').ASINTEGER := QRYTERCEIROCOD_TERCEIRO.ASINTEGER;
     QRYAUX.OPEN;

     IF QRYAUX.FieldByName('QTDE').AsInteger > 0 then
     BEGIN
       MESSAGEDLG('CNPJ já existente, por favor cadastre outro para prosseguir!',MTINFORMATION,[MBOK],1);
       DBTXTCNPJ.SETFOCUS;
       ABORT;
     END;
end;

end.
