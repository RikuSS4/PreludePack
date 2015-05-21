@echo off
Setlocal EnableDelayedExpansion
title Solder Compiler

::Scan for folders
cls
echo 	Scanning...
::if exist  ( echo [OK]  ) else ( echo [FAIL]  )
if exist bin ( echo [OK] bin ) else ( echo [FAIL] bin )
if exist config ( echo [OK] config ) else ( echo [FAIL] config )
if exist mods ( echo [OK] mods ) else ( echo [FAIL] mods )
if exist resources ( echo [OK] resources ) else ( echo [FAIL] resources )

::Scan for mods and create mod directories
cd mods
echo.
echo For each mod enter an all lowercase universal mod name. This will be used for urls and folder directories.
echo.
pause
cls
for /r %%I IN (*) DO (
	echo Found mod: %%~nI
	set /P name=Name 	
	set /p version=Version 
	md !name!
	md !name!\mods
	move "%%~nI.jar" "!name!\mods\%%~nI.jar"
	cd !name!
	"C:\Program Files\WinRAR\WinRAR" M !name!-!version!.zip mods
	cd ..
)

echo.
pause