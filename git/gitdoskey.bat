:: Windows Batch File
:: Author: 	Jordan Ulmer
:: Date:		2016-12-31
:: Purpose: 	git aliases
:: Resource: http://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt

@ echo off

:: Defined in gitconfig

DOSKEY gs=git status --short

:: DOSKEY gco=git checkout * :: does not function with added commands

:: DOSKEY gc=git commit * :: does not function with added commands

:: DOSKEY gd=git diff *$ :: does not function with added commands

:: DOSKEY gb=git branch * :: does not function with added commands

DOSKEY ga=git add -A

DOSKEY gr=git reset

:: DOSKEY gac=git add -A && git commit -m *

DOSKEY glog=git log --graph --abbrev-commit --date=relative

