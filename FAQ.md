
# ❓ Frequently Asked Questions (FAQ)

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

---

### 🔹 How do I regenerate a repository or CRUD if it already exists?
Use the --force flag:
```bash
dotnet tool run RepoGen add --repo OrderItems --force
```


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

> It’s helpful if you can also attach an image or screenshot of the issue to provide more context.

