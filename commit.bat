@echo off
:: Navigate to the project directory
cd /d "C:\Users\n1cit\OneDrive - Cape Peninsula University of Technology\Documents\2KRONOS\JavaScript-portfolio"
if %ERRORLEVEL% neq 0 (
    echo Failed to navigate to the project directory.
    exit /b %ERRORLEVEL%
)

:: Stage all changes
git add .
if %ERRORLEVEL% neq 0 (
    echo Failed to stage changes.
    exit /b %ERRORLEVEL%
)

:: Check if commit_message.txt exists
if not exist commit_message.txt (
    echo commit_message.txt not found.
    exit /b 1
)

:: Read commit message from commit_message.txt
set /p commit_message=<commit_message.txt
if "%commit_message%"=="" (
    echo Commit message is empty.
    exit /b 1
)

:: Commit the changes with the message from the text file
git commit -m "%commit_message%"
if %ERRORLEVEL% neq 0 (
    echo Failed to commit changes.
    exit /b %ERRORLEVEL%
)

:: Push the changes to the remote repository
git push origin master
if %ERRORLEVEL% neq 0 (
    echo Failed to push changes to GitHub.
    exit /b %ERRORLEVEL%
)

:: Optional: Print a success message
echo Code committed and pushed to GitHub successfully!