unit FMCADCLIENTE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOCADASTRO, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Vcl.Mask, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, Vcl.Imaging.jpeg, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,shellapi;

type
  TFMCADCLIENTE1 = class(TFMPADRAOCADASTRO1)
    QRYCLIENTE: TZQuery;
    DSCLIENTE: TDataSource;
    Notebook1: TNotebook;
    GBPRINCIPAL_FISICA: TGroupBox;
    Label5: TLabel;
    DBTXTNOME: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBTXTCPF: TDBEdit;
    Label9: TLabel;
    Label11: TLabel;
    DBTXTDATA_NASCIMENTO: TcxDBDateEdit;
    Label12: TLabel;
    DBTXTENDERECO: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    DBTXTNUMERO: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBTXTBAIRRO: TDBEdit;
    Label17: TLabel;
    Label18: TLabel;
    DBTXTCEP: TDBEdit;
    Label19: TLabel;
    LBLCOD_PROPRIET: TLabel;
    BIB_BUSCA_RAMO_ATIVIDADE: TBitBtn;
    TXTDESC_RAMO_ATIVIDADE: TEdit;
    DBTXTRAMO_ATIVIDADE: TDBEdit;
    Label20: TLabel;
    DBTXTEMAIL: TDBEdit;
    GBDADOS_BANCARIOS: TGroupBox;
    Label22: TLabel;
    BIB_BUSCA_BANCO: TBitBtn;
    TXTBANCO: TEdit;
    DBTXTBANCO: TDBEdit;
    Label23: TLabel;
    DBTXTAGENCIA: TDBEdit;
    Label24: TLabel;
    DBTXTCONTA_BCO: TDBEdit;
    Label25: TLabel;
    DBTXTOBSERVACAO: TDBMemo;
    GB_DADOS_ADICIONAIS: TGroupBox;
    Label26: TLabel;
    DBTXTFACEBOOK: TDBEdit;
    DBTXTWHATS_APP: TDBEdit;
    Label29: TLabel;
    DBTXTTELEFONE_CELULAR: TDBEdit;
    Label27: TLabel;
    DBTXTTELEFONE_FIXO: TDBEdit;
    Label28: TLabel;
    DBTXTCONTATO_PRINCIPAL: TDBEdit;
    Label30: TLabel;
    PNL_PRINCIPAL: TPanel;
    Label4: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    LBL_TP_PESSOA: TLabel;
    DBTXTCOD_CLIENTE: TDBEdit;
    BIBPONTOS_PRINCIPAL: TBitBtn;
    DBC_TIPO_PESSOA: TDBComboBox;
    RG_CADASTRO: TRadioGroup;
    BIB_BUSCA_CLIENTE: TBitBtn;
    TXTCLIENTE: TEdit;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_C1: TWideStringField;
    QRYPARAMPARAM_C2: TWideStringField;
    DSPARAM: TDataSource;
    Label31: TLabel;
    Label32: TLabel;
    DBL_CIDADE: TDBLookupComboBox;
    QRYCIDADE: TZQuery;
    QRYCIDADECOD_IBGE: TFloatField;
    QRYCIDADENOME: TWideStringField;
    QRYCIDADEUF: TWideStringField;
    QRYCIDADEPAIS: TWideStringField;
    QRYCIDADEAREA: TFloatField;
    QRYCIDADEPOPULACAO: TFloatField;
    QRYCIDADECOD_UF: TFloatField;
    DSCIDADE: TDataSource;
    Label33: TLabel;
    Label34: TLabel;
    DBTXTUF: TDBEdit;
    DBTXTPAIS: TDBEdit;
    GBPRINCIPAL_JURIDICA: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    DBTXTNOME_FANTASIA: TDBEdit;
    DBTXTCNPJ: TDBEdit;
    DBTXTENDERECO_JURID: TDBEdit;
    DBTXTNUMERO_JURID: TDBEdit;
    DBTXTBAIRRO_JURID: TDBEdit;
    DBTXTCEP_JURID: TDBEdit;
    BIBBUSCA_RAMO_ATIVIDADE: TBitBtn;
    TXTRAMO_ATIVIDADE_JURID: TEdit;
    DBTXTRAMO_ATIVIDADE_JURID: TDBEdit;
    DBTXTEMAIL_JURID: TDBEdit;
    GroupBox1: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    BIBBUSCA_BANCO_JURID: TBitBtn;
    TXTBANCO_JURID: TEdit;
    DBTXTCOD_BANCO_JURID: TDBEdit;
    DBTXTAGENCIA_JURID: TDBEdit;
    DBTXTCONTA_JURID: TDBEdit;
    DBTXTOBS_JURID: TDBMemo;
    GroupBox3: TGroupBox;
    Label63: TLabel;
    Label64: TLabel;
    DBTXTFACEBOOK_JURID: TDBEdit;
    DBTXTWHATS_JURID: TDBEdit;
    DBTXTCONTATO_JURID: TDBEdit;
    DBLCIDADE_JURID: TDBLookupComboBox;
    DBTXTUF_JURID: TDBEdit;
    DBTXTPAIS_JURID: TDBEdit;
    Label53: TLabel;
    DBTXTTELEFONE_JURID: TDBEdit;
    DBTXTTELEFONE_FIXO_JURID: TDBEdit;
    Label54: TLabel;
    Label39: TLabel;
    DBTXTIE: TDBEdit;
    Label65: TLabel;
    DBTXTQTDE_FUNC: TDBEdit;
    Label66: TLabel;
    DBTXTCAPITAL_REG_JURID: TDBEdit;
    Label67: TLabel;
    DBTXTREGISTRO_JUNTA_JURID: TDBEdit;
    Label51: TLabel;
    Label68: TLabel;
    DBTXTRAZAO_SOCIAL: TDBEdit;
    QRYCLIENTECOD_EMPRESA: TFloatField;
    QRYCLIENTECOD_CLIENTE: TFloatField;
    QRYCLIENTECOD_CIDADE: TFloatField;
    QRYCLIENTENOME_NOME_FANTASIA: TWideStringField;
    QRYCLIENTERAZAO_SOCIAL: TWideStringField;
    QRYCLIENTECPF: TWideStringField;
    QRYCLIENTETIPO_PESSOA: TWideStringField;
    QRYCLIENTEENDERECO: TWideStringField;
    QRYCLIENTENUMERO: TFloatField;
    QRYCLIENTEBAIRRO: TWideStringField;
    QRYCLIENTECOMPLEMENTO: TWideStringField;
    QRYCLIENTECEP: TWideStringField;
    QRYCLIENTERAMO_ATIVIDADE: TWideStringField;
    QRYCLIENTEDATA_CADASTRO: TDateTimeField;
    QRYCLIENTEEMAIL: TWideStringField;
    QRYCLIENTECOD_BANCO: TWideStringField;
    QRYCLIENTECOD_AGENCIA: TFloatField;
    QRYCLIENTECOD_CONTA_BANCO: TFloatField;
    QRYCLIENTEOBSERVACAO: TWideStringField;
    QRYCLIENTEREGISTRO_JUNTA: TWideStringField;
    QRYCLIENTEQUANTIDADE_FUNCIONARIOS: TFloatField;
    QRYCLIENTEINSCRICAO_ESTADUAL: TWideStringField;
    QRYCLIENTETELEFONE_CELULAR: TWideStringField;
    QRYCLIENTETELEFONE_FIXO: TWideStringField;
    QRYCLIENTEDATA_NASCIMENTO: TDateTimeField;
    QRYCLIENTEFACEBOOK: TWideStringField;
    QRYCLIENTEWHATS_APP: TWideStringField;
    QRYCLIENTECONTATO_PRINCIPAL: TWideStringField;
    QRYCLIENTESITUACAO: TWideStringField;
    QRYCLIENTECNPJ: TWideStringField;
    RG_TIPO_PESSOA: TRadioGroup;
    DBGRIDTABELADBTableView1COD_CLIENTE: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NOME_NOME_FANTASIA: TcxGridDBColumn;
    DBGRIDTABELADBTableView1RAZAO_SOCIAL: TcxGridDBColumn;
    DBGRIDTABELADBTableView1CPF: TcxGridDBColumn;
    DBGRIDTABELADBTableView1ENDERECO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1NUMERO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1BAIRRO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1COMPLEMENTO: TcxGridDBColumn;
    DBGRIDTABELADBTableView1CEP: TcxGridDBColumn;
    DBGRIDTABELADBTableView1CNPJ: TcxGridDBColumn;
    QRYCLIENTENOME_CIDADE: TStringField;
    Label21: TLabel;
    Label40: TLabel;
    QRYCLIENTECAPITAL_REGISTRADO: TFloatField;
    QRYCLIENTEAGENCIA: TWideStringField;
    QRYCLIENTECONTA: TWideStringField;
    procedure FormShow(Sender: TObject);
    procedure DBC_TIPO_PESSOAChange(Sender: TObject);
    procedure PGPRINCIPALChange(Sender: TObject);
    procedure CARREGA_GRID;
    procedure BTNANTERIORClick(Sender: TObject);
    procedure BTNPROXIMOClick(Sender: TObject);
    procedure BTNINCLUIRClick(Sender: TObject);
    procedure BTNEDITARClick(Sender: TObject);
    procedure BTNEXLCUIRClick(Sender: TObject);
    procedure BTNSALVARClick(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BIBPONTOS_PRINCIPALEnter(Sender: TObject);
    procedure RG_CADASTROClick(Sender: TObject);
    procedure BIB_BUSCA_CLIENTEClick(Sender: TObject);
    procedure DBTXTCOD_CLIENTEExit(Sender: TObject);
    procedure BIB_BUSCA_RAMO_ATIVIDADEClick(Sender: TObject);
    procedure DBTXTRAMO_ATIVIDADEExit(Sender: TObject);
    procedure BIB_BUSCA_BANCOClick(Sender: TObject);
    procedure DBTXTBANCOExit(Sender: TObject);
    procedure BIBBUSCA_RAMO_ATIVIDADEClick(Sender: TObject);
    procedure DBTXTRAMO_ATIVIDADE_JURIDExit(Sender: TObject);
    procedure BIBBUSCA_BANCO_JURIDClick(Sender: TObject);
    procedure DBTXTCOD_BANCO_JURIDExit(Sender: TObject);
    procedure DBTXTCPFExit(Sender: TObject);
    procedure DBTXTCNPJExit(Sender: TObject);
    procedure DBTXTEMAIL_JURIDExit(Sender: TObject);
    procedure DBTXTEMAILExit(Sender: TObject);
    procedure RG_TIPO_PESSOAClick(Sender: TObject);
    procedure QRYCLIENTECalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBTXTCEPExit(Sender: TObject);
    procedure DBTXTCEP_JURIDExit(Sender: TObject);
    procedure DBC_TIPO_PESSOAExit(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
    procedure VERIFICA_DUPLICIDADE_CADASTRO;
    FUNCTION EXISTE_CLIENTE_MOV : BOOLEAN;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMCADCLIENTE1: TFMCADCLIENTE1;

implementation

{$R *.dfm}

uses DMPRINCIPAL, FMPADRAOCONSULTA, UNROTINASGERAIS, FMPADRAOFILTRO;

procedure TFMCADCLIENTE1.BIBBUSCA_BANCO_JURIDClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
 S_FILTRO := '';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_BANCO', 'COD_BANCO "Codigo", NOME_BANCO "Nome"',
        S_FILTRO, 'Nome', 'NOME_BANCO',
        'TBBANCO', 'S', 'Banco', TRUE
     ) THEN
  BEGIN
     QRYCLIENTECOD_BANCO.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_BANCO_JURIDExit(SELF);
  END;
end;

procedure TFMCADCLIENTE1.BIBBUSCA_RAMO_ATIVIDADEClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := '';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME', 'RAMOATIVIDADE "Ramo Atividade", NOME "Nome"',
        S_FILTRO, 'Nome', 'Nome',
        'TBRAMOATIVIDADE', 'S', 'Ramo de Atividade', TRUE
     ) THEN
  BEGIN
     QRYCLIENTERAMO_ATIVIDADE.ASSTRING := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Ramo Atividade').ASSTRING;
     DBTXTRAMO_ATIVIDADE_JURIDExit(SELF);
  END;
end;

procedure TFMCADCLIENTE1.BIBPONTOS_PRINCIPALEnter(Sender: TObject);
begin
  inherited;
   if RG_CADASTRO.ItemIndex = 1 then
   BEGIN
     if TRIM(DBTXTCOD_CLIENTE.Text) = '' then
     BEGIN
        APPLICATION.MessageBox('Informe um cliente para Prosseguir',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_CLIENTE.SetFocus;
        ABORT;
     END;
   END;

   if TRIM(DBC_TIPO_PESSOA.Text) = '' then
   BEGIN
      APPLICATION.MessageBox('Informe um tipo de Pessoa para Prosseguir',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBC_TIPO_PESSOA.SetFocus;
      ABORT;
   END;

   if RG_CADASTRO.ItemIndex = 1 then
   BEGIN
       if QRYPARAMPARAM_C1.AsString <> '' then
       BEGIN
         QRYAUX.Close;
         QRYAUX.SQL.Clear;
         QRYAUX.SQL.Add('SELECT COUNT(1) "QTDE"');
         QRYAUX.SQL.Add('FROM TBCLIENTE ');
         QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PEMP AND');
         QRYAUX.SQL.Add('      COD_CLIENTE = :PCOD_CLIENTE AND ');
         QRYAUX.SQL.Add('      SITUACAO    = ''A'' AND       ');
         QRYAUX.SQL.Add('      TIPO_PESSOA = :PTIPO_PESSOA  ');
         QRYAUX.ParamByName('PEMP').AsInteger          := EMPRESA_ATUAL;
         QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger  := STRTOINT(QRYPARAMPARAM_C1.ASSTRING);
         QRYAUX.ParamByName('PTIPO_PESSOA').ASSTRING  :=  QRYPARAMPARAM_C2.ASSTRING;
         QRYAUX.Open;

         if QRYAUX.FieldByName('QTDE').AsInteger > 0 then
         BEGIN
           QRYCLIENTE.Close;
           QRYCLIENTE.SQL.Clear;
           QRYCLIENTE.SQL.Add('SELECT * FROM TBCLIENTE ');
           QRYCLIENTE.SQL.Add('WHERE COD_EMPRESA = :PEMP AND');
           QRYCLIENTE.SQL.Add('      COD_CLIENTE = :PCOD_CLIENTE AND ');
           QRYCLIENTE.SQL.Add('      SITUACAO    = ''A''        ');
           QRYCLIENTE.ParamByName('PEMP').AsInteger          := EMPRESA_ATUAL;
           QRYCLIENTE.ParamByName('PCOD_CLIENTE').AsInteger  := STRTOINT(QRYPARAMPARAM_C1.ASSTRING);
           QRYCLIENTE.Open;
           QRYCLIENTE.First;
         END;
       END;
        BTNEDITAR.Enabled    := TRUE;
        BTNCANCELAR.Enabled  := TRUE;
        BTNEXLCUIR.Enabled   := TRUE;
   END
   ELSE
   BEGIN
         QRYAUX.Close;
         QRYAUX.SQL.Clear;
         QRYAUX.SQL.Add('SELECT NVL(MAX(COD_CLIENTE), 0) + 1 COD_CLIENTE');
         QRYAUX.SQL.Add('FROM TBCLIENTE ');
         QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PEMP');
         QRYAUX.ParamByName('PEMP').AsInteger          := EMPRESA_ATUAL;
         QRYAUX.Open;

         QRYPARAMPARAM_C1.ASSTRING := INTTOSTR(QRYAUX.FieldByName('COD_CLIENTE').AsInteger);
         BTNINCLUIR.Enabled := TRUE;
         BTNCANCELAR.Enabled  := TRUE;
         BTNINCLUIRClick(SELF);

   END;
   if QRYPARAMPARAM_C2.AsString = 'F' then
   BEGIN
     Notebook1.ActivePage := 'Fisica';
     if RG_CADASTRO.ItemIndex  = 0 then
     BEGIN
        BTNINCLUIRClick(SELF);
     END
     ELSE
     BEGIN
       DBTXTBANCOExit(SELF);
       DBTXTRAMO_ATIVIDADEExit(SELF);
     END;
   END
   ELSE
   BEGIN
      Notebook1.ActivePage := 'Juridica';
      if DBTXTNOME_FANTASIA.CANFOCUS then
         DBTXTNOME_FANTASIA.SetFocus;
      if RG_CADASTRO.ItemIndex  = 0 then
      BEGIN
         BTNINCLUIRClick(SELF);
      END
      ELSE
      BEGIN
         DBTXTCOD_BANCO_JURIDExit(SELF);
         DBTXTRAMO_ATIVIDADE_JURIDExit(SELF);
      END;

   END;

   QRYCIDADE.CLOSE;
   QRYCIDADE.SQL.Clear;
   QRYCIDADE.SQL.Add('SELECT * FROM TBCIDADES');
   {if QRYCLIENTECOD_CIDADE.ASINTEGER <> 0 then
   BEGIN
     QRYCIDADE.SQL.Add('WHERE COD_IBGE  = :PCOD_CIDADE');
     QRYCIDADE.ParamByName('PCOD_CIDADE').ASINTEGER := QRYCLIENTECOD_CIDADE.ASINTEGER;
   END;}
   QRYCIDADE.Open;
   DBC_TIPO_PESSOA.ENABLED := FALSE;
   BIBPONTOS_PRINCIPAL.ENABLED := FALSE;
end;

procedure TFMCADCLIENTE1.BIB_BUSCA_BANCOClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
 S_FILTRO := '';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_BANCO', 'COD_BANCO "Codigo", NOME_BANCO "Nome"',
        S_FILTRO, 'Nome', 'NOME_BANCO',
        'TBBANCO', 'S', 'Banco', TRUE
     ) THEN
  BEGIN
     QRYCLIENTECOD_BANCO.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTBANCOExit(SELF);
  END;
end;

procedure TFMCADCLIENTE1.BIB_BUSCA_CLIENTEClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  if RG_CADASTRO.ItemIndex = 1 then
  BEGIN
     S_FILTRO := 'COD_EMPRESA = '+IntToStr(EMPRESA_ATUAL)+
                'AND SITUACAO    = ''A'' ' ;
      FMPADRAOCONSULTA1.QRY.CLOSE;
      IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
            'NOME_NOME_FANTASIA', 'COD_CLIENTE "Codigo", NOME_NOME_FANTASIA "Nome", TIPO_PESSOA "Tipo Pessoa"',
            S_FILTRO, 'Nome', 'COD_CLIENTE',
            'TBCLIENTE', 'S', 'Clientes', TRUE
         ) THEN
      BEGIN
         QRYPARAMPARAM_C1.AsSTRING := INTTOSTR(FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER);
         DBTXTCOD_CLIENTEExit(SELF);
       //  SELECTNEXT(BIB_BUSCA_CLIENTE, TRUE, TRUE);
      END;
   END;
end;
procedure TFMCADCLIENTE1.BIB_BUSCA_RAMO_ATIVIDADEClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := '';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME', 'RAMOATIVIDADE "Ramo Atividade", NOME "Nome"',
        S_FILTRO, 'Nome', 'Nome',
        'TBRAMOATIVIDADE', 'S', 'Ramo de Atividade', TRUE
     ) THEN
  BEGIN
     QRYCLIENTERAMO_ATIVIDADE.ASSTRING := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Ramo Atividade').ASSTRING;
     DBTXTRAMO_ATIVIDADEExit(SELF);
  END;
end;

procedure TFMCADCLIENTE1.BTNANTERIORClick(Sender: TObject);
begin
  inherited;
   QRYCLIENTE.Prior;
   QRYPARAMPARAM_C1.AsInteger := QRYCLIENTECOD_CLIENTE.AsInteger;
   DBTXTCOD_CLIENTEExiT(SELF);
end;

procedure TFMCADCLIENTE1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
  {HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                    BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                  BTNCANCELAR,   BTNEXLCUIR, PNDADOS);}
  DBC_TIPO_PESSOA.ENABLED := TRUE;
  BIBPONTOS_PRINCIPAL.ENABLED := TRUE;
  RG_CADASTRO.ItemIndex := 0;
  PNL_PRINCIPAL.Enabled := TRUE;
  QRYPARAMPARAM_C1.AsString := '';
  TXTCLIENTE.Text := '';
  RG_CADASTRO.ItemIndex := 0;
  RG_CADASTROClick(SELF);

  QRYCLIENTE.CANCEL;
  QRYCLIENTE.Close;
  QRYCIDADE.CANCEL;
  QRYCIDADE.Close;

   //if DBC_TIPO_PESSOA.Text = 'F' then
   // BEGIN
       //DBTXTNOME.ReadOnly := TRUE;
       DBTXTCPF.READONLY  := FALSE;
    //END
    //ELSE if DBC_TIPO_PESSOA.Text = 'J' then
    //BEGIN
       DBTXTRAZAO_SOCIAL.ReadOnly := FALSE;
       DBTXTCNPJ.ReadOnly := FALSE;
    //END;


end;

procedure TFMCADCLIENTE1.BTNEDITARClick(Sender: TObject);
begin
  inherited;
  if DBC_TIPO_PESSOA.Text = 'F' then
  BEGIN
     //DBTXTNOME.ReadOnly := TRUE;
     DBTXTCPF.READONLY  := TRUE;
  END
  ELSE if DBC_TIPO_PESSOA.Text = 'J' then
  BEGIN
     DBTXTRAZAO_SOCIAL.ReadOnly := TRUE;
     DBTXTCNPJ.ReadOnly := TRUE;
  END;


    HABILITABOTOES(1, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                     BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                      BTNCANCELAR,   BTNEXLCUIR, PNDADOS);

   QRYCLIENTE.EDIT;
   if DBTXTNOME.CanFocus then
   BEGIN
      DBTXTNOME.SetFocus;
   END;
   if DBTXTNOME_FANTASIA.CanFocus theN
   BEGIN
      DBTXTNOME_FANTASIA.SetFocus;
   END;

   //DBTXTNOME.SetFocus;
end;

procedure TFMCADCLIENTE1.BTNEXLCUIRClick(Sender: TObject);
begin
  inherited;
 IF EXISTE_CLIENTE_MOV THEN
 BEGIN
   APPLICATION.MessageBox('O cliente não pode ser excluído pois já possui movimentações ligadas a ele.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
   ABORT;
 END;


 if QRYCLIENTE.IsEmpty then
 BEGIN
    APPLICATION.MessageBox('Não existe Registro para Ser Excluido!',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
    ABORT;
  END;

  IF APPLICATION.MESSAGEBOX('Deseja Realmente excluir o Registro?','Atenção',MB_ICONQUESTION+MB_YESNO) = MRNO THEN
     ABORT;

 //QRYCLIENTE.Delete;

  QRYCLIENTE.EDIT;
  QRYCLIENTESITUACAO.ASSTRING := 'E';
  QRYCLIENTE.POST;
  QRYCLIENTE.FIRST;

  MDPRINCIPAL.COMMIT;

  {PGPRINCIPAL.ActivePage := TSCONSULTA;
  PGPRINCIPALChange(SELF);

  MDPRINCIPAL.COMMIT; }
  RG_CADASTRO.ItemIndex := 0;
  RG_CADASTROClick(self);

  //ATUALIZACONEXAO2;

  APPLICATION.MessageBox('Registro excluido com sucesso.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
end;

procedure TFMCADCLIENTE1.BTNINCLUIRClick(Sender: TObject);
begin
  inherited;
  {QRYPARAMPARAM_C1.AsString := '';
  QRYPARAMPARAM_C2.AsString := 'F';
  TXTCLIENTE.Text := '';
  DBC_TIPO_PESSOAChange(SELF);  }

  HABILITABOTOES(1, BTNPROXIMO,   BTNANTERIOR, BTNINCLUIR,
                    BTNEDITAR,    BTNSALVAR,   BTNPESQUISAR,
                     BTNCANCELAR, BTNEXLCUIR, PNDADOS);

  QRYCLIENTE.CLOSE;
  QRYCLIENTE.OPEN;
  QRYCLIENTE.INSERT;
  QRYCLIENTECOD_EMPRESA.ASINTEGER := EMPRESA_ATUAL;
  QRYCLIENTECOD_CLIENTE.AsInteger := STRTOINT(QRYPARAMPARAM_C1.ASSTRING);
  QRYCLIENTETIPO_PESSOA.AsString := QRYPARAMPARAM_C2.AsString;
  QRYCLIENTEDATA_CADASTRO.AsDateTime := DATE;
  QRYCLIENTESITUACAO.ASSTRING       := 'A';
  //QRYCLIENTERAMO_ATIVIDADE.AsString := 'Distribuição';
  //QRYCLIENTECOD_BANCO.AsString      := '756';
  QRYCLIENTECOD_CIDADE.AsInteger    := 4103503;
 // DBC_TIPO_PESSOAChange(SELF);
  if DBTXTNOME.CanFocus then
     DBTXTNOME.SETFOCUS;
  if DBTXTNOME_FANTASIA.CanFOCUS then
     DBTXTNOME_FANTASIA.SetFocus;
end;

procedure TFMCADCLIENTE1.BTNPROXIMOClick(Sender: TObject);
begin
  inherited;
   QRYCLIENTE.Next;
   QRYPARAMPARAM_C1.AsInteger := QRYCLIENTECOD_CLIENTE.AsInteger;
   DBTXTCOD_CLIENTEExiT(SELF);
end;

procedure TFMCADCLIENTE1.BTNSALVARClick(Sender: TObject);
VAR
  SCPF,SCNPJ : STRING;
begin
  inherited;
   SCPF  := STRINGREPLACE(STRINGREPLACE(QRYCLIENTECPF.ASSTRING, '-', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]);
   SCNPJ := STRINGREPLACE(STRINGREPLACE(STRINGREPLACE(QRYCLIENTECNPJ.ASSTRING, '/', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]), '-', '',[RFREPLACEALL, RFIGNORECASE]);
   IF TRIM(QRYCLIENTENOME_NOME_FANTASIA.ASSTRING) = '' THEN
   BEGIN
      IF DBC_TIPO_PESSOA.TEXT = 'F' THEN
      BEGIN
        APPLICATION.MessageBox('É obrigatório informar o nome do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTNOME.SetFocus;
        ABORT;
      END
      ELSE IF DBC_TIPO_PESSOA.TEXT = 'J' THEN
      BEGIN
        APPLICATION.MessageBox('É obrigatório informar o nome fantasia do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTNOME_FANTASIA.SetFocus;
        ABORT;
      END;
   END;
   IF DBC_TIPO_PESSOA.TEXT = 'J' THEN
   begin
      IF TRIM(QRYCLIENTERAZAO_SOCIAL.ASSTRING) = '' THEN
      BEGIN
         APPLICATION.MessageBox('É obrigatório informar a razão social do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
         DBTXTRAZAO_SOCIAL.SetFocus;
         ABORT;
      END;
   end;

   IF DBC_TIPO_PESSOA.TEXT = 'F' THEN
   BEGIN
      IF TRIM(SCPF) = '' THEN
      BEGIN
        APPLICATION.MessageBox('É obrigatório informar o CPF do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCPF.SetFocus;
        ABORT;
      END;

      IF TRIM(QRYCLIENTEDATA_NASCIMENTO.ASSTRING) = '' THEN
      BEGIN
        APPLICATION.MessageBox('É obrigatório informar a data de nascimento do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTDATA_NASCIMENTO.SetFocus;
        ABORT;
      END;
    END
    ELSE IF DBC_TIPO_PESSOA.TEXT = 'J' THEN
    BEGIN


      IF TRIM(SCNPJ) = '' THEN
      BEGIN
        APPLICATION.MessageBox('É obrigatório informar o CNPJ do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCNPJ.SetFocus;
        ABORT;
      END;
      {IF TRIM(QRYCLIENTEINSCRICAO_ESTADUAL.ASSTRING) = '' THEN
      BEGIN
        APPLICATION.MessageBox('É obrigatório informar a do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCNPJ.SetFocus;
        ABORT;
      END;}
    END;

  { IF TRIM(QRYCLIENTEENDERECO.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar o endereço do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     DBTXTENDERECO.SetFocus;
     ABORT;
   END;}

   IF TRIM(QRYCLIENTEENDERECO.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar o endereço do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     IF DBTXTENDERECO.CANFOCUS THEN
        DBTXTENDERECO.SETFOCUS;
     IF DBTXTENDERECO_JURID.CANFOCUS THEN
        DBTXTENDERECO_JURID.SETFOCUS;
     ABORT;
   END;

   IF TRIM(QRYCLIENTENUMERO.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar o número do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     IF DBTXTNUMERO.CANFOCUS THEN
        DBTXTNUMERO.SETFOCUS;
     IF DBTXTNUMERO_JURID.CANFOCUS THEN
        DBTXTNUMERO_JURID.SETFOCUS;
     ABORT;
   END;

   IF TRIM(QRYCLIENTEBAIRRO.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar o bairro do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     IF DBTXTBAIRRO.CANFOCUS THEN
        DBTXTBAIRRO.SETFOCUS;
     IF DBTXTBAIRRO_JURID.CANFOCUS THEN
        DBTXTBAIRRO_JURID.SETFOCUS;
     ABORT;
   END;

   IF TRIM(QRYCLIENTECEP.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar o CEP do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     IF DBTXTCEP.CANFOCUS THEN
        DBTXTCEP.SETFOCUS;
     IF DBTXTCEP_JURID.CANFOCUS THEN
        DBTXTCEP_JURID.SETFOCUS;
     ABORT;
   END;

   IF TRIM(QRYCLIENTECOD_CIDADE.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar a cidade do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     IF DBL_CIDADE.CANFOCUS THEN
        DBL_CIDADE.SETFOCUS;
     IF DBLCIDADE_JURID.CANFOCUS THEN
        DBLCIDADE_JURID.SETFOCUS;
     ABORT;
   END;


   IF TRIM(QRYCLIENTECOD_BANCO.ASSTRING) = '' THEN
   BEGIN
     APPLICATION.MessageBox('É obrigatório informar o banco do cliente',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
     IF DBTXTBANCO.CANFOCUS THEN
        DBTXTBANCO.SETFOCUS;
     IF DBTXTCOD_BANCO_JURID.CANFOCUS THEN
        DBTXTCOD_BANCO_JURID.SETFOCUS;
     ABORT;
   END;


   {HABILITABOTOES(2, BTNPROXIMO, BTNANTERIOR,   BTNINCLUIR,
                       BTNEDITAR,   BTNSALVAR, BTNPESQUISAR,
                       BTNCANCELAR,   BTNEXLCUIR, PNDADOS); }
   VERIFICA_DUPLICIDADE_CADASTRO;
   QRYCLIENTE.POST;
   MDPRINCIPAL.COMMIT;
   DBC_TIPO_PESSOA.ENABLED := TRUE;
   BIBPONTOS_PRINCIPAL.ENABLED := TRUE;
   RG_CADASTRO.ItemIndex := 0;
   RG_CADASTROClick(SELF);
    //if DBC_TIPO_PESSOA.Text = 'F' then
    //BEGIN
       //DBTXTNOME.ReadOnly := TRUE;
       DBTXTCPF.READONLY  := FALSE;
    //END
    //ELSE if DBC_TIPO_PESSOA.Text = 'J' then
    //BEGIN
       DBTXTRAZAO_SOCIAL.ReadOnly := FALSE;
       DBTXTCNPJ.ReadOnly := FALSE;
    //END;
end;

procedure TFMCADCLIENTE1.CARREGA_GRID;
begin
 {  QRYCLIENTE.Close;
   QRYCLIENTE.SQL.Clear;
   QRYCLIENTE.SQL.Add('SELECT * FROM TBCLIENTE ');
   QRYCLIENTE.SQL.Add('WHERE COD_EMPRESA = :PEMP  ');  }
   {if TXTPESQUISA_PRINCIPAL.Text <> '' then
   BEGIN
     QRYCLIENTE.SQL.Add('AND NOME_NOME_FANTASIA LIKE ''%'+TXTPESQUISA_PRINCIPAL.Text+'%'' ');
    // QRYUSUARIO.ParamByName('PNOME').ASSTRING := TXTPESQUISA_PRINCIPAL.Text;
   END;  }
  { QRYCLIENTE.SQL.Add('AND SITUACAO = ''A''  ');
   QRYCLIENTE.ParamByName('PEMP').AsInteger := EMPRESA_ATUAL;
   QRYCLIENTE.Open;
   QRYCLIENTE.First;}
end;

procedure TFMCADCLIENTE1.DBC_TIPO_PESSOAChange(Sender: TObject);
begin
  inherited;
   if DBC_TIPO_PESSOA.Text = 'J' then
   BEGIN
     LBL_TP_PESSOA.Caption := 'Jurídica';
   END
   ELSE if DBC_TIPO_PESSOA.Text = 'F' then
   BEGIN
     LBL_TP_PESSOA.Caption := 'Física';
   END
   ELSE
      LBL_TP_PESSOA.Caption := '';

end;

procedure TFMCADCLIENTE1.DBC_TIPO_PESSOAExit(Sender: TObject);
begin
  inherited;
   BIBPONTOS_PRINCIPALEnter(SELF);
end;

procedure TFMCADCLIENTE1.DBTXTBANCOExit(Sender: TObject);
begin
  inherited;
  if QRYCLIENTECOD_BANCO.AsString <> '' then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT NOME_BANCO');
     QRYAUX.SQL.Add('FROM TBBANCO');
     QRYAUX.SQL.Add('WHERE COD_BANCO = :PCOD_BANCO');
     QRYAUX.ParamByName('PCOD_BANCO').ASINTEGER := QRYCLIENTECOD_BANCO.ASINTEGER;
     QRYAUX.Open;

     if QRYAUX.RecordCount = 0 then
     BEGIN
       APPLICATION.MessageBox('Banco não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       DBTXTBANCO.SetFocus;
       abort;
     END
     ELSE
     BEGIN
        TXTBANCO.Text := QRYAUX.FieldByName('NOME_BANCO').AsString;
        if DBTXTAGENCIA.CanFOCUS then
           DBTXTAGENCIA.SetFocus;
     END;
   END
   else
   begin
     TXTBANCO.Text := '';
   end;
end;

procedure TFMCADCLIENTE1.DBTXTCEPExit(Sender: TObject);
VAR
SCEP :STRING;
begin
  inherited;
 SCEP := STRINGREPLACE(STRINGREPLACE(QRYCLIENTECEP.ASSTRING, '-', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]);
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

procedure TFMCADCLIENTE1.DBTXTCEP_JURIDExit(Sender: TObject);
VAR
SCEP :STRING;
begin
  inherited;
 SCEP := STRINGREPLACE(STRINGREPLACE(QRYCLIENTECEP.ASSTRING, '-', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]);
 IF TRIM(SCEP) <> '' THEN
 BEGIN
   IF LENGTH(TRIM(SCEP)) < 8 THEN
   BEGIN
      APPLICATION.MessageBox('O cep informado deve conter 8 dígitos',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCEP_JURID.SETFOCUS;
      ABORT;
   END;
 END;
end;

procedure TFMCADCLIENTE1.DBTXTCNPJExit(Sender: TObject);
VAR S_CNPJ :STRING;
begin
  inherited;
  S_CNPJ := STRINGREPLACE(STRINGREPLACE(STRINGREPLACE(QRYCLIENTECNPJ.ASSTRING, '/', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]), '-', '',[RFREPLACEALL, RFIGNORECASE]);
  IF TRIM(S_CNPJ) <> '' THEN
  BEGIN
    IF NOT VALIDAR_CNPJ(S_CNPJ) THEN
    BEGIN
      APPLICATION.MessageBox('CNPJ inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCNPJ.SETFOCUS;
      ABORT;
    END;
    VERIFICA_DUPLICIDADE_CADASTRO;
  END;

end;
procedure TFMCADCLIENTE1.DBTXTCOD_BANCO_JURIDExit(Sender: TObject);
begin
  inherited;
   if QRYCLIENTECOD_BANCO.AsString <> '' then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT NOME_BANCO');
     QRYAUX.SQL.Add('FROM TBBANCO');
     QRYAUX.SQL.Add('WHERE COD_BANCO = :PCOD_BANCO');
     QRYAUX.ParamByName('PCOD_BANCO').ASINTEGER := QRYCLIENTECOD_BANCO.ASINTEGER;
     QRYAUX.Open;

     if QRYAUX.RecordCount = 0 then
     BEGIN
       APPLICATION.MessageBox('Ramo de Atividade não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       DBTXTCOD_BANCO_JURID.SetFocus;
       abort;
     END
     ELSE
     BEGIN
        TXTBANCO_JURID.Text := QRYAUX.FieldByName('NOME_BANCO').AsString;
     END;
   END;
end;

procedure TFMCADCLIENTE1.DBTXTCOD_CLIENTEExit(Sender: TObject);
begin
  inherited;
 if DBTXTCOD_CLIENTE.Text <> '' then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT NOME_NOME_FANTASIA NOME,TIPO_PESSOA');
     QRYAUX.SQL.Add('FROM TBCLIENTE');
     QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PEMP AND ');
     QRYAUX.SQL.Add('      COD_CLIENTE = :PCOD_CLIENTE AND ');
     QRYAUX.SQL.Add('      SITUACAO    = ''A''    ');
     QRYAUX.ParamByName('PEMP').AsInteger := EMPRESA_ATUAL;
     QRYAUX.ParamByName('PCOD_CLIENTE').AsInteger := STRTOINT(DBTXTCOD_CLIENTE.Text);
     QRYAUX.Open;
     if QRYAUX.IsEmpty then
     BEGIN
       APPLICATION.MessageBox('Cliente não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       DBTXTCOD_CLIENTE.SetFocus;
       abort;
     END
     ELSE
     BEGIN
       TXTCLIENTE.Text := QRYAUX.FieldByName('NOME').AsString;
       QRYPARAMPARAM_C2.AsString := QRYAUX.FieldByName('TIPO_PESSOA').AsString;
       DBC_TIPO_PESSOAChange(SELF);
       BIBPONTOS_PRINCIPALEnter(SELF);
     END;
   END
   ELSE
   BEGIN
      QRYCLIENTE.Cancel;
      QRYCLIENTE.Close;
      TXTCLIENTE.Text := '';
      TXTRAMO_ATIVIDADE_JURID.Text := '';
      TXTDESC_RAMO_ATIVIDADE.Text := '';
      TXTBANCO.Text := '';
      TXTBANCO_JURID.Text := '';
      DBTXTUF.Text := '';
      DBTXTUF_JURID.Text := '';
      DBTXTPAIS.Text := '';
      DBTXTPAIS_JURID.Text := '';
   END;

end;

procedure TFMCADCLIENTE1.DBTXTCPFExit(Sender: TObject);
VAR S_CPF :STRING;
begin
  inherited;
  S_CPF := STRINGREPLACE(STRINGREPLACE(QRYCLIENTECPF.ASSTRING, '-', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]);
  IF TRIM(S_CPF) <> '' THEN
  BEGIN
    if NOT VALIDAR_CPF(S_CPF) then
    BEGIN
      APPLICATION.MessageBox('CPF inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTCPF.SETFOCUS;
      ABORT;
    END;
    VERIFICA_DUPLICIDADE_CADASTRO;
  END;

end;

procedure TFMCADCLIENTE1.DBTXTEMAILExit(Sender: TObject);
begin
  inherited;
  IF QRYCLIENTEEMAIL.ASSTRING <> '' THEN
  BEGIN
    IF NOT VALIDAR_EMAIL(QRYCLIENTEEMAIL.ASSTRING) THEN
    BEGIN
      APPLICATION.MessageBox('Email inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTEMAIL.SETFOCUS;
      ABORT;
    END;
  END;
end;

procedure TFMCADCLIENTE1.DBTXTEMAIL_JURIDExit(Sender: TObject);
begin
  inherited;
  //S_CNPJ := STRINGREPLACE(STRINGREPLACE(STRINGREPLACE(QRYCLIENTECNPJ.ASSTRING, '/', '',[RFREPLACEALL, RFIGNORECASE]), '.', '',[RFREPLACEALL, RFIGNORECASE]), '-', '',[RFREPLACEALL, RFIGNORECASE]);
  IF QRYCLIENTEEMAIL.ASSTRING <> '' THEN
  BEGIN
    IF NOT VALIDAR_EMAIL(QRYCLIENTEEMAIL.ASSTRING) THEN
    BEGIN
      APPLICATION.MessageBox('Email inválido.',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
      DBTXTEMAIL_JURID.SETFOCUS;
      ABORT;
    END;
  END;
end;

procedure TFMCADCLIENTE1.DBTXTRAMO_ATIVIDADEExit(Sender: TObject);
begin
  inherited;
   if QRYCLIENTERAMO_ATIVIDADE.AsString <> '' then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT NOME_ABREV');
     QRYAUX.SQL.Add('FROM TBRAMOATIVIDADE');
     QRYAUX.SQL.Add('WHERE RAMOATIVIDADE = :PRAMOATIVIDADE');
     QRYAUX.ParamByName('PRAMOATIVIDADE').AsString := QRYCLIENTERAMO_ATIVIDADE.AsString;
     QRYAUX.Open;

     if QRYAUX.RecordCount = 0 then
     BEGIN
       APPLICATION.MessageBox('Ramo de Atividade não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       DBTXTRAMO_ATIVIDADE.SetFocus;
       abort;
     END
     ELSE
     BEGIN
        TXTDESC_RAMO_ATIVIDADE.Text := QRYAUX.FieldByName('NOME_ABREV').AsString;
        if DBTXTEMAIL.CanFocus then
           DBTXTEMAIL.SETFOCUS;
     END;
   END
   else
   begin
     TXTDESC_RAMO_ATIVIDADE.Text := '';
   end;
end;

procedure TFMCADCLIENTE1.DBTXTRAMO_ATIVIDADE_JURIDExit(Sender: TObject);
begin
  inherited;
  if QRYCLIENTERAMO_ATIVIDADE.AsString <> '' then
   BEGIN
     QRYAUX.Close;
     QRYAUX.SQL.Clear;
     QRYAUX.SQL.Add('SELECT NOME_ABREV');
     QRYAUX.SQL.Add('FROM TBRAMOATIVIDADE');
     QRYAUX.SQL.Add('WHERE RAMOATIVIDADE = :PRAMOATIVIDADE');
     QRYAUX.ParamByName('PRAMOATIVIDADE').AsString := QRYCLIENTERAMO_ATIVIDADE.AsString;
     QRYAUX.Open;

     if QRYAUX.RecordCount = 0 then
     BEGIN
       APPLICATION.MessageBox('Ramo de Atividade não encontrado',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
       DBTXTRAMO_ATIVIDADE_JURID.SetFocus;
       abort;
     END
     ELSE
     BEGIN
        TXTRAMO_ATIVIDADE_JURID.Text := QRYAUX.FieldByName('NOME_ABREV').AsString;
        if DBTXTEMAIL_JURID.CanFocus then
           DBTXTEMAIL_JURID.SetFocus;
     END;
   END
   ELSE
      TXTRAMO_ATIVIDADE_JURID.Text := '';
end;

function TFMCADCLIENTE1.EXISTE_CLIENTE_MOV: BOOLEAN;
VAR B_EXISTE :BOOLEAN;
begin
   B_EXISTE := FALSE;

   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.ADD('FROM TBCONTAS_RECEBER A');
   QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.ADD('      A.COD_CLIENTE = :PCOD_CLIENTE');
   QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
   QRYAUX.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER :=  QRYCLIENTECOD_CLIENTE.ASINTEGER;
   QRYAUX.OPEN;

   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     B_EXISTE := TRUE;
   END;

   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.ADD('FROM TBHEADER_ORCAMENTO A');
   QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.ADD('      A.COD_CLIENTE = :PCOD_CLIENTE');
   QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
   QRYAUX.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER :=  QRYCLIENTECOD_CLIENTE.ASINTEGER;
   QRYAUX.OPEN;

   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     B_EXISTE := TRUE;
   END;

   QRYAUX.CLOSE;
   QRYAUX.SQL.CLEAR;
   QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE"');
   QRYAUX.SQL.ADD('FROM TBHEADERORDEM_SERVICO A');
   QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYAUX.SQL.ADD('      A.COD_CLIENTE = :PCOD_CLIENTE');
   QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
   QRYAUX.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER :=  QRYCLIENTECOD_CLIENTE.ASINTEGER;
   QRYAUX.OPEN;

   IF QRYAUX.FIELDBYNAME('QTDE').ASINTEGER > 0 THEN
   BEGIN
     B_EXISTE := TRUE;
   END;

   EXISTE_CLIENTE_MOV := B_EXISTE;

end;

procedure TFMCADCLIENTE1.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFMCADCLIENTE1.FormShow(Sender: TObject);
begin
  inherited;
  QRYPARAM.CANCEL;
  QRYPARAM.CLOSE;
  QRYPARAM.OPEN;
  QRYPARAM.INSERT;

  DSPADRAO.DATASET := QRYCLIENTE;
//  DBTXTCPF.FIELD.EDITMASK := '000-000-000-00;1;_';
  PGPRINCIPALCHANGE(SELF);
  MONTACAMPOSQUERY(QRYCLIENTE);
  PGPRINCIPAL.ACTIVEPAGE.TABVISIBLE := FALSE;
  //DBC_TIPO_PESSOA.TEXT := 'F';
  QRYPARAMPARAM_C2.ASSTRING := 'F';
  Notebook1.ActivePage := 'Fisica';
  DBC_TIPO_PESSOACHANGE(SELF);
  RG_CADASTROCLICK(SELF);
  //RG_CADASTRO.SetFocus;


end;

procedure TFMCADCLIENTE1.MNUAJUDAClick(Sender: TObject);
BEGIN
  ABRIR_AJUDA('2');
END;
procedure TFMCADCLIENTE1.PGPRINCIPALChange(Sender: TObject);
begin
  inherited;
 if (QRYCLIENTE.State = DSINSERT) OR (QRYCLIENTE.State = DSEDIT) then
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
    //CARREGA_GRID;
  END
  ELSE
  BEGIN
    //CB_TIPO_USUARIOChange(SELF);
    DBC_TIPO_PESSOAChange(SELF);
  END;

  RG_TIPO_PESSOA.ItemIndex := 0;
  RG_TIPO_PESSOACLICK(SELF);
end;

procedure TFMCADCLIENTE1.QRYCLIENTECalcFields(DataSet: TDataSet);
begin
  inherited;
  { QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('SELECT NOME ');
   QRYAUX.SQL.Add('FROM TBCIDADES');
   QRYAUX.SQL.Add('WHERE COD_CIDADE = :PCOD_CIDADE');
   QRYAUX.SQL.Add('');
   QRYAUX.SQL.Add('');
   QRYAUX.SQL.Add('');  }
end;

procedure TFMCADCLIENTE1.RG_CADASTROClick(Sender: TObject);
begin
  inherited;
  {QRYCLIENTE.Close;
  QRYCIDADE.Close;}
  BTNPROXIMO.ENABLED   := FALSE;
  BTNANTERIOR.ENABLED  := FALSE;
  BTNINCLUIR.ENABLED   := FALSE;
  BTNEDITAR.ENABLED    := FALSE;
  BTNEXLCUIR.ENABLED   := FALSE;
  BTNSALVAR.ENABLED    := FALSE;
  BTNCANCELAR.ENABLED  := FALSE;
  BTNPESQUISAR.ENABLED := FALSE;
  PNDADOS.ENABLED      := FALSE;

  TXTCLIENTE.TEXT := '';
  TXTDESC_RAMO_ATIVIDADE.TEXT := '';
  TXTBANCO.TEXT := '';
  TXTRAMO_ATIVIDADE_JURID.TEXT := '';
  TXTBANCO_JURID.TEXT := '';
  QRYPARAMPARAM_C1.ASSTRING := '';
  QRYPARAMPARAM_C2.ASSTRING := 'F';
  DBC_TIPO_PESSOACHANGE(SELF);
  QRYCIDADE.CLOSE;
   IF RG_CADASTRO.ITEMINDEX = 0 THEN
   BEGIN
      DBTXTCOD_CLIENTE.ENABLED := FALSE;
      BIB_BUSCA_CLIENTE.ENABLED := FALSE;
      TXTCLIENTE.ENABLED        := FALSE;
      QRYCLIENTE.CLOSE;
      BIBPONTOS_PRINCIPALEnter(SELF);
      DBC_TIPO_PESSOA.Enabled := TRUE;
      BIBPONTOS_PRINCIPAL.Enabled := TRUE;
      IF DBC_TIPO_PESSOA.CANFOCUS THEN
         DBC_TIPO_PESSOA.SETFOCUS;
   END
   ELSE IF RG_CADASTRO.ITEMINDEX = 1 THEN
   BEGIN
      DBTXTCOD_CLIENTE.ENABLED := TRUE;
      BIB_BUSCA_CLIENTE.ENABLED := TRUE;
      TXTCLIENTE.ENABLED        := TRUE;
      DBTXTCOD_CLIENTE.SETFOCUS;
   END;

end;

procedure TFMCADCLIENTE1.RG_TIPO_PESSOAClick(Sender: TObject);
begin
  inherited;
   IF RG_TIPO_PESSOA.ITEMINDEX = 0 THEN
   BEGIN

   END
   ELSE IF RG_TIPO_PESSOA.ITEMINDEX = 1  THEN
   BEGIN

   END;
end;

procedure TFMCADCLIENTE1.VERIFICA_DUPLICIDADE_CADASTRO;
begin
   if DBC_TIPO_PESSOA.TEXT = 'J' then
   BEGIN
       QRYAUX.CLOSE;
       QRYAUX.SQL.CLEAR;
       QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE" FROM TBCLIENTE A');
       QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
       QRYAUX.SQL.ADD('      A.CNPJ = :PCNPJ AND ');
       QRYAUX.SQL.ADD('      A.SITUACAO    <> ''E'' AND ');
       QRYAUX.SQL.ADD('      A.COD_CLIENTE <> :PCOD_CLIENTE');
       QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
       QRYAUX.PARAMBYNAME('PCNPJ').ASSTRING        := QRYCLIENTECNPJ.ASSTRING;
       QRYAUX.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER := QRYCLIENTECOD_CLIENTE.ASINTEGER;
       QRYAUX.OPEN;

       IF QRYAUX.FieldByName('QTDE').AsInteger > 0 then
       BEGIN
         MESSAGEDLG('CNPJ já existente, por favor cadastre outro para prosseguir!',MTINFORMATION,[MBOK],1);
         DBTXTCNPJ.SETFOCUS;
         ABORT;
       END;

   END
   ELSE if DBC_TIPO_PESSOA.TEXT = 'F' then
   BEGIN
       QRYAUX.CLOSE;
       QRYAUX.SQL.CLEAR;
       QRYAUX.SQL.ADD('SELECT COUNT(1) "QTDE" FROM TBCLIENTE A');
       QRYAUX.SQL.ADD('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND ');
       QRYAUX.SQL.ADD('      A.CPF = :PCPF AND ');
       QRYAUX.SQL.ADD('      A.SITUACAO    <> ''E'' AND ');
       QRYAUX.SQL.ADD('      A.COD_CLIENTE <> :PCOD_CLIENTE');
       QRYAUX.PARAMBYNAME('PCOD_EMPRESA').ASINTEGER := EMPRESA_ATUAL;
       QRYAUX.PARAMBYNAME('PCPF').ASSTRING        := QRYCLIENTECPF.ASSTRING;
       QRYAUX.PARAMBYNAME('PCOD_CLIENTE').ASINTEGER := QRYCLIENTECOD_CLIENTE.ASINTEGER;
       QRYAUX.OPEN;

       IF QRYAUX.FieldByName('QTDE').AsInteger > 0 then
       BEGIN
         MESSAGEDLG('CPF já existente, por favor cadastre outro para prosseguir!',MTINFORMATION,[MBOK],1);
         DBTXTCPF.SETFOCUS;
         ABORT;
       END;
   END;
end;

end.
