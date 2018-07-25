unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, IdTCPConnection, IdTCPClient, IdHTTP, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdAuthentication, XML.XmlDoc;

type
  TfrmConsultarCEP = class(TForm)
    gbRetorno: TGroupBox;
    mmRetorno: TMemo;
    pnlTopo: TPanel;
    gbDados: TGroupBox;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    lblComplemento: TLabel;
    edtCEP: TEdit;
    edtLogradouro: TEdit;
    edtComplemento: TEdit;
    lblBairro: TLabel;
    lblLocalidade: TLabel;
    lblUF: TLabel;
    edtBairro: TEdit;
    edtLocalidade: TEdit;
    edtUF: TEdit;
    lblUnidade: TLabel;
    edtUnidade: TEdit;
    lblIBGE: TLabel;
    edtIBGE: TEdit;
    pnlRequisicao: TPanel;
    gbConsulta: TGroupBox;
    edtConsulta: TEdit;
    rgOndeConsultar: TRadioGroup;
    gbConsultar: TGroupBox;
    gbToken: TGroupBox;
    edtToken: TEdit;
    rgEncode: TRadioGroup;
    btnConsultar: TBitBtn;
    procedure btnConsultarClick(Sender: TObject);
    procedure rgOndeConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure ConsultarCEP;
    function getRequestCorreios(ACep: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarCEP: TfrmConsultarCEP;

implementation

{$R *.dfm}

uses
  uConsultar;

procedure TfrmConsultarCEP.btnConsultarClick(Sender: TObject);
begin
  ConsultarCEP;
end;

procedure TfrmConsultarCEP.ConsultarCEP;
var
  FConsultarCEP: TConsultarCEP;
begin

  FConsultarCEP := TConsultarCEP.Create;
  try

    mmRetorno.Clear;

    case rgEncode.ItemIndex of
      0:
        FConsultarCEP.Encode := nil;
      1:
        FConsultarCEP.Encode := TEncoding.UTF8;
      2:
        FConsultarCEP.Encode := TEncoding.ANSI;
      3:
        FConsultarCEP.Encode := TEncoding.ASCII;
      4:
        FConsultarCEP.Encode := TEncoding.Unicode;
    end;

    FConsultarCEP.CEP := Trim(edtConsulta.Text);

    case rgOndeConsultar.ItemIndex of
      0:
        begin

          FConsultarCEP.UsaSSL := True;
          FConsultarCEP.URL := 'https://viacep.com.br/ws/' +
            FConsultarCEP.CEP + '/xml';

        end;
      1:
        begin

          FConsultarCEP.UsaSSL := False;
          FConsultarCEP.URL := 'http://webservice.kinghost.net/web_cep.php?auth=' + Trim(edtToken.Text) + '&formato=xml&cep=' + FConsultarCEP.CEP;
        end;
      2:
        begin
          //WSDL CORREIOS: https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente?wsdl
          FConsultarCEP.UsaSSL := False;
          FConsultarCEP.URL := 'https://apps.correios.com.br/SigepMasterJPA/AtendeClienteService/AtendeCliente';
          FConsultarCEP.UsePost := True;
          FConsultarCEP.Request := getRequestCorreios(FConsultarCEP.CEP);
        end;
    end;

    if FConsultarCEP.ConsultarCEP then
    begin

      mmRetorno.Lines.Add(FormatXMLData(FConsultarCEP.Response));
      edtCEP.Text := FConsultarCEP.CEP;
      edtLogradouro.Text := FConsultarCEP.Logradouro;
      edtComplemento.Text := FConsultarCEP.Complemento;
      edtBairro.Text := FConsultarCEP.Bairro;
      edtLocalidade.Text := FConsultarCEP.Cidade;
      edtUF.Text := FConsultarCEP.UF;
      edtUnidade.Text := FConsultarCEP.Gia;
      edtIBGE.Text := FConsultarCEP.CodIBGE;

    end;

  finally

    FreeAndNil(FConsultarCEP);

  end;

end;

procedure TfrmConsultarCEP.FormCreate(Sender: TObject);
  function ExtrairResource(ResourceName, ResType, Filename: string): Boolean;
  var
    Resource: TResourceStream;
  begin
    Resource := TResourceStream.Create(HInstance, ResourceName,
      PWideChar(ResType));
    try
      Resource.SaveToFile(Filename);
      result := FileExists(Filename)
    finally
      Resource.Free;
    end;
  end;

var
  ResourceName: string;
begin
  inherited;

  ResourceName := ExtractFilePath(ParamStr(0));
  if ResourceName[Length(ResourceName)] <> '\' then
    ResourceName := ResourceName + '\';
  ResourceName := ResourceName + 'libeay32.dll';

  if not ExtrairResource('libeay32', 'DLL', ResourceName) Then
    Application.MessageBox(PChar('Falha ao extrair ' + ResourceName), 'Erro',
      MB_ICONERROR + MB_OK);

  ResourceName := ExtractFilePath(ParamStr(0));
  if ResourceName[Length(ResourceName)] <> '\' then
    ResourceName := ResourceName + '\';
  ResourceName := ResourceName + 'ssleay32.dll';

  if not ExtrairResource('ssleay32', 'DLL', ResourceName) Then
    Application.MessageBox(PChar('Falha ao extrair ' + ResourceName), 'Erro',
      MB_ICONERROR + MB_OK);

end;

function TfrmConsultarCEP.getRequestCorreios(ACep: string): string;
var
  xml: TStringBuilder;
begin
  xml := TStringBuilder.Create;
  try

    xml.Append('<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">')
       .Append('   <soapenv:Header/>')
       .Append('   <soapenv:Body>')
       .Append('      <cli:consultaCEP>')
       .Append('         <!--Optional:-->')
       .Append('         <cep>').Append(ACep).Append('</cep>')
       .Append('      </cli:consultaCEP>')
       .Append('   </soapenv:Body>')
       .Append('</soapenv:Envelope>');

    Result := xml.ToString;

  finally
    FreeAndNil(xml);
  end;
end;

procedure TfrmConsultarCEP.rgOndeConsultarClick(Sender: TObject);
begin

  gbToken.Visible := rgOndeConsultar.ItemIndex = 1;

end;

end.
