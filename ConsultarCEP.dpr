program ConsultarCEP;

{$R *.dres}

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmConsultarCEP},
  uConsultar in 'uConsultar.pas',
  uUtils in 'uUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmConsultarCEP, frmConsultarCEP);
  Application.Run;
end.

