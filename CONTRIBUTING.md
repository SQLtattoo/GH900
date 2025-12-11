# Contributing to GH-900 GitHub Foundations Course

Thank you for your interest in contributing to the GH-900 course materials! This repository is designed to help students learn Git and GitHub fundamentals, and we welcome contributions that improve the learning experience.

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Getting Started](#getting-started)
- [Contribution Guidelines](#contribution-guidelines)
- [Submitting Changes](#submitting-changes)
- [Style Guide](#style-guide)

---

## Code of Conduct

This project adheres to a [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code. Please report unacceptable behavior to the repository maintainers.

---

## How Can I Contribute?

### 🐛 Reporting Bugs or Issues

Found a typo, broken link, or incorrect command? Help us fix it!

1. **Check existing issues** to avoid duplicates
2. **Create a new issue** with:
   - Clear, descriptive title
   - Steps to reproduce (if applicable)
   - Expected vs. actual behavior
   - Screenshots (if helpful)
   - Your environment (OS, Git version, etc.)

### 💡 Suggesting Enhancements

Have an idea to improve the course materials?

1. **Open an issue** with the `enhancement` label
2. Describe:
   - The problem you're trying to solve
   - Your proposed solution
   - Why this would benefit learners
   - Any alternative approaches considered

### 📝 Improving Documentation

Documentation improvements are always welcome:

- Fix typos or grammatical errors
- Clarify confusing instructions
- Add missing steps or explanations
- Update outdated screenshots or examples
- Improve formatting or readability

### ✨ Adding New Content

Want to add new exercises or tutorials?

1. **Discuss first**: Open an issue to discuss your idea
2. **Ensure alignment**: New content should fit the GH-900 curriculum
3. **Follow structure**: Match existing exercise format and style
4. **Test thoroughly**: Verify all commands work as documented

---

## Getting Started

### Prerequisites

- Git installed on your machine
- A GitHub account
- Basic understanding of Markdown
- Familiarity with the course content

### Fork and Clone

1. **Fork** this repository to your GitHub account
2. **Clone** your fork locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/GH900.git
   cd GH900
   ```
3. **Add upstream remote**:
   ```bash
   git remote add upstream https://github.com/SQLtattoo/GH900.git
   ```

### Create a Branch

Always create a new branch for your changes:

```bash
git checkout -b feature/your-feature-name
```

**Branch naming conventions:**
- `fix/issue-description` - Bug fixes
- `feature/new-content` - New features or content
- `docs/improvement-description` - Documentation updates
- `chore/task-description` - Maintenance tasks

---

## Contribution Guidelines

### Content Standards

#### Exercise Structure

All exercises must follow this format:

```markdown
### Exercise X.Y: Exercise Title

**Objective**: Clear learning goal in one sentence.

#### Step 1: Descriptive Step Title

```bash
# Commands with comments
git command --option
```

**Expected Output**:
```
Show what students should see
```

**What to observe**: Key teaching points for instructors
```

#### Command Examples

- **Include exact commands**: Students should be able to copy-paste
- **Show expected output**: Help students verify success
- **Add context**: Explain what each command does
- **Handle errors**: Include troubleshooting for common issues

#### Writing Style

- **Clear and concise**: Short sentences, simple language
- **Step-by-step**: Break complex tasks into manageable steps
- **Beginner-friendly**: Assume minimal prior knowledge
- **Consistent terminology**: Use Git/GitHub standard terms
- **Active voice**: "Create a branch" not "A branch is created"

### Testing Requirements

Before submitting, test your changes:

1. **Follow your own instructions**: Can you complete the exercise?
2. **Test all commands**: Verify they work as documented
3. **Check links**: Ensure all links are valid
4. **Verify formatting**: Preview Markdown rendering
5. **Test on clean environment**: Use fresh repository if possible

### File Organization

- **Tutorials**: Main instructional content files (e.g., `Git-Tutorial.md`)
- **Cheat Sheets**: Quick reference guides (e.g., `Search-CheatSheet.md`)
- **Demos**: Live classroom scripts (e.g., `GitHub-Copilot-Live-Demo.md`)
- **Images**: Screenshots and diagrams in `/images` folder
- **Scripts**: Automation scripts (e.g., `reset-demo.ps1`)

---

## Submitting Changes

### Pull Request Process

1. **Update your fork**:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Commit your changes**:
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```
   
   **Good commit messages:**
   - `fix: Correct git rebase command syntax in Exercise 4.5`
   - `feat: Add exercise on GitHub Actions workflows`
   - `docs: Clarify merge conflict resolution steps`
   - `chore: Update broken links in README`

3. **Push to your fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

4. **Create Pull Request**:
   - Go to your fork on GitHub
   - Click "New pull request"
   - Fill out the PR template
   - Link related issues (e.g., "Closes #42")

### Pull Request Template

```markdown
## Description
Brief summary of changes

## Type of Change
- [ ] Bug fix (typo, broken link, incorrect command)
- [ ] New feature (new exercise, tutorial, or content)
- [ ] Documentation update
- [ ] Chore (maintenance, refactoring)

## Checklist
- [ ] I have tested all commands/instructions
- [ ] I have followed the style guide
- [ ] I have updated relevant documentation
- [ ] My changes generate no new warnings
- [ ] I have checked for typos and grammar errors

## Related Issues
Closes #(issue number)
```

### Review Process

1. Maintainers will review your PR
2. Address any requested changes
3. Once approved, your PR will be merged
4. Your contribution will be acknowledged! 🎉

---

## Style Guide

### Markdown Formatting

- Use `#` for main titles, `##` for sections, `###` for subsections
- Use **bold** for UI elements: "Click the **Settings** tab"
- Use `code` for commands, files, and variables: `git commit`
- Use fenced code blocks with language specification:
  ````markdown
  ```bash
  git status
  ```
  ````

### Code Examples

- **PowerShell scripts**: Use `.ps1` extension and `pwsh` syntax
- **Bash commands**: Use standard bash syntax
- **Comments**: Add inline comments for complex commands
- **Placeholders**: Use UPPERCASE for user-replaceable values:
  ```bash
  git clone https://github.com/YOUR-USERNAME/repo.git
  ```

### Screenshots and Images

- Store in `/images` folder
- Use descriptive filenames: `merge-conflict-example.png`
- Compress images to reduce file size
- Add alt text: `![Alt text description](images/filename.png)`

### Language and Tone

- **Instructional**: Clear, direct instructions
- **Encouraging**: Positive, supportive tone
- **Professional**: Avoid slang or overly casual language
- **Inclusive**: Use "you" and "we", avoid assumptions

---

## Questions?

- **Open an issue**: For questions about contributing
- **Check existing docs**: Review [README.md](README.md) first
- **Join discussions**: Participate in GitHub Discussions (if enabled)

---

## Recognition

Contributors will be acknowledged in:
- Repository contributors list
- Release notes (for significant contributions)
- Special thanks section (coming soon!)

---

## License

By contributing to this project, you agree that your contributions will be licensed under the same terms as the project (see [LICENSE](LICENSE) if applicable).

---

**Thank you for helping make Git and GitHub more accessible to learners! 🚀**
