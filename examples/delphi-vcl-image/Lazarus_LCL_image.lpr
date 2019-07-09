program Lazarus_LCL_image;

{$mode objfpc}{$H+}

uses
  cmem,
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, FormOpenALPRImage;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TOpenALPRImageForm, OpenALPRImageForm);
  Application.Run;
end.

