namespace Vjeko.Performance;

using System.Tooling;

codeunit 76001 DefaultParameters implements "BCPT Test Param. Provider"
{
    var
        Parameters: Codeunit Parameters;

    procedure GetDefaultParameters(): Text[1000]
    begin
        exit(StrSubstNo('%1=10000, %2=true', Parameters.Parameter_LoopCount(), Parameters.Parameter_IgnoreCache()));
    end;

    procedure ValidateParameters(Params: Text[1000])
    begin
        // Not needed for demo
    end;

    procedure AppendParameters(Params: Text[1000]): Text
    begin
        exit(StrSubstNo('%1, %2', Params, GetDefaultParameters()));
    end;
}
