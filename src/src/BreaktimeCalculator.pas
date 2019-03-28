unit BreaktimeCalculator;

interface

uses
    TimeService;

type
    TBreaktimeCalculator = class
    private
        _timeService: ITimeService;
    public
        constructor Create(timeService: ITimeService);

        function IsBreak: Boolean;
    end;

implementation

uses
    System.DateUtils,
    System.Math;

{ TBreaksCalculator }

constructor TBreaktimeCalculator.Create(timeService: ITimeService);
begin
    _timeService := timeService;
end;

function TBreaktimeCalculator.IsBreak: Boolean;
const
    min_hour = 4;
    max_hour = 7;
var
    time: TTime;
    hour: Integer;
begin
    time := _timeService.GetTime;
    hour := HourOf(time);
    result := InRange(hour, min_hour, max_hour);
end;

end.
