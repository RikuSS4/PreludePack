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
	::Compress the jar
	"C:\Program Files\WinRAR\WinRAR" M !name!-!version!.zip mods
	cd ..
	cd ..
	cd ..
	::Copy mod files into respective folders
	copy "additions\mods\%%~nI.jar" "client\mods\%%~nI.jar"
	copy "additions\mods\%%~nI.jar" "server\mods\%%~nI.jar"
	copy "additions\mods\%%~nI.jar" "server-staffpack\mods\%%~nI.jar"
	if not exist "solder\mods\!name!" md "solder\mods\!name!"
	copy "additions\mods\!name!\!name!-!version!.zip" "solder\mods\!name!\!name!-!version!.zip"
	cd additions
	cd mods
	::Cleanup
	del "!name!\!name!-!version!.zip"
	rmdir "!name!"
	del "%%~nI.jar"
)

echo.
pause