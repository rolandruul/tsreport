@echo off
setlocal EnableDelayedExpansion

:: Change the active code page to 65001 for UTF-8 encoding
chcp 65001 > nul

:: Description of the script.
echo.
echo TIME SPENT REPORT GENERATOR by Roland Ruul (C) 2023
echo.

:: Get file name from user.
set /p filename="Enter file name w/ extension (must be located on Desktop): ":
set file=%USERPROFILE%\Desktop\%filename%

:: Check the existance of the file.
echo.
echo Trying to read file from: %file%
echo.

if exist %file% (
  echo [SUCCESS] File found! Parsing the file...
  call :parse_csv_file
) else (
  echo [ERROR] File %filename% was not found in %USERPROFILE%\Desktop
)

:: Global variables used.
set swimlanes=

:: Function which parses the CSV file.
:parse_csv_file
  for /f "tokens=1-5 delims=;" %%a in (%file%) do (
    : Group swimlanes into an array
    swimlanes[0]=Hello
    swimlanes[1]=World
    call :exist_in_array %%c
  )

:: Function to detect if item already exists in array.
:: @param %~1 = item  - Item to be searched for.
:: @param %~2 = array - Array to search.
:exist_in_array
  set item=%~1
  for %%a in (%swimlanes%) do (echo %%a)

:: Exit the script and keep the CMD window open.
echo.
cmd /k
