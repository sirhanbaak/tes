program VCL_Sparkle_Server;

uses
  Vcl.Forms,
  Server in 'Server.pas',
  MainForm in 'MainForm.pas' {fmServer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmServer, fmServer);
  Application.Run;
end.
