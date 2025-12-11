# GitHub Search Samples (Personal Account Edition)

These examples demonstrate practical GitHub code search patterns using the personal account `youUsernameHere`. All queries work without needing a GitHub Organization and are ideal for GH-900 demos.

---

## 🔎 1. Find Accidental Secrets in Personal Repos

Search for common hard-coded secrets or environment files:

```
user:youUsernameHere "password"
user:youUsernameHere "apikey="
user:youUsernameHere AWS_SECRET_ACCESS_KEY
filename:.env user:youUsernameHere
extension:env user:youUsernameHere
```

**Use Case**: Audit your repositories for accidentally committed credentials or API keys before they become security incidents.

---

## 🔎 2. Detect Insecure or Dangerous Code Patterns

Search for insecure or risky patterns:

```
user:youUsernameHere "0.0.0.0/0"
user:youUsernameHere eval(
user:youUsernameHere exec(
user:youUsernameHere DROP TABLE
```

**Use Case**: Find potentially dangerous code like overly permissive network rules, dynamic code execution, or SQL injection vulnerabilities.

---

## 🔎 3. Locate Dependency Usage Before Upgrading

Find where libraries are used across personal repos:

```
user:youUsernameHere filename:package.json axios
user:youUsernameHere filename:package.json react
user:youUsernameHere filename:requirements.txt flask
user:youUsernameHere lodash
```

**Use Case**: Before upgrading a package with breaking changes, identify all repos that depend on it so you can plan updates accordingly.

---

## 🔎 4. Discover All GitHub Actions Workflows

Audit CI/CD automation across personal repositories:

```
user:youUsernameHere path:.github/workflows
user:youUsernameHere filename:workflow.yml
extension:yml user:youUsernameHere "run:"
```

**Use Case**: Inventory all automation workflows to standardize CI/CD practices, update deprecated actions, or audit build processes.

---

## 🔎 5. Track Function or Constant Usage Across Repos

Search for specific code references across all your repos:

```
user:youUsernameHere "validateUser("
user:youUsernameHere "BASE_URL"
user:youUsernameHere "dbConnect"
```

**Use Case**: When refactoring shared utilities or constants, find all locations where they're used to ensure consistent updates.

---

## 🎯 GH-900 Teaching Tip

> **"Everything shown here on a personal account becomes exponentially more powerful in an organization using `org:` filters."**

### Scaling to Organizations

Replace `user:youUsernameHere` with `org:your-organization` to search across all repositories in your GitHub Organization:

```
org:your-company "apikey="
org:your-company path:.github/workflows
org:your-company filename:package.json react
```

This enables enterprise-wide code audits, security scanning, and dependency management at scale.

---

## 📚 Additional Resources

- [GitHub Search Syntax Documentation](https://docs.github.com/en/search-github/searching-on-github)
- [Search CheatSheet](./Search-CheatSheet.md) - Quick reference for GitHub search operators
- [GitHub Security Tutorial](./GitHub-Security-Tutorial.md) - Learn about secret scanning and security features
more powerful in an organization using org: filters.”