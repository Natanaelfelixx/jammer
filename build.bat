dotnet publish -r win10-x64 -c Release /p:PublishSingleFile=true

@echo off
set "sourceFolder=bin\Release\net6.0\win10-x64\publish"
set "targetFolder=nsis-folder"

rem Copy jammer.exe
copy /y "%sourceFolder%\jammer.exe" "%targetFolder%\jammer.exe"

rem Copy jammer_1024px.ico
copy /y "%sourceFolder%\jammer_1024px.ico" "%targetFolder%\jammer_1024px.ico"

rem Copy jammer.ico (assuming you also have jammer.ico)
copy /y "%sourceFolder%\jammer.ico" "%targetFolder%\jammer.ico"

echo Files copied successfully.

makensis setup.nsi

rem if program files (x86)/jammer exists, run C:\Program Files (x86)\jammer\Uninstall.exe
if exist "C:\Program Files (x86)\jammer" (
    echo Uninstalling previous version...
    start "" "C:\Program Files (x86)\jammer\Uninstall.exe"
)

jammer-Setup.exe