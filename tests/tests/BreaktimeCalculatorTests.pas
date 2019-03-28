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
    breaktimeCalculator: TBreaktimeCalculator;
begin
//    expected := ??
    breaktimeCalculator := TBreaktimeCalculator.Create;
    actual := breaktimeCalculator.IsBreak();

    Assert.AreEqual(expected, actual);
end;

initialization

TDUnitX.RegisterTestFixture(TBreaktimeCalculatorTests);

end.
