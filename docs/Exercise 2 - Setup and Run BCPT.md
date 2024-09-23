# Exercise 2: Setup and Run Business Central Performance Toolkit

In this exercise you will set up Business Central Performance Toolkit (BCPT), configure a new performance test suite, and then run the suite.

## Step 1: Install Performance Toolkit app

If you have **Performance Toolkit** already installed in your environment, skip this step.

This exercise assumes you are running a Business Central Online Sandbox environment.

> Note: If you are using a Docker container, check if you have **Performance Toolkit** extension installed. If not, you'll have to set up new container:
>   ```ps
>   New-BcContainer `
>       -includePerformanceToolkit # THIS PARAMETER IS IMPORTANT
>       # Other parameters here
>   ```

1. Open **Extension Marketplace**.
2. Search for *"Performance Toolkit"*. Under **All results** there should be one result.
3. Click **Get it now**.
4. In the **Confirm to continue** dialog, click **Get it now**.
5. In the **Extension Installation** dialog, click Install and follow the instructions.

## Step 2: Install Performance Toolkit extension for Visual Studio Code

If you have **Performance Toolkit** extension already installed in Visual Studio Code, skip this step.

1. Go to **Extensions** (`Ctrl+Shift+X`).
2. Search for *"ms-dynamics-smb.bcpt"*.
3. Click **Performance Toolkit**.
4. Click **Install**.

## Step 3: Set up a new BCPT project

This step is optional. This app is already configured as a BCPT project and you can use this app for all exercises and practices in this workshop. However, if you want to try to create a new project from scratch, follow these steps.

1. Press `Ctrl+Shift+P` (or `F1`) to access Command Palette.
2. Enter *"BCPT: Setup new Business Central Performance Toolkit project"* and press `Enter`.
3. In the **Select which type of environment you want to target** prompt, select **SaaS**.
    > Note: Selecting **Docker** may not work. At the time of this writing, there seems to be a bug in the BCPT
    > extension (check this [open unresolved issue at GitHub](https://github.com/microsoft/ALAppExtensions/issues/26596))
    > that prevents setting up or running BCPT projects using the BCPT extension for Visual Studio Code. You can still
    > configure the project manually and then run it manually.
4. When the popup shows with *To sign in, use a web browser...* message shows, click **Copy & Open**.
5. In the browser, in the **Enter code to allow access** dialog, paste the code in the **Code** field.
6. Click **Next**. If requested, follow the instructions to select the account or to sign in to your Business Central Online tenant.
7. When asked ***Are you trying to sign in to Dynamics 365 Business Central Performance Toolkit Client?***, click **Continue**.
8. When completed, the message ***You have signed in to the Dynamics 365 Business Central Performance Toolkit Client application on your device. You may now close this window.*** shows. Close the browser tab and return to Visual Studio Code.
9. In the **Select which environment you want to target** prompt, select the environment you want to use.
10. In the **Please enter the target directory for where to create the BCPT project** prompt, make sure the correct path for the new VS Code workspace is specified, then press `Enter`.
11. In the **Please select the source of the sample tests** choose **Standard**.
    > Note: Selecting **GitHub** may not work. At the time of this writing, this results in an error. Possible reason is that
    > the [sample tests have been moved](https://github.com/microsoft/ALAppExtensions/pull/26799) out of the original repository.
12. When finished, click **Open**.
13. Download the symbols.

## Step 4: Deploy the project

Regardless of whether you have configured a new project in the previous step, whether it uses Docker or SaaS, or whether you are using this app, you have to deploy the project to your environment just like any other Business Central app.

1. Press `F5` to build and deploy your app.
2. When deployment succeeds, page **BCPT Suites** will open. ***Do not close it!***

## Step 5: Create a new BCPT suite

1. In the **BCPT Suites** page, click `+ New`.
2. In the **BCPT Suite** page, enter this information:
    | Field       | Value               |
    | ----------- | ------------------- |
    | Code        | TEST                |
    | Description | My first BCPT suite |
3. In the **BCPT Suite Lines** part, enter these lines:
    | Codeunit ID | No. of sessions | Delay between iterations (sec.) |
    | ----------- | --------------- | ------------------------------- |
    | 50013       | 5               | 1                               |
    | 50014       | 5               | 1                               |
    > Please note that default for **No. of sessions** is 1, and for **Delay between iterations** is 5. We are inverting these values on purpose.

## Step 6: Run the BCPT suite and check results

1. In the **BCPT Suite** page, click `Start`.
    > If you configured everything as described in the previous step, the tests will run for 1 minute. Tests will run in the background.
2. Monitor the execution status by occasionally clicking `Refresh`. The execution status can be seen in the **Status** field. While tests are running, it will contain value **Running**.
3. When tests finish, the **Status** changes to **Completed**.
4. Click `Log Entries` to open the **BCPT Log Entries** page.
5. In the **BCPT Log Entries** page, click **Show errors**.

Running this test suit shows that creating and posting a large number of sales and purchase orders is expected to result in deadlocks when ran simultaneously. BCPT is very useful in exposing this kind of issues.

## Step 7: Analyze the results in Excel

1. In the **BCPT Log Entries** page, click the share button, then click **Open in Excel**
2. Open the downloaded Excel file.
3. Click **Insert > Pivot Table** and accept all defaults.
4. From the **PivotTable Fields** pane, click **Operation** and **Duration (ms)**
