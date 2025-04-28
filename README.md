# DEFC.Util.RepoGen

## 🎯 Objective
NuGet tool that implements the **repository** and **unit of work** patterns by automating the creation of repositories mapped to database **stored procedures (SPs)**. This can greatly enhance developer productivity and help maintain a clean architecture in .NET applications.

## 🚀 Benefits

- **Reduced Boilerplate**: Developers don't need to manually create the repository and methods for every stored procedure. The tool can automatically generate them.
- **Enforces Clean Architecture**: The separation of concerns between database operations (in the repository) and business logic (in the service) is maintained.
- **Promotes Maintainability**: When working with stored procedures, the tool keeps the codebase more organized and easier to maintain, as the SP logic is encapsulated in the repository.
- **Speeds Up Development**: Instead of writing repetitive code, developers can focus more on writing business logic by using the generated repositories.
 
## 🔌 Supported Technologies

The tool is designed to work seamlessly within modern .NET environments using clean architecture principles.

### 🗄️ Database Providers
- Microsoft SQL Server *(current supported provider)*

### ⚙️ .NET Versions
- ✅ .NET 6
- ✅ .NET 7
- ✅ .NET 8

> 💡 **Note:** The tool is compatible with .NET SDK-based projects and uses `dotnet` CLI commands internally.

### 🧱 Design Patterns Used
- **Repository Pattern** – abstracts data access and encapsulates business logic interactions.
- **Unit of Work** – coordinates the writing out of changes and maintains transactional integrity.
- **Command Pattern** (CLI-based) – the tool is built around modular command-line operations.
- **Separation of Concerns** – enforces clean boundaries between infrastructure and domain logic.

> 💡 **Note:** The tool helps teams enforce these patterns consistently across the codebase, especially when working with stored procedures.

### 🖥️ Recommended Execution Environments
You can run the tool using any of the following:

- **Developer PowerShell for Visual Studio** *(recommended)* — provides better visualization and output formatting.
- **Package Manager Console** in Visual Studio.
- **.NET CLI** from terminal or command prompt.

> 💡 **Note:** For best experience and readability, use **Developer PowerShell**.

## 🛠️ Prerequisites
- Install the following NuGet packages:
  - `Microsoft.Data.SqlClient`
  - `Microsoft.EntityFrameworkCore.SqlServer`
  - `Microsoft.EntityFrameworkCore` 

## 📦 Installation
Install the NuGet Package **DEFC.Util.RepoGen** with version **1.0.0** using the following command:
```bash
dotnet add package DEFC.Util.RepoGen --version 1.0.0
```
## 🔧 RepoGen.json – Tool Configuration

The `RepoGen.json` file is the primary configuration file used by the `DEFC.Util.RepoGen` tool. It allows you to customize key settings that define how the tool interacts with your database and structures the generated code.

### Key Configuration Options:
- **DBContextName**: The base name for your DbContext. The tool will automatically append "DBContext" to it.
- **ConnectionString**: A valid connection string to your database.
- **Namespace**: The application namespace used in the generated code.
- **FoldersStructureModel**: Choose between different folder structure models (e.g., `MODEL_1` for default, `MODEL_2` for layered, `MODEL_3` for hexagonal).
- **LoggerCode**: Controls logger generation for command and batch executions.

> 💡 **Note:** The tool automatically appends `DBContext`, `Repository`, and `Service` to the relevant names, so you don’t need to include those suffixes in your configuration.

### Dynamic Creation of `RepoGen.json`
When you first initialize the tool with the following command:

```bash
dotnet tool run DEFC.Util.RepoGen initial
```

## 🏃‍♂️ Usage
1. Customize the 'RepoGen.json' file with your specific data and save the changes. 
2. Explore and utilize additional tool commands as needed:
- To initialize the tool:
```bash
dotnet tool run DEFC.Util.RepoGen initial
```
- To inforce re-initialize the tool:
```bash
dotnet tool run DEFC.Util.RepoGen initial -f
```
- To set up the repository pattern folder structure:
```bash
dotnet tool run DEFC.Util.RepoGen set --structure
```
- To test the database connection:
```bash
dotnet tool run DEFC.Util.RepoGen test --db-connection
```
- To add the unit of work only (If not already exists):
```bash
dotnet tool run DEFC.Util.RepoGen add --uow
```
- To add the generic crud repository only:
```bash
dotnet tool run DEFC.Util.RepoGen add --crud
```
- To inforce replace the generic crud repository only:
```bash
dotnet tool run DEFC.Util.RepoGen add --crud -f
```
- To add a new repository with unit of work (if not exists):
```bash
dotnet tool run DEFC.Util.RepoGen add --repo REPO_NAME
```
- To add a batch file sample:
```bash
dotnet tool run DEFC.Util.RepoGen add --batch FILE_NAME_WITHOUT_EXTENSION
```
- To map an stored procedure to a stored procedure:
```bash
dotnet tool run DEFC.Util.RepoGen map --repo REPO_NAME --sp STORED_PROCEDURE_NAME
```
- To remap an stored procedure to a stored procedure:
```bash
dotnet tool run DEFC.Util.RepoGen re-map --repo REPO_NAME --sp STORED_PROCEDURE_NAME
```
- To remove a mapped stored procedure:
```bash
dotnet tool run DEFC.Util.RepoGen remove --repo REPO_NAME --sp STORED_PROCEDURE_NAME
```
- To CRUD a table:
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl TABLE_NAME --service SERVICE_NAME
```
- To inforce CRUD a table:
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl TABLE_NAME --service SERVICE_NAME -f
```
- To run batch of commends from json file:
```bash
dotnet tool run DEFC.Util.RepoGen batch --file FILE_NAME
```
## 🔔 Important Notes

- **Do not change the folder structure** generated by the tool. It’s designed to support consistency, clean architecture, and team alignment.
- **Review the auto-generated comments and documentation**, and update them to match your project’s standards as needed.
- **Avoid modifying or moving generated files manually.** For the tool to work effectively, the file structure must remain intact.
- This tool is built to help your team stay in sync and maintain a clean, maintainable codebase. Changing the generated structure may cause issues and defeat the purpose of using the tool.



## ℹ️ About
### 📝 License
### 🤝 Contact


## Other Nugets
### DEFC.Util.DataValidation
- For using: [Nuget](https://www.nuget.org/packages/DEFC.Util.DataValidation)
- Read: [Dev.to](https://dev.to/aminaelsheikh/data-validation-nuget-package-kco)
### DEFC.Util.Generator
- For using: [Nuget](https://www.nuget.org/packages/DEFC.Util.Generator)
- Read: [Dev.to](https://dev.to/aminaelsheikh/data-generator-nuget-package-1fij)



## SAMPLES
=======
https://www.nuget.org/packages/Obfuscar/2.2.47?_src=template

## Issues

If you have a patch to contribute, a feature to request, or a bug to report, please post to the Issue Tracker.
Support Services

Please contact LeXtudio Inc. for support services.
## Contribution

Pull requests are welcome, but make sure you sign the Contributor License Agreement.
## Donation

If you want to donate to my efforts on this project, please use this link.
