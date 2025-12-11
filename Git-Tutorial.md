# GitHub Foundations Course - Demo Project

Welcome to the GitHub Foundations hands-on demo project! This guide will walk you through Git and GitHub fundamentals using a practical example: building a simple Task Manager application.

## Course Agenda

1. **Git Basics** - Local repository setup and essential commands
2. **Repository Management** - Creating repositories, managing files, commits, and branches
3. **Collaboration Features** - Pull requests, issues, discussions, and notifications

---

## Prerequisites

- Git installed on your computer
- A GitHub account
- A text editor (VS Code recommended)
- Terminal/Command Prompt access

---

## Part 1: Git Basics

### Exercise 1.1: Install and Configure Git

**Objective**: Set up Git on your local machine with proper configuration.

#### Step 1: Verify Git Installation

```bash
git --version
```

If Git is not installed, download it from [git-scm.com](https://git-scm.com/).

#### Step 2: Configure Your Identity

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

#### Step 3: Verify Configuration

```bash
git config --list
```

#### Step 4: Set Default Branch Name (Optional but Recommended)

```bash
git config --global init.defaultBranch main
```

---

### Exercise 1.2: Create Your First Local Repository

**Objective**: Initialize a Git repository and understand basic Git workflow.

#### Step 1: Create Project Directory

```bash
mkdir task-manager
cd task-manager
```

#### Step 2: Initialize Git Repository

```bash
git init
```

**Expected Output**: `Initialized empty Git repository in .../task-manager/.git/`

#### Step 3: Verify Repository Status

```bash
git status
```

**What to observe**: "On branch main", "No commits yet", "nothing to commit"

---

### Exercise 1.3: Create and Track Files

**Objective**: Learn the staging area concept and make your first commit.

#### Step 1: Create a README File

Create a file named `README.md` with the following content:

```markdown
# Task Manager

A simple task management application for learning Git and GitHub.

## Features
- Add tasks
- Mark tasks as complete
- Delete tasks
```

#### Step 2: Check Repository Status

```bash
git status
```

**What to observe**: `README.md` appears as "Untracked files"

#### Step 3: Add File to Staging Area

```bash
git add README.md
```

#### Step 4: Check Status Again

```bash
git status
```

**What to observe**: File now appears under "Changes to be committed"

#### Step 5: Make Your First Commit

```bash
git commit -m "Initial commit: Add README"
```

#### Step 6: View Commit History

```bash
git log
```

**What to observe**: Your commit with author, date, and message

---

### Exercise 1.4: Working with Multiple Files

**Objective**: Practice staging multiple files and understanding the workflow.

#### Step 1: Create Application Files

Create `tasks.txt`:
```
1. Learn Git basics
2. Practice commits
3. Master branching
```

Create `config.json`:
```json
{
  "appName": "Task Manager",
  "version": "1.0.0",
  "features": {
    "addTask": true,
    "deleteTask": true,
    "editTask": false
  }
}
```

#### Step 2: Check Status

```bash
git status
```

#### Step 3: Stage All Files

```bash
git add .
```

Or individually:
```bash
git add tasks.txt
git add config.json
```

#### Step 4: Commit Changes

```bash
git commit -m "Add initial task list and configuration"
```

#### Step 5: View Compact Log

```bash
git log --oneline
```

---

### Exercise 1.5: Making Changes and Understanding Diffs

**Objective**: Learn to track changes and use git diff.

#### Step 1: Modify tasks.txt

Add a new task:
```
1. Learn Git basics
2. Practice commits
3. Master branching
4. Explore GitHub features
```

#### Step 2: View Changes

```bash
git status
git diff
```

**What to observe**: Lines added/removed with +/- symbols

#### Step 3: View Diff for Staged Files

```bash
git add tasks.txt
git diff --staged
```

#### Step 4: Commit the Change

```bash
git commit -m "Add fourth task: Explore GitHub features"
```

---

## Part 2: Repository Management

### Exercise 2.1: Create a GitHub Repository

**Objective**: Connect your local repository to GitHub.

#### Step 1: Create Repository on GitHub

1. Log in to GitHub
2. Click the "+" icon → "New repository"
3. Name: `task-manager-demo`
4. Description: "Demo project for GitHub Foundations course"
5. Keep it **Public** (for learning purposes)
6. **Do NOT** initialize with README (we already have one locally)
7. Click "Create repository"

#### Step 2: Connect Local Repository to GitHub

```bash
git remote add origin https://github.com/YOUR-USERNAME/task-manager-demo.git
```

Replace `YOUR-USERNAME` with your actual GitHub username.

#### Step 3: Verify Remote Connection

```bash
git remote -v
```

#### Step 4: Push to GitHub

```bash
git push -u origin main
```

**Note**: You may need to authenticate with GitHub. Use a Personal Access Token if prompted.

#### Step 5: Verify on GitHub

Visit your repository URL and confirm all files are there.

---

### Exercise 2.2: Working with Branches

**Objective**: Create and manage branches for feature development.

#### Step 1: Create a New Branch

```bash
git branch feature/add-priorities
```

#### Step 2: List All Branches

```bash
git branch
```

**What to observe**: `*` indicates your current branch (main)

#### Step 3: Switch to New Branch

```bash
git checkout feature/add-priorities
```

Or use the shorthand to create and switch:
```bash
git checkout -b feature/add-priorities
```

#### Step 4: Make Changes on the Branch

Modify `tasks.txt`:
```
1. [HIGH] Learn Git basics
2. [MEDIUM] Practice commits
3. [HIGH] Master branching
4. [LOW] Explore GitHub features
```

#### Step 5: Commit Changes

```bash
git add tasks.txt
git commit -m "Add priority levels to tasks"
```

#### Step 6: Push Branch to GitHub

```bash
git push -u origin feature/add-priorities
```

#### Step 7: Switch Back to Main Branch

```bash
git checkout main
```

**What to observe**: Your `tasks.txt` doesn't have priority levels (changes are isolated to the branch)

---

### Exercise 2.3: Merging Branches

**Objective**: Merge feature branch into main branch.

#### Step 1: Ensure You're on Main Branch

```bash
git checkout main
```

#### Step 2: Merge Feature Branch

```bash
git merge feature/add-priorities
```

#### Step 3: Verify Changes

```bash
cat tasks.txt
```

**What to observe**: Priority levels are now in main branch

#### Step 4: Push Updated Main Branch

```bash
git push origin main
```

#### Step 5: Delete Feature Branch (Optional)

Local:
```bash
git branch -d feature/add-priorities
```

Remote:
```bash
git push origin --delete feature/add-priorities
```

---

### Exercise 2.4: Handling Merge Conflicts

**Objective**: Understand and resolve merge conflicts.

#### Step 1: Create Two Branches

```bash
git checkout -b feature/ui-improvements
```

Modify `config.json`:
```json
{
  "appName": "Task Manager Pro",
  "version": "1.1.0",
  "features": {
    "addTask": true,
    "deleteTask": true,
    "editTask": true
  },
  "theme": "dark"
}
```

```bash
git add config.json
git commit -m "Add dark theme and enable edit feature"
git push -u origin feature/ui-improvements
```

#### Step 2: Create Conflicting Changes

```bash
git checkout main
git checkout -b feature/backend-updates
```

Modify `config.json` (same file, different changes):
```json
{
  "appName": "Task Manager",
  "version": "2.0.0",
  "features": {
    "addTask": true,
    "deleteTask": true,
    "editTask": false,
    "searchTask": true
  },
  "database": "sqlite"
}
```

```bash
git add config.json
git commit -m "Add database config and search feature"
```

#### Step 3: Merge First Branch into Main

```bash
git checkout main
git merge feature/ui-improvements
git push origin main
```

#### Step 4: Attempt to Merge Second Branch

```bash
git merge feature/backend-updates
```

**What to observe**: CONFLICT message

#### Step 5: View Conflict

```bash
git status
cat config.json
```

**What to observe**: Conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`)

#### Step 6: Resolve Conflict

Edit `config.json` to combine both changes:
```json
{
  "appName": "Task Manager Pro",
  "version": "2.0.0",
  "features": {
    "addTask": true,
    "deleteTask": true,
    "editTask": true,
    "searchTask": true
  },
  "theme": "dark",
  "database": "sqlite"
}
```

#### Step 7: Complete the Merge

```bash
git add config.json
git commit -m "Merge backend updates and resolve conflicts"
git push origin main
```

---

## Part 3: Collaboration Features

### Exercise 3.1: Creating and Managing Issues

**Objective**: Use GitHub Issues to track tasks and bugs.

#### Step 1: Create an Issue

1. Go to your repository on GitHub
2. Click "Issues" tab
3. Click "New issue"
4. Title: "Add task categories feature"
5. Description:
   ```
   ## Description
   Users should be able to categorize tasks (Work, Personal, Shopping, etc.)
   
   ## Acceptance Criteria
   - [ ] Add category field to task structure
   - [ ] Update tasks.txt format
   - [ ] Document category usage in README
   
   ## Labels
   enhancement, good first issue
   ```
6. Assign labels: "enhancement"
7. Click "Submit new issue"

#### Step 2: Create More Issues

Create these additional issues:
- **Bug**: "Priority levels not sorted correctly" (label: bug)
- **Enhancement**: "Add due dates to tasks" (label: enhancement)
- **Documentation**: "Update README with installation instructions" (label: documentation)

#### Step 3: Create and Use Milestones

**What are Milestones?**
Milestones help you track progress on groups of issues or pull requests toward a specific goal (like a release version).

**Create a Milestone:**

1. Go to your repository on GitHub
2. Click "Issues" tab
3. Click "Milestones" (next to Labels)
4. Click "New milestone"
5. Fill in:
   - **Title**: `v1.1 - Basic Features`
   - **Due date**: `2025-12-31` (optional)
   - **Description**: `First release with priority levels and categories`
6. Click "Create milestone"

**Create Additional Milestones:**
- Title: `v2.0 - Advanced Features`, Due: `2026-03-31`
- Title: `Documentation Updates`, Due: `2025-12-20`

**Assign Issues to Milestones:**

1. Open an issue (e.g., "Add task categories feature")
2. On the right sidebar, click "Milestone"
3. Select `v1.1 - Basic Features`
4. The issue is now tracked under that milestone

**View Milestone Progress:**

1. Go to Issues → Milestones
2. See percentage completion for each milestone
3. Click a milestone to see all associated issues

**What to observe**: Visual progress bar showing completed vs. total issues

**Organize with Labels:**

1. Assign issues to yourself using the "Assignees" section
2. Use labels to categorize (bug, enhancement, documentation, etc.)
3. Combine milestones + labels for powerful organization

---

### Exercise 3.2: Working with Pull Requests

**Objective**: Create and review pull requests for collaborative development.

#### Step 1: Create a Feature Branch

```bash
git checkout main
git pull origin main
git checkout -b feature/task-categories
```

#### Step 2: Implement the Feature

Modify `tasks.txt`:
```
[HIGH][Work] Learn Git basics
[MEDIUM][Personal] Practice commits
[HIGH][Work] Master branching
[LOW][Personal] Explore GitHub features
[MEDIUM][Work] Review pull requests
```

Update `README.md` to document categories:
```markdown
# Task Manager

A simple task management application for learning Git and GitHub.

## Features
- Add tasks
- Mark tasks as complete
- Delete tasks
- **Priority levels** (HIGH, MEDIUM, LOW)
- **Categories** (Work, Personal, Shopping, etc.)

## Task Format
```
[PRIORITY][CATEGORY] Task description
```

Example: `[HIGH][Work] Complete project documentation`
```

#### Step 3: Commit Changes

```bash
git add tasks.txt README.md
git commit -m "Add task categories feature

- Added category field to task format
- Updated example tasks with categories
- Documented category usage in README

Closes #1"
```

**Note**: "Closes #1" will automatically close issue #1 when PR is merged

#### Step 4: Push Branch

```bash
git push -u origin feature/task-categories
```

#### Step 5: Create Pull Request on GitHub

1. Go to your repository on GitHub
2. Click "Pull requests" tab
3. Click "New pull request"
4. Base: `main`, Compare: `feature/task-categories`
5. Title: "Add task categories feature"
6. Description:
   ```
   ## Changes
   - Added category field to task structure
   - Updated tasks.txt with categorized tasks
   - Documented category feature in README
   
   ## Related Issue
   Closes #1
   
   ## Testing
   - [x] Verified task format with categories
   - [x] Updated documentation
   
   ## Screenshots
   (If applicable, add screenshots)
   ```
7. Click "Create pull request"

#### Step 6: Review and Merge

1. Review the "Files changed" tab
2. Add comments or approve
3. Click "Merge pull request"
4. Confirm merge
5. Delete the branch

#### Step 7: Sync Local Repository

```bash
git checkout main
git pull origin main
git branch -d feature/task-categories
```

---

### Exercise 3.3: Code Review and Comments

**Objective**: Practice reviewing pull requests and providing feedback.

#### Step 1: Create a PR for Review

```bash
git checkout -b feature/due-dates
```

Modify `tasks.txt`:
```
[HIGH][Work] Learn Git basics - Due: 2025-12-15
[MEDIUM][Personal] Practice commits - Due: 2025-12-16
[HIGH][Work] Master branching - Due: 2025-12-17
[LOW][Personal] Explore GitHub features - Due: 2025-12-20
[MEDIUM][Work] Review pull requests - Due: 2025-12-18
```

```bash
git add tasks.txt
git commit -m "Add due dates to tasks"
git push -u origin feature/due-dates
```

Create a pull request on GitHub.

#### Step 2: Add Review Comments

1. Go to "Files changed" in the PR
2. Click on a line number to add a comment
3. Example comment: "Should we use ISO 8601 format (YYYY-MM-DD) for consistency?"
4. Click "Start a review"
5. Add more comments on other lines
6. Click "Review changes" → "Comment" or "Request changes"

#### Step 3: Address Review Comments

Locally, make requested changes:
```bash
# Make your edits based on feedback
git add tasks.txt
git commit -m "Use ISO 8601 date format for due dates"
git push origin feature/due-dates
```

**What to observe**: PR automatically updates with new commits

#### Step 4: Approve and Merge

1. Re-review the changes
2. Approve the PR
3. Merge it

---

### Exercise 3.4: Working with Notifications and Subscriptions

**Objective**: Understand GitHub's notification system.

#### Step 1: Configure Notification Settings

1. Go to Settings → Notifications
2. Review notification preferences:
   - Participating
   - Watching
   - Email preferences

#### Step 2: Watch a Repository

1. On your repository page, click "Watch"
2. Select "All Activity"

**What happens**: You'll receive notifications for all issues, PRs, and discussions

#### Step 3: Manage Subscriptions

1. Go to an issue or PR
2. Click "Subscribe" / "Unsubscribe" on the right sidebar
3. Test by @mentioning yourself in a comment

#### Step 4: Practice with @mentions

In an issue or PR comment:
```
@YOUR-USERNAME Could you review this approach?
```

**What to observe**: You receive a notification

---

### Exercise 3.5: Using GitHub Discussions (Optional)

**Objective**: Enable and use Discussions for community interaction.

#### Step 1: Enable Discussions

1. Go to repository Settings
2. Scroll to "Features"
3. Check "Discussions"

#### Step 2: Create a Discussion

1. Click "Discussions" tab
2. Click "New discussion"
3. Category: "General"
4. Title: "Best practices for task organization"
5. Body: "What's your preferred way to organize tasks? Share your tips!"
6. Start discussion

#### Step 3: Engage with Discussions

1. Reply to discussions
2. Mark helpful answers
3. Use reactions

---

## Additional Exercises

### Exercise 4.1: Git Log and History

**Objective**: Explore commit history and find specific changes.

```bash
# View detailed log
git log

# One-line format
git log --oneline

# Graph view
git log --graph --oneline --all

# Filter by author
git log --author="Your Name"

# Filter by date
git log --since="2 weeks ago"

# Search commit messages
git log --grep="feature"

# Show changes in a commit
git show <commit-hash>
```

---

### Exercise 4.2: Undoing Changes

**Objective**: Learn to undo changes safely.

#### Unstage a File
```bash
git add tasks.txt
git reset tasks.txt
```

#### Discard Local Changes
```bash
git checkout -- tasks.txt
```

#### Undo Last Commit (Three Ways)

**Soft Reset** - Undo commit but keep changes staged:
```bash
git reset --soft HEAD~1
```
*Use case*: You want to re-commit with a different message or add more files

**Mixed Reset** - Undo commit and unstage changes (default):
```bash
git reset --mixed HEAD~1
# Or simply: git reset HEAD~1
```
*Use case*: You want to modify files before committing again

**Hard Reset** - Undo commit and discard all changes:
```bash
git reset --hard HEAD~1
```
⚠️ *Warning*: This permanently deletes your changes. Use with caution!

#### Amend Last Commit
```bash
git commit --amend -m "Updated commit message"
```
*Note*: Adds staged changes to the last commit and/or updates its message

#### Revert a Commit

**What is revert?**
`git revert` creates a **new commit** that undoes the changes from a previous commit. This is safe for shared branches because it doesn't rewrite history.

**Step 1: Find the commit hash**

View recent commits:
```bash
git log --oneline
```

**Example output**:
```
a1b2c3d (HEAD -> main) Add due dates feature
e4f5g6h Add task categories
i7j8k9l Add priority levels
m0n1o2p Initial commit
```

The **commit hash** is the alphanumeric code on the left (e.g., `e4f5g6h`)

**Step 2: Copy the hash of the commit you want to undo**

For example, to undo "Add task categories", copy `e4f5g6h`

**Step 3: Revert the commit**
```bash
git revert e4f5g6h
```

**What happens**:
- Git opens an editor with a default message: "Revert 'Add task categories'"
- Save and close the editor
- A new commit is created that undoes the changes from `e4f5g6h`

**Step 4: Verify the revert**
```bash
git log --oneline
```

**New output**:
```
p3q4r5s (HEAD -> main) Revert "Add task categories"
a1b2c3d Add due dates feature
e4f5g6h Add task categories
i7j8k9l Add priority levels
m0n1o2p Initial commit
```

**Alternative: Revert without opening editor**
```bash
git revert e4f5g6h --no-edit
```

**Alternative: Revert multiple commits**
```bash
# Revert a range of commits (oldest first)
git revert e4f5g6h..a1b2c3d
```

**When to use revert vs reset:**
- ✅ **Revert**: When commits are already pushed to shared branches (safe, preserves history)
- ❌ **Reset**: Only for local commits not yet pushed (rewrites history)

---

### Exercise 4.3: Using Git Stash

**Objective**: Save work in progress temporarily without committing.

#### Common Scenario
You're working on a feature but need to switch branches to fix a bug.

#### Save Changes Temporarily
```bash
# Basic stash
git stash

# Stash with a descriptive message
git stash save "Work in progress on task filtering"

# Stash including untracked files
git stash -u
```

#### List All Stashes

```bash
git stash list
```

**Example output**:
```
stash@{0}: On feature/filtering: Work in progress on task filtering
stash@{1}: WIP on main: Add configuration
```

#### Apply Stashed Changes

**Apply and keep the stash**:
```bash
# Apply most recent stash
git stash apply

# Apply specific stash
git stash apply stash@{1}
```

**Apply and remove the stash**:
```bash
# Pop most recent stash
git stash pop

# Pop specific stash
git stash pop stash@{1}
```

#### View Stash Contents

```bash
# Show changes in most recent stash
git stash show

# Show detailed diff
git stash show -p

# Show specific stash
git stash show stash@{1}
```

#### Remove Stashes

```bash
# Remove specific stash
git stash drop stash@{0}

# Clear all stashes
git stash clear
```

#### Practical Exercise: Real-World Stash Workflow

**Scenario**: You're working on a feature branch when someone asks you to urgently fix a bug on main.

**Step 1**: Start working on a feature
```bash
git checkout -b feature/new-categories
```

Make some changes to `tasks.txt` (but don't commit yet):
```
Add a line: "5. Create task categories"
```

**Step 2**: Check your uncommitted changes
```bash
git status
```
**What to observe**: Modified files shown in red (not staged)

**Step 3**: Urgent bug fix needed! Save your work temporarily
```bash
git stash save "WIP: Adding new task categories"
```

**Step 4**: Verify working directory is now clean
```bash
git status
```
**What to observe**: "nothing to commit, working tree clean"

**Step 5**: Switch to main and fix the bug
```bash
git checkout main
# Fix the bug in another file
# Commit the bug fix
git add .
git commit -m "Fix urgent bug"
```

**Step 6**: Go back to your feature branch
```bash
git checkout feature/new-categories
```

**Step 7**: Restore your uncommitted changes
```bash
git stash pop
```

**What to observe**: 
- Your uncommitted changes to `tasks.txt` are back!
- The stash is automatically removed from the stash list
- You can continue working where you left off

**Alternative**: If you want to keep the stash (apply without removing):
```bash
git stash apply
# Your changes are restored, but stash remains in the list
```

---

### Exercise 4.4: Git Pull - Fetching and Merging Remote Changes

**Objective**: Understand how to sync your local repository with remote changes using `git pull`.

#### What is Git Pull?

`git pull` is a combination of two commands:
1. `git fetch` - Downloads changes from remote repository
2. `git merge` - Merges those changes into your current branch

#### Basic Pull Command

```bash
git pull origin main
```

**What happens**:
- Fetches latest changes from `origin/main`
- Merges them into your current branch
- Updates your working directory

#### Pull with Rebase

```bash
git pull --rebase origin main
```

**What's different**:
- Fetches changes like normal pull
- Instead of merging, it **rebases** your commits on top of the fetched changes
- Creates a cleaner, linear history

#### Pull Options Explained

**Option 1: Default Pull (Merge Strategy)**
```bash
git pull
```
- Creates a merge commit if there are changes
- Preserves complete history
- Shows where branches diverged

**Option 2: Pull with Fast-Forward Only**
```bash
git pull --ff-only
```
- Only updates if it can fast-forward
- Fails if divergent changes exist
- Prevents unwanted merge commits
- Good for keeping main branch clean

**Option 3: Pull without Commit**
```bash
git pull --no-commit
```
- Fetches and merges but doesn't create merge commit
- Lets you review changes before committing
- Useful for careful code reviews

**Option 4: Pull from Specific Branch**
```bash
git pull origin feature/new-ui
```
- Pulls from a specific branch instead of default
- Useful for reviewing teammate's work

#### Practical Exercise: Working with Git Pull

**Scenario**: Simulate a team environment where remote changes need to be pulled.

**Step 1**: Create a change on GitHub (simulating a teammate's commit)

1. Go to your repository on GitHub
2. Click "Add file" → "Create new file"
3. Name it `CONTRIBUTING.md`
4. Add content:
   ```markdown
   # Contributing Guidelines
   
   ## How to Contribute
   1. Fork the repository
   2. Create a feature branch
   3. Submit a pull request
   ```
5. Commit with message: "Add contributing guidelines"

**Step 2**: Check your local repository status
```bash
git status
```

**Step 3**: Fetch to see what's different
```bash
git fetch origin
```

**Step 4**: View differences between local and remote
```bash
git diff origin/main
```
**What to observe**: The changes made on GitHub that aren't in your local copy

**Step 5**: Pull the changes
```bash
git pull origin main
```

**Expected Output**:
```
Updating abc1234..def5678
Fast-forward
 CONTRIBUTING.md | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 CONTRIBUTING.md
```

**Step 6**: Verify changes are now local
```bash
cat CONTRIBUTING.md
# or
git log --oneline -3
```

#### When to Use Each Pull Strategy

**Use `git pull` (merge):**
- When you want to preserve all history
- For feature branches
- When working with a team and want to show collaboration

**Use `git pull --rebase`:**
- To keep a linear history
- Before pushing your commits
- To avoid "merge bubble" commits
- When your changes don't conflict with remote

**Use `git pull --ff-only`:**
- On the main/production branch
- When you want to ensure you're up-to-date without creating merges
- To maintain a clean commit history

---

### Exercise 4.5: Git Rebase - Rewriting History

**Objective**: Learn to use `git rebase` to create a cleaner commit history and resolve conflicts.

#### What is Git Rebase?

Rebasing takes your commits and replays them on top of another branch's commits. Think of it as "moving your branch to start from a different point."

#### Basic Rebase

```bash
# Move your current branch on top of main
git rebase main
```

**What happens**:
1. Git finds the common ancestor of your branch and main
2. Saves your commits temporarily
3. Updates your branch to match main
4. Replays your commits one by one on top

#### Interactive Rebase (`git rebase -i`)

**Most powerful feature** - lets you edit commit history before sharing.

```bash
# Rebase last 3 commits interactively
git rebase -i HEAD~3

# Rebase all commits since branching from main
git rebase -i main
```

**Editor opens with options**:
```
pick a1b2c3d Add task filtering
pick d4e5f6g Fix typo in filter
pick h7i8j9k Update documentation

# Commands:
# p, pick = use commit as-is
# r, reword = use commit, but edit message
# e, edit = use commit, but stop to amend
# s, squash = combine with previous commit, keep both messages
# f, fixup = combine with previous commit, discard this message
# d, drop = remove commit entirely
```

#### Practical Exercise: Interactive Rebase

**Step 1**: Create a messy commit history
```bash
git checkout -b feature/add-authors
```

Make some commits:
```bash
# Commit 1 - Create AUTHORS file
echo "# Project Authors" > AUTHORS.md
git add AUTHORS.md
git commit -m "Add authors file"

# Commit 2 - Oops, typo!
echo "- John Doe (john@exmaple.com)" >> AUTHORS.md
git add AUTHORS.md
git commit -m "Add author"

# Commit 3 - Fix the typo
echo "- John Doe (john@example.com)" >> AUTHORS.md
git add AUTHORS.md
git commit -m "Fix email typo"

# Commit 4 - Add another author
echo "- Jane Smith (jane@example.com)" >> AUTHORS.md
git add AUTHORS.md
git commit -m "Add second author"
```

**Step 2**: View the messy history
```bash
git log --oneline -4
```

**What to observe**: Multiple small commits that should be combined

**Step 3**: Start interactive rebase
```bash
git rebase -i HEAD~4
```

**Step 4**: In the editor, change to:
```
pick a1b2c3d Add authors file
fixup d4e5f6g Add author
fixup h7i8j9k Fix email typo
pick l0m1n2o Add second author
```

**Step 5**: Save and close editor

**Step 6**: Verify clean history
```bash
git log --oneline -2
```

**Expected Result**: Only 2 commits instead of 4!

#### Rebase Options Explained

**Option 1: Continue Rebase After Resolving Conflicts**
```bash
git rebase --continue
```
- Used after fixing merge conflicts during rebase
- Proceeds to next commit in the rebase

**Option 2: Abort Rebase**
```bash
git rebase --abort
```
- Cancels rebase and returns to state before rebase
- Safe escape if things go wrong

**Option 3: Skip Current Commit**
```bash
git rebase --skip
```
- Skips the current commit during rebase
- Use if the commit is no longer needed

**Option 4: Rebase onto Different Branch**
```bash
git rebase --onto main feature-old feature-new
```
- Rebases `feature-new` onto `main`, removing `feature-old` commits
- Advanced usage for complex branch management

**Option 5: Autosquash**
```bash
# First, create fixup commit
git commit --fixup a1b2c3d

# Then rebase with autosquash
git rebase -i --autosquash main
```
- Automatically arranges fixup commits next to their targets
- Saves manual editing in interactive rebase

#### Rebase vs Merge: When to Use Each

**Use Rebase When:**
- ✅ Working on a feature branch (before sharing)
- ✅ Want a linear, clean history
- ✅ Preparing commits for a pull request
- ✅ Commits are only local (not pushed)

**Use Merge When:**
- ✅ Working on shared/public branches
- ✅ Want to preserve complete history
- ✅ Commits already pushed to remote
- ✅ Multiple people are working on the same branch

#### ⚠️ The Golden Rule of Rebase

**NEVER rebase commits that have been pushed to a shared branch!**

```bash
# ❌ DANGEROUS - Don't do this!
git checkout main
git rebase feature-branch  # If main is shared

# ✅ SAFE - Do this instead
git checkout feature-branch
git rebase main  # Rebase your private branch
```

**Why?** Rebasing rewrites commit history. If others have based work on those commits, their repositories will be broken.

#### Handling Rebase Conflicts

**Scenario**: Conflicts occur during rebase

**Step 1**: Rebase and encounter conflict
```bash
git rebase main
```

**Output**:
```
CONFLICT (content): Merge conflict in AUTHORS.md
error: could not apply a1b2c3d... Add authors file
hint: Resolve all conflicts manually, mark them as resolved with
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".
```

**Step 2**: View conflicted files
```bash
git status
```

**Step 3**: Open and resolve conflicts in your editor
```
<<<<<<< HEAD
# Project Contributors
- Alice Johnson (alice@example.com)
=======
# Project Authors
- John Doe (john@example.com)
>>>>>>> a1b2c3d (Add authors file)
```

**Step 4**: Mark as resolved
```bash
git add AUTHORS.md
```

**Step 5**: Continue rebase
```bash
git rebase --continue
```

**Step 6**: If more conflicts, repeat steps 3-5. Otherwise, rebase completes!

#### Rebase Best Practices

1. **Always backup before rebasing**
   ```bash
   git branch backup-feature-add-authors
   git rebase main
   ```

2. **Rebase frequently**
   - Pull and rebase regularly to avoid large conflicts
   ```bash
   git pull --rebase origin main
   ```

3. **Use interactive rebase before pull requests**
   - Clean up commits
   - Combine related changes
   - Fix commit messages

4. **Test after rebasing**
   - Run tests to ensure nothing broke
   - Verify functionality still works

---

### Exercise 4.6: GitHub CLI (Optional)

**Objective**: Use GitHub CLI for command-line operations.

#### Install GitHub CLI
Download from [cli.github.com](https://cli.github.com/)

#### Authenticate
```bash
gh auth login
```

#### Create Issue from CLI
```bash
gh issue create --title "Add export feature" --body "Users should be able to export tasks to CSV"
```

#### Create PR from CLI
```bash
gh pr create --title "Add export feature" --body "Implements CSV export functionality"
```

#### View Issues
```bash
gh issue list
```

---

## Summary Checklist

After completing all exercises, you should be able to:

### Git Basics
- [ ] Install and configure Git
- [ ] Initialize a repository
- [ ] Use `git status`, `git add`, `git commit`
- [ ] View commit history with `git log`
- [ ] Understand the staging area
- [ ] Use `git diff` to see changes
- [ ] Stash and restore work in progress

### Repository Management
- [ ] Create a GitHub repository
- [ ] Connect local and remote repositories
- [ ] Push and pull changes
- [ ] Create and switch branches
- [ ] Merge branches
- [ ] Resolve merge conflicts
- [ ] Delete branches

### Collaboration Features
- [ ] Create and manage issues
- [ ] Create pull requests
- [ ] Review code in PRs
- [ ] Comment on specific lines
- [ ] Merge pull requests
- [ ] Manage notifications
- [ ] Use GitHub Discussions

---

## Part 4: GitHub Projects (Bonus)

### Exercise 4.5: Introduction to GitHub Projects

**Objective**: Learn to organize and track work using GitHub Projects.

**What are GitHub Projects?**
Projects are customizable, flexible tools for planning and tracking work. Think of them as Kanban boards, roadmaps, or task trackers integrated with your repository.

#### Step 1: Create Your First Project

**Option A: Repository Project**

1. Go to your repository on GitHub
2. Click "Projects" tab
3. Click "Link a project" → "New project"
4. Choose template:
   - **Board**: Kanban-style columns (Recommended for beginners)
   - **Table**: Spreadsheet view
   - **Roadmap**: Timeline view
5. Select "Board"
6. Name: `Task Manager Development`
7. Click "Create"

**What to observe**: A board with default columns (Todo, In Progress, Done)

#### Step 2: Customize Your Project Board

1. Click the board name to open it
2. **Add a column**: Click "+ Add column"
   - Name: `Backlog`
   - Move it to the left of "Todo"
3. **Add another column**: 
   - Name: `Ready for Review`
   - Place between "In Progress" and "Done"

**Your board now has**: Backlog → Todo → In Progress → Ready for Review → Done

#### Step 3: Add Issues to Your Project

**Method 1: From the Project Board**

1. In the "Backlog" column, click "+ Add item"
2. Type `#` to see existing issues
3. Select issue #1 "Add task categories feature"
4. Add more issues to appropriate columns

**Method 2: From an Issue**

1. Open an issue
2. Right sidebar → Click "Projects"
3. Select your project
4. Issue appears in the default column

#### Step 4: Organize and Move Cards

1. **Drag and drop** issues between columns
   - Move "Add task categories feature" from Backlog → Todo
   - When you start working, drag to "In Progress"
   - After creating a PR, drag to "Ready for Review"
   - When merged, drag to "Done"

2. **Add notes** (cards without issues):
   - Click "+ Add item" in a column
   - Type a note: "Research best practices for task management"
   - Press Enter

#### Step 5: Add Metadata and Filters

**Add custom fields:**

1. Click "•••" (project menu) → Settings
2. Scroll to "Fields"
3. Click "+ New field"
   - Name: `Priority`
   - Type: Single select
   - Options: High, Medium, Low
4. Add another field:
   - Name: `Effort`
   - Type: Number
   - Description: Story points or hours

**Use fields:**

1. Click on a card in your project
2. Set Priority: High
3. Set Effort: 5

**Filter and sort:**

1. Click "Filter" at the top
2. Filter by: `Priority: High`
3. Click "Sort" → Sort by: Effort

#### Step 6: Project Views

**Create different views for different purposes:**

1. Click "•••" → "New view"
2. Choose "Table" view
3. Name: `All Tasks Table`
4. See all items in spreadsheet format

**Create a roadmap view:**

1. Click "•••" → "New view"
2. Choose "Roadmap"
3. Name: `Development Timeline`
4. Set start/end dates on issues to see timeline

#### Step 7: Automate Your Project

**Set up automation:**

1. Click "•••" → "Workflows"
2. Enable built-in automations:
   - ✅ **Item added to project**: Move to "Todo"
   - ✅ **Item reopened**: Move to "Todo"
   - ✅ **Item closed**: Move to "Done"
   - ✅ **Pull request merged**: Move to "Done"

**What this does**: Issues automatically move between columns based on their status!

#### Step 8: Link Multiple Repositories (Optional)

If you have multiple repositories:

1. Open your project
2. Click "+ Add item"
3. Type `#` and select from any of your repositories
4. Manage work across multiple repos in one project!

---

### Exercise 4.6: Projects Best Practices

**Objective**: Learn effective project management patterns.

#### Pattern 1: Sprint Planning Board

**Columns:**
- Backlog
- Sprint Ready
- In Progress
- Code Review
- Testing
- Done

**Workflow:**
1. All new issues go to Backlog
2. During sprint planning, move selected items to "Sprint Ready"
3. Team members pull from "Sprint Ready" to "In Progress"
4. Follow through each stage

#### Pattern 2: Feature Development Tracking

**Custom fields:**
- **Status**: Not Started, In Progress, Blocked, Completed
- **Team**: Frontend, Backend, Design, QA
- **Sprint**: Sprint 1, Sprint 2, Sprint 3
- **Size**: S, M, L, XL

**Views:**
- Board view: Group by Status
- Table view: Filter by Team
- Roadmap view: Timeline by Sprint

#### Pattern 3: Bug Triage Board

**Columns:**
- New Bugs
- Triaged
- High Priority
- In Progress
- Fixed
- Verified

**Labels to use:**
- `bug`, `critical`, `low-priority`, `needs-reproduction`

---

### Quick Reference: Projects vs. Milestones vs. Issues

| Feature | Purpose | Best For |
|---------|---------|----------|
| **Issues** | Individual tasks, bugs, features | Tracking specific work items |
| **Milestones** | Group issues toward a goal/release | Release planning, version targets |
| **Projects** | Visual organization and workflow | Sprint planning, Kanban workflow, cross-repo tracking |

**Use together:**
- Create issues for each task
- Group related issues in a milestone (e.g., "v2.0")
- Organize all work visually in a project board
- Track progress across all three!

---

### Common Project Patterns

**For Solo Developers:**
```
Backlog → Todo → Doing → Done
```

**For Small Teams:**
```
Backlog → Ready → In Progress → Review → Testing → Done
```

**For Larger Teams:**
```
Ideas → Backlog → Planned → In Development → Code Review → QA → Staging → Production
```

---

## Next Steps

1. **Practice regularly**: The best way to learn Git is by using it daily
2. **Explore GitHub features**: Projects, Actions, Wikis, etc.
3. **Contribute to open source**: Find beginner-friendly projects
4. **Learn advanced topics**: Rebasing, cherry-picking, submodules
5. **Automation**: GitHub Actions for CI/CD

---

## Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com)
- [GitHub Skills](https://skills.github.com/)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
- [Pro Git Book](https://git-scm.com/book/en/v2) (Free)

---

## Troubleshooting

### Common Issues

**Problem**: `fatal: not a git repository`
- **Solution**: Run `git init` in the correct directory

**Problem**: `fatal: remote origin already exists`
- **Solution**: Use `git remote set-url origin <url>` instead

**Problem**: Authentication failed
- **Solution**: Use Personal Access Token instead of password

**Problem**: Merge conflicts
- **Solution**: Edit files to resolve conflicts, then `git add` and `git commit`

---

## License

This demo project is for educational purposes.

---

Happy Learning! 🚀
