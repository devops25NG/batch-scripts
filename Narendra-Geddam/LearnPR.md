# GitHub Pull Request (PR) Documentation

## Table of Contents
1. [Creating a Pull Request](#creating-a-pull-request)
2. [Assigning Team Members](#assigning-team-members)
3. [PR Options & Features](#pr-options--features)
4. [PR Workflow & Best Practices](#pr-workflow--best-practices)
5. [Reviewing & Merging](#reviewing--merging)

---

## Creating a Pull Request

### Step 1: Create a Feature Branch
Before creating a PR, ensure you're working on a separate branch from `main`:

```bash
git checkout -b feature/your-feature-name
# Example: git checkout -b feature/add-cleanup-script
```

### Step 2: Make Changes & Commit
Add your changes and commit with meaningful messages:

```bash
git add .
git commit -m "feat: add cleanup script for disk management"
# Follow conventional commits format
```

### Step 3: Push Your Branch
Push your branch to the remote repository:

```bash
git push origin feature/your-feature-name
```

### Step 4: Open a Pull Request

#### Via GitHub Web Interface:
1. Go to your repository: [batch-scripts](https://github.com/devops25NG/batch-scripts)
2. Click the **"Compare & pull request"** button (appears after pushing)
3. Fill in the PR details:
   - **Title**: Brief description of changes (e.g., "Add disk cleanup automation script")
   - **Description**: Detailed explanation of what changed and why
   - **Base branch**: `main` (or target branch)
   - **Compare branch**: Your feature branch

#### Via GitHub CLI:
```bash
gh pr create --title "Add cleanup script" --body "Adds automated disk cleanup functionality"
```

---

## Assigning Team Members

### Method 1: Assign Reviewers

1. **On the PR page**, locate the **Reviewers** section (right sidebar)
2. Click the **⚙️ gear icon** next to "Reviewers"
3. Select team members from the dropdown list
4. Multiple reviewers can be assigned

**Example workflow:**
```
PR: Add disk cleanup script
├── Assign: Narendra-Geddam (lead reviewer)
├── Assign: Anitha-shell_scripts (code reviewer)
└── Assign: rahul (testing)
```

### Method 2: Request Review via Comment
```
@narendra-geddam @anitha-shell Please review this PR when you get a chance!
```

### Method 3: Use Code Owners (Advanced)
Create a `.github/CODEOWNERS` file:

```
# Define who reviews what
* @devops25NG/maintainers
/batch-scripts/Narendra-Geddam/ @narendra-geddam
/batch-scripts/Anitha-shell_scripts/ @anitha-shell
/batch-scripts/raj_scripts/ @raj-scripts
```

---

## Assigning to Yourself

1. Click "Assignees" in the right sidebar
2. Select your username
3. This indicates you're working on or responsible for this PR

---

## PR Options & Features

### 1. **Labels** 📏
Categorize PRs for easy filtering:

```
Available Labels:
├── bug (fixes a bug)
├── feature (new feature)
├── documentation (docs only)
├── enhancement (improvement)
├── help-wanted (needs community help)
├── good-first-issue (beginner friendly)
├── wip (work in progress)
├── high-priority (urgent)
└── ready-for-review (ready to merge)
```

**How to add:**
1. Click **Labels** in the right sidebar
2. Select relevant labels

### 2. **Projects** 📊
Track PR progress in project boards:

```
Projects board example:
├── Backlog
├── In Progress
├── In Review
├── Testing
└── Done
```

**How to add:**
1. Click **Projects** in the right sidebar
2. Add PR to relevant project board
3. Drag between columns as progress updates

### 3. **Milestones** 🎯
Group related PRs under milestones:

```
Example Milestones:
├── v1.0 - Initial Release
├── v1.1 - Bug Fixes
├── v2.0 - Major Features
└── Q1 2024 - Quarterly Goals
```

**How to add:**
1. Click **Milestone** in the right sidebar
2. Select or create milestone

### 4. **Linked Issues** 🔗
Connect PR to related issues:

```bash
# In PR description, reference an issue:
Closes #45
Fixes #102
Related to #89
```

**Formats:**
- `Closes #issue-number` — Auto-closes issue when PR merges
- `Fixes #issue-number` — Same as Closes
- `Related to #issue-number` — Links without closing

### 5. **Draft PR** 📝 (Work in Progress)
Create a draft PR for early feedback:

1. Click **"Still in progress?"** when creating PR
2. Or convert existing PR to draft via **"Convert to draft"** button
3. Draft PRs cannot be merged until marked as "Ready for review"

---

## PR Workflow & Best Practices

### Complete PR Description Template

```markdown
## 📝 Description
Brief summary of changes made in this PR.

## 🎯 Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## 📋 Changes Made
- Added disk cleanup script (`cleanup.sh`)
- Optimized file removal logic
- Improved logging functionality

## ✅ Testing Done
- Tested on Ubuntu 20.04
- Verified with 500GB+ directories
- Checked log file generation

## 🔗 Related Issues
Closes #45
Related to #89

## 📸 Screenshots / Output
(Optional: Add screenshots, terminal output, or logs)

## ✔️ Checklist
- [x] Code follows project guidelines
- [x] Tested on my system
- [x] Comments added for clarity
- [x] Documentation updated
- [x] No breaking changes
```

### Example PR for cleanup.sh

```markdown
## 📝 Description
Adds automated disk cleanup script to free up space on Linux systems.

## 🎯 Type of Change
- [x] New feature

## 📋 Changes Made
- Added `/batch-scripts/raj_scripts/cleanup.sh`
- Updated README.md with usage instructions
- Implemented logging to `/var/log/disk_cleanup.log`

## ✅ Testing Done
- Tested on EC2 instance (Amazon Linux 2)
- Verified temp directory cleanup (7+ days)
- Confirmed log file generation

## ✔️ Checklist
- [x] Script has proper shebang
- [x] Error handling implemented
- [x] Comments included
- [x] README updated
```

---

## Reviewing & Merging

### Review Process

#### Reviewer's Perspective:
1. **View Changes**: Click **"Files changed"** tab
2. **Add Comments**: Hover over line numbers, click **+** to comment
3. **Approve or Request Changes**: Use **"Review changes"** button

```
Review Options:
├── Comment (provide feedback)
├── Approve (ready to merge)
└── Request changes (needs fixes)
```

#### PR Creator's Perspective:
1. **Respond to Reviews**: Reply directly to comments
2. **Make Updates**: Push new commits to address feedback
3. **Mark Conversations as Resolved**: After fixes applied

### Merge Strategies

#### 1. **Create a Merge Commit** (Recommended for teams)
```bash
# Preserves full commit history
Merge branch 'feature/cleanup-script' into main
```

#### 2. **Squash & Merge** (For cleaner history)
```bash
# Combines all commits into one
feat: add disk cleanup automation
```

#### 3. **Rebase & Merge** (Linear history)
```bash
# Replays commits on top of main
```

### How to Merge

1. Scroll to bottom of PR page
2. Click **"Merge pull request"** button
3. Confirm merge by clicking **"Confirm merge"**
4. Delete feature branch (optional but recommended)

---

## Advanced PR Options

### 1. **Auto-linking Issues**
```markdown
Closes #45 (automatically closes issue #45 when merged)
```

### 2. **Protected Branches** 🔒
Require PR reviews before merging to `main`:

**GitHub Settings → Branches → Add rule:**
```
Branch name pattern: main
✓ Require pull request reviews (minimum 2)
✓ Require status checks to pass
✓ Require branches to be up to date
```

### 3. **PR Templates** 📋
Create `.github/pull_request_template.md`:

```markdown
## Type
- [ ] Bug Fix
- [ ] Feature
- [ ] Documentation

## Description
...

## Testing
...
```

### 4. **Conversation Threads**
```
┌─ Main Comment
│  ├─ Reply 1
│  ├─ Reply 2 (Conversation resolved)
│  └─ Reply 3
└─ Can discuss inline or general
```

### 5. **Commit History**
View all commits in PR:
```
Click "Commits" tab to see:
├── commit: Add cleanup.sh
├── commit: Update README
└── commit: Fix syntax error
```

---

## Troubleshooting Common PR Issues

### Issue: "This branch has conflicts"
```bash
# Resolve locally:
git fetch origin
git merge origin/main
# Fix conflicts, then commit
git push origin feature/your-branch
```

### Issue: "PR won't merge - checks failing"
1. Click **"Details"** on failing check
2. Fix the issue (syntax error, test failure, etc.)
3. Commit and push
4. Checks automatically re-run

### Issue: "Need to update PR with latest main"
```bash
git fetch origin
git rebase origin/main
git push -f origin feature/your-branch
```

---

## Additional Resources

| Resource | Link |
|----------|------|
| GitHub Docs | [Creating a PR](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request) |
| Conventional Commits | [Format Guide](https://www.conventionalcommits.org/) |
| Git Commands | [Cheat Sheet](https://git-scm.com/docs) |
| batch-scripts Repo | [devops25NG/batch-scripts](https://github.com/devops25NG/batch-scripts) |

---

## Summary

✅ **Quick PR Workflow:**
1. Create feature branch (`git checkout -b feature/name`)
2. Make changes and commit (`git commit -m "type: description"`)
3. Push branch (`git push origin feature/name`)
4. Open PR on GitHub
5. Add reviewers, labels, and milestone
6. Address review feedback
7. Merge when approved

✅ **Best Practices:**
- Write clear PR descriptions
- Assign multiple reviewers
- Use labels and milestones for organization
- Keep PRs focused and not too large
- Respond promptly to review comments