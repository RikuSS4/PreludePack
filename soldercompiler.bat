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
	copy "%%~nI.jar" "!name!\mods\%%~nI.jar"
	cd !name!
	"C:\Program Files\WinRAR\WinRAR" M !name!-!version!.zip mods
	cd ..
	cd ..
	copy "additions\%%~nI.jar" "client\mods\%%~nI.jar"
	copy "additions\%%~nI.jar" "server\mods\%%~nI.jar"
	move "additions\!name!" "solder\mods"
	cd additions
	del "%%~nI.jar"
)

echo.
pause