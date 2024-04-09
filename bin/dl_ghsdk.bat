@echo off
pushd "%~dp0"
curl -L -o tmp.zip https://gitgud.io/fretworks/guitar-hero-sdk/-/archive/master/guitar-hero-sdk-master.zip && ^
unzip tmp.zip && ^
rm tmp.zip && ^
rename guitar-hero-sdk-master GHSDK
echo.[SDKConfig]>GHSDK\Config\config.ini
echo.DefaultMod=qb>>GHSDK\Config\config.ini
popd
