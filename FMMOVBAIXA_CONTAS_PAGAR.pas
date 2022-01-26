unit FMMOVBAIXA_CONTAS_PAGAR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Buttons, Vcl.Mask, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TFMMOVBAIXA_CONTAS_PAGAR1 = class(TFMPADRAOGERAL1)
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    BTNCONFIRMAR: TBitBtn;
    BTNCANCELAR: TBitBtn;
    DBGRID_CONTAS_PAGAR: TcxGrid;
    DBGRID_CONTAS_PAGARDBTableView1: TcxGridDBTableView;
    DBGRID_CONTAS_PAGARLevel1: TcxGridLevel;
    QRYPARAM: TZQuery;
    QRYPARAMPARAM_N1: TFloatField;
    QRYPARAMPARAM_D1: TDateTimeField;
    QRYPARAMPARAM_D2: TDateTimeField;
    DSPARAM: TDataSource;
    QRYCONTAS_PAGAR: TZQuery;
    QRYCONTAS_PAGARCOD_EMPRESA: TFloatField;
    QRYCONTAS_PAGARCOD_DESPESA: TFloatField;
    QRYCONTAS_PAGARVALOR_DESPESA: TFloatField;
    QRYCONTAS_PAGARSITUACAO: TWideStringField;
    QRYCONTAS_PAGARDATA_PAGAMENTO: TDateTimeField;
    QRYCONTAS_PAGARDATA_CADASTRO: TDateTimeField;
    QRYCONTAS_PAGARSEQUENCIA: TFloatField;
    QRYCONTAS_PAGAROBSERVACAO: TWideStringField;
    QRYCONTAS_PAGARNUM_PARCELA: TFloatField;
    QRYCONTAS_PAGARDATA_VENCIMENTO: TDateTimeField;
    DSCONTAS_PAGAR: TDataSource;
    DBGRID_CONTAS_PAGARDBTableView1VALOR_DESPESA: TcxGridDBColumn;
    DBGRID_CONTAS_PAGARDBTableView1DATA_CADASTRO: TcxGridDBColumn;
    DBGRID_CONTAS_PAGARDBTableView1OBSERVACAO: TcxGridDBColumn;
    DBGRID_CONTAS_PAGARDBTableView1NUM_PARCELA: TcxGridDBColumn;
    DBGRID_CONTAS_PAGARDBTableView1DATA_VENCIMENTO: TcxGridDBColumn;
    RGSELECAO: TRadioGroup;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    DBTXTCOD_DESPESA: TDBEdit;
    BIB_BUSCA_DESPESA: TBitBtn;
    TXTNOME_DESPESA: TEdit;
    DBTXTDATA_INICIO: TcxDBDateEdit;
    DBTXTDATA_FINAL: TcxDBDateEdit;
    BIBPONTOS_PRINCIPAL: TBitBtn;
    QRYCONTAS_PAGARNOME_DESPESA: TWideStringField;
    DBGRID_CONTAS_PAGARDBTableView1NOME_DESPESA: TcxGridDBColumn;
    Label9: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    procedure BIB_BUSCA_DESPESAClick(Sender: TObject);
    procedure DBTXTCOD_DESPESAExit(Sender: TObject);
    procedure BTNCANCELARClick(Sender: TObject);
    procedure BIBPONTOS_PRINCIPALEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CARREGAR_CONTAS_PAGAR;
    procedure DBGRID_CONTAS_PAGARDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure BTNCONFIRMARClick(Sender: TObject);
    procedure RGSELECAOClick(Sender: TObject);
    procedure DBTXTDATA_FINALExit(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMMOVBAIXA_CONTAS_PAGAR1: TFMMOVBAIXA_CONTAS_PAGAR1;

implementation

{$R *.dfm}

uses UNROTINASGERAIS, DMPRINCIPAL, FMPADRAOCONSULTA, FMPADRAOFILTRO,
  FMMOVBAIXA_CONTAS_PAGAR2, FMMOVBAIXASALDODEVEDOR2;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.BIBPONTOS_PRINCIPALEnter(Sender: TObject);
begin
  inherited;
   IF RGSELECAO.ITEMINDEX = 1 THEN
   BEGIN
     IF QRYPARAMPARAM_N1.ASSTRING = '' THEN
     BEGIN
       MESSAGEDLG('Informe uma despesa para prosseguir!',MTINFORMATION,[MBOK],0);
       DBTXTCOD_DESPESA.SETFOCUS;
       ABORT;
     END;
   END;

   if QRYPARAMPARAM_D1.AsString = '' then
   BEGIN
     MESSAGEDLG('Informe a data inicial para prosseguir',MTINFORMATION,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   if QRYPARAMPARAM_D2.AsString = '' then
   BEGIN
     MESSAGEDLG('Informe a data final para prosseguir',MTINFORMATION,[MBOK],0);
     DBTXTDATA_FINAL.SETFOCUS;
     ABORT;
   END;

   IF QRYPARAMPARAM_D1.ASDATETIME > QRYPARAMPARAM_D2.ASDATETIME THEN
   BEGIN
     MESSAGEDLG('A data inicial não pode maior do que a data final',MTINFORMATION,[MBOK],0);
     DBTXTDATA_INICIO.SETFOCUS;
     ABORT;
   END;

   CARREGAR_CONTAS_PAGAR;

   IF NOT QRYCONTAS_PAGAR.ISEMPTY THEN
      BTNCONFIRMAR.ENABLED      := TRUE
   ELSE
   BEGIN
      MESSAGEDLG('Não foram encontrados registros no período informado.',MTINFORMATION,[MBOK],0);
      ABORT;
   END;


   //BTNCONFIRMAR.ENABLED      := TRUE;
   DBTXTCOD_DESPESA.ENABLED  := FALSE;
   //DBTXTDATA_INICIO.ENABLED  := FALSE;
   //DBTXTDATA_FINAL.ENABLED   := FALSE;
   BIB_BUSCA_DESPESA.ENABLED := FALSE;
   BIB_BUSCA_DESPESA.ENABLED := FALSE;
   BTNCONFIRMAR.SETFOCUS;

end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.BIB_BUSCA_DESPESAClick(Sender: TObject);
var S_FILTRO : STRING;
begin
  inherited;
  S_FILTRO := 'COD_EMPRESA  = '+INTTOSTR(EMPRESA_ATUAL)+
              'AND SITUACAO = ''A''   ';
  FMPADRAOCONSULTA1.QRY.CLOSE;
  IF FMPADRAOCONSULTA1.PADRAOCONSULTA (
        'NOME_DESPESA', 'COD_DESPESA "Codigo", NOME_DESPESA "Nome da Despesa"',
        S_FILTRO, 'Nome da Despesa', 'COD_DESPESA',
        'TBDESPESAS', 'S', 'Despesas', TRUE
     ) THEN
  BEGIN
     QRYPARAMPARAM_N1.ASINTEGER := FMPADRAOCONSULTA1.QRY.FIELDBYNAME('Codigo').ASINTEGER;
     DBTXTCOD_DESPESAEXIT(SELF);
   //  DBTXTCOD_TERCEIROExit(SELF);
  END;
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.BTNCANCELARClick(Sender: TObject);
begin
  inherited;
   QRYPARAM.Cancel;
   QRYPARAM.Close;
   QRYPARAM.Open;
   QRYPARAM.Insert;


   QRYPARAMPARAM_D1.AsDateTime := DATE;
   QRYPARAMPARAM_D2.AsDateTime := DATE+15;

   BTNCONFIRMAR.Enabled      := FALSE;
   DBTXTCOD_DESPESA.Enabled  := TRUE;
   DBTXTDATA_INICIO.Enabled  := TRUE;
   DBTXTDATA_FINAL.Enabled   := TRUE;
   BIB_BUSCA_DESPESA.Enabled := TRUE;
   BIB_BUSCA_DESPESA.Enabled := TRUE;
   //DBTXTCOD_DESPESA.SetFocus;

   QRYCONTAS_PAGAR.Close;
   TXTNOME_DESPESA.Text := '';


end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.BTNCONFIRMARClick(Sender: TObject);
VAR
   BCONTINUA : BOOLEAN;
   IVLR_PAGO :REAL;
begin
  inherited;
  If  MessageDlg('Você tem certeza que deseja baixar o registro?',mtConfirmation,[mbyes,mbno],0)=mryes THEN
  BEGIN
       BCONTINUA := FALSE;
     TRY
        APPLICATION.CREATEFORM(TFMBAIXA_CONTAS_PAGAR2,FMBAIXA_CONTAS_PAGAR2);
        FMBAIXA_CONTAS_PAGAR2.IVLR_PARCELA := QRYCONTAS_PAGARVALOR_DESPESA.AsFloat;
        FMBAIXA_CONTAS_PAGAR2.SHOWMODAL;
     IF FMBAIXA_CONTAS_PAGAR2.BCONTINUA THEN
     BEGIN
        BCONTINUA := TRUE;
        IVLR_PAGO := FMBAIXA_CONTAS_PAGAR2.QRYPARAMPARAM_N1.ASFLOAT;
     END;
     FINALLY
        FMBAIXA_CONTAS_PAGAR2.FREE;
     END;
     IF BCONTINUA THEN
     BEGIN
       TRY
          QRYAUX.Close;
          QRYAUX.SQL.Clear;
          QRYAUX.SQL.Add('UPDATE TBCONTAS_PAGAR');
          QRYAUX.SQL.Add('SET SITUACAO       = ''P'',');
          QRYAUX.SQL.Add('   DATA_PAGAMENTO  = SYSDATE, ');
          QRYAUX.SQL.Add('   VALOR_REAL_PAGO = :PVALOR_REAL_PAGO ');
          QRYAUX.SQL.Add('WHERE COD_EMPRESA = :PCOD_EMPRESA AND');
          QRYAUX.SQL.Add('      COD_DESPESA = :PCOD_DESPESA AND');
          QRYAUX.SQL.Add('      SEQUENCIA   = :PSEQUENCIA   AND');
          QRYAUX.SQL.Add('      DATA_VENCIMENTO = :PDATA_VENCIMENTO');
          QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger      := EMPRESA_ATUAL;
          QRYAUX.ParamByName('PCOD_DESPESA').AsInteger      := QRYCONTAS_PAGARCOD_DESPESA.AsInteger;
          QRYAUX.ParamByName('PSEQUENCIA').AsInteger        := QRYCONTAS_PAGARSEQUENCIA.AsInteger;
          QRYAUX.ParamByName('PDATA_VENCIMENTO').ASDATETIME := QRYCONTAS_PAGARDATA_VENCIMENTO.ASDATETIME;
          QRYAUX.ParamByName('PVALOR_REAL_PAGO').ASFLOAT    := IVLR_PAGO;
          QRYAUX.ExecSQL;

          MDPRINCIPAL.COMMIT;

          MESSAGEDLG('Registro Baixado com sucesso.!',mtInformation,[MBOK],0);
       EXCEPT
          ON E:EXCEPTION DO
          BEGIN
            MDPRINCIPAL.ROLLBACK;
            MESSAGEDLG('Erro ao baixar o registro.Erro: '+E.Message,mtInformation,[MBOK],0);
            ABORT;
          END;
       END;
     END;
     CARREGAR_CONTAS_PAGAR;
  END;
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.CARREGAR_CONTAS_PAGAR;
begin
   QRYCONTAS_PAGAR.Close;
   QRYCONTAS_PAGAR.SQL.Clear;
   QRYCONTAS_PAGAR.SQL.Add('SELECT A.*,B.NOME_DESPESA');
   QRYCONTAS_PAGAR.SQL.Add('FROM TBCONTAS_PAGAR A,TBDESPESAS B');
   QRYCONTAS_PAGAR.SQL.Add('WHERE A.COD_EMPRESA = :PCOD_EMPRESA AND');
   QRYCONTAS_PAGAR.SQL.Add('      (A.COD_DESPESA = :PCOD_DESPESA OR :PCOD_DESPESA = 0) AND');
   QRYCONTAS_PAGAR.SQL.Add('      A.DATA_VENCIMENTO >= :PDATA_INICIAL AND');
   QRYCONTAS_PAGAR.SQL.Add('      A.DATA_VENCIMENTO <= :PDATA_FINAL AND');
   QRYCONTAS_PAGAR.SQL.Add('      A.SITUACAO = ''E'' AND');
   QRYCONTAS_PAGAR.SQL.Add('      B.COD_EMPRESA = A.COD_EMPRESA AND ');
   QRYCONTAS_PAGAR.SQL.Add('      B.COD_DESPESA = A.COD_DESPESA');
   QRYCONTAS_PAGAR.SQL.Add('ORDER BY A.SEQUENCIA,A.DATA_VENCIMENTO');
   QRYCONTAS_PAGAR.ParamByName('PCOD_EMPRESA').AsInteger   := EMPRESA_ATUAL;
   QRYCONTAS_PAGAR.ParamByName('PCOD_DESPESA').AsInteger   := QRYPARAMPARAM_N1.AsInteger;
   QRYCONTAS_PAGAR.ParamByName('PDATA_INICIAL').AsDateTime := QRYPARAMPARAM_D1.ASDATETIME;
   QRYCONTAS_PAGAR.ParamByName('PDATA_FINAL').AsDateTime   := QRYPARAMPARAM_D2.ASDATETIME;
   QRYCONTAS_PAGAR.Open;

   IF RGSELECAO.ITEMINDEX = 1 THEN
   BEGIN
     DBGRID_CONTAS_PAGARDBTABLEVIEW1NOME_DESPESA.VISIBLE := FALSE;
   END
   ELSE
   BEGIN
      DBGRID_CONTAS_PAGARDBTABLEVIEW1NOME_DESPESA.VISIBLE := TRUE;
   END;

end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.DBGRID_CONTAS_PAGARDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if(AViewInfo.GridRecord.Values[DBGRID_CONTAS_PAGARDBTableView1DATA_VENCIMENTO.Index] < DATE) then
  begin
    ACanvas.Brush.Color := CLRED;
    ACANVAS.FonT.Color  := clWhite;
    ACANVAS.Font.Style  := [FSBOLD];
  end;
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.DBTXTCOD_DESPESAExit(Sender: TObject);
begin
  inherited;
    IF QRYPARAMPARAM_N1.ASINTEGER <> 0 THEN
    BEGIN
      QRYAUX.Close;
      QRYAUX.SQL.Clear;
      QRYAUX.SQL.Add('SELECT NOME_DESPESA');
      QRYAUX.SQL.Add('FROM TBDESPESAS');
      QRYAUX.SQL.Add('WHERE COD_EMPRESA  = :PCOD_EMPRESA  AND ');
      QRYAUX.SQL.Add('      COD_DESPESA  = :PCOD_DESPESA  AND ');
      QRYAUX.SQL.Add('      SITUACAO     = ''A'' ');
      QRYAUX.ParamByName('PCOD_EMPRESA').AsInteger := EMPRESA_ATUAL;
      QRYAUX.ParamByName('PCOD_DESPESA').AsInteger := QRYPARAMPARAM_N1.AsInteger;
      QRYAUX.Open;

      if QRYAUX.IsEmpty then
      BEGIN
        APPLICATION.MessageBox('Despesa não encontrada',pchar(Application.Title), MB_OK + MB_ICONINFORMATION);
        DBTXTCOD_DESPESA.SetFocus;
        abort;
      END
      ELSE
      BEGIN
        TXTNOME_DESPESA.Text := QRYAUX.FieldByName('NOME_DESPESA').AsString;
        BIBPONTOS_PRINCIPALEnter(SELF);
      END;
    END
    ELSE
    BEGIN
       TXTNOME_DESPESA.Text := '';
    END;
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.DBTXTDATA_FINALExit(Sender: TObject);
begin
  inherited;
  BIBPONTOS_PRINCIPALEnter(SELF);
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.FormShow(Sender: TObject);
begin
  inherited;
   BTNCANCELARClick(SELF);
   RGSELECAO.ItemIndex := 1;
   RGSELECAOClick(SELF);
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
  ABRIR_AJUDA('29');
end;

procedure TFMMOVBAIXA_CONTAS_PAGAR1.RGSELECAOClick(Sender: TObject);
begin
  inherited;
  BTNCANCELARClick(SELF);
  IF RGSELECAO.ITEMINDEX = 0 THEN
  BEGIN
     DBTXTCOD_DESPESA.ENABLED  := FALSE;
     BIB_BUSCA_DESPESA.ENABLED := FALSE;
     QRYPARAMPARAM_N1.CLEAR;
     TXTNOME_DESPESA.TEXT := '';
     BTNCONFIRMAR.ENABLED := TRUE;
     DBTXTDATA_INICIO.SETFOCUS;
     BIBPONTOS_PRINCIPALEnter(SELF);
  END
  ELSE
  BEGIN
     DBTXTCOD_DESPESA.Enabled  := TRUE;
     BIB_BUSCA_DESPESA.Enabled := TRUE;
     DBTXTCOD_DESPESA.SetFocus;
     TXTNOME_DESPESA.TEXT := '';
     BTNCONFIRMAR.Enabled := FALSE;
  END;
end;

end.
