program Timetable;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  BreaktimeCalculator in 'src\BreaktimeCalculator.pas',
  TimeService in 'src\TimeService.pas';

var
    breaksCalculator: TBreaktimeCalculator;
begin
    breaksCalculator := TBreaktimeCalculator.Create;
    if breaksCalculator.IsBreak then
        Writeln('Przerwa')
    else
        Writeln('Praca');

    ReadLn;

    breaksCalculator.DisposeOf();
end.
