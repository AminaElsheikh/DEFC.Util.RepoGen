# DEFC.Util.RepoGen
A powerful .NET CLI tool and NuGet package that automates the generation of repositories and unit of work patterns around SQL 
Server stored procedures, accelerating clean architecture development.

## Table of Contents

- [ℹ️ About](#️-about)
- [🎯 Objective](#-objective)
- [🚀 Benefits](#-benefits)
- [🔌 Supported Technologies](#-supported-technologies)
- [🛠️ Prerequisites](#️-prerequisites)
- [📦 Installation](#-installation)
- [🔧 RepoGen.json – Tool Configuration](#-repogenjson--tool-configuration)
- [📁 Folder Structure Models](#-folder-structure-models)
- [🏁 Usage Guide](#-usage-guide)
- [🔔 Important Notes](#-important-notes)
- [💡 Example Usage](#-example-usage)
- [📝 License](#-license)
- [📞 Contact](#-contact)
- [🐞 Issues](#-issues)
- [Other Nugets](#other-nugets)
- [💖 Donation](#-donation)

## ℹ️ About
**DEFC.Util.RepoGen** is a .NET CLI tool and NuGet package that helps developers quickly generate repositories and unit of work patterns mapped to SQL Server stored procedures. It is designed to automate repetitive tasks, reduce boilerplate code, and maintain a clean architecture within .NET applications.

This tool empowers development teams to enforce consistent patterns, improve productivity, and accelerate the creation of scalable applications that interact with databases via stored procedures.

### Created by
Amina El-Sheikh

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

## 🏁 Usage Guide
#### Step 1 – Configuration
 Customize the 'RepoGen.json' file with your specific data and save the changes.
#### Step 2 – Initialize
- To initialize the tool:
```bash
dotnet tool run DEFC.Util.RepoGen initial
```
- To inforce re-initialize the tool:
```bash
dotnet tool run DEFC.Util.RepoGen initial -f
```
#### Step 3 – Structure Setup
- To set up the repository pattern folder structure:
```bash
dotnet tool run DEFC.Util.RepoGen set --structure
```
#### Step 4 – Explore and utilize tool commands as needed
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

### 💡 Example Usage
To help you get started, a sample application demonstrating how to use the `DEFC.Util.RepoGen` tool is available on GitHub.

#### Sample Application

You can find a sample app that demonstrates how to configure and use `DEFC.Util.RepoGen` to generate repositories and unit of work patterns for SQL Server stored procedures.

- **GitHub Repository**: [DEFC.Util.RepoGen Sample App](https://github.com/AminaElsheikh/DEFC.Util.RepoGen)

The sample app includes:
- **Basic Setup**: How to configure `RepoGen.json` for your project.
- **Repository Generation**: Step-by-step instructions on generating repositories and mapping stored procedures.
- **Unit of Work Implementation**: Example of integrating the unit of work pattern with the generated repositories.

Feel free to clone or fork the repository and try it out in your own projects!
### 📝 License
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

- **GitHub**: [@AminaElSheikh](https://github.com/AminaElSheikh)
- **LinkedIn**: [Amina El-Sheikh](https://www.linkedin.com/in/aminaelsheikh)
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

## Other Nugets
### DEFC.Util.DataValidation
- For using: [Nuget](https://www.nuget.org/packages/DEFC.Util.DataValidation)
- Read: [Dev.to](https://dev.to/aminaelsheikh/data-validation-nuget-package-kco)
### DEFC.Util.Generator
- For using: [Nuget](https://www.nuget.org/packages/DEFC.Util.Generator)
- Read: [Dev.to](https://dev.to/aminaelsheikh/data-generator-nuget-package-1fij)
 
## 💖 Donation
If you find this tool helpful and would like to support its ongoing development, you can make a donation:

- [Buy Me a Coffee](https://www.buymeacoffee.com/aminaelsheikh)
- [GitHub Sponsors](https://github.com/sponsors/AminaElSheikh)
- [Ko-fi](https://ko-fi.com/aminaelsheikh)

Your support is greatly appreciated and helps keep this project active and maintained! 🙏


