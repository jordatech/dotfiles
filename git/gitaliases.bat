:: Windows Batch File
:: Author: 	Jordan Ulmer
:: Date:		2016-12-31
:: Purpose: 	git aliases
:: Resource: http://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt

@ echo off

:: Defined in gitconfig

DOSKEY gs=git status --short

DOSKEY gco=git checkout $*

DOSKEY gc=git commit $*

DOSKEY gd=git diff $*

DOSKEY gb=git branch $*

DOSKEY ga=git add $*

DOSKEY gr=git reset $*

DOSKEY gun=git config --local user.name $*

DOSKEY gue=git config --local user.email $*

:: DOSKEY gfb='git filter-branch --tree-filter 'rm -rf ./projects/a1_uint_multiplier/folder_with_binaries/' --prune-empty HEAD --all'

:: DOSKEY gac=git add -A && git commit -m $*

DOSKEY gfp=git fetch --prune

DOSKEY glog=git log --graph --abbrev-commit --date=relative

