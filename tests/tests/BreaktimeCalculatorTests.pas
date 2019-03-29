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
        [TestCase('Lower extreme value test.', '04:00:00')]
        [TestCase('Upper extreme value test.', '07:00:00')]
        [TestCase('Middle value test.', '05:45:13')]
        procedure CalculateBreak_ReturnBreak_ForBreakTime(time: string);
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

procedure TBreaktimeCalculatorTests.CalculateBreak_ReturnBreak_ForBreakTime(time: string);
var
    actual, expected: Boolean;
begin
    _timeService.Setup.WillReturn(StrToTime(time)).Once.WhenCallingWithAnyArguments.GetTime;
    actual := _breaktimeCalculator.IsBreak();
    expected := false;
    Assert.AreEqual(expected, actual);
end;

initialization

TDUnitX.RegisterTestFixture(TBreaktimeCalculatorTests);

end.
