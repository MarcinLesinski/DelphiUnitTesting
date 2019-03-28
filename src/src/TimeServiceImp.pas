unit TimeServiceImp;

interface

uses
    TimeService;

type
    TTimeService = class(TInterfacedObject, ITimeService)
    public
        function GetTime: TTime;
    end;

implementation

uses
    System.SysUtils;

{ TTimeService }

function TTimeService.GetTime: TTime;
begin
    result := Now();
end;

end.
