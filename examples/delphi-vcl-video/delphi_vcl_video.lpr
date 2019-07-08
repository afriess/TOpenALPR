program delphi_vcl_video;

{$MODE Delphi}

uses
  {Vcl.Forms,}
  FormOpenALPRVideo in 'FormOpenALPRVideo.pas' {OpenALPRVideoForm},
  openalpr in '..\..\openalpr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TOpenALPRVideoForm, OpenALPRVideoForm);
  Application.Run;
end.
