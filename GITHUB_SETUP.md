# How to Push Your Project to GitHub

## Step-by-Step Guide

### Prerequisites
- Git installed on your computer ([Download Git](https://git-scm.com/download/win))
- GitHub account ([Sign up](https://github.com/signup) if you don't have one)

---

## Method 1: Using Command Line (Recommended)

### Step 1: Initialize Git Repository

Open PowerShell or Command Prompt in your project folder and run:

```powershell
cd "C:\Users\Guest User\Downloads\asp-project-with-calculations"
git init
```

### Step 2: Add All Files

```powershell
git add .
```

### Step 3: Create Initial Commit

```powershell
git commit -m "Initial commit: Compound Interest Calculator with Classic ASP"
```

### Step 4: Create Repository on GitHub

1. Go to [GitHub.com](https://github.com)
2. Click the **"+"** icon in the top right → **"New repository"**
3. Repository name: `compound-interest-calculator` (or any name you prefer)
4. Description: "Compound Interest Calculator built with Classic ASP, HTML, CSS, and Access Database"
5. Choose **Public** or **Private**
6. **DO NOT** check "Initialize with README" (you already have files)
7. Click **"Create repository"**

### Step 5: Connect Local Repository to GitHub

After creating the repository, GitHub will show you commands. Use these:

```powershell
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
```

Replace `YOUR_USERNAME` with your GitHub username and `YOUR_REPO_NAME` with your repository name.

### Step 6: Push to GitHub

```powershell
git branch -M main
git push -u origin main
```

You'll be prompted for your GitHub username and password (or personal access token).

---

## Method 2: Using GitHub Desktop (Easier for Beginners)

### Step 1: Download GitHub Desktop
- Download from: https://desktop.github.com/
- Install and sign in with your GitHub account

### Step 2: Add Repository
1. Open GitHub Desktop
2. Click **"File"** → **"Add Local Repository"**
3. Browse to: `C:\Users\Guest User\Downloads\asp-project-with-calculations`
4. Click **"Add repository"**

### Step 3: Commit Files
1. You'll see all your files listed
2. Write a commit message: "Initial commit: Compound Interest Calculator"
3. Click **"Commit to main"**

### Step 4: Publish to GitHub
1. Click **"Publish repository"** button at the top
2. Choose repository name and description
3. Choose Public or Private
4. Click **"Publish repository"**

---

## Method 3: Using VS Code (If you use VS Code)

### Step 1: Open in VS Code
1. Open VS Code
2. File → Open Folder → Select your project folder

### Step 2: Initialize Git
1. Open Terminal in VS Code (Ctrl + `)
2. Run: `git init`
3. Run: `git add .`
4. Run: `git commit -m "Initial commit"`

### Step 3: Push to GitHub
1. Click the Source Control icon (left sidebar)
2. Click "..." menu → "Publish to GitHub"
3. Follow the prompts to create repository and push

---

## Important Notes

### Files NOT Included in Git
The `.gitignore` file excludes:
- `compoundly.accdb` - Database file (too large and contains data)
- `node_modules/` - Node.js dependencies (if any)
- `.env` files - Environment variables

### What Gets Pushed
✅ All `.asp` files  
✅ `styles.css`  
✅ `README.md`  
✅ `DATABASE_SETUP.md`  
✅ `PROJECT_ANALYSIS.md`  
✅ `GITHUB_SETUP.md`  
✅ `.gitignore`  

### After Pushing

1. **Share the Repository:**
   - Copy the repository URL: `https://github.com/YOUR_USERNAME/YOUR_REPO_NAME`
   - Share with your group members or instructor

2. **Future Updates:**
   ```powershell
   git add .
   git commit -m "Description of changes"
   git push
   ```

3. **Clone Repository (on another computer):**
   ```powershell
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
   ```

---

## Troubleshooting

### Problem: "Authentication failed"
**Solution:** Use a Personal Access Token instead of password:
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token with `repo` permissions
3. Use token as password when pushing

### Problem: "Repository not found"
**Solution:** 
- Check repository name is correct
- Ensure repository exists on GitHub
- Verify you have access permissions

### Problem: "Large files error"
**Solution:**
- Database files (.accdb, .mdb) should be in `.gitignore`
- If already committed, remove with: `git rm --cached compoundly.accdb`

---

## Quick Reference Commands

```powershell
# Initialize repository
git init

# Add all files
git add .

# Commit changes
git commit -m "Your commit message"

# Add remote repository
git remote add origin https://github.com/USERNAME/REPO.git

# Push to GitHub
git push -u origin main

# Check status
git status

# View commit history
git log
```

