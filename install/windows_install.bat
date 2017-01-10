:: Windows Batch File
:: Author:    Jordan Ulmer
:: Date:      2017-01-10
:: Purpose:   Setup DOTFILES on Windows Side
:: Reference: https://gist.github.com/vladikoff/38307908088d58af206b

@ echo Sourcing windows_install.bat
@ echo off

:: TODO: User must create a shortcut on desktop

:: target: %windir%\system32\cmd.exe /K Z:\workspace\jdulmer\dotfiles\install\windows_install.bat
:: Start In: Z:\workspace\jdulmer
:: Shortcut Key: ctrl+alt+t 

:: Environmental Variables
SET WORKSPACE="Z:\workspace\jdulmer"
SET DOTFILES="%WORKSPACE%\dotfiles"

:: Source Aliases
CALL %DOTFILES%\git\gitdoskey.bat
CALL %DOTFILES%\subl\subldoskey.bat
CALL %DOTFILES%\system\sysdoskey.bat
