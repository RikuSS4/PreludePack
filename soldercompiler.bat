@echo off
Setlocal EnableDelayedExpansion
title Solder Compiler

::Scan for mods and create mod directories
cd additions
cd mods
echo.
echo For each mod enter an all lowercase universal mod name. This will be used for urls and folder directories.
echo.
pause
cls
for /r %%I IN (*.jar) DO (
	echo Found mod: %%~nI
	set /P name=Name 	
	set /p version=Version 
	md !name!
	md !name!\mods
	move "%%~nI.jar" "!name!\mods\%%~nI.jar"
	cd !name!
	"C:\Program Files\WinRAR\WinRAR" A !name!-!version!.zip mods
	cd ..
)

echo.
pause