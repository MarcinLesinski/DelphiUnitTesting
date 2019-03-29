unit BreaktimeCalculatorTests;

interface

uses
    DUnitX.TestFramework,
    BreaktimeCalculator,
    TimeService,

    DSharp.Testing.Mock;

type

    [TestFixture]
    TBreaktimeCalculatorTests = class(TObject)
    private
        _timeService: Mock<ITimeService>;
        _breaktimeCalculator: TBreaktimeCalculator;
    public
        [Setup]
        procedure Setup;
        [TearDown]
        procedure Teardown;
        [Test]
        procedure CalculateBreak_ReturnBreak_ForBreakTime;
    end;

implementation

uses
    System.SysUtils;

procedure TBreaktimeCalculatorTests.Setup;
begin
    _breaktimeCalculator := TBreaktimeCalculator.Create(_timeService);
end;

procedure TBreaktimeCalculatorTests.Teardown;
begin
    _timeService.Free;
    _breaktimeCalculator.DisposeOf;
end;

procedure TBreaktimeCalculatorTests.CalculateBreak_ReturnBreak_ForBreakTime;
var
    actual, expected: Boolean;
begin
    _timeService.Setup.WillReturn(StrToTime('05:45:13')).Once.WhenCallingWithAnyArguments.GetTime;
    actual := _breaktimeCalculator.IsBreak();
    expected := true;
    Assert.AreEqual(expected, actual);
end;

initialization

TDUnitX.RegisterTestFixture(TBreaktimeCalculatorTests);

end.
