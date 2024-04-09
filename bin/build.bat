:: REQUIRES (AND USES CYGWIN/MSYS2) (Z)SH, Node
@echo off
pushd "%~dp0"
set "Q=./qcomp ../src/qb ./tmp/qb/q"
set "P=call ghsdk createpak"
:: save compiled to not rebuild them over and over
:: ALSO PAK BUILDING IS SLOW (sometimes)
mkdir tmp tmp\qb tmp\qb\q tmp\qb\d 2>nul >nul
:: /!\ ZSH OPERATES ON SCRIPTS FASTER, EVEN FASTER THAN DASH, AND SUPPORTS NEWLINES IN VARS, DASH L /!\
set SH=
call :chsh zsh
if "%SH%"=="" ( call :chsh dash )
if "%SH%"=="" ( call :chsh sh )
%SH% %Q%
set "O=..\game\DATA\PAK"
%P% -out "%O%\qb.pak.xen" tmp/qb/q -pab
:: kind of pointless to run every time but helps to reduce dbg.pak size
:: AND IT'S SLLOOOWWWWWWW (my fault probably)
%P% -out "%O%\dbg.pak.xen" tmp/qb/d

popd
exit /b

:chsh
where "%~1" /Q && set "SH=%~1"
exit /b
