# GitHub Security Features - Demo Guide

Welcome to the GitHub Security hands-on demo! This guide will walk you through GitHub's security features using practical examples.

## What You'll Learn

1. **Security Policies** - Create a SECURITY.md file to guide vulnerability reporting
2. **Dependabot Alerts** - Automatically detect vulnerable dependencies
3. **Security Advisories** - Privately manage and disclose vulnerabilities
4. **Code Scanning** - Find and fix security issues in your code

---

## Prerequisites

- A GitHub account
- A repository with admin access (we'll create one)
- Basic understanding of Git and GitHub

---

## Part 1: Security Policies

### Exercise 1.1: Create a Security Policy

**Objective**: Add a SECURITY.md file to define how users should report security vulnerabilities.

#### Step 1: Create a Test Repository

1. Go to GitHub and create a new repository
   - Name: `security-demo`
   - Description: "Testing GitHub security features"
   - Make it **Public**
   - ✅ Check "Add a README file"
   - Click "Create repository"

#### Step 2: Add a Security Policy

**Option A: Using GitHub's Template**

1. Go to your repository
2. Click the **"Security"** tab
3. Click **"Security policy"** in the left sidebar
4. Click **"Start setup"**
5. GitHub creates a `SECURITY.md` file

**Option B: Manual Creation**

1. In your repository, click **"Add file"** → **"Create new file"**
2. Name the file: `SECURITY.md`
3. Add the following content:

```markdown
# Security Policy

## Supported Versions

We release patches for security vulnerabilities. Which versions are eligible for receiving such patches depends on the CVSS v3.0 Rating:

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

Instead, please report them to our security team at: security@example.com

You should receive a response within 48 hours. If for some reason you do not, please follow up via email to ensure we received your original message.

Please include the following information:

* Type of issue (e.g., buffer overflow, SQL injection, cross-site scripting, etc.)
* Full paths of source file(s) related to the issue
* The location of the affected source code (tag/branch/commit or direct URL)
* Any special configuration required to reproduce the issue
* Step-by-step instructions to reproduce the issue
* Proof-of-concept or exploit code (if possible)
* Impact of the issue, including how an attacker might exploit it

This information will help us triage your report more quickly.

## Preferred Languages

We prefer all communications to be in English.

## Security Update Process

When we receive a security bug report, we will:

1. Confirm the problem and determine affected versions
2. Audit code to find any similar problems
3. Prepare fixes for all supported releases
4. Release patches as soon as possible

## Comments on This Policy

If you have suggestions on how this process could be improved, please submit a pull request.
```

4. Commit the file

#### Step 3: Verify Your Security Policy

1. Go to your repository's main page
2. Click the **"Security"** tab
3. You should now see **"Security policy"** listed
4. Click it to view your SECURITY.md

**What to observe**: Users can now easily find how to report vulnerabilities!

---

## Part 2: Dependabot Alerts

### Exercise 2.1: Enable Dependabot

**Objective**: Configure Dependabot to monitor your dependencies for vulnerabilities.

#### Step 1: Create a Project with Dependencies

Let's create a simple Node.js project with an intentionally vulnerable dependency for demonstration:

1. In your `security-demo` repository, click **"Add file"** → **"Create new file"**
2. Name: `package.json`
3. Add this content (contains an old, vulnerable version):

```json
{
  "name": "security-demo",
  "version": "1.0.0",
  "description": "Demo for GitHub security features",
  "dependencies": {
    "express": "4.16.0",
    "lodash": "4.17.11",
    "axios": "0.18.0"
  }
}
```

4. Commit the file with message: "Add package.json with dependencies"

**Why these versions?** These older versions have known security vulnerabilities that Dependabot will detect.

#### Step 2: Enable Dependabot Alerts

**Method 1: Repository Settings**

1. Go to **Settings** → **Security & analysis**
2. Find **"Dependabot alerts"**
3. Click **"Enable"**
4. Find **"Dependabot security updates"**
5. Click **"Enable"**

**Method 2: Using dependabot.yml (Advanced)**

1. Create `.github/dependabot.yml`:

```yaml
version: 2
updates:
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
    open-pull-requests-limit: 10
```

2. Commit the file

---

**🤔 Do you need Method 2 if you have Method 1?**

**Short answer:** Method 1 is sufficient for basic security. Method 2 is optional but gives you more control.

**Method 1 (UI Settings):**
- ✅ **Enables**: Dependabot security alerts for vulnerabilities
- ✅ **Enables**: Automatic security update PRs when vulnerabilities are found
- ⚠️ **Limitation**: Only creates PRs for **security vulnerabilities**, not regular updates
- ⚠️ **Limitation**: No customization of schedule, reviewers, or labels

**Method 2 (dependabot.yml file):**
- ✅ **Enables**: Everything from Method 1
- ✅ **Plus**: Regular dependency updates (not just security fixes)
- ✅ **Plus**: Custom schedule (daily, weekly, monthly)
- ✅ **Plus**: Assign reviewers automatically
- ✅ **Plus**: Add custom labels to PRs
- ✅ **Plus**: Control number of open PRs
- ✅ **Plus**: Group updates together
- ✅ **Plus**: Ignore specific dependencies

**Key Difference:**
- **Method 1**: "Tell me when there's a security problem and create a PR to fix it"
- **Method 2**: "Keep ALL my dependencies up-to-date on a schedule I control, with custom settings"

**When to use each:**

| Scenario | Use Method 1 | Use Method 2 |
|----------|--------------|--------------|
| Just want security alerts | ✅ Yes | Not needed |
| Want to keep dependencies current | Not enough | ✅ Yes |
| Need to control PR timing | Not possible | ✅ Yes |
| Want to assign reviewers automatically | Not possible | ✅ Yes |
| Small project, basic needs | ✅ Yes | Optional |
| Large project, multiple ecosystems | ✅ Start here | ✅ Add this |

**💡 Recommendation for this demo:**
- **Start with Method 1** to see security alerts quickly
- **Add Method 2 later** if you want regular dependency updates

---

#### Step 3: Wait for Dependabot to Scan

**This may take a few minutes!**

Dependabot automatically scans your dependencies when:
- You push a manifest file (like `package.json`)
- A new vulnerability is published
- On a schedule (if configured)

#### Step 4: View Dependabot Alerts

1. Click the **"Security"** tab
2. Click **"Dependabot alerts"** in the left sidebar
3. You should see alerts for vulnerable packages

**What to observe**:
- List of vulnerable dependencies
- Severity levels (Critical, High, Medium, Low)
- CVE numbers
- Recommended versions to fix the issue

#### Step 5: Review an Alert

1. Click on one of the alerts (e.g., lodash alert)
2. You'll see:
   - **Vulnerability details**: What the issue is
   - **Affected versions**: Which versions are vulnerable
   - **Patched versions**: What version fixes it
   - **Severity**: How serious the issue is
   - **CVE**: The official vulnerability ID

#### Step 6: Fix a Vulnerability with Dependabot PR

**If Dependabot security updates are enabled**, Dependabot automatically creates pull requests to fix vulnerabilities!

1. Go to **Pull requests** tab
2. Look for PRs created by `dependabot[bot]`
3. Click on a Dependabot PR
4. Review the changes:
   - Updated version in `package.json`
   - Details about the vulnerability
   - Compatibility score

5. **Merge the PR** to fix the vulnerability

**Manual Fix:**

If no automatic PR was created, fix it manually:

1. Edit `package.json`
2. Update the vulnerable package version:

```json
{
  "dependencies": {
    "express": "4.18.2",
    "lodash": "4.17.21",
    "axios": "1.6.0"
  }
}
```

3. Commit and push
4. The alert should automatically close

#### Step 7: Configure Dependabot (Optional)

Create `.github/dependabot.yml` for more control:

```yaml
version: 2
updates:
  # Enable version updates for npm
  - package-ecosystem: "npm"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "09:00"
    open-pull-requests-limit: 5
    reviewers:
      - "your-github-username"
    labels:
      - "dependencies"
      - "security"
    commit-message:
      prefix: "npm"
      include: "scope"
```

---

## Part 3: Security Advisories

### Exercise 3.1: Create a Security Advisory

**Objective**: Learn to privately discuss and fix security vulnerabilities before public disclosure.

#### Step 1: Create a Security Advisory

1. Go to your repository's **Security** tab
2. Click **"Advisories"** in the left sidebar
3. Click **"New draft security advisory"**
4. Fill in the form:

**Advisory Details:**
- **Title**: `SQL Injection in user authentication`
- **CVE ID**: Leave empty (GitHub can request one for you)
- **Description**:
  ```
  ## Impact
  An SQL injection vulnerability was discovered in the user authentication module.
  This allows an attacker to bypass authentication and gain unauthorized access.
  
  ## Affected Versions
  - Versions 1.0.0 through 1.2.5
  
  ## Patches
  This issue has been fixed in version 1.3.0
  
  ## Workarounds
  Use parameterized queries for all database interactions
  
  ## References
  - [OWASP SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
  ```

- **Severity**: Select **"High"**
- **Ecosystem**: Select your package ecosystem (e.g., "npm")
- **Package name**: `security-demo`
- **Affected versions**: `>= 1.0.0, < 1.3.0`
- **Patched versions**: `1.3.0`

5. Click **"Create draft security advisory"**

#### Step 2: Collaborate on the Advisory (Private)

**What makes advisories special?** They're private until you publish them!

1. In your draft advisory, click **"Collaborators"**
2. You can invite collaborators to discuss the vulnerability privately
3. Add team members who should help fix the issue
4. They can view and comment without the public seeing it

#### Step 3: Create a Private Fork to Fix the Issue

1. In your advisory, click **"Start a temporary private fork"**
2. This creates a private copy of your repo
3. Make fixes in this private fork
4. Create a pull request to merge the fix

**Example fix workflow:**

```bash
# Clone the private fork
git clone https://github.com/YOUR-USERNAME/security-demo-GHSA-xxxx.git
cd security-demo-GHSA-xxxx

# Create a branch for the fix
git checkout -b fix-sql-injection

# Make your fixes (example)
echo "Fixed SQL injection vulnerability" >> FIXES.md

# Commit and push
git add .
git commit -m "Fix SQL injection in authentication"
git push origin fix-sql-injection
```

#### Step 4: Request a CVE

1. In your draft advisory, click **"Request CVE"**
2. GitHub will request a CVE ID from MITRE
3. This gives your vulnerability an official identifier

#### Step 5: Publish the Advisory

**Only after you've fixed the vulnerability!**

1. Review all advisory details
2. Ensure the fix is released
3. Click **"Publish advisory"**
4. The advisory becomes public
5. Affected users get notified

**What happens when published:**
- ✅ Appears in GitHub Security Advisories database
- ✅ Dependabot alerts users of affected repositories
- ✅ Gets a CVE ID (if requested)
- ✅ Included in security feeds

---

## Part 4: Code Scanning

### Exercise 4.1: Set Up Code Scanning with CodeQL

**Objective**: Automatically scan your code for security vulnerabilities and coding errors.

#### Step 1: Enable Code Scanning

**Method 1: GitHub's Default Setup (Easiest)**

1. Go to your repository
2. Click **"Security"** tab
3. Click **"Code scanning"** in the left sidebar
4. Click **"Set up code scanning"**
5. Click **"Set up this workflow"** under **"CodeQL Analysis"**

**Method 2: Manual Setup with GitHub Actions**

1. In your repository, create `.github/workflows/codeql-analysis.yml`:

```yaml
name: "CodeQL"

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]
  schedule:
    - cron: '0 0 * * 1'  # Run every Monday at midnight

jobs:
  analyze:
    name: Analyze
    runs-on: ubuntu-latest
    permissions:
      actions: read
      contents: read
      security-events: write

    strategy:
      fail-fast: false
      matrix:
        language: [ 'javascript' ]

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3

    - name: Initialize CodeQL
      uses: github/codeql-action/init@v2
      with:
        languages: ${{ matrix.language }}

    - name: Autobuild
      uses: github/codeql-action/autobuild@v2

    - name: Perform CodeQL Analysis
      uses: github/codeql-action/analyze@v2
```

2. Commit the file
3. The workflow will run automatically

#### Step 2: Add Vulnerable Code for Testing

Create a file with intentional vulnerabilities so CodeQL has something to find:

**Create `app.js`:**

```javascript
const express = require('express');
const app = express();

// VULNERABILITY 1: SQL Injection
app.get('/user', (req, res) => {
  const userId = req.query.id;
  // Bad: Direct string concatenation
  const query = `SELECT * FROM users WHERE id = ${userId}`;
  // This would execute: db.query(query)
  res.send('User query executed');
});

// VULNERABILITY 2: Command Injection
app.get('/ping', (req, res) => {
  const host = req.query.host;
  // Bad: Unsanitized user input in shell command
  const { exec } = require('child_process');
  exec(`ping -c 4 ${host}`, (error, stdout) => {
    res.send(stdout);
  });
});

// VULNERABILITY 3: Hardcoded Credentials
const DB_PASSWORD = 'admin123';  // Bad: Hardcoded password
const API_KEY = 'sk-1234567890abcdef';  // Bad: Exposed API key

// VULNERABILITY 4: Path Traversal
app.get('/file', (req, res) => {
  const fileName = req.query.name;
  // Bad: No path sanitization
  const filePath = `./uploads/${fileName}`;
  res.sendFile(filePath);
});

// VULNERABILITY 5: Weak Cryptography
const crypto = require('crypto');
function hashPassword(password) {
  // Bad: MD5 is cryptographically broken
  return crypto.createHash('md5').update(password).digest('hex');
}

app.listen(3000, () => {
  console.log('Server running on port 3000');
});
```

Commit this file with message: "Add application code (contains vulnerabilities for demo)"

**⚠️ Important Note About CodeQL Detection:**

CodeQL will detect **actual executable vulnerabilities**, not commented code. From the code above, you'll likely see:
- ✅ **Uncontrolled command line** (Critical) - from the `exec()` with unsanitized input
- ✅ **Use of password hash with insufficient computational effort** (High) - from MD5 hashing
- ✅ **Missing rate limiting** (High) - from unprotected endpoints
- ❌ **SQL Injection won't appear** - because the SQL query is in a comment, not executed
- ❌ **Hardcoded credentials might not appear** - depends on CodeQL's pattern matching
- ❌ **Path traversal might not appear** - because `res.sendFile()` has some built-in protections

**Why?** CodeQL analyzes actual code execution paths, not comments or strings that aren't used.

#### Step 3: Wait for Code Scanning to Complete

1. Go to **Actions** tab
2. Watch the CodeQL workflow run
3. Wait for it to complete (usually 2-5 minutes)

#### Step 4: View Code Scanning Alerts

1. Go to **Security** tab
2. Click **"Code scanning"** 
3. You should see approximately **4 open alerts**

**What to observe:**
- List of security issues found
- Severity levels (Critical, High, Medium, Low)
- Affected files and line numbers
- Detailed explanations

**Expected alerts:**
- "Uncontrolled command line" (Critical) - Line 18
- "Use of password hash with insufficient computational effort" (High) - Line 39
- "Missing rate limiting" (High) - Multiple instances

#### Step 5: Review a Code Scanning Alert

1. Click on the **"Uncontrolled command line"** alert (Critical severity)
2. You'll see:
   - **Description**: "Forwarding command-line arguments to a child process executed within a shell may indirectly introduce command injection vulnerabilities"
   - **Recommendation**: Sanitize input or use `execFile()` instead of `exec()`
   - **Severity**: Critical
   - **Location**: app.js, line 18 (the `exec()` call)
   - **Code flow**: Shows how `req.query.host` flows into `exec()`

3. Click **"Show paths"** to see the data flow from user input to vulnerability

#### Step 6: Fix a Vulnerability

Let's fix the **Uncontrolled command line** (command injection):

**Option 1: Input Validation**

```javascript
// FIXED: Validate input
app.get('/ping', (req, res) => {
  const host = req.query.host;
  
  // Validate: only allow alphanumeric, dots, and hyphens
  if (!/^[a-zA-Z0-9.-]+$/.test(host)) {
    return res.status(400).send('Invalid host');
  }
  
  const { exec } = require('child_process');
  exec(`ping -c 4 ${host}`, (error, stdout) => {
    res.send(stdout);
  });
});
```

**Option 2: Use execFile (Better)**

```javascript
// BEST: Use execFile with arguments array
app.get('/ping', (req, res) => {
  const host = req.query.host;
  const { execFile } = require('child_process');
  
  // execFile doesn't invoke a shell, preventing injection
  execFile('ping', ['-c', '4', host], (error, stdout) => {
    if (error) {
      return res.status(500).send('Error executing ping');
    }
    res.send(stdout);
  });
});
```

3. Commit and push the fix

#### Step 7: Dismiss or Close Alerts

After fixing:

1. Go back to the code scanning alert
2. Click **"Dismiss alert"**
3. Select reason: "Fixed"
4. Add a comment about the fix
5. Click **"Dismiss alert"**

**Or** the alert will automatically close when CodeQL detects the fix in the next scan.

#### Step 8: Configure Code Scanning (Advanced)

Create `.github/codeql/codeql-config.yml` for custom configuration:

```yaml
name: "Custom CodeQL Configuration"

queries:
  - uses: security-extended
  - uses: security-and-quality

paths-ignore:
  - node_modules
  - test/**
  - '**/*.test.js'

paths:
  - src/**

query-filters:
  - exclude:
      id: js/sql-injection
```

---

## Part 5: Secret Scanning

### Exercise 5.1: Enable Secret Scanning

**Objective**: Prevent accidentally committing secrets like API keys and passwords.

#### Step 1: Enable Secret Scanning

**For public repositories:** Automatically enabled!

**For private repositories:**

1. Go to **Settings** → **Security & analysis**
2. Find **"Secret scanning"**
3. Click **"Enable"**
4. Enable **"Push protection"** (prevents commits with secrets)

#### Step 2: Test Secret Scanning

**Important:** Don't use real secrets! Use fake/dummy secrets for testing.

1. Create a file `config.js`:

```javascript
// Test secrets (these are FAKE - don't use real ones!)
module.exports = {
  // GitHub Personal Access Token pattern
  githubToken: 'ghp_1234567890abcdefghijklmnopqrstuvwxyzAB',
  
  // AWS Access Key pattern
  awsAccessKey: 'AKIAIOSFODNN7EXAMPLE',
  awsSecretKey: 'wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY',
  
  // Slack Token pattern
  slackToken: 'xoxb-123456789012-1234567890123-abcdefghijklmnopqrstuvw',
  
  // API Key pattern
  apiKey: 'sk_live_1234567890abcdefghijklmnopqrstuvwxyz'
};
```

2. Try to commit this file

**If push protection is enabled:**
- Git will **block** the push
- You'll see an error about detected secrets
- You must remove the secrets or bypass the protection

3. If the commit goes through, check:
   - Go to **Security** → **Secret scanning**
   - View detected secrets
   - Each secret shows where it was found

#### Step 3: Resolve Secret Alerts

1. **Remove the secret** from your code
2. **Rotate the secret** (invalidate the old one, create a new one)
3. Use **environment variables** or **secret management tools** instead
4. Close the alert after resolving

**Best practice fix:**

```javascript
// GOOD: Use environment variables
module.exports = {
  githubToken: process.env.GITHUB_TOKEN,
  awsAccessKey: process.env.AWS_ACCESS_KEY,
  apiKey: process.env.API_KEY
};
```

---

## Part 6: Putting It All Together

### Exercise 6.1: Complete Security Setup

**Objective**: Enable all security features for comprehensive protection.

#### Security Checklist

Create a security checklist in your repository:

```markdown
# Security Checklist

## Repository Security Setup

- [x] SECURITY.md file created
- [x] Dependabot alerts enabled
- [x] Dependabot security updates enabled
- [x] Code scanning (CodeQL) enabled
- [x] Secret scanning enabled
- [x] Push protection for secrets enabled
- [ ] Branch protection rules configured
- [ ] Required status checks enabled
- [ ] Require pull request reviews

## Monitoring

- [ ] Review Dependabot alerts weekly
- [ ] Review code scanning alerts on each PR
- [ ] Monitor secret scanning alerts
- [ ] Check security advisories monthly

## Response Plan

1. Vulnerability reported → Acknowledge within 48h
2. Create private security advisory
3. Fix in temporary private fork
4. Test the fix thoroughly
5. Publish advisory and release fix
6. Notify affected users
```

#### Step 1: Configure Branch Protection

1. Go to **Settings** → **Branches**
2. Click **"Add rule"**
3. Branch name pattern: `main`
4. Enable:
   - ✅ Require pull request reviews
   - ✅ Require status checks to pass (select CodeQL)
   - ✅ Require conversation resolution
5. Click **"Create"**

**What this does:**
- Forces code review before merging
- Ensures code scanning passes
- Prevents direct pushes to main

---

## Part 7: Security Workflows

### Exercise 7.1: Create a Security-First Development Workflow

**Complete workflow for secure development:**

#### 1. When Starting a New Feature

```bash
# Create a feature branch
git checkout -b feature/user-authentication
```

#### 2. While Developing

- Write secure code following best practices
- Avoid hardcoding secrets
- Use parameterized queries
- Validate and sanitize inputs

#### 3. Before Committing

```bash
# Check for secrets locally (optional tool)
git secrets --scan

# Review your changes
git diff
```

#### 4. Create Pull Request

1. Push your branch
2. Create a PR
3. **Wait for automated checks:**
   - ✅ CodeQL analysis runs
   - ✅ Dependabot checks dependencies
   - ✅ Secret scanning checks for leaked secrets

#### 5. Code Review

1. Request review from team members
2. Address code scanning alerts
3. Fix any vulnerabilities found
4. Respond to review comments

#### 6. After Merge

1. Monitor for new Dependabot alerts
2. Check if any security advisories affect you
3. Update dependencies regularly

---

## Best Practices Summary

### ✅ Do's

1. **Enable all security features**
   - Dependabot alerts
   - Code scanning
   - Secret scanning
   - Branch protection

2. **Create a SECURITY.md**
   - Clear reporting process
   - Response timeline
   - Contact information

3. **Respond quickly to alerts**
   - Review alerts within 24 hours
   - Fix critical issues immediately
   - Keep dependencies updated

4. **Use security advisories**
   - For serious vulnerabilities
   - Private disclosure first
   - Coordinate fixes before publishing

5. **Regular security audits**
   - Weekly Dependabot review
   - Monthly security review
   - Quarterly dependency updates

### ❌ Don'ts

1. **Never commit secrets**
   - No API keys
   - No passwords
   - No tokens
   - Use environment variables

2. **Don't ignore alerts**
   - Every alert matters
   - Low severity can escalate
   - Fix or document why dismissed

3. **Don't disable security features**
   - Keep them on always
   - They're there to help
   - Free protection

4. **Don't delay updates**
   - Update vulnerable dependencies ASAP
   - Don't wait for "convenient time"
   - Security first

---

## Troubleshooting

### Dependabot Not Creating PRs

**Problem**: Alerts appear but no PRs created

**Solutions:**
- Ensure "Dependabot security updates" is enabled
- Check if PRs are disabled in settings
- Look for dependency lock files that need updating
- Check branch protection rules aren't blocking

### Code Scanning Failing

**Problem**: CodeQL workflow fails

**Solutions:**
- Check workflow logs for errors
- Ensure language is correctly specified
- Verify repository has code to analyze
- Check GitHub Actions permissions

### Secret Scanning False Positives

**Problem**: Test secrets triggering alerts

**Solutions:**
- Use clearly fake patterns for tests
- Add `# pragma: allowlist secret` comment above test secrets
- Document test secrets in security policy
- Use secret scanning configuration to exclude test files

---

## Additional Resources

- [GitHub Security Features Documentation](https://docs.github.com/en/code-security)
- [Dependabot Documentation](https://docs.github.com/en/code-security/dependabot)
- [CodeQL Documentation](https://codeql.github.com/docs/)
- [Security Advisories Guide](https://docs.github.com/en/code-security/security-advisories)
- [Secret Scanning Documentation](https://docs.github.com/en/code-security/secret-scanning)

---

## Summary Checklist

After completing all exercises, you should be able to:

### Security Policies
- [ ] Create a comprehensive SECURITY.md file
- [ ] Define vulnerability reporting process
- [ ] Specify supported versions
- [ ] Set expectations for response time

### Dependabot
- [ ] Enable Dependabot alerts
- [ ] Configure Dependabot updates
- [ ] Review and merge Dependabot PRs
- [ ] Understand vulnerability severity levels

### Security Advisories
- [ ] Create a draft security advisory
- [ ] Collaborate privately on vulnerabilities
- [ ] Use temporary private forks
- [ ] Request CVE IDs
- [ ] Publish advisories responsibly

### Code Scanning
- [ ] Set up CodeQL analysis
- [ ] Interpret code scanning alerts
- [ ] Fix security vulnerabilities
- [ ] Configure custom queries
- [ ] Integrate with PR workflows

### Secret Scanning
- [ ] Enable secret scanning
- [ ] Set up push protection
- [ ] Identify and remove leaked secrets
- [ ] Use environment variables properly

---

## Next Steps

1. **Apply to your real projects**
   - Enable security features on all repositories
   - Create security policies
   - Set up automated scanning

2. **Stay informed**
   - Subscribe to GitHub Security Blog
   - Follow security advisories
   - Join security communities

3. **Educate your team**
   - Share this guide
   - Conduct security training
   - Establish security practices

---

Congratulations! You now have a comprehensive understanding of GitHub's security features! 🔒🎉
