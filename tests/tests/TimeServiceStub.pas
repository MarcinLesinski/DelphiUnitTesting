unit TimeServiceStub;

interface

uses
    TimeService;

type
    TTimeServiceStub = class(TInterfacedObject, ITimeService)
    private
        _time: TTime;
    public
        constructor Create(time: TTime);
        function GetTime: TTime;
    end;

implementation

{ TTestServiceStub }

constructor TTimeServiceStub.Create(time: TTime);
begin
    _time := time;
end;

function TTimeServiceStub.GetTime: TTime;
begin
    result := _time;
end;

end.
