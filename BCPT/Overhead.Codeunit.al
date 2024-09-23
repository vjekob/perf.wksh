namespace Vjeko.Performance;

/// <summary>
/// Measures overhead of the default parameters codeunit. This is useful for offsetting the overhead of the test codeunits.
/// </summary>
codeunit 79999 Overhead
{
    var
        Parameters: Codeunit Parameters;

    trigger OnRun()
    begin
        while Parameters.KeepGoing() do;
    end;
}
