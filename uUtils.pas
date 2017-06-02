unit uUtils;

interface

uses
  IdTCPClient, IdHTTP, System.IniFiles, IdExplicitTLSClientServerBase, IdFTP,
  System.SysUtils, Vcl.Dialogs, System.Classes, Vcl.Forms,
  Vcl.Controls, Winapi.Windows, Soap.SOAPHTTPTrans, Soap.WebNode, System.DateUtils,  IdDayTime,
  Vcl.DBCtrls, Data.DB, Vcl.Graphics, Vcl.StdCtrls, Vcl.ComCtrls,
  Soap.XSBuiltIns, system.ZLib, Soap.EncdDecd, System.RegularExpressions;


  function GetTagPos(XML, Strtag: String; AMantemCaseDoResult: boolean = false): String; overload;
  function GetTagPos(AExpressaoRegular, XML, Strtag: String; AMantemCaseDoResult: boolean = false; AExpressaoRegFlag: TRegExOptions = []): string; overload;

implementation

function GetTagPos(XML, Strtag: String; AMantemCaseDoResult: boolean = false): String;
var
  PosIni, PosFim : Integer;
  sText: string;
  XMLOriginal: String;
begin
  PosIni := 0;
  PosFim := 0;

  if AMantemCaseDoResult then
    XMLOriginal := XML;

  XML := AnsiUpperCase(XML);
  Strtag := AnsiUpperCase(Strtag);
  if Pos('<'+Strtag,XML) > 0 then
  begin
    if Pos('<'+Strtag+' ',XML) > 0 then
      PosIni := Pos('<'+Strtag+' ',XML) + Length(Strtag) - 1;

    if PosIni = 0 then
      PosIni := Pos('<'+Strtag+'>',XML) + Length(Strtag) - 2;
    PosFim := Pos('/' + Strtag +'>',XML);

    if AMantemCaseDoResult then
      sText := Copy(XMLOriginal,PosIni,(PosFim - PosIni))
    else
      sText := Copy(XML,PosIni,(PosFim - PosIni));

    PosIni := Pos('>',sText);
    PosFim := Length(sText); //Pos('<',sText);

    sText := Copy(sText,PosIni + 1,(PosFim - PosIni - 1));

    Result := Trim(sText);
  end
  else
    Result := '';

end;

function GetTagPos(AExpressaoRegular, XML, Strtag: String; AMantemCaseDoResult: boolean = false; AExpressaoRegFlag: TRegExOptions = []): string; overload;
var
  ExpressaoRegular: TRegex;
begin

  ExpressaoRegular.Create(AExpressaoRegular, AExpressaoRegFlag);

  XML := ExpressaoRegular.Replace(XML, EmptyStr);

  Result := GetTagPos(XML, Strtag, AMantemCaseDoResult);

end;

end.

