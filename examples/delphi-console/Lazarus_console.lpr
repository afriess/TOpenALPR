program Lazarus_console;

{$IFDEF FPC}
  {$MODE Delphi}
{$ENDIF}

{$APPTYPE CONSOLE}

{$IFnDEF FPC}
{$R *.res}
{$ELSE}
{$ENDIF}

uses
{$IFnDEF FPC}
  System.Diagnostics,
{$ELSE}
{$ENDIF}
  {$IFNDEF FPC}System.{$ENDIF}SysUtils,
  openalpr in '..\..\openalpr.pas';

var
  vOpenAlpr: TOpenALPR;
  alprResult: TOpenALPRResult;
  i, k: Integer;
  {$IFNDEF FPC}sw: TStopWatch; {$ENDIF}
begin
  vOpenAlpr := TOpenALPR.Create;
  try
    if vOpenAlpr.Initialize('eu', 'openalpr.conf', 'runtime_data') then
    begin
      vOpenAlpr.SetTopN(10);
      {$IFNDEF FPC}sw := TStopwatch.StartNew; {$ENDIF}
      alprResult := vOpenAlpr.RecognizeFile('samples\eu-3.jpg');
      {$IFNDEF FPC}WriteLn(Format('Total time to process image: %1.3fms.', [sw.Elapsed.TotalMilliseconds]));{$ENDIF}
      if (alprResult.Plates.Count > 0) then
      begin
        for i := 0 to alprResult.Plates.Count-1 do
        begin
          WriteLn(Format('plate%d: %d results -- Processing Time = %1.3fms.',
            [i, alprResult.Plates[i].Candidates.Count, alprResult.Plates[i].ProcessingTimeMs]));
          for k := 0 to alprResult.Plates[i].Candidates.Count-1 do
          begin
            WriteLn(Format('    - %s' + #9 + ' confidence: %1.3f',
              [alprResult.Plates[i].Candidates[k].Plate, alprResult.Plates[i].Candidates[k].Confidence]));
          end;
        end;
      end else
        WriteLn('No license plates found.');
    end;
  finally
    vOpenAlpr.Free;
  end;
end.
