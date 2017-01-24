:: Windows Batch File
:: Author:    Jordan Ulmer
:: Date:      2017-01-10
:: Purpose:   Global system aliases

@ echo off

:: General System Functions
DOSKEY cp=copy $*
DOSKEY mv=move $*
DOSKEY clear=cls
DOSKEY rm=del $*
DOSKEY gedit=edit $*
DOSKEY diff=fc $*
DOSKEY grep=find $*

:: Detailed Directory Navigation 
:: DOSKEY ls=dir /W :: This over-rides git-bash command when integrated into cmd
DOSKEY ll=dir /W
:: DOSKEY pwd=chdir :: This over-rides git-bash command when integrated into cmd


::-------------------------------------------------------------
:: The cd helpers - a quick way to get out of current directory
::-------------------------------------------------------------

DOSKEY ..=cd..
DOSKEY .2=cd../../
DOSKEY ...=cd../../
DOSKEY .3=cd../../../
DOSKEY ....=cd../../../
DOSKEY .4=cd../../../../
DOSKEY .....=cd../../../../
DOSKEY .5=cd../../../../..

:: Run process in background (equivelent to "$vsim &" in linux)
DOSKEY bk=START /B $*
