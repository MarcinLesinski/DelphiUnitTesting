unit TimeService;

interface

type
    TTimeService = class
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
