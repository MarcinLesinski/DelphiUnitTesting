unit BreaktimeCalculatorTests;

interface

uses
    DUnitX.TestFramework,
    BreaktimeCalculator;

type

    [TestFixture]
    TBreaktimeCalculatorTests = class(TObject)
    public
        [Test]
        procedure CalculateBreak_ReturnBreak_ForBreakTime;
    end;

implementation

uses
    TimeService,
    System.SysUtils;

procedure TBreaktimeCalculatorTests.CalculateBreak_ReturnBreak_ForBreakTime;
var
    actual, expected: Boolean;
    timeService: TTimeService;
    breaktimeCalculator: TBreaktimeCalculator;
begin
    timeService := TTimeService.Create;
    breaktimeCalculator := TBreaktimeCalculator.Create(timeService);
    actual := breaktimeCalculator.IsBreak();

    //    expected := ??
    Assert.AreEqual(expected, actual);
end;

initialization

TDUnitX.RegisterTestFixture(TBreaktimeCalculatorTests);

end.
