# PowerShell script to push the Gantt Chart codebase to the new GitHub repository

Write-Host "=== Pushing Codebase to GitHub ===" -ForegroundColor Cyan

# 1. Check if Git is installed
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "Git is not installed or not in your PATH. Please install Git and try again."
    exit 1
}

# 2. Initialize Git repository if not already initialized
if (!(Test-Path .git)) {
    Write-Host "Initializing new Git repository..." -ForegroundColor Yellow
    git init
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Green
}

# 3. Configure remote origin
Write-Host "Configuring remote origin..." -ForegroundColor Yellow
$remoteExists = git remote | Select-String -Pattern "^origin$"
if ($remoteExists) {
    git remote set-url origin https://github.com/busyapril/lake_tapps.git
} else {
    git remote add origin https://github.com/busyapril/lake_tapps.git
}

# 4. Set branch to main
Write-Host "Setting branch to main..." -ForegroundColor Yellow
git branch -M main

# 5. Stage all files
Write-Host "Staging files..." -ForegroundColor Yellow
git add .

# 6. Commit changes
Write-Host "Committing changes..." -ForegroundColor Yellow
$status = git status --porcelain
if ($status) {
    git commit -m "Initial commit of Gantt Chart application"
} else {
    Write-Host "No changes to commit." -ForegroundColor Green
}

# 7. Push to GitHub
Write-Host "Pushing to GitHub (this may prompt you to log in)..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nSuccessfully pushed to https://github.com/busyapril/lake_tapps.git!" -ForegroundColor Green
} else {
    Write-Warning "`nPush failed. Please check your internet connection, repository permissions, or credentials."
}
