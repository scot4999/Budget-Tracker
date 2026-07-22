@echo off
echo ============================================
echo  Budget Tracker Deploy
echo ============================================

echo.
echo [1/3] Copying budget.html to public/index.html (Firebase)...
copy /Y budget.html public\index.html >nul

echo [2/3] Deploying to Firebase Hosting...
firebase deploy --only hosting
if errorlevel 1 (
  echo ERROR: Firebase deploy failed.
  pause
  exit /b 1
)

echo.
echo [3/3] Pushing to GitHub (GitHub Pages)...
copy /Y budget.html index.html >nul
git add index.html public\ .firebaserc firebase.json deploy.bat .gitignore
git commit -m "Update budget app"
git push origin main
if errorlevel 1 (
  echo ERROR: Git push failed. You may need to run 'git push' manually.
  pause
  exit /b 1
)

echo.
echo ============================================
echo  All done!
echo  Firebase: https://scott-and-cort-budget.web.app
echo  GitHub:   https://scot4999.github.io/Budget-Tracker/
echo ============================================
pause
