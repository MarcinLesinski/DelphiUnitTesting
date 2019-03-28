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
    TimeServiceStub,
    System.SysUtils;

procedure TBreaktimeCalculatorTests.CalculateBreak_ReturnBreak_ForBreakTime;
var
    actual, expected: Boolean;
    timeService: TTimeServiceStub;
    BreaktimeCalculator: TBreaktimeCalculator;
begin
    timeService := TTimeServiceStub.Create(StrToTime('05:45:23'));
    BreaktimeCalculator := TBreaktimeCalculator.Create(timeService);
    actual := BreaktimeCalculator.IsBreak();
    expected := true;
    Assert.AreEqual(expected, actual);
end;

initialization

TDUnitX.RegisterTestFixture(TBreaktimeCalculatorTests);

end.
