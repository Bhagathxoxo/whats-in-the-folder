@echo off
setlocal enabledelayedexpansion

:Start
echo.
echo ============================================
echo         Folder / File Listing Tool
echo ============================================
echo.

set "folder="
set /p "folder=Enter the path: "
if not exist "%folder%" (
    echo Path does not exist.
    echo.
    pause
    goto Start
)

echo.
echo Contents of "%folder%":
echo.

:: Display folders
for /f "delims=" %%D in ('dir "%folder%" /b /ad') do (
    echo [Folder] %%D
)

:: Display files
for /f "delims=" %%F in ('dir "%folder%" /b /a-d') do (
    echo %%F
)

echo.
:: Ask to save
set /p "save=Do you want to save this list to files_list.txt? (Y/N): "
if /i "%save%"=="Y" (
    (
        for /f "delims=" %%D in ('dir "%folder%" /b /ad') do echo [Folder] %%D
        for /f "delims=" %%F in ('dir "%folder%" /b /a-d') do echo %%F
    ) > files_list.txt
    echo List saved to files_list.txt
	echo ============================
    echo.
    goto Start
) else (
    echo List not saved.
    pause
    goto Start
)
