# 🏁 Training Task Scenario – SampleStore API

Welcome to the **SampleStore** onboarding project!  
This task will introduce you to the powerful `.NET CLI` tool 
[**DEFC.Util.RepoGen**](https://www.nuget.org/packages/DEFC.Util.RepoGen), 
which automates repository and Unit of Work generation using **SQL Server stored procedures**.

---

## 📘 Scenario

You’ve joined the backend team of an online platform called **SampleStore**.  
Your goal is to set up the data access layer using `DEFC.Util.RepoGen`, based on:

- A sample SQL Server database (`SampleStore.sql`)
- A .NET Core API skeleton project (`SampleStore`)
- A RepoGen commands to follow (`SampleStore-commands.txt`)
- A batch automation script (`store-setup.batch.json`)

You'll generate the necessary code structure without writing boilerplate repositories or services manually!

---

## 📦 Files Provided

| File/Folder                  | Description                                         |
|-----------------------------|-----------------------------------------------------|
| `SampleStore.sql`           | SQL script to create and seed the database          |
| `Store/`                    | .NET Core 6+ API project skeleton                   |
| `store-setup.batch.json`    | Batch command script for RepoGen                    |
| `RepoGen.json`              | Tool configuration file with DB & folder settings   |
| `SampleStore-commands.txt`              | A RepoGen commands to follow   |

---

## 🛠️ Prerequisites

Make sure the following are installed:

-  [.NET 6 SDK or newer](https://dotnet.microsoft.com/download)
-  SQL Server
- `Microsoft.Data.SqlClient`
- `Microsoft.EntityFrameworkCore.SqlServer`
- `Microsoft.EntityFrameworkCore`
- `DEFC.Util.RepoGen` installed globally or locally:
  ```bash
  dotnet add package DEFC.Util.RepoGen --version 1.0.0
  ```

---

## 🚀 Steps to Complete the Task

### ✅ Step 1: Create the Database
- Open SQL Server Management Studio (SSMS) or any SQL client.
- Run the script:
```bash
	/DB/SampleStore.sql
```
- This creates tables like `Products`, `ProductCategories`, `Orders`, `Customers` and a few stored procedures.
### ✅ Step 2: Open the API Project
- Open the `SampleStore` solution in Visual Studio.
- Review the structure — **do not manually add repositories or services**.
### ✅ Step 3: Initialize the RepoGen tool
- Open **Developer PowerShell for Visual Studio** *(recommended)* — provides better visualization and output formatting.		
  (OR) **Package Manager Console** in Visual Studio.
  (OR) **.NET CLI** from terminal or command prompt.
- Write the initialization command below
```bash
dotnet tool run DEFC.Util.RepoGen initial
```
### ✅ Step 4: Review the Configuration
- Open the file:

```bash 
SampleStore/RepoGenTool/RepoGen.json
```
- Confirm it contains the correct:
	- Connection string to SampleStore DB
	- Namespace (e.g., SampleStore)
	- Folder structure model (e.g., MODEL_2)

### ✅ Step 5: Set-up app folder structure


