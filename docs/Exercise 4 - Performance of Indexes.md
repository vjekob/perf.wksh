# Exercise 4: Performance of Indexes

In this exercise, you will test the performance of indexes in Business Central. You will create two identical tables, one without any indexes, and one with several indexes. You will then write a test that measures time for various operations, and compare the results.

## Task 1: Create tables

Create two tables: `DEMO Customer` and `DEMO Customer Indexed`. Copy all fields from the Base App's `Customer` table to both tables. Remove any validation logic from the fields.

Both tables should define a clustered primary key on the `No.` field.

## Task 2: Create indexes

For `DEMO Customer Indexed`, copy all additional non-obsolete keys from Base App's `Customer` table.

## Task 3: Write test code

Create two BCPT tests with the following behavior:
* Each test operates on one of the two tables you created. Both test codeunits should be identical except for the table they operate upon and for scenario names you will use.
* First scenario is inserting 10000 records into the table. Make sure to write a value into every field that is indexed in the `DEMO Customer Indexed` table. Value of numeric fields should be the value of the record's position in the loop. Value of text fields should be the same value, just formatted as text.
* Second scenario is finding records in the table. For each of the indexed fields in the `DEMO Customer Indexed` table, find a record with a specific value that's expected to be inserted there.
* Third scenario is updating all records in the table. Iterate through all records and update each field to a new value. Any value is fine, as long as it is different from the original value.
* Last scenario is to delete all records from the table using the `DeleteAll` method.

Make sure that scenario names indicate whether you are testing indexed or non-indexed table.

## Task 4: Execute and analyze the results

Publish your test, then create a new BCPT suite. Make sure to add one line for each codeunit you created in Task 3. Make sure that delay between tests is set to 1. Accept all other defaults.

Run the suite, then export the results into Excel and use PivotTable feature to determine which table performs better for which type of operation.
