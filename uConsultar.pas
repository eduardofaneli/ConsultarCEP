unit uConsultar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdAuthentication;

type
  TConsultarCEP = class
  private
    FHttp: TIdHTTP;
    FSSL: TIdSSLIOHandlerSocketOpenSSL;
    FLogradouro: String;
    FBairro: String;
    FVerifyDepthSSL: Integer;
    FUF: String;
    FIOHandler: TIdIOHandler;
    FCEP: String;
    FHostSSL: String;
    FToken: String;
    FUsaSSL: Boolean;
    FComplemento: String;
    FGia: String;
    FEncode: TEncoding;
    FMethodSSL: TIdSSLVersion;
    FVerifyModeSSL: TIdSSLVerifyModeSet;
    FURL: String;
    FModeSSL: TIdSSLMode;
    FCodIBGE: String;
    FTipoLogradouro: String;
    FCidade: String;
    FRequestUserAgent: String;
    FResponse: String;

    procedure ProcessarRetorno;

  public
    constructor Create;
    destructor Destroy; override;

    function ConsultarCEP: Boolean;

  published
    property UsaSSL           : Boolean             read FUsaSSL           write FUsaSSL           ;
    property MethodSSL        : TIdSSLVersion       read FMethodSSL        write FMethodSSL        ;
    property ModeSSL          : TIdSSLMode          read FModeSSL          write FModeSSL          ;
    property VerifyModeSSL    : TIdSSLVerifyModeSet read FVerifyModeSSL    write FVerifyModeSSL    ;
    property VerifyDepthSSL   : Integer             read FVerifyDepthSSL   write FVerifyDepthSSL   ;
    property IOHandler        : TIdIOHandler        read FIOHandler        write FIOHandler        ;
    property Encode           : TEncoding           read FEncode           write FEncode           ;
    property HostSSL          : String              read FHostSSL          write FHostSSL          ;
    property RequestUserAgent : String              read FRequestUserAgent write FRequestUserAgent ;
    property URL              : String              read FURL              write FURL              ;
    property CEP              : String              read FCEP              write FCEP              ;
    property UF               : String              read FUF               write FUF               ;
    property Cidade           : String              read FCidade           write FCidade           ;
    property Bairro           : String              read FBairro           write FBairro           ;
    property TipoLogradouro   : String              read FTipoLogradouro   write FTipoLogradouro   ;
    property Logradouro       : String              read FLogradouro       write FLogradouro       ;
    property Complemento      : String              read FComplemento      write FComplemento      ;
    property CodIBGE          : String              read FCodIBGE          write FCodIBGE          ;
    property Gia              : String              read FGia              write FGia              ;
    property Response         : String              read FResponse         write FResponse         ;

  end;

implementation

uses
  uUtils;

{ TConsultarCEP }

function TConsultarCEP.ConsultarCEP: Boolean;
var
  sResponse: TStringStream;
begin

  if Encode = nil then
    sResponse := TStringStream.Create
  else
    sResponse := TStringStream.Create('', Encode);
  try

    Result := False;

    try

      if UsaSSL then
      begin

        FSSL.SSLOptions.Method      := MethodSSL;
        FSSL.SSLOptions.Mode        := ModeSSL;
        FSSL.SSLOptions.VerifyMode  := VerifyModeSSL;
        FSSL.SSLOptions.VerifyDepth := VerifyDepthSSL;
        FSSL.host                   := HostSSL;

        FHttp.IOHandler           := FSSL;
        FHttp.HandleRedirects     := True;

      end;

      FHttp.Request.UserAgent   := RequestUserAgent;

      FHttp.Get(URL, sResponse);

      Response := sResponse.DataString;

      ProcessarRetorno;

      Result := True;

    except

      on e:EIdHTTPProtocolException do
        raise Exception.Create(e.Message);

      on e: Exception do
      begin
        raise Exception.Create(e.Message);
      end;

    end;

  finally

    FreeAndNil(sResponse);

  end;

end;

constructor TConsultarCEP.Create;
begin

  FHttp := TIdHTTP.Create(nil);
  FSSL := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  UsaSSL           := False;
  MethodSSL        := sslvSSLv23;
  ModeSSL          := sslmUnassigned;
  VerifyModeSSL    := [];
  VerifyDepthSSL   := 0;
  IOHandler        := nil;
  Encode           := nil;
  HostSSL          := EmptyStr;
  RequestUserAgent := 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; Maxthon)';

end;

destructor TConsultarCEP.Destroy;
begin

  FreeAndNil(FSSL);
  FreeAndNil(FHttp);

  inherited;
end;

procedure TConsultarCEP.ProcessarRetorno;
begin

  UF := GetTagPos(Response, 'UF');

  Cidade := GetTagPos(Response, 'CIDADE');

  if Cidade = EmptyStr then
    Cidade := GetTagPos(Response, 'LOCALIDADE');

  Bairro := GetTagPos(Response, 'BAIRRO');
  TipoLogradouro := GetTagPos(Response, 'TIPO_LOGRADOURO');
  Logradouro := GetTagPos(Response, 'LOGRADOURO');
  Complemento := GetTagPos(Response, 'COMPLEMENTO');
  CodIBGE := GetTagPos(Response, 'IBGE');
  Gia := GetTagPos(Response, 'GIA');

end;

end.
