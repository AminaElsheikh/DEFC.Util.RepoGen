
# ❓ Frequently Asked Questions (FAQ)

[🔹 What is DEFC.Util.RepoGen?](#-what-is-defcutilrepogen)
[🔹 What database providers are supported?](#-what-database-providers-are-supported)
[🔹 Which .NET versions are compatible?](#-which-net-versions-are-compatible)
[🔹 Do I need Entity Framework Core?](#-do-i-need-entity-framework-core)
[🔹 Is the tool secure? Does it send data to the internet?](#-is-the-tool-secure-does-it-send-data-to-the-internet)
[🔹 Can I use it in commercial projects?](#-can-i-use-it-in-commercial-projects)
[🔹 Can I define my own folder structure?](#-can-i-define-my-own-folder-structure)
[🔹 What if my stored procedure changes?](#-what-if-my-stored-procedure-changes)
[🔹 Does it support batch operations?](#-does-it-support-batch-operations)
[🔹 What should I do if I get a SQL connection error?](#-what-should-i-do-if-i-get-a-sql-connection-error)
[🔹 How do I regenerate a repository or CRUD if it already exists?](#-how-do-i-regenerate-a-repository-or-crud-if-it-already-exists)
[🔹 Why PowerShell or CLI is better?](#-why-powershell-or-cli-is-better)
[🔹 Can I change model classes suffix?](#-can-2)
[🔹 Can I apply this tool to my existing solution?](#-can-3)
[🔹 Can change folder structure in the middle of work?](#-can-4)
[🔹 Why can not change folder structure in the middle of work without manually interfere?](#-why-1)
[🔹 Can stop loggers?](#-can-5)
[🔹 Can generate endpoints for CRUD?](#-can-6)
[🔹 Can generate endpoints for repository?](#-can-7)
[🔹 Want a Table with commands and Usage?](#-want)

### 🔹 What is DEFC.Util.RepoGen?
`RepoGen` is a .NET CLI and NuGet tool that automatically generates repository and unit of work classes based on **SQL Server stored procedures**, following clean architecture principles.

---

### 🔹 What database providers are supported?
Currently, **only Microsoft SQL Server** is supported.

❌ **PostgreSQL** and **MySQL** are not supported due to:
- Incompatible stored procedure metadata
- Different SQL dialects
- Lack of necessary introspection features

---

### 🔹 Which .NET versions are compatible?
`RepoGen` supports projects targeting **.NET 6 and above**.

---

### 🔹 Do I need Entity Framework Core?
Yes. You must install:
- `Microsoft.EntityFrameworkCore`
- `Microsoft.EntityFrameworkCore.SqlServer`
- `Microsoft.Data.SqlClient`

---

### 🔹 Is the tool secure? Does it send data to the internet?
✅ Yes, `RepoGen` is 100% **offline**:
- No external API calls or telemetry
- No tracking or analytics
- All code generation and processing happens locally

---

### 🔹 Can I use it in commercial projects?
Yes, under the [Elastic License 2.0](https://www.elastic.co/licensing/elastic-license), **you can use it commercially**, but you **cannot redistribute, repackage, or modify** the tool.

---

### 🔹 Can I define my own folder structure?
Yes. Use `MODEL_CUSTOM` and configure `custom_model.json` and `structure_mapper.json`.
A step by step paractice sample [Here →](https://github.com/AminaElsheikh/DEFC.Util.RepoGen-SampleStore/blob/main/Custom-Model-README.md)

---

### 🔹 What if my stored procedure changes?
You can follow one of this tow methods:
- You can **re-map** the stored procedure:
```bash
dotnet tool run RepoGen re-map --sp <YourSP> --repo <YourRepo>
```
- You can **remove** then **map** the stored procedure:

```bash
dotnet tool run RepoGen remove --sp <YourSP> --repo <YourRepo>
```

```bash
dotnet tool run RepoGen map --sp <YourSP> --repo <YourRepo>
```

---

### 🔹 Does it support batch operations?
Yes. You can script multiple commands using JSON and run them in a batch:
```bash
dotnet tool run RepoGen batch --file <filename>
```
---

### 🔹 What should I do if I get a SQL connection error?
- Check if SQL Server is running
- Validate the connection string
- Enable remote access and TCP/IP in SQL Server Configuration Manager
- Use dotnet tool run RepoGen test db-connection to test
See DB connectio troubleshooting[Here →](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/blob/main/README.md#-troubleshooting--error-handling)
---

### 🔹 How do I regenerate a repository or CRUD if it already exists?
Use `remap` command for regenerate a repository
```bash
dotnet tool run RepoGen re-map --sp sp_CreateProduct --repo Products
```

Use `remove` command then `map` for regenerate a repository
```bash
dotnet tool run RepoGen remove --sp sp_CreateProduct --repo Products
```

```bash
dotnet tool run RepoGen map --sp sp_CreateProduct --repo Products
```

Use the `--force` flag for CRUD:
```bash
dotnet tool run RepoGen crud --tbl ProductCategories --service ProductCategory --force
```
---

### 🔹 why powershell or cli is better?
You can run the tool using any of the following:

- **Developer PowerShell for Visual Studio** *(`recommended`)* — provides better visualization and output formatting.
- **.NET CLI** from terminal or command prompt *(`recommended`)* — provides better visualization and output formatting.
- **Package Manager Console** in Visual Studio.

> 💡 **Important:** For best experience and readability, use **Developer PowerShell** or **.NET CLI**.
![PS](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/blob/main/Img/CLI.png)

---
### 🔹 Can I change model classes suffix?
**Yes**, you can! You just need to configure the suffixes accordingly.
``` json
....
"Suffixes": {
        "Model": "Entity", // Suffix for domain or entity classes
        "DTO": "Request" // Suffix for data transfer objects 
 
      }
.....
```

---

### 🔹 Can I apply this tool to my existing solution?
### 🔹 Can change folder structure in the middle of work?

**Yes**, you can! You just need to configure the folder structure accordingly.
**Read carefully it critical to do**
**Step 1: Initialize the Tool**
Start by performing the necessary tool initialization.
**Step 2: Keep old files safe aside (important to avoid class conflicts)**
Manually delete(if not want them any more) or keep aside(if want them back to new structure) the current folder structure model.
**Step 3: Configure the Folder Structure**
You have two options based on your current folder structure:
**🔸 Option 1: Your structure matches one of the predefined models (MODEL_1, MODEL_2, or MODEL_3)**
Update the `RepoGenTool/RepoGen.json` file:
``` json
....
 "FoldersStructureModel": "MODEL_1", // MODEL_2 or MODEL_3
.....
```
**🔸 Option 2: You have a custom folder structure**
- In `RepoGenTool/RepoGen.json`, set the folder structure model to `MODEL_CUSTOM`: 
``` json
....
 "FoldersStructureModel": "MODEL_CUSTOM",
.....
```
1- Define your current folder structure in `RepoGenTool/Structure/custom_model.json`.
2- In that same file, map your folders to the 7 main folders used by `RepoGenTool`.
**Step 4: (Optionally)get old files back**
If want your previous work back, manually transfare file you kept aside in thier new place. 

---

### 🔹 Why can not change folder structure in the middle of work without manully interfere?
Becuse There is a possibility of losing some files during the transfer process.

---

### 🔹 Can stop loogers?
**Yes**, you can! You just need to configure the folder structure accordingly.
``` json
....
  "LoggerCode": "100"
.....
```

- 100: No logger files
- 101: Logger for Command (Individual CLI operations) & Batch (JSON-scripted multi-step executions)
- 102: Logger for Command only
- 103: Logger for Batch commands only

**Yes**, you can! To ensure project integrity, 

1- Manually delete(or keep aside) the current folder structure model.
2- Apply model type in `RepoGenTool/RepoGen.json`, sample; change the folder structure model from `MODEL_1` to `MODEL_3`: 
``` json
....
 "FoldersStructureModel": "MODEL_3",
.....
```
### 🔹 Can generate endpoints for CRUD?
**Yes**, you can! You need to add controller name for it.
```bash
dotnet tool run RepoGen crud --tbl <YourTableName> --service <YourServiceName> --controller <YourControllerName>
```
- regenegate use `--force` or `-f`
```bash
dotnet tool run RepoGen crud --tbl <YourTableName> --service <YourServiceName> --controller <YourControllerName> --force
```
### 🔹 Can generate endpoints for repository?
**Yes**, you can! You need to add controller name for it with the endpoint name and method type needed (post, get, put or delete).
```bash
dotnet tool run RepoGen map --sp <YourStoredProcedureName> --repo <YourRepoName> --controller <ControllerName> --endpoint <EndpointName> --<Method>
```
```bash
dotnet tool run RepoGen re-map --sp <YourStoredProcedureName> --repo <YourRepoName> --controller <ControllerName> --endpoint <EndpointName> --<Method>
```
### 🔹 Want a Table with commands and Usage?
For Table with commands and Usage [See](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/RepoGen-CLI-Commands-Table)
For Table with Shorthands [See](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/RepoGen-CLI-Shorthands-Table)
