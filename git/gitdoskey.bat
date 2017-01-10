REM Windows Batch File
REM Author: 	Jordan Ulmer
REM Date:		2016-12-31
REM Purpose: 	git aliases
REM Resource: http://stackoverflow.com/questions/20530996/aliases-in-windows-command-prompt

REM Defined in gitconfig

doskey gs=git status --short

doskey gco=git checkout *$

doskey gc=git commit *$

doskey gd=git diff *$

doskey gb=git branch *$

doskey ga=git add *$

doskey gr=git reset *$

REM doskey gac=git add -A && git commit -m *$

doskey glog=git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative *$

