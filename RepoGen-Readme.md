# DEFC.Util.RepoGen
A powerful .NET CLI tool and NuGet package that automates the generation of repositories and unit of work patterns around SQL 
Server stored procedures, to accelerate clean architecture development.

## Table of Contents

1. [ℹ️ About](#️-about)
2. [🎯 Objective](#-objective)
3. [🚀 Benefits](#-benefits)
4. [🔌 Supported Technologies](#-supported-technologies)
   - [🗄️ Database Providers](#️-database-providers)
   - [⚙️ .NET Versions](#️-net-versions)
   - [🧱 Design Patterns Used](#-design-patterns-used)
   - [🖥️ Recommended Execution Environments](#️-recommended-execution-environments)
5. [🛠️ Prerequisites](#️-prerequisites)
6. [📦 Installation](#-installation)
7. [🔧 RepoGen.json – Tool Configuration](#-repogenjson--tool-configuration)
8. [📁 Folder Structure Models](#-folder-structure-models)
   - [🧱 `MODEL_1` – Default (Clean Architecture Inspired)](#-model_1--default-clean-architecture-inspired)
   - [🧱 `MODEL_2` – Layered Architecture](#-model_2--layered-architecture)
   - [🧱 `MODEL_3` – Hexagonal Architecture (Ports & Adapters)](#️-model_3--hexagonal-architecture-ports-adapters)
   - [🧱 `MODEL_CUSTOM` – Custom User-Defined Structure](#-model_custom--custom-user-defined-structure)
9. [🏁 Usage Guide](#-usage-guide)
   - [📁 1. Initialization](#-1-initialization)
   - [🔧 2. Configuration](#-2-configuration)
   - [🗂️ 3. Structure Setup](#️-3-structure-setup)
   - [🧪 4. Testing](#-4-testing)
   - [🧱 5. Repository and Unit of Work Generation](#-5-repository-and-unit-of-work-generation)
   - [🔁 6. Stored Procedure Mapping](#-6-stored-procedure-mapping)
   - [🧬 7. CRUD](#-7-crud)
   - [📄 8. Batch Operations](#-8-batch-operations)
10. [🐞 Troubleshooting & Error Handling](#️-troubleshooting-error-handling)
11. [🔔 Important Notes](#-important-notes)
12. [💡 Example Usage](#-example-usage)
13. [📝 License](#-license)
14. [📞 Contact](#-contact)
15. [🐞 Issues](#-issues)
    - [How to Report an Issue](#how-to-report-an-issue)
    - [How to Contribute](#how-to-contribute)
16. [📦 Other Nugets](#-other-nugets)
    - [DEFC.Util.DataValidation](#defcutildatavalidation)
    - [DEFC.Util.Generator](#defcutilgenerator)
    
## ℹ️ About
**DEFC.Util.RepoGen** is a .NET CLI tool and NuGet package that helps developers quickly generate repositories and Unit of Work classes that map to SQL Server stored procedures. It is designed to automate repetitive tasks, reduce boilerplate code, and maintain a clean architecture within .NET applications.

This tool empowers development teams to enforce consistent patterns, improve productivity, and accelerate the creation of scalable applications that interact with databases via stored procedures.

### Created by
This tool was created by **Amina El-Sheikh**.

## 🎯 Objective
NuGet tool that implements the **repository** and **unit of work** patterns by automating the creation of repositories mapped to database **stored procedures (SPs)**. This enhances developer productivity and helps maintain clean architecture in .NET applications.

## 🚀 Benefits
- **Reduced Boilerplate**: Developers don't need to manually create the repository and methods for every stored procedure. The tool can automatically generate them.
- **Enforces Clean Architecture**: The separation of concerns between database operations (in the repository) and business logic (in the service) is maintained.
- **Promotes Maintainability**: When working with stored procedures, the tool keeps the codebase more organized and easier to maintain, as the SP logic is encapsulated in the repository.
- **Speeds Up Development**: Instead of writing repetitive code, developers can focus more on writing business logic by using the generated repositories.
 
## 🔌 Supported Technologies
The tool is designed to work seamlessly within modern .NET environments using clean architecture principles.

### 🗄️ Database Providers
- Microsoft SQL Server *(current supported provider)*

> ⚠️ **Important on Other Databases**
> `DEFC.Util.RepoGen` does **not support PostgreSQL or MySQL** because:
>
> - These databases do not provide the same stored procedure metadata needed for automated mapping.
> - Their procedural SQL dialects differ significantly from T-SQL (used in SQL Server).
> - The tool is tightly coupled to SQL Server’s stored procedure introspection capabilities.
>
> ⚠️ **Important:** For PostgreSQL or MySQL, consider using EF Core’s model- or code-first patterns instead.

### ⚙️ .NET Versions
- ✅ .NET 6
- ✅ .NET 7
- ✅ .NET 8

> 💡 **Important:** The tool is compatible with .NET SDK-based projects and uses `dotnet` CLI commands internally.

### 🧱 Design Patterns Used
- **Repository Pattern** – abstracts data access and encapsulates business logic interactions.
- **Unit of Work** – coordinates the writing out of changes and maintains transactional integrity.
- **Command Pattern** (CLI-based) – the tool is built around modular command-line operations.
- **Separation of Concerns** – enforces clean boundaries between infrastructure and domain logic.

> 💡 **Important:** The tool helps teams enforce these patterns consistently across the codebase, especially when working with stored procedures.

### 🖥️ Recommended Execution Environments
You can run the tool using any of the following:

- **Developer PowerShell for Visual Studio** *(recommended)* — provides better visualization and output formatting.
- **.NET CLI** from terminal or command prompt *(recommended)* — provides better visualization and output formatting.
- **Package Manager Console** in Visual Studio.

> 💡 **Important:** For best experience and readability, use **Developer PowerShell** or **.NET CLI**.


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
- **DBContextName**: The base name for your DBContext. The tool will automatically append "DBContext" to it.
- **ConnectionString**: A valid connection string to your database.
- **Namespace**: The application namespace used in the generated code.
- **FoldersStructureModel**: Choose between different folder structure models (e.g., `MODEL_1` for default, `MODEL_2` for layered, `MODEL_3` for hexagonal or `MODEL_CUSTOM` for user-defined model). See: [Folder Structure Models](#-folder-structure-models)
- **LoggerCode**: Controls logger generation for command and batch executions.

> 💡 **Important:** The tool automatically appends `DBContext`, `Repository`, and `Service` to the relevant names, so you don’t need to include those suffixes in your configuration.
```json

//================================================================================
// Notes:
// - The word "DBContext" will be dynamically appended to the DBContextName.
// - The word "Repository" will be dynamically appended to the Repository Name.
// - The word "Service" will be dynamically appended to the Service Name.
//================================================================================

{
  "Config": {
    "DBConfig": {
      "SchemaID": "1", // OPTIONAL: Database schema ID (if applicable)
      "DBContextName": "YOUR_DBCONTEXTNAME_HERE", // REQUIRED: Base name for DbContext (suffix "DBContext" will be added automatically)
       "ConnectionString": "Server=SERVER_NAME;Database=DATABASE_NAME;User Id=USER_NAME;Password=PASSWORD;TrustServerCertificate=True"
      // REQUIRED: Valid connection string to your database
    },
    "AppConfig": {
      "Namespace": "YOUR_NAMESPACE_HERE", // REQUIRED: Base namespace for generated code
      "FoldersStructureModel": "MODEL_1", // REQUIRED: Folder structure
      //   MODEL_1 (Default)
      //   MODEL_2 (Layered)
      //   MODEL_3 (Hexagonal/Ports & Adapters)
      //   - MODEL_CUSTOM (Define your own folder structure to fit your specific project architecture)
      "LoggerCode": "101" // REQUIRED: Logger file generation control
      //   100: No logger
      //   101: Logger for Command & Batch
      //   102: Logger for Command only
      //   103: Logger for Batch only
    }
  }
}
```
### Dynamic Creation of `RepoGen.json`
When you first initialize the tool with the following command:

```bash
dotnet tool run DEFC.Util.RepoGen initial
```
## 📁 Folder Structure Models

`DEFC.Util.RepoGen` supports multiple folder structure models that enforce clean, maintainable architectures by default.  
You can define your preferred structure via the `FoldersStructureModel` property in your `RepoGen.json` configuration file.

Below are the supported models:

---

### 🧱 `MODEL_1` – Default (Clean Architecture Inspired)

Ideal for small to medium-sized applications that follow the **clean architecture** pattern with clear separation of concerns.

✅ **Use When**:
- You want rapid setup, a simple layered structure, and maintainable code organization.
- You're building MVPs, prototypes, or smaller-scale systems where full enterprise layering is unnecessary.

---

### 🧱 `MODEL_2` – Layered Architecture

Follows a classic **layered architecture** with distinct separation between **Presentation**, **Application**, **Domain**, and **Infrastructure**.

✅ **Use When**:
- You're building scalable, enterprise-level applications with well-defined layers.
- Collaboration, modular testing, and separation of domain logic are priorities — especially for large teams or multi-service environments.

---

### 🧱 `MODEL_3` – Hexagonal Architecture (Ports & Adapters)

Implements **Hexagonal (a.k.a. Onion) Architecture**, placing business logic at the core and isolating infrastructure via ports and adapters.

✅ **Use When**:
- You need **maximum decoupling** between business logic and external systems (DB, APIs, etc.).
- You're embracing **Domain-Driven Design (DDD)**, building **microservices**, or prioritizing **testability and modularity**.

---

### 🧱 `MODEL_CUSTOM` – Custom User-Defined Structure

`MODEL_CUSTOM` allows you to define your **own folder structure** to fit your specific project architecture. 
This model is designed for advanced users or teams that already follow a customized layout and want to integrate `RepoGen` seamlessly.

✅ **Use When**:
- You have an existing architecture not covered by the default models.
- You require full control over the names and hierarchy of folders.
- You are integrating RepoGen into a legacy or uniquely structured project.

---

#### 🗂️ `custom_model.json`

This file defines your custom folder structure. Below is a basic example:

```json
{
  // This file defines the custom project folder structure.
  // You can add nested folders using "Children" arrays.
  // Required folders must exist to satisfy the structure mapping.

  "Structure": [
    { "Name": "DBContext" },     // Folder for database context files
    { "Name": "DTOs" },          // Folder for Data Transfer Objects
    { "Name": "Interfaces" },    // Folder for repository interfaces
    { "Name": "Models" },        // Folder for domain or EF models
    { "Name": "Repositories" },  // Folder for concrete repositories
    { "Name": "Services" },      // Folder for service layer classes
    { "Name": "UnitOfWork" }     // Folder for unit of work implementation

    // Example of a nested structure:
    // {
    //   "Name": "Core",
    //   "Children": [
    //     { "Name": "Repositories" },
    //     { "Name": "Services" }
    //   ]
    // }
  ]
}

```
> 💡 **Important:** You can define **nested folders** using the `Children` property to represent complex, hierarchical structures.
#### 🗂️ `structure_mapper.json`
This file maps required logical components to the folders defined in your structure:
```json
{
  // RequiredMappings define the logical folders your application MUST include.
  // Each key is a required logical role (like 'DTOs'), and the value is the actual folder name in your structure.

  "RequiredMappings": {
    "DbContext": "DBContext",         // This folder represents EF DbContext files
    "DTOs": "DTOs",                   // This folder represents DTOs
    "IRepositories": "Interfaces",    // This folder represents repository interfaces
    "Models": "Models",               // This folder represents models/entities
    "Repositories": "Repositories",   // This folder represents concrete repo implementations
    "Services": "Services",           // This folder represents business/service layer
    "UnitOfWork": "UnitOfWork"        // This folder represents unit of work class
  }
}

```
> 💡 **Important:** All required mappings must be defined for the tool to operate correctly.  
#### 🛠️ Activating MODEL_CUSTOM
To use this model, update your `RepoGen.json` configuration file:
```json
{
  "FoldersStructureModel": "MODEL_CUSTOM"
}

```
Then, apply your custom folder structure by running:
```bash
dotnet tool run DEFC.Util.RepoGen structure set

```
### 🛠️ Switching Folder Structure

To apply a specific structure, update your `RepoGen.json` configuration:

```json
{
  "FoldersStructureModel": "MODEL_2"
}
```
---

### 🧩 Choosing a Structure

| Model     | Ideal For                         | Separation Level | Complexity |
|-----------|-----------------------------------|------------------|------------|
| `MODEL_1` | Simple projects, quick start      | Medium           | Low        |
| `MODEL_2` | Enterprise/layered applications   | High             | Medium     |
| `MODEL_3` | Domain-driven, microservices apps | Very High        | High       |
| `MODEL_CUSTOM`| Custom legacy or advanced architectures|	Custom |Variable    |

> 💡 **Important:** If you're switching from one structure model to another, manually delete any previously generated folders to avoid conflicts,
 then run the structure setup command again.
```bash
dotnet tool run DEFC.Util.RepoGen structure set
```

## 🏁 Usage Guide
### 📁 1. Initialization
- Initialize the RepoGen tool
```bash
dotnet tool run DEFC.Util.RepoGen initial
```
- Force re-initialize the tool (overwrites existing files):
```bash
dotnet tool run DEFC.Util.RepoGen initial --force
```
```bash
dotnet tool run DEFC.Util.RepoGen initial -f
```
### 🔧 2. Configuration
 Customize the 'RepoGen.json' file with your specific data and save the changes.  See [RepoGen.json – Tool Configuration](#-repogenjson--tool-configuration)
### 🗂️ 3. Structure Setup
- Generate the repository pattern folder structure:
```bash
dotnet tool run DEFC.Util.RepoGen structure set
```
### 🧪 4. Testing 
- To confirm if the connection string in `RepoGen.json` is working:
```bash
dotnet tool run DEFC.Util.RepoGen test db-connection
```
- Test the structure model:
```bash
dotnet tool run DEFC.Util.RepoGen  structure test
```
### 🧱 5. Repository and Unit of Work Generation
- Add a Unit of Work class (if not already added):
```bash
dotnet tool run DEFC.Util.RepoGen add --uow
```
- Add a generic CRUD repository:
```bash
dotnet tool run DEFC.Util.RepoGen add --crud
```
- Force replace the existing CRUD repository:
```bash
dotnet tool run DEFC.Util.RepoGen add --crud --force
```
```bash
dotnet tool run DEFC.Util.RepoGen add --crud -f
```
- Add a new repository with unit of work (if not exists):
```bash
dotnet tool run DEFC.Util.RepoGen add --repo REPO_NAME
```
### 🔁 6. Stored Procedure Mapping
- Map a stored procedure to a repository:
```bash
dotnet tool run DEFC.Util.RepoGen map --sp STORED_PROCEDURE_NAME --repo REPO_NAME
```
- Remap a stored procedure to a repository:
```bash
dotnet tool run DEFC.Util.RepoGen re-map --sp STORED_PROCEDURE_NAME --repo REPO_NAME
```
- Remove a mapped stored procedure:
```bash
dotnet tool run DEFC.Util.RepoGen remove --sp STORED_PROCEDURE_NAME --repo REPO_NAME
```
### 🧬 7. CRUD
- Generate CRUD a table:
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl TABLE_NAME --service SERVICE_NAME
```
- Force regenerate CRUD operations for a table:
```bash
dotnet tool run DEFC.Util.RepoGen crud --tbl TABLE_NAME --service SERVICE_NAME --force
```
### 📄 8. Batch Operations
- Add a batch file sample:
```bash
dotnet tool run DEFC.Util.RepoGen add --batch FILE_NAME_WITHOUT_EXTENSION
```
- Run batch of commends from a JSON file:
```bash
dotnet tool run DEFC.Util.RepoGen batch --file FILE_NAME
```
#### Batch File Sample
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

## 🐞 Troubleshooting & Error Handling
This section covers common issues users might encounter while using the tool, along with potential causes and resolutions.
### ❌ Error: The option 'XXX' is not valid
**Cause:** This error typically occurs when an invalid option is passed to the CLI tool, or the command is not recognized.
**Solution:** 
- Make sure you are using the Write option.
- Usage: dotnet tool run DEFC.Util.RepoGen help or See [Usage Guide](#-usage-guide) section.
### ❌ Error: Invalid command. Please provide valid arguments.
**Cause:** This error typically occurs when an invalid command is passed to the CLI tool, or the command is not recognized.
**Solution:**
- Make sure you are using the Write command.
- Usage: dotnet tool run DEFC.Util.RepoGen help or See [Usage Guide](#-usage-guide) section.

### ❌ Error: A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: Named Pipes Provider, error: 40 - Could not open a connection to SQL Server)
**Cause:**

- This error typically indicates one of the following:
- The SQL Server instance is not running or accessible.
- Incorrect server name or instance name in the connection string.
- The SQL Server instance is not configured to allow remote connections.
- Network issues or firewall restrictions preventing the connection.
**Solution:**

**1- Check SQL Server instance status:**
- Ensure the SQL Server instance is running. You can check the SQL Server instance status through **SQL Server Configuration Manager** or **Services in Windows**.
**2- Verify the connection string:**
- Double-check that the connection string in `RepoGen.json` is correct. Ensure the **server name**, **instance name**, and **authentication credentials** are valid.
**3- Check SQL Server configuration:**
- Ensure the SQL Server instance is configured to allow remote connections.
**4- Check firewall settings:**
- Ensure there are no **firewall** rules blocking SQL Server connections:
**5- Test with SQL Server Management Studio (SSMS):**
- Try connecting to the database manually using SSMS with the same credentials and connection string.
- If it works in SSMS but not via the tool, there might be issues with how the connection string is configured or passed to the tool.
**6- Check Named Pipes and TCP/IP settings:**
- If the error mentions the **Named Pipes provider**, you may need to configure SQL Server to accept TCP/IP connections instead of Named Pipes:
- Open **SQL Server Configuration Manager**, then ensure **TCP/IP** is enabled and configured correctly.
**7- Test network connectivity:**
- Use **ping** or **telnet** to test network connectivity between the application and the SQL Server.

## 🔔 Important Notes
- **Do not change the folder structure** generated by the tool. It’s designed to support consistency, clean architecture, and team alignment.
- **Review the auto-generated comments and documentation**, and update them to match your project’s standards as needed.
- **Avoid modifying or moving generated files manually.** For the tool to work effectively, the file structure must remain intact.
- This tool is built to help your team stay in sync and maintain a **clean**, **maintainable** codebase. Changing the generated structure may cause issues and defeat the purpose of using the tool.

## 💡 Example Usage
A sample application is available on GitHub to help you get started with `DEFC.Util.RepoGen`.

### Sample Application

You can find a sample app that demonstrates how to configure and use `DEFC.Util.RepoGen` to generate repositories and unit of work patterns for SQL Server stored procedures.

- **Example Usage**: [DEFC.Util.RepoGen Sample App](https://github.com/AminaElsheikh/DEFC.Util.RepoGen)

The sample app includes:
- **Basic Setup**: How to configure `RepoGen.json` for your project.
- **Repository Generation**: Step-by-step instructions on generating repositories and mapping stored procedures.
- **Unit of Work Implementation**: Example of integrating the unit of work pattern with the generated repositories.

Feel free to clone or fork the repository and explore in your own projects!
## 📝 License
This project is licensed under the **Elastic License 2.0**.

You are permitted to:

- Use the software for any purpose, including commercial use.
- Run the software as part of your service offering.

You are **not permitted to**:

- Modify the software.
- Redistribute the software, in whole or in part, or as part of another software product.
- Remove any attribution or claim the software as your own.
- Use the software to build or offer a competing service.

By using this software, you agree to the [Elastic License 2.0](https://www.elastic.co/licensing/elastic-license).

> © 2025 Amina El-Sheikh. All rights reserved.

## 📞 Contact
If you have any questions, feedback, or need support, feel free to reach out:

- **GitHub**: [AminaElSheikh](https://github.com/AminaElSheikh)
- **LinkedIn**: [Amina El-Sheikh](https://www.linkedin.com/in/amina-el-sheikh-05254884/)
## 🐞 Issues
If you encounter any bugs, have suggestions for new features, or need assistance with the tool, please open an issue in the GitHub repository.

### How to Report an Issue
1. **Check Existing Issues**: Before creating a new issue, please search through the [existing issues](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/issues) to see if your problem or question has already been addressed.
2. **Provide Detailed Information**: When creating a new issue, provide as much detail as possible. Include information like:
   - The version of the tool you're using
   - A description of the problem or feature request
   - Steps to reproduce the issue (if applicable)
   - Any error messages or logs
3. **Feature Requests**: If you'd like to request a new feature or improvement, feel free to create an issue with a description of the functionality you'd like to see.

### How to Contribute
If you're interested in contributing to the project, please follow these guidelines:
1. **Fork the Repository**: Start by forking the project on GitHub.
2. **Clone Your Fork**: Clone your fork to your local machine and create a new branch.
3. **Make Your Changes**: Implement the changes or fix the bug you want to contribute.
4. **Commit Your Changes**: Commit your changes to your branch.
5. **Open a Pull Request**: Once you're ready, open a pull request to the main repository. Please ensure that your PR is well-documented and includes relevant information (e.g., fixes for bugs or explanations for new features).

We welcome contributions and feedback to improve the tool!

## 📦 Other Nugets
### DEFC.Util.DataValidation
- For using: [Nuget](https://www.nuget.org/packages/DEFC.Util.DataValidation)
- [GitHub Sample](https://github.com/AminaElsheikh/DEFC.Util.DataValidationExamples)
- Read: [Dev.to](https://dev.to/aminaelsheikh/data-validation-nuget-package-kco)
### DEFC.Util.Generator
- For using: [Nuget](https://www.nuget.org/packages/DEFC.Util.Generator)
- [GitHub Sample](https://github.com/AminaElsheikh/DEFC.Util.GeneratorExamples)
- Read: [Dev.to](https://dev.to/aminaelsheikh/data-generator-nuget-package-1fij)


Your support is greatly appreciated and helps keep this project active and maintained! 🙏


