# Exercise 3: Does `IsEmpty` help improve performance?

Recently there has been some discussion in the community about the following pattern:
```pascal
if not Rec.IsEmpty() then
    if Rec.FindSet() then
        repeat
            // Do something
        until not Rec.FindNext();
```

The theory behind goes something like this: *It takes SQL Server a little time to determine if a recordset is empty as compared to fetching data from the underlying store. By calling `IsEmpty` first, we can avoid the overhead of calling `FindSet` on an empty recordset.*

It also seems to have been influenced by another similar practice:
```pascal
// First use case
if not Rec.IsEmpty() then
    Rec.Delete();

// Second use case
if not Rec.IsEmpty() then
    Rec.DeleteAll();
```

## Hypotheses

There are three hypotheses to test:

1. Calling `IsEmpty` before `FindSet` improves performance.
2. Calling `IsEmpty` before `Delete` improves performance.
3. Calling `IsEmpty` before `DeleteAll` improves performance.

## Test

Your goal in this exercise is to:
1. Envision a valid experiment (test) to prove or disprove these hypotheses beyond reasonable doubt
2. Write test code
3. Execute and analyze the results

> No further instructions are given. From pure AL perspective, these should be very simple tests. Apply the theory you just learned in the class and ask the instructor for help if needed.
