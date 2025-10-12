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
git checkout -b <your-name-branch>
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

