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
    DSharp.Testing.Mock,
    System.SysUtils;

procedure TBreaktimeCalculatorTests.CalculateBreak_ReturnBreak_ForBreakTime;
var
    actual, expected: Boolean;
    timeService: Mock<ITimeService>;
    BreaktimeCalculator: TBreaktimeCalculator;
begin
    BreaktimeCalculator := TBreaktimeCalculator.Create(timeService);
    timeService.Setup.WillReturn(StrToTime('05:45:13')).Once.WhenCallingWithAnyArguments.GetTime;
    actual := BreaktimeCalculator.IsBreak();
    expected := true;
    Assert.AreEqual(expected, actual);
end;

initialization

TDUnitX.RegisterTestFixture(TBreaktimeCalculatorTests);

end.
