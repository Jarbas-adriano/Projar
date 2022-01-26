unit DMPRINCIPAL;

interface

uses
  System.SysUtils, System.Classes, ZAbstractConnection, ZConnection, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,SHELLAPI,VCL.FORMS;

type
  TMDPRINCIPAL = class(TDataModule)
    DBBASE_CONEXAO: TZConnection;
    QRYAUX: TZQuery;
    PROCEDURE COMMIT;
    PROCEDURE ROLLBACK;
    procedure DataModuleCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MDPRINCIPAL: TMDPRINCIPAL;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TMDPRINCIPAL }


procedure TMDPRINCIPAL.COMMIT;
begin
   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('COMMIT');
   QRYAUX.ExecSQL;
end;

procedure TMDPRINCIPAL.DataModuleCreate(Sender: TObject);
begin
   DBBASE_CONEXAO.Connected := TRUE;
end;

procedure TMDPRINCIPAL.ROLLBACK;
begin
   QRYAUX.Close;
   QRYAUX.SQL.Clear;
   QRYAUX.SQL.Add('ROLLBACK');
   QRYAUX.ExecSQL;
end;

end.
