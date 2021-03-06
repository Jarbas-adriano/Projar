unit UNROTINASGERAIS;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, StdCtrls,System.Math;

PROCEDURE BUSCA_EMPRESA_USUARIO(PCOD_USUARIO :STRING);
FUNCTION VALIDAR_CPF(PCPF :STRING) : BOOLEAN;
FUNCTION VALIDAR_CNPJ(PCNPJ :STRING) : BOOLEAN;
FUNCTION VALIDAR_EMAIL(PEMAIL :STRING) :BOOLEAN;
FUNCTION CHECKALLOWED(CONST S: STRING): BOOLEAN;
FUNCTION BUSCANOME_COMPUTADOR: STRING;
//PROCEDURE ABRIR_AJUDA(PPARAM_PDF :STRING);

VAR
   EMPRESA_ATUAL : INTEGER;
   USUARIO_ATUAL : STRING;
   TIPO_USUARIO  : STRING;
   ICOD_USUARIO_ATUAL :INTEGER;

implementation

uses DMPRINCIPAL;

PROCEDURE BUSCA_EMPRESA_USUARIO(PCOD_USUARIO :STRING);
BEGIN
   MDPRINCIPAL.QRYAUX.Close;
   MDPRINCIPAL.QRYAUX.SQL.CLEAR;
   MDPRINCIPAL.QRYAUX.SQL.Add('SELECT A.COD_EMPRESA,A.NOME,A.COD_USUARIO, ');
   MDPRINCIPAL.QRYAUX.SQL.Add('UPPER(DECODE(A.TIPO_USUARIO, ''G'', ''Gerencia'', ''N'', ''Normal'', ''D'', ''Diretoria'')) TP_USUARIO');
   MDPRINCIPAL.QRYAUX.SQL.Add('FROM TBUSUARIO A ');
   MDPRINCIPAL.QRYAUX.SQL.Add('WHERE UPPER(A.LOGIN) = UPPER(:PCOD_USUARIO) AND ');
   MDPRINCIPAL.QRYAUX.SQL.Add('      A.SITUACAO     = ''A'' ');
   MDPRINCIPAL.QRYAUX.ParamByName('PCOD_USUARIO').AsString := PCOD_USUARIO;
   MDPRINCIPAL.QRYAUX.Open;
   EMPRESA_ATUAL       := MDPRINCIPAL.QRYAUX.FieldByName('COD_EMPRESA').AsInteger;
   USUARIO_ATUAL       := MDPRINCIPAL.QRYAUX.FieldByName('NOME').AsString;
   TIPO_USUARIO        := MDPRINCIPAL.QRYAUX.FieldByName('TP_USUARIO').AsString;
   ICOD_USUARIO_ATUAL  := MDPRINCIPAL.QRYAUX.FieldByName('COD_USUARIO').ASINTEGER;
END;

FUNCTION VALIDAR_CPF(PCPF :STRING): BOOLEAN;
VAR
  V: ARRAY [0 .. 1] OF WORD;
  CPF: ARRAY [0 .. 10] OF BYTE;
  I: BYTE;
BEGIN
  RESULT := FALSE;

  { VERIFICANDO SE TEM 11 CARACTERES }
  IF LENGTH(PCPF) <> 11 THEN
  BEGIN
    EXIT;
  END;

  { CONFERINDO SE TODOS D?GITOS S?O IGUAIS }
  IF PCPF = STRINGOFCHAR('0', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('1', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('2', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('3', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('4', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('5', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('6', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('7', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('8', 11) THEN
    EXIT;

  IF PCPF = STRINGOFCHAR('9', 11) THEN
    EXIT;

  TRY
    FOR I := 1 TO 11 DO
      CPF[I - 1] := STRTOINT(PCPF[I]);
    // NOTA: CALCULA O PRIMEIRO D?GITO DE VERIFICA??O.
    V[0] := 10 * CPF[0] + 9 * CPF[1] + 8 * CPF[2];
    V[0] := V[0] + 7 * CPF[3] + 6 * CPF[4] + 5 * CPF[5];
    V[0] := V[0] + 4 * CPF[6] + 3 * CPF[7] + 2 * CPF[8];
    V[0] := 11 - V[0] MOD 11;
    V[0] := IFTHEN(V[0] >= 10, 0, V[0]);
    // NOTA: CALCULA O SEGUNDO D?GITO DE VERIFICA??O.
    V[1] := 11 * CPF[0] + 10 * CPF[1] + 9 * CPF[2];
    V[1] := V[1] + 8 * CPF[3] + 7 * CPF[4] + 6 * CPF[5];
    V[1] := V[1] + 5 * CPF[6] + 4 * CPF[7] + 3 * CPF[8];
    V[1] := V[1] + 2 * V[0];
    V[1] := 11 - V[1] MOD 11;
    V[1] := IFTHEN(V[1] >= 10, 0, V[1]);
    // NOTA: VERDADEIRO SE OS D?GITOS DE VERIFICA??O S?O OS ESPERADOS.
    RESULT := ((V[0] = CPF[9]) AND (V[1] = CPF[10]));
  EXCEPT
    ON E: EXCEPTION DO
      RESULT := FALSE;
  END;
END;
FUNCTION VALIDAR_CNPJ(PCNPJ :STRING) : BOOLEAN;
VAR
  V: ARRAY[1..2] OF WORD;
  CNPJ: ARRAY[1..14] OF BYTE;
  I: BYTE;
BEGIN
  RESULT := FALSE;

  { VERIFICANDO SE TEM 11 CARACTERES }
  IF LENGTH(PCNPJ) <> 14 THEN
  BEGIN
    EXIT;
  END;

  { CONFERINDO SE TODOS D?GITOS S?O IGUAIS }
  IF PCNPJ = STRINGOFCHAR('0', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('1', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('2', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('3', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('4', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('5', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('6', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('7', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('8', 14) THEN
    EXIT;

  IF PCNPJ = STRINGOFCHAR('9', 14) THEN
    EXIT;

  TRY
    FOR I := 1 TO 14 DO
      CNPJ[I] := STRTOINT(PCNPJ[I]);

    //NOTA: CALCULA O PRIMEIRO D?GITO DE VERIFICA??O.
    V[1] := 5*CNPJ[1] + 4*CNPJ[2]  + 3*CNPJ[3]  + 2*CNPJ[4];
    V[1] := V[1] + 9*CNPJ[5] + 8*CNPJ[6]  + 7*CNPJ[7]  + 6*CNPJ[8];
    V[1] := V[1] + 5*CNPJ[9] + 4*CNPJ[10] + 3*CNPJ[11] + 2*CNPJ[12];
    V[1] := 11 - V[1] MOD 11;
    V[1] := IFTHEN(V[1] >= 10, 0, V[1]);

    //NOTA: CALCULA O SEGUNDO D?GITO DE VERIFICA??O.
    V[2] := 6*CNPJ[1] + 5*CNPJ[2]  + 4*CNPJ[3]  + 3*CNPJ[4];
    V[2] := V[2] + 2*CNPJ[5] + 9*CNPJ[6]  + 8*CNPJ[7]  + 7*CNPJ[8];
    V[2] := V[2] + 6*CNPJ[9] + 5*CNPJ[10] + 4*CNPJ[11] + 3*CNPJ[12];
    V[2] := V[2] + 2*V[1];
    V[2] := 11 - V[2] MOD 11;
    V[2] := IFTHEN(V[2] >= 10, 0, V[2]);

    //NOTA: VERDADEIRO SE OS D?GITOS DE VERIFICA??O S?O OS ESPERADOS.
    RESULT := ((V[1] = CNPJ[13]) AND (V[2] = CNPJ[14]));
  EXCEPT ON E: EXCEPTION DO
    RESULT := FALSE;
  END;
END;

FUNCTION VALIDAR_EMAIL(PEMAIL :STRING) :BOOLEAN;
VAR
  I: INTEGER;
  NAMEPART, SERVERPART: STRING;
BEGIN
  RESULT := FALSE;
  I := POS('@', PEMAIL);
  IF I = 0 THEN
    EXIT;
  NAMEPART := COPY(PEMAIL, 1, I - 1);
  SERVERPART := COPY(PEMAIL, I + 1, LENGTH(PEMAIL));
  IF (LENGTH(NAMEPART) = 0) OR ((LENGTH(SERVERPART) < 5)) THEN
    EXIT;
  I := POS('.', SERVERPART);
  IF (I = 0) OR (I > (LENGTH(SERVERPART) - 2)) THEN
    EXIT;
  RESULT := CHECKALLOWED(NAMEPART) AND CHECKALLOWED(SERVERPART);
END;

FUNCTION CHECKALLOWED(CONST S: STRING): BOOLEAN;
VAR
    I: INTEGER;
BEGIN
   RESULT := FALSE;
   FOR I := 1 TO LENGTH(S) DO
      IF NOT(S[I] IN ['A' .. 'Z', 'A' .. 'Z', '0' .. '9', '_', '-', '.']) THEN
         EXIT;
   RESULT := TRUE;
END;

FUNCTION BUSCANOME_COMPUTADOR: STRING;
VAR
   COMPUTER: PCHAR;
   CSIZE: DWORD;
BEGIN
  COMPUTER:=#0;
  CSIZE:=MAX_COMPUTERNAME_LENGTH + 1;
  TRY
      GETMEM(COMPUTER,CSIZE);
      IF Winapi.Windows.GETCOMPUTERNAME(COMPUTER,CSIZE ) THEN
          RESULT:= COMPUTER;
  FINALLY
      FREEMEM(COMPUTER);
  END;
END;

PROCEDURE ABRIR_AJUDA(PPARAM_PDF :STRING);
//var s, result:String;
  //  path: array[0..250] of char;
begin
       //s:='/A page=27.5 "D:\TCC - Sistemas de Informa??o\Projeto TCC\Delphi - IDE\Projeto e Formul?rios\Ajuda.pdf"';
  { s:='/A page='+PPARAM_PDF+' "D:\TCC - Sistemas de Informa??o\Projeto TCC\Delphi - IDE\Projeto e Formul?rios\Ajuda.pdf"';
   FindExecutable('D:\TCC - Sistemas de Informa??o\Projeto TCC\Delphi - IDE\Projeto e Formul?rios\Ajuda.pdf',nil,path);
   result := trim(StrPas(path));
   ShellExecute(handle,nil,pchar(result),pchar(s),nil,sw_show); }
end;
end.
