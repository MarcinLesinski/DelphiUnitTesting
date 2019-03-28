program Timetable;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  BreaktimeCalculator in 'src\BreaktimeCalculator.pas',
  TimeService in 'src\TimeService.pas';

var
    timeService: TTimeService;
    breaksCalculator: TBreaktimeCalculator;
begin
    timeService := TTimeService.Create;
    breaksCalculator := TBreaktimeCalculator.Create(timeService);
    if breaksCalculator.IsBreak then
        Writeln('Przerwa')
    else
        Writeln('Praca');

    ReadLn;

    breaksCalculator.DisposeOf();
end.
