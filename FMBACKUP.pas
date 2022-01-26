unit FMBACKUP;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FMPADRAOGERAL, Vcl.ComCtrls, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Menus, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, cxStyles, cxClasses,ShellAPI,
  ZStoredProcedure;

type
  TFMBACKUP1 = class(TFMPADRAOGERAL1)
    PG_PRINCIPAL: TPageControl;
    TS_BACKUP: TTabSheet;
    TS_RESTAURAR: TTabSheet;
    Panel1: TPanel;
    BTNREALIZAR_BACKUP: TBitBtn;
    Panel2: TPanel;
    BTNRESTAURAR: TBitBtn;
    PCEXCLUI_TABELAS: TZStoredProc;
    procedure BTNREALIZAR_BACKUPClick(Sender: TObject);
    procedure BTNRESTAURARClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MNUAJUDAClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMBACKUP1: TFMBACKUP1;
  SDIR_BACKUP,SNOME_FILE_BKP : STRING;

implementation

{$R *.dfm}

uses DMPRINCIPAL;

procedure TFMBACKUP1.BTNRESTAURARClick(Sender: TObject);
VAR
   //SDIR_BACKUP,SNOME_FILE_BKP : STRING;
   STEXTO : TSTRINGLIST;

begin
  inherited;
   TRY
      IF NOT FILEEXISTS(SDIR_BACKUP+SNOME_FILE_BKP) THEN
      BEGIN
        MESSAGEDLG('Arquivo de Backup não encontrado.',mtInformation,[MBOK],1);
        ABORT;
      END;
      
      PCEXCLUI_TABELAS.Prepare;
      PCEXCLUI_TABELAS.ExecProc;
      PCEXCLUI_TABELAS.Unprepare;
       //TABLES= tbteste -- AQUI SE EU TIRAR FAZ O BACKUP DE TODAS AS TABELAS
      //---
      STEXTO := TSTRINGLIST.CREATE;
      STEXTO.Text := '/C impdp projar/projar@xe DIRECTORY=bkp01 DUMPFILE=exp_dp.dmp LOGFILE=exp_dp.log;';
      ShellExecute(HANDLE, 'open', 'cmd.exe', PWideChar(STEXTO.TEXT), nil, SW_SHOWNORMAL);
      SLEEP(15000);
      MESSAGEDLG('Processo concluído com sucesso',mtInformation,[MBOK],1);
    EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MESSAGEDLG('Erro ao fazer Restauração. Erro :'+e.Message,mtInformation,[MBOK],1);
        MDPRINCIPAL.ROLLBACK;
        abort;
     END;
   END;
end;

procedure TFMBACKUP1.FormShow(Sender: TObject);
begin
  inherited;
   PG_PRINCIPAL.ActivePage := TS_BACKUP;

   SDIR_BACKUP := 'C:\oraclexe\app\oracle\bkp\';
   SNOME_FILE_BKP := 'exp_dp.dmp';
end;

procedure TFMBACKUP1.MNUAJUDAClick(Sender: TObject);
begin
  inherited;
   if PG_PRINCIPAL.ActivePage = TS_BACKUP then
      ABRIR_AJUDA('54')
   ELSE if PG_PRINCIPAL.ActivePage = TS_RESTAURAR then
      ABRIR_AJUDA('55');
end;

procedure TFMBACKUP1.BTNREALIZAR_BACKUPClick(Sender: TObject);
VAR
   STEXTO : TSTRINGLIST;

begin
  inherited;
  TRY
    STEXTO := TSTRINGLIST.CREATE;
    STEXTO.Text := '/C expdp projar/projar@xe DIRECTORY=bkp01 DUMPFILE=exp_dp.dmp LOGFILE=exp_dp.log;';
    DELETEFILE(SDIR_BACKUP+SNOME_FILE_BKP);
    ShellExecute(HANDLE, 'open', 'cmd.exe', PWideChar(STEXTO.TEXT), nil, SW_SHOWNORMAL);
    SLEEP(25000);
    MESSAGEDLG('Processo concluído com sucesso',mtInformation,[MBOK],1);
  EXCEPT
     ON E:EXCEPTION DO
     BEGIN
        MESSAGEDLG('Erro ao fazer Backup. Erro :'+e.Message,mtInformation,[MBOK],1);
        MDPRINCIPAL.ROLLBACK;
        abort;
     END;
   END;
end;

end.
