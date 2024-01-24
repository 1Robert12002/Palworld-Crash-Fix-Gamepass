@echo off

echo Executing Game Fix for Palworld.
echo Launching Palworld and then killing explorer.exe.

start /high shell:AppsFolder\PocketpairInc.Palworld_ad4psfrxyesvt!AppPalShipping
SetLocal EnableExtensions
SetLocal ENABLEDELAYEDEXPANSION

echo Waiting for the game to launch...
timeout /T 60 /NOBREAK

echo Killing explorer.exe...
taskkill /f /im explorer.exe

echo Capturing PID of Palworld...
for /f "tokens=2" %%a in ('tasklist /nh /fi "IMAGENAME eq Palworld-WinGDK-Shipping.exe"') do set PalworldPID=%%a

:waitForExit
echo Waiting for Palworld to exit...
timeout /T 5 /NOBREAK
tasklist /fi "PID eq %PalworldPID%" | find "%PalworldPID%" > NUL
if not errorlevel 1 goto waitForExit

echo Palworld has closed. Restarting explorer.exe...
start explorer.exe
exit
