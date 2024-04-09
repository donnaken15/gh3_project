@echo off
pushd "%~dp0"
git clone https://gitgud.io/fretworks/guitar-hero-sdk GHSDK
call clone_nodeqbc
echo.[SDKConfig]>>GHSDK\Config\config.ini
echo.DefaultMod=qb>>GHSDK\Config\config.ini
popd