# Batch Assignment – GitHub Workflow

This repository is part of the **Batch Assignment** under the organization [devops25NG](https://github.com/devops25NG).  
Each member will contribute their own shell scripts by creating a personal branch, pushing their work, and finally merging into `main` through a Pull Request.

---

## 📌 Steps to Contribute

### 1. Clone the Repository
```bash
git clone https://github.com/devops25NG/batch-scripts.git
cd batch-scripts
```

### 2. Create and Switch to Your Branch
Name your branch using your name. Example for Rahul:
```bash
git checkout -b <your-name>
```

Other examples:
- `narendra-geddam`
- `rahul-scripts`
- `john-doe`

### 3. Add Your Files
Copy or create your shell script files inside the repo folder.

```bash
git add .
git commit -m "Added scripts by <Your Name>"
```

### 4. Push Your Branch to GitHub
```bash
git push origin <your-branch-name>
```

Example:
```bash
git push origin rahul-scripts
```

### 5. Create a Pull Request (PR)
1. Go to the repository on GitHub: [batch-scripts](https://github.com/devops25NG/batch-scripts).  
2. You will see a message: **“Compare & Pull Request”** for your branch.  
3. Click it, write a short description (e.g., *“Added Rahul’s scripts”*), and submit the PR.

### 6. Merge to Main
- The repo owner (or authorized member) reviews the PR.  
- If everything looks good, click **Merge pull request** → **Confirm merge**.

### 7. Sync Your Local Repo
After your branch is merged, update your local repository:

```bash
git switch main
git pull origin main
```

---

## ✅ Rules
- **Do not push directly to main.** Always use your own branch.  
- Commit messages should be **clear and meaningful**.  
- Keep your scripts inside a folder with your name for clarity.  
  Example: `Narendra-Geddam/your_script.sh`

---

## 📂 Example Directory Structure

```
batch-scripts/
├── Narendra-Geddam/
│   ├── AQ1.sh
│   ├── AQ2.sh
│   └── README.md
├── rahul/
│   ├── monitorscript.sh
│   └── reversestring.sh
└── README.md
```

---

## 🚀 Summary
Each batch member:  
1. Creates their own branch.  
2. Adds scripts in a personal folder.  
3. Pushes the branch.  
4. Opens a PR.  
5. Gets merged into `main`.  

This keeps the repository **organized, clean, and collaborative**.

---

## 📝 Git Commit Message Shortcuts (Conventional Commits)

To keep commit history clean and consistent, follow these commit message types:

| Prefix     | Meaning                                                                 | Example |
|------------|-------------------------------------------------------------------------|---------|
| **feat:**  | New feature added to the codebase                                       | `feat: add login script` |
| **fix:**   | A bug fix                                                              | `fix: correct file path in backup script` |
| **docs:**  | Documentation only changes (README, comments)                          | `docs: update contribution guide` |
| **style:** | Changes that don’t affect logic (formatting, spacing, linting)          | `style: format shell script with tabs` |
| **refactor:** | Code changes that neither fix a bug nor add a feature (improvement) | `refactor: simplify loop in monitor script` |
| **test:**  | Adding or updating tests                                               | `test: add test cases for string reverse` |
| **chore:** | Maintenance tasks (build, configs, dependencies, CI/CD)                 | `chore: update gitignore for temp files` |
| **perf:**  | Performance improvements                                               | `perf: optimize CPU usage in monitor script` |
| **ci:**    | Continuous integration / deployment changes                            | `ci: add GitHub Actions workflow` |

### ✅ Format
```
<type>: <short description>

[optional body]

[optional footer]
```

### Examples
```bash
git commit -m "feat: add AQ1.sh script for user input"
git commit -m "fix: correct syntax error in AQ3.sh"
git commit -m "docs: update README with workflow steps"
```

