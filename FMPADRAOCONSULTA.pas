unit FMPADRAOCONSULTA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TFMPADRAOCONSULTA1 = class(TForm)
    Panel1: TPanel;
    PANEL_FUNDO_FILTRO: TPanel;
    RGOPCOES: TRadioGroup;
    GBFILTRO: TGroupBox;
    LBLCAMPO: TLabel;
    BTNPONTOS: TBitBtn;
    DBTXTVALOR: TDBEdit;
    PANEL_BOTOES: TPanel;
    BTNOK: TBitBtn;
    BTNCANCELAR: TBitBtn;
    DBGCONSULTA: TDBGrid;
    QRYPADRAO: TZQuery;
    DS: TDataSource;
    DSQRY: TDataSource;
    QRY: TZQuery;
    QRYPA: TZQuery;
    QRYPACOD_TERMINAL: TWideStringField;
    QRYPACOD_APLIC_CHAMA: TWideStringField;
    QRYPANOME_PARAM: TWideStringField;
    QRYPAPARAM_C1: TWideStringField;
    QRYPAPARAM_C2: TWideStringField;
    QRYPAPARAM_C3: TWideStringField;
    QRYPAPARAM_C4: TWideStringField;
    QRYPAPARAM_C5: TWideStringField;
    QRYPAPARAM_C6: TWideStringField;
    QRYPAPARAM_C7: TWideStringField;
    QRYPAPARAM_C8: TWideStringField;
    QRYPAPARAM_C9: TWideStringField;
    QRYPAPARAM_C10: TWideStringField;
    QRYPAPARAM_N1: TFloatField;
    QRYPAPARAM_N2: TFloatField;
    QRYPAPARAM_N3: TFloatField;
    QRYPAPARAM_N4: TFloatField;
    QRYPAPARAM_N5: TFloatField;
    QRYPAPARAM_N6: TFloatField;
    QRYPAPARAM_N7: TFloatField;
    QRYPAPARAM_N8: TFloatField;
    QRYPAPARAM_N9: TFloatField;
    QRYPAPARAM_N10: TFloatField;
    QRYPAPARAM_N11: TFloatField;
    QRYPAPARAM_N12: TFloatField;
    QRYPAPARAM_N13: TFloatField;
    QRYPAPARAM_N14: TFloatField;
    QRYPAPARAM_N15: TFloatField;
    QRYPAPARAM_N16: TFloatField;
    QRYPAPARAM_N17: TFloatField;
    QRYPAPARAM_N18: TFloatField;
    QRYPAPARAM_N19: TFloatField;
    QRYPAPARAM_N20: TFloatField;
    QRYPAPARAM_D1: TDateTimeField;
    QRYPAPARAM_D2: TDateTimeField;
    QRYPAPARAM_D3: TDateTimeField;
    QRYPAPARAM_D4: TDateTimeField;
    QRYPAPARAM_D5: TDateTimeField;
    QRYPAPARAM_D6: TDateTimeField;
    QRYPAPARAM_D7: TDateTimeField;
    QRYPAPARAM_D8: TDateTimeField;
    QRYPAPARAM_D9: TDateTimeField;
    QRYPAPARAM_D10: TDateTimeField;
    QRYPAPARAM_N21: TFloatField;
    QRYPAPARAM_N22: TFloatField;
    QRYPAPARAM_N23: TFloatField;
    QRYPAPARAM_N24: TFloatField;
    QRYPAPARAM_N25: TFloatField;
    QRYPAPARAM_N26: TFloatField;
    QRYPAPARAM_N27: TFloatField;
    QRYPAPARAM_N28: TFloatField;
    QRYPAPARAM_N29: TFloatField;
    QRYPAPARAM_N30: TFloatField;
    QRYPAPARAM_D11: TDateTimeField;
    QRYPAPARAM_D12: TDateTimeField;
    QRYPAPARAM_D13: TDateTimeField;
    QRYPAPARAM_D14: TDateTimeField;
    QRYPAPARAM_D15: TDateTimeField;
    QRYPAPARAM_D16: TDateTimeField;
    QRYPAPARAM_D17: TDateTimeField;
    QRYPAPARAM_D18: TDateTimeField;
    QRYPAPARAM_D19: TDateTimeField;
    QRYPAPARAM_D20: TDateTimeField;
    QRYPAPARAM_N31: TFloatField;
    QRYPAPARAM_N32: TFloatField;
    QRYPAPARAM_N33: TFloatField;
    QRYPAPARAM_N34: TFloatField;
    QRYPAPARAM_N35: TFloatField;
    QRYPAPARAM_C11: TWideStringField;
    QRYPAPARAM_C12: TWideStringField;
    QRYPAPARAM_C13: TWideStringField;
    QRYPAPARAM_C14: TWideStringField;
    QRYPAPARAM_C15: TWideStringField;
    QRYPAPARAM_C16: TWideStringField;
    QRYPAPARAM_C17: TWideStringField;
    QRYPAPARAM_C18: TWideStringField;
    QRYPAPARAM_C19: TWideStringField;
    QRYPAPARAM_C20: TWideStringField;
    QRYPAPARAM_C21: TWideStringField;
    QRYPAPARAM_C22: TWideStringField;
    QRYPAPARAM_C23: TWideStringField;
    QRYPAPARAM_C24: TWideStringField;
    QRYPAPARAM_C25: TWideStringField;
    QRYPAPARAM_N36: TFloatField;
    QRYPAPARAM_N37: TFloatField;
    QRYPAPARAM_N38: TFloatField;
    QRYPAPARAM_N39: TFloatField;
    QRYPAPARAM_N40: TFloatField;
    QRYPAPARAM_N41: TFloatField;
    QRYPAPARAM_N42: TFloatField;
    QRYPAPARAM_N43: TFloatField;
    QRYPAPARAM_N44: TFloatField;
    QRYPAPARAM_N45: TFloatField;
    QRYPAPARAM_N46: TFloatField;
    QRYPAPARAM_N47: TFloatField;
    QRYPAPARAM_N48: TFloatField;
    QRYPAPARAM_N49: TFloatField;
    QRYPAPARAM_N50: TFloatField;
    QRYPAPARAM_N51: TFloatField;
    QRYPAPARAM_N52: TFloatField;
    QRYPAPARAM_N53: TFloatField;
    QRYPAPARAM_N54: TFloatField;
    QRYPAPARAM_N55: TFloatField;
    QRYPAPARAM_N56: TFloatField;
    QRYPAPARAM_N57: TFloatField;
    QRYPAPARAM_N58: TFloatField;
    QRYPAPARAM_N59: TFloatField;
    QRYPAPARAM_N60: TFloatField;
    QRYPAPARAM_C26: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBTXTVALORChange(Sender: TObject);
    procedure DBTXTVALOREnter(Sender: TObject);
    procedure DBTXTVALORExit(Sender: TObject);
    procedure BTNPONTOSEnter(Sender: TObject);
    procedure BTNOKClick(Sender: TObject);
     function PADRAOCONSULTA(CAMPOCONSULTA, CAMPOSVISUALIZAR, FILTRO,
      LABELVALOR, ORDEMVISUALIZAR, TABELA, TIPO, TITULO: STRING;
      CONSULTA: BOOLEAN): BOOLEAN;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGCONSULTATitleClick(Column: TColumn);
    procedure DBGCONSULTADblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SCAMPOCONSULTA, SCAMPOSVISUALIZAR, SFILTRO, SLABEL, SORDEMVISUALIZAR, STABELA, STIPO, STITULO, SULTIMA: STRING;
    BCONSULTA, BUTILIZAULTIMA: BOOLEAN;
    S_SELECAO: STRING;
  end;

var
  FMPADRAOCONSULTA1: TFMPADRAOCONSULTA1;
  BSETA: BOOLEAN;

implementation

{$R *.dfm}

uses DMPRINCIPAL, FMCADUSUARIO, UNROTINASGERAIS;

procedure TFMPADRAOCONSULTA1.BTNOKClick(Sender: TObject);
begin
IF QRY.ACTIVE THEN
     SELF.MODALRESULT := MROK
  ELSE
     SELF.MODALRESULT := MRCANCEL;
  SULTIMA := DBTXTVALOR.TEXT;
end;

procedure TFMPADRAOCONSULTA1.BTNPONTOSEnter(Sender: TObject);
var I: INTEGER;
 VSQL: STRING;
begin
   VSQL := '';
   VSQL := VSQL+'SELECT ' + SCAMPOSVISUALIZAR;
   VSQL := VSQL+' FROM ' + STABELA;
   VSQL := VSQL+' WHERE ';
   IF LENGTH(SFILTRO) > 0 THEN
      VSQL := VSQL+SFILTRO+' AND ';
   VSQL := VSQL+SCAMPOCONSULTA;
   IF (RGOPCOES.ITEMINDEX = 0) AND (STIPO = 'S') THEN
      VSQL := VSQL+' LIKE (' + QUOTEDSTR(DBTXTVALOR.TEXT+'%')+')'
   ELSE IF RGOPCOES.ITEMINDEX = 1 THEN
      VSQL := VSQL+' = ' + QUOTEDSTR(DBTXTVALOR.TEXT)
   ELSE IF RGOPCOES.ITEMINDEX = 2 THEN
      VSQL := VSQL+' LIKE (' +QUOTEDSTR('%'+DBTXTVALOR.TEXT+'%')+')';
   IF LENGTH(SORDEMVISUALIZAR) > 0 THEN
      VSQL := VSQL+' ORDER BY ' + SORDEMVISUALIZAR;

   WITH QRY DO
   BEGIN
      CLOSE;
      SQL.CLEAR;
      SQL.ADD(VSQL);
      OPEN;
      FIRST;

      FOR I := 0 TO DBGCONSULTA.COLUMNS.COUNT - 1 DO
         DBGCONSULTA.COLUMNS.ITEMS[I].TITLE.ALIGNMENT := TACENTER;

      BTNOK.ENABLED := TRUE;
      IF (NOT BCONSULTA) OR (BSETA) THEN
         DBGCONSULTA.SETFOCUS;
   END;
end;

procedure TFMPADRAOCONSULTA1.DBGCONSULTADblClick(Sender: TObject);
begin
  BTNOKClick(SELF);
end;

procedure TFMPADRAOCONSULTA1.DBGCONSULTATitleClick(Column: TColumn);
begin
   IF (QRY.FIELDBYNAME(COLUMN.FIELDNAME).FIELDKIND = FKDATA) AND (NOT QRY.ISEMPTY) THEN
   BEGIN
      QRY.CLOSE;
      IF QRY.SQL.STRINGS[QRY.SQL.COUNT-1] = 'ORDER BY '+COLUMN.FIELDNAME THEN
         QRY.SQL.STRINGS[QRY.SQL.COUNT-1] := 'ORDER BY '+COLUMN.FIELDNAME+' DESC'
      ELSE
         QRY.SQL.STRINGS[QRY.SQL.COUNT-1] := 'ORDER BY '+COLUMN.FIELDNAME;
      QRY.OPEN;
      QRY.FIRST;
   END;
end;

procedure TFMPADRAOCONSULTA1.DBGrid1DblClick(Sender: TObject);
begin
   BTNOKClick(Self);
end;

procedure TFMPADRAOCONSULTA1.DBTXTVALORChange(Sender: TObject);
begin
 IF BCONSULTA THEN
  BEGIN
     BTNPONTOSENTER(SELF);
     DBTXTVALOR.SETFOCUS;
  END;
end;

procedure TFMPADRAOCONSULTA1.DBTXTVALOREnter(Sender: TObject);
begin
  BSETA := FALSE;
end;

procedure TFMPADRAOCONSULTA1.DBTXTVALORExit(Sender: TObject);
begin
   BSETA := TRUE;
end;

procedure TFMPADRAOCONSULTA1.FormCreate(Sender: TObject);
begin
   QRYPA.SQL.CLEAR;
   QRYPA.SQL.ADD('SELECT A.*, A.ROWID FROM TBCOGPASSAPARAMETRO A');
   //QRYPA.SQL.ADD('SELECT * FROM TBCOGPASSAPARAMETRO');
   //QRYPA.REQUESTLIVE := TRUE;
   QRYPA.OPEN;
   QRYPA.CANCEL;
   QRYPA.INSERT;
   DS.DATASET := QRYPA;
   DBTXTVALOR.DATASOURCE := DS;
   RGOPCOES.ITEMINDEX := 2;
end;

procedure TFMPADRAOCONSULTA1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 IF (BCONSULTA) AND (NOT BSETA) THEN
  BEGIN
    IF ORD(KEY) = 38 THEN
       QRY.PRIOR;

    IF ORD(KEY) = 40 THEN
       QRY.NEXT;
  END;
end;

procedure TFMPADRAOCONSULTA1.FormShow(Sender: TObject);
var SCAMPO: STRING;
begin
   RGOPCOES.ItemIndex := 0;
   WITH QRYPA DO
   BEGIN
      CANCEL;
      INSERT;
   END;
   QRY.SQL.CLEAR;
   SELF.CAPTION := 'Consulta ' + STITULO;
   LBLCAMPO.CAPTION := SLABEL;
   IF STIPO = 'D' THEN
      SCAMPO :=  'PARAM_D1'
   ELSE IF STIPO = 'N' THEN
      SCAMPO :=  'PARAM_N1'
   ELSE IF STIPO = 'S' THEN
      SCAMPO :=  'PARAM_C1';
   DBTXTVALOR.DATAFIELD := SCAMPO;
   BTNOK.ENABLED := FALSE;
   IF BUTILIZAULTIMA THEN
   BEGIN
      QRYPA.FIELDBYNAME(SCAMPO).ASSTRING := SULTIMA;
   END;
   BTNPONTOSENTER(SELF);

   IF DBTXTVALOR.CANFOCUS THEN
   BEGIN
      DBTXTVALOR.SETFOCUS;
      DBTXTVALOR.SELECTALL;
   END;
end;

function TFMPADRAOCONSULTA1.PADRAOCONSULTA(CAMPOCONSULTA, CAMPOSVISUALIZAR,
  FILTRO, LABELVALOR, ORDEMVISUALIZAR, TABELA, TIPO, TITULO: STRING;
  CONSULTA: BOOLEAN): BOOLEAN;
begin
SCAMPOCONSULTA := CAMPOCONSULTA;
  SCAMPOSVISUALIZAR := CAMPOSVISUALIZAR;
  SFILTRO := FILTRO;
  SLABEL := LABELVALOR;
  SORDEMVISUALIZAR := ORDEMVISUALIZAR;
  STABELA := TABELA;
  STIPO := TIPO;
  STITULO := TITULO;
  BCONSULTA := CONSULTA;
  IF SHOWMODAL = MROK THEN
  BEGIN
    RESULT  := TRUE;
    IF STIPO = 'S' THEN
       S_SELECAO := DBTXTVALOR.TEXT;
  END
  ELSE
  BEGIN
    RESULT := FALSE;
    S_SELECAO := '';
  END;
end;

end.
