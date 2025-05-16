# 🏁 Training Task Scenario – SampleStore API

Welcome to the **SampleStore** onboarding project!  
This task will introduce you to the powerful `.NET CLI` tool 
[**DEFC.Util.RepoGen**](https://www.nuget.org/packages/DEFC.Util.RepoGen), 
which automates repository and Unit of Work generation using **SQL Server stored procedures** [See RepoGen tool documentation](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/blob/main/RepoGen-Readme.md).
# 📑 Table of Contents

1. [🧩 Scenario Title](#-scenario-title)
2. [📘 Scenario](#-scenario)
3. [🛠️ Prerequisites](#️-prerequisites)
4. [🚀 Steps to Complete the Task](#-steps-to-complete-the-task)
   - [✅ Step 1: Create the Database](#-step-1-create-the-database)
   - [✅ Step 2: Open the API Project](#-step-2-open-the-api-project)
   - [✅ Step 3: Initialize the RepoGen tool](#-step-3-initialize-the-repogen-tool)
   - [✅ Step 4: Review the Configuration](#-step-4-review-the-configuration)
   - [✅ Step 5: Set-up app folder structure](#-step-5-set-up-app-folder-structure)
   - [✅ Step 6: Use CRUD option for ProductCategories](#-step-6-for-productcategories-table-will-use-crud-option)
   - [✅ Step 7: Use Map option for Products, Orders, Customers](#-step-7-for-products-orders-customers-tables-will-use-map-option)
   - [✅ Step 8: Use Batch option for OrderItems](#-step-8-for-orderitems-table-will-use-batch-option)
   - [✅ Step 9: Explore the Generated Code](#-step-9-explore-the-generated-code--add-required-logics-and-validations)
   - [✅ Step 10: Configure your application](#-step-10-configure-your-application)
   - [✅ Step 11: Wire It to the API](#-step-11-wire-it-to-the-api)
5. [📚 For More Tool Training](#-for-more-tool-training)
6. [🧱 Challenges](#-challenge-1-remap-stored-procedure)
   - [Challenge 1: Remap Stored Procedure](#-challenge-1-remap-stored-procedure)
   - [Challenge 2: Remove Stored Procedure](#-challenge-2-remove-stored-procedure)
   - [Challenge 3: Force Overwrite Using --force or -f](#-challenge-3-force-overwrite-using---force-or--f)
   - [Challenge 4: Change Structure Model](#-challenge-4-change-structure-model)
7. [🎯 Learning Objectives](#-learning-objectives)
8. [📩 Questions?](#-questions)
9. [🎯 Learning Outcome](#-learning-outcome)

---

## 🧩 Scenario Title
`Kickstart the Store API with DEFC.Util.RepoGen`

## 📘 Scenario
You've joined the backend team of an online platform called **SampleStore**.  
Your goal is to set up the data access layer using `DEFC.Util.RepoGen`, based on:

- A sample SQL Server database (`SampleStore.sql`) that creates the store database with tables like 
  `Products`, `ProductCategories`, `Orders`, `Customers`,`OrderItems` and stored procedures.
- A .NET Core API skeleton project (`SampleStore`)
You'll generate the necessary code structure without writing boilerplate repositories or services manually!

---

## 🛠️ Prerequisites

Make sure the following are installed:

- SQL Server
- [.NET 6 SDK or newer](https://dotnet.microsoft.com/download)
    - `Microsoft.Data.SqlClient`
    - `Microsoft.EntityFrameworkCore.SqlServer`
    - `Microsoft.EntityFrameworkCore`
    - `DEFC.Util.RepoGen`
      ```bash
      dotnet add package DEFC.Util.RepoGen --version 1.0.0
      ```

---

## 🚀 Steps to Complete the Task

### ✅ Step 1: Create the Database
- Open SQL Server Management Studio (SSMS) or any SQL client.
- [Run the script](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/tree/main/DB)
- This creates tables `Products`, `ProductCategories`, `Orders`, `Customers`, `OrderItems` and a few stored procedures.
### ✅ Step 2: Open the API Project
- Open the [`SampleStore`](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/tree/main/SampleStore) solution in Visual Studio.
- Review the structure — **do not manually add repositories or services**.
### ✅ Step 3: Initialize the RepoGen tool
- Open **Developer PowerShell for Visual Studio** *(recommended)* — provides better visualization and output formatting.
    - (OR) **.NET CLI** from terminal or command prompt *(recommended)* — provides better visualization and output formatting.		
    - (OR) **Package Manager Console** in Visual Studio.
- Write the initialization command below
```bash
dotnet tool run DEFC.Util.RepoGen initial
```
### ✅ Step 4: Review the Configuration

[See RepoGen Configuration](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/blob/main/RepoGen-Readme.md#-repogenjson--tool-configuration)

#### 🔧 RepoGen Configuration Checklist

Please verify and update the following in the file:

**Path:** `SampleStore/RepoGenTool/RepoGen.json`

#### 🔧 Required Configuration Fields

| Field                    | Status     | Description                                                                                   | Example Value            |
|-------------------------|------------|-----------------------------------------------------------------------------------------------|--------------------------|
| `ConnectionString`      | ❌ Pending | Valid connection string to the SampleStore database                                           | `Server=localhost;Database=SampleStore;User Id=admin;Password=secret;TrustServerCertificate=True` |
| `DBContextName`         | ❌ Pending | Base name for the `DbContext` (suffix `DBContext` will be added automatically)               | `Store`                  |
| `Namespace`             | ❌ Pending | Root namespace to be used for generated code                                                  | `SampleStore`            |
| `FoldersStructureModel` | ✅ Set      | Structure model used for organizing the generated codebase                                   | `MODEL_1`                |

> ℹ️ **Note:** Other folder models include `MODEL_2`, `MODEL_3`, and `MODEL_CUSTOM`  [see](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/blob/main/README.md).

#### 📁 Example `RepoGen.json`

```json
{
  "Config": {
    "DBConfig": {
      "SchemaID": "1",
      "DBContextName": "Store",
      "ConnectionString": "Server=localhost;Database=SampleStore;User Id=admin;Password=secret;TrustServerCertificate=True"
    },
    "AppConfig": {
      "Namespace": "SampleStore",
      "FoldersStructureModel": "MODEL_1",
      "LoggerCode": "101"
    }
  }
}
```
### ✅ Step 5: Set-up app folder structure

```bash
dotnet tool run DEFC.Util.RepoGen structure set
```
#### ⚠️ Important Notes
- Make sure no extra spaces in the commands.

- To confirm if the connection string in `RepoGen.json` is working:
```bash
dotnet tool run DEFC.Util.RepoGen test db-connection
```

### ✅ Step 6: For ProductCategories table will use CRUD option
- use `crud` command with table `ProductCategories`: 
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl ProductCategories --service ProductCategory
```
### ✅ Step 7: For `Products`, `Orders`, `Customers` tables will use Map option
- use	`add` for creating `Products`,`Customers` and `Orders` Repository:

```bash
dotnet tool run DEFC.Util.RepoGen add --repo Products
dotnet tool run DEFC.Util.RepoGen add --repo Customers
dotnet tool run DEFC.Util.RepoGen add --repo Orders
```
- use `map` command `sp_CreateProduct`,`sp_GetAllProducts`,`sp_GetProductById`,`sp_UpdateProduct` and `sp_DeleteProduct` stored procedures: 
```bash
dotnet tool run DEFC.Util.RepoGen map --sp sp_CreateProduct --repo Products
dotnet tool run DEFC.Util.RepoGen map --sp sp_GetAllProducts --repo Products
dotnet tool run DEFC.Util.RepoGen map --sp sp_GetProductById --repo Products
dotnet tool run DEFC.Util.RepoGen map --sp sp_UpdateProduct --repo Products
dotnet tool run DEFC.Util.RepoGen map --sp sp_DeleteProduct --repo Products
```
- use `map` command `sp_CreateCustomer`,`sp_GetAllCustomers`,`sp_GetCustomerById`,`sp_UpdateCustomer` and `sp_DeleteCustomer` stored procedures: 
```bash
dotnet tool run DEFC.Util.RepoGen map --sp sp_CreateCustomer --repo Customers
dotnet tool run DEFC.Util.RepoGen map --sp sp_GetAllCustomers --repo Customers
dotnet tool run DEFC.Util.RepoGen map --sp sp_GetCustomerById --repo Customers
dotnet tool run DEFC.Util.RepoGen map --sp sp_UpdateCustomer --repo Customers
dotnet tool run DEFC.Util.RepoGen map --sp sp_DeleteCustomer --repo Customers
```
- use `map` command `sp_CreateOrder`,`sp_GetAllOrders`,`sp_GetOrderById`,`sp_UpdateOrder` and `sp_DeleteOrder` stored procedures: 
```bash
dotnet tool run DEFC.Util.RepoGen map --sp sp_CreateOrder --repo Orders
dotnet tool run DEFC.Util.RepoGen map --sp sp_GetAllOrders --repo Orders
dotnet tool run DEFC.Util.RepoGen map --sp sp_GetOrderById --repo Orders
dotnet tool run DEFC.Util.RepoGen map --sp sp_UpdateOrder --repo Orders
dotnet tool run DEFC.Util.RepoGen map --sp sp_DeleteOrder --repo Orders
```
### ✅ Step 8: For `OrderItems` table will use batch option
- Add batch file called `batch-orderitems`.
```bash
dotnet tool run DEFC.Util.RepoGen add --batch batch-orderitems
```
- Generated file location **Path:** `SampleStore/RepoGenTool/Batches/batch-orderitems.json`.
- The generated file will include **sample nodes** like below:

```json
{
  "Commands": [
    {
      "ID": "add-repo",
      "Command": "add --repo <YourRepoName>"
    },
    {
      "ID": "map-insert",
      "Command": "map --sp <YourStoredProcedureName> --repo <YourRepoName>"
    },
    {
      "ID": "re-map-update",
      "Command": "re-map --sp <YourStoredProcedureName> --repo <YourRepoName>"
    },
    {
      "ID": "remove-delete",
      "Command": "remove --sp <YourStoredProcedureName> --repo <YourRepoName>"
    } 
    ,
    {
      "ID": "curd-table",
      "Command": "crud --tbl <YourTableName> --service <YourServiceName>"
    } 

  ]
}
```
- Change in this file to be lke below:
```json
{
  "Commands": [
    {
      "ID": "add-OrderItems-repo",
      "Command": "add --repo OrderItems"
    },
    {
      "ID": "map-insert-OrderItems",
      "Command": "map --sp sp_CreateOrderItem --repo OrderItems"
    },
    {
      "ID": "map-update-OrderItems",
      "Command": "map --sp sp_UpdateOrderItem --repo OrderItems"
    },
    {
      "ID": "map-delete-OrderItems",
      "Command": "map --sp sp_DeleteOrderItem --repo OrderItems"
    },
    {
      "ID": "map-get-OrderItems",
      "Command": "map --sp sp_GetOrderItemById --repo OrderItems"
    },
    {
      "ID": "map-get-all-OrderItems",
      "Command": "map --sp sp_GetAllOrderItems --repo OrderItems"
    }

  ]
}
```
- Run batch of commends from a JSON file:
```bash
dotnet tool run DEFC.Util.RepoGen batch --file batch-orderitems
``` 
- This will: 
    - Create OrderItems reposatory.
    - Map stored procedures for OrderItems written in `batch-orderitems.json`.
## ✅ Step 9: Explore the Generated Code & Add required logics and validations
Look inside the following folders:

- Repositories
- Interfaces (IRepositories)
- Services
- DTOs
- Find the auto-generated ProductsRepository, UnitOfWork, etc.
##  ✅ Step 10: Configure your application
This based on your application requirements.
- Confuger database connection string in `appsettings.json` file.
```json
...............
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "ConnectionString": "Server=SERVER_NAME;Database=DATABASE_NAME;User Id=USER_NAME;Password=PASSWORD;TrustServerCertificate=True"

  }
}
```
- Confuger database connection string in `Program.cs` file.
```c#
.....................
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<StoreDBContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("ConnectionString"));
}
);
......................
```
- Add any other configurations needed.

## ✅ Step 11: Wire It to the API
- Create a basic controllers called `Products`,`Customers` and `Orders`, etc.
- Link them to unit of work class.
 ```C#
    [ApiController]
    [Route("api/[controller]")]
    public class ProductsController : Controller
    {
        private readonly IUnitOfWork _unitOfWork; 
        public ProductsController(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }
        .........
    }
```
> ⚠️ **Important**: Open `ProductsController` in the **SampleStore** app, then **uncomment the code** to enable faster testing during development.
---

## 📚 For More Tool Training

Once you complete the main task, try redoing it using a different folder structure model.  
This helps you better understand clean architecture strategies and how `DEFC.Util.RepoGen` adapts to different setups.

---
### 🧱 Challenge 1: Remap Stored Procedure
1. **Add new field `PhoneNumber` with datatype `nvarchar(150)` to `Customers` table.**
```sql
ALTER TABLE Customers ADD PhoneNumber nvarchar(150) null;
```
2. **Alter `sp_CreateCustomer` stored procedure to accept the new `PhoneNumber` field.**
```sql 
ALTER PROCEDURE [dbo].[sp_CreateCustomer]
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100),
    @Email NVARCHAR(150),
    @PhoneNumber NVARCHAR(150)
AS
BEGIN
    INSERT INTO Customers (FirstName, LastName, Email,PhoneNumber)
    VALUES (@FirstName, @LastName, @Email,@PhoneNumber);
    
    SELECT SCOPE_IDENTITY() AS NewCustomerId;
END
```
3. **use `re-map` command to apply the changes**
```bash
dotnet tool run DEFC.Util.RepoGen re-map --sp sp_CreateCustomer --repo Customers
```
4. **Verify updates**
- Open `sp_CreateCustomer_DTO` class and confirm the `PhoneNumber` field is included.
- Open `Customers` repository and ensure the changes have been correctly applied.

### 🧱 Challenge 2: Remove Stored Procedure
1. **Assumption:**  
   We want to remove the `sp_DeleteOrder` stored procedure mapping.
2. **Use `remove` command to remove the mapped stored procedure**
```bash
   dotnet tool run DEFC.Util.RepoGen remove --sp sp_DeleteOrder --repo Orders
```
### 🧱 Challenge 3: Force Overwrite Using --force or -f
- Try regenerating a CRUD layer for an existing table with the force option:
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl ProductCategories --service ProductCategory --force
```
Or shorthand:
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl ProductCategories --service ProductCategory -f
```
> ⚠️ This overwrites existing files. Useful when structure or schema has changed.

### 🧱 Challenge 4: Change Structure Model
- Try using `MODEL_2` (Layered), (Hexagonal) `MODEL_3` (Hexagonal) or `MODEL_CUSTOM` and observe code layout changes.
> ⚠️ This Challenge is the most critical
1. Manually delete(or keep aside) previously generated folders (to avoid conflicts):
    ```bash
    # Delete folders like Services, Repositories, etc.
    ```
2. Open `RepoGen.json` and update the structure model:
    ```json
    {
      "FoldersStructureModel": "MODEL_2"
    }
    ```
3. Re-run the folder setup:
    ```bash
    dotnet tool run DEFC.Util.RepoGen structure set
    ```
4. Re-run the batch setup:
    ```bash
    dotnet tool run DEFC.Util.RepoGen batch --file batch-orderitems
    ```
5. Observe how the folder layout and organization differ from `MODEL_1`.

> 🔁 You can also try `MODEL_3` (Hexagonal) or define your own using `MODEL_CUSTOM`.

---
## 🎯 Learning Objectives
By completing this task, you will:

- Understand the Repository & Unit of Work patterns.
- Learn to use a CLI-based code generator in real projects.
- Follow clean architecture principles in a .NET Core application.
- Map, Re-map and Remove stored procedures to strongly typed repository methods.
- CRUD tables to strongly typed services methods.

---

## 📩 Questions?
If you're stuck or want feedback on your solution: Open a [GitHub Issue](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/issues) with your question

---

### 🎯 Learning Outcome
- Understand how layered architecture separates **application**, **domain**, and **infrastructure** logic.
- Learn to switch architectural styles without changing your business logic.
- Practice adapting tools to enterprise-grade coding standards.
 

Your support is greatly appreciated and helps keep this project active and maintained! 🙏

