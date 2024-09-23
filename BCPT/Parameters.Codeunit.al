namespace Vjeko.Performance;

using System.Tooling;

codeunit 76000 Parameters
{
    var
        BCPTContext: Codeunit "BCPT Test Context";
        LoopMax: Integer;
        LoopTo: Integer;
        DoIgnoreCache: Boolean;
        Initialized: Boolean;

    local procedure Initialize()
    begin
        Evaluate(LoopMax, BCPTContext.GetParameter(Parameter_LoopCount()));
        Evaluate(DoIgnoreCache, BCPTContext.GetParameter(Parameter_IgnoreCache()));
        Initialized := true;
    end;

    /// <summary>
    /// The central loop control method. If it returns true, you should perform
    /// your test iteration. This method will clear database cache if it is
    /// configured to do so.
    /// </summary>
    /// <returns></returns>
    procedure KeepGoing() Result: Boolean
    begin
        if not Initialized then
            Initialize();

        if DoIgnoreCache then
            Database.SelectLatestVersion();

        LoopTo += 1;
        exit(LoopTo <= LoopMax);
    end;

    procedure IgnoreCache() Result: Boolean
    begin
        if not Initialized then
            Initialize();

        exit(DoIgnoreCache);
    end;

    /// <summary>
    /// Returns the number of iterations to be performed. If you are not using
    /// the `KeepGoing` method, you can use this method to get the number of
    /// iterations.
    /// </summary>
    /// <returns></returns>
    procedure LoopCount() Result: Integer
    begin
        if not Initialized then
            Initialize();

        exit(LoopMax);
    end;

    procedure Parameter_LoopCount(): Text
    begin
        exit('LoopCount');
    end;

    procedure Parameter_IgnoreCache(): Text
    begin
        exit('IgnoreCache');
    end;
}
