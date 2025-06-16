# DEFC.Util.RepoGen

[![NuGet](https://img.shields.io/nuget/v/DEFC.Util.RepoGen?label=NuGet&style=flat-square)](https://www.nuget.org/packages/DEFC.Util.RepoGen)
![License](https://img.shields.io/badge/license-Elastic%202.0-blue.svg?style=flat-square)
![.NET](https://img.shields.io/badge/.NET-6+-blue?style=flat-square)

> 🚀 Powerful .NET CLI & NuGet tool for automating Repository and Unit of Work generation using SQL Server Stored Procedures.

---

## 🧩 What is RepoGen?

**DEFC.Util.RepoGen** is a .NET CLI and NuGet tool that automates the implementation of the **Repository** 
and **Unit of Work** patterns using **SQL Server stored procedures**. It simplifies the generation of clean, 
scalable, and maintainable architecture in .NET applications, while promoting strong separation of concerns.

---

## 🛠️ Key Features

- ✅ **Automatic Repository Generation** – Generates repository classes mapped to SQL Server stored procedures.
- ✅ **Unit of Work Integration** – Creates a `UnitOfWork` class to manage transactions across repositories.
- ✅ **Stored Procedure Mapping** – Automates method creation inside repositories that correspond to stored procedures.
- ✅ **CRUD Generator** – Generates full CRUD (Create, Read, Update, Delete) logic and models for SQL tables.
- ✅ **Clean Architecture Support** – Supports multiple folder structures: Clean, Layered, Hexagonal, or Custom.
- ✅ **Batch Command Execution** – Run multiple operations from a JSON batch script.
- ✅ **Dynamic DTO & Model Generation** – Generates Data Transfer Objects and domain models from stored procedures or tables.
- ✅ **Endpoint Creation** – Auto-generates RESTful controller endpoints (e.g., POST, GET, PUT, DELETE) alongside SP and CRUD mappings.
- ✅ **Offline & Secure** – Operates fully offline with no external calls or telemetry.

---

## 📦 Installation

Install the NuGet package:
```bash
dotnet new tool-manifest
```
```bash
dotnet tool install --local DEFC.Util.RepoGen --version 1.0.0-beta
```
---
## 🚀 Quick Start

1. Initialize:

```bash
dotnet tool run RepoGen initial
```
dotnet tool run RepoGen initial

2. Configure RepoGen.json:
```json
{
  "Config": {
    "DBConfig": {
      "SchemaID": "1",
      "DBContextName": "YOUR_DBCONTEXTNAME_HERE",
      "ConnectionString": "Server=SERVER_NAME;Database=DATABASE_NAME;User Id=USER_NAME;Password=PASSWORD;TrustServerCertificate=True"
    },
    "AppConfig": {
      "Namespace": "YOUR_NAMESPACE_HERE",
      "FoldersStructureModel": "MODEL_1",
      "LoggerCode": "101",
      "Suffixes": {
        "Model": "Models", // Suffix for domain or entity classes
        "DTO": "Dtos" // Suffix for data transfer objects 
 
      }
    }
  }
}
```
3. Generate Folder Structure:
```bash
dotnet tool run RepoGen structure set
```
4. Test DB Connection:
```bash
dotnet tool run RepoGen test db-connection
```
```bash
dotnet tool run RepoGen  structure test
```
5. Generate CRUD for a Table:
```bash
dotnet tool run RepoGen crud --tbl <YourTableName> --service <YourServiceName> --controller <YourControllerName>
```
```bash
dotnet tool run RepoGen crud --tbl <YourTableName> --service <YourServiceName>
```
6. Stored Procedure Mapping
- Map a stored procedure to a repository:
 ```bash
dotnet tool run RepoGen map --sp <YourStoredProcedureName> --repo <YourRepoName> --controller <ControllerName> --endpoint <EndpointName> --<Method>
```
```bash
dotnet tool run RepoGen map --sp <YourStoredProcedureName> --repo <YourRepoName>
```
 - Remap a stored procedure to a repository with controller endpoint:
```bash
dotnet tool run RepoGen re-map --sp <YourStoredProcedureName> --repo <YourRepoName> --controller <ControllerName> --endpoint <EndpointName> --<Method>
```
- Remove a mapped stored procedure:
```bash
dotnet tool run RepoGen remove --sp <YourStoredProcedureName> --repo <YourRepoName>
```
---
## 📁 Architecture Support
- 🧱 MODEL_1: Clean Architecture (default) 
- 🧱 MODEL_2: Layered Architecture 
- 🧱 MODEL_3: Hexagonal (Ports & Adapters) 
- 🧱 MODEL_CUSTOM: Fully configurable layout via custom_model.json

---
## 📚 Documentation

Full guides, step-by-step examples, and command references are available in the 📘 [Wiki](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki):
 
- [🚀 Getting Started](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Step-by-step-practice-sample-guide)  
- [🧱 Custom Structure Setup](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Step-by-step-practice-sample-with-MODEL_CUSTOM-guide) 
- [ℹ️ About](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki)
- [🎯 Objective](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Objective)
- [🚀 Benefits](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki#-benefits)
- [🔌 Supported Technologies](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Installation#-supported-technologies)
- [🛠️ Prerequisites](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Installation#️-prerequisites)
- [📦 Installation](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Installation)
- [🔧 RepoGen.json – Tool Configuration](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Configuration)
- [🔒 Security & Privacy Assurance](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Security)  
- [📁 Folder Structure Models](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Folder-Structure) 
- [🏁 Usage Guide](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Usage) 
- [📋 RepoGen CLI Commands Table](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/RepoGen-CLI-Commands-Table)
- [📋 RepoGen CLI Shorthands Table](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/RepoGen-CLI-Shorthands-Table)
- [🐞 Troubleshooting & Error Handling](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Troubleshooting)
- [🔔 Important Notes](#-important-notes)
- [💡 Example Usage](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/Examples)
- [📝 License](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/License)
- [📞 Contact](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki#-contact)
- [🐞 Issues](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki#-issues) 
- [📦 Other Nugets](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki#-related-packages) 
- [❓ FAQ](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/wiki/FAQ)

 
---
## 🛠 Prerequisites
Install required EF Core dependencies:
```bash
dotnet add package Microsoft.EntityFrameworkCore
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.Data.SqlClient
```
---
## 📎 Related Packages

- [DEFC.Util.DataValidation](https://www.nuget.org/packages/DEFC.Util.DataValidation)
- [DEFC.Util.Generator](https://www.nuget.org/packages/DEFC.Util.Generator)
---
## 📄 License

Licensed under the Elastic License 2.0.
See full license details [here](https://www.elastic.co/licensing/elastic-license).

---
## 👩‍💻 Author

Amina El-Sheikh
🔗 [GitHub](https://github.com/AminaElSheikh) • [LinkedIn](https://www.linkedin.com/in/amina-el-sheikh-05254884/)

---
## 🐞 Issues & Feedback

Found a bug or want to contribute?
📬 [Open an issue](https://github.com/AminaElsheikh/DEFC.Util.RepoGen/issues)

---
> 🙏 Thank you for supporting the development of DEFC.Util.RepoGen. Let’s build clean, maintainable .NET applications together!
