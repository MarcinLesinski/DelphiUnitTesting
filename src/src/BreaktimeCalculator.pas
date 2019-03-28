unit BreaktimeCalculator;

interface

uses
    TimeService;

type
    TBreaktimeCalculator = class
    private
        _timeService: TTimeService;
    public
        constructor Create();
        destructor Destroy; override;

        function IsBreak: Boolean;
    end;

implementation

uses
    System.DateUtils,
    System.Math;

{ TBreaksCalculator }

constructor TBreaktimeCalculator.Create;
begin
    _timeService := TTimeService.Create;
end;

destructor TBreaktimeCalculator.Destroy;
begin
    _timeService.DisposeOf;
    inherited;
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
