:: Windows Batch File
:: Author: 	Jordan Ulmer
:: Date:		2017-01-24
:: Purpose: 	Quartus aliases

@ echo off

:: Open Quartus

DOSKEY quartus13="C:\altera\13.0sp1\quartus\bin64\quartus.exe" $*

DOSKEY quartus16="C:\altera\16.1\quartus\bin64\quartus.exe" $*

:: Default
DOSKEY quartus="C:\altera\16.1\quartus\bin64\quartus.exe" $*
