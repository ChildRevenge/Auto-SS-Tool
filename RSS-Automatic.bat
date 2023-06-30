@echo off
cls
set version=1.2
title RSS Tools v%version% (%date%)
if not "%1"=="am_admin" (powershell start -verb runas '%0' am_admin & exit /b)

set folderPath=%appdata%\SS

if exist "%folderPath%" (
    rd /s /q "%folderPath%"
)
:var
set g=[92m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m
set bo=[01m
cls
SET webhook=
mkdir %appdata%\SS 2>nul
mkdir %appdata%\SS\Tools 2>nul
:credits
cls
chcp 65001 >nul
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                 %c%             ██████╗ ███████╗██╗   ██╗███████╗███╗   ██╗ ██████╗ ███████╗
echo                              ██╔══██╗██╔════╝██║   ██║██╔════╝████╗  ██║██╔════╝ ██╔════╝
echo                              ██████╔╝█████╗  ██║   ██║█████╗  ██╔██╗ ██║██║  ███╗█████╗  
echo                              ██╔══██╗██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║   ██║██╔══╝  
echo                              ██║  ██║███████╗ ╚████╔╝ ███████╗██║ ╚████║╚██████╔╝███████╗
echo                              ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝                                                     
echo.                                                                                                                                                                                                                                                                                                               
tasklist /fi "ImageName eq Javaw.exe" /fo csv 2>nul | find /I "Javaw" >nul
if "%ERRORLEVEL%"=="0" echo                                                   %g%Minecraft found.%white%
if "%ERRORLEVEL%"=="1" echo                                                   %r%Minecraft not found.%white%
ping localhost -n 3 >nul
cls
:AT
cls
echo Would you like to use an Automatic SS Tool? [Y/N]
set /p M=""
if %M%==N goto jnat
if %M%==Y goto AutomaticTools

goto AT

:AutomaticTools
cls
mkdir %appdata%\SS\AutomaticTools
echo     %bo%%red%%c%Automatic Tools%red%%bo%
echo %d%[%u%Ec%d%]         Download Echo
echo %d%[%u%Ocean%d%]      Download Ocean
echo %d%[%u%Golden%d%]     Download Golden
echo %d%[%u%Avenge%d%]     Download Avenge
echo %d%[%u%Paladin%d%]    Download Paladin
echo %d%[%u%SKY%d%]        Download Skyy 
echo %d%[%u%SSD%d%]        Download SSDetector
echo %b%[%y%CON%b%]        Continue With The Screenshare
echo.
set /p M="%d%What SS Tool Would You Like To Use?%u%"

If %M% == Ec goto ech
If %M% == Ocean goto Ocean
If %M% == Golden goto Golden
If %M% == Avenge goto Avenge
If %M% == Paladin goto Paladin
if %M% == SKY goto skyy
if %M% == SSD goto SSD
If %M% == CON goto Continue10


:ech
cls
echo %c%Downloading . . .%c%
start "" https://dl.echo.ac

goto AutomaticTools


:Ocean
cls
echo %c%Downloading . . .%c%
curl -o "%appdata%\SS\AutomaticTools\Ocean.exe" "https://anticheat.site/downloads/windows/"
"%appdata%\SS\AutomaticTools\Ocean.exe"
goto AutomaticTools

:Golden
cls
echo %c%Downloading . . .%c%
curl -o "%appdata%\SS\AutomaticTools\Golden.exe" "https://raw.githubusercontent.com/NotSnakeSilent/Executables/main/Golden.exe"
"%appdata%\SS\AutomaticTools\Golden.exe"
goto AutomaticTools


:Avenge
cls
echo %c%Downloading . . .%c%
curl -o "%appdata%\SS\AutomaticTools\Avenge.exe" "https://dl.avenge.ac"
"%appdata%\SS\AutomaticTools\Avenge.exe"
goto AutomaticTools




:Paladin
cls
echo %c%Downloading . . .%c%
curl -o "%appdata%\SS\AutomaticTools\Paladin.exe" "https://dl.paladin.ac"
%appdata%\SS\AutomaticTools\Paladin.exe
goto AutomaticTools



:skyy
echo %c%Downloading . . .%c%
start "" https://github.com/AgustinMC09/Skyy/blob/master/SKYY.exe
goto AutomaticTools


:SSD
echo %d%SSDetector Is Currently Under Development!%d%
set /p M="%r%Would you like to open the SSDetector Website? [Y/N]":
if %M% == Y start "" https://ssdetector.xyz else goto AutomaticTools
goto AutomaticTools

:delete1

del %appdata%\SS\AutomaticTools
rmdir %appdata%\SS\AutomaticTools
%c%<!> The "AutomaticTools" file Has been deleted!<!>%c%
pause
:Continue10
:jnat
chcp 850 >nul
for /R "%temp%" %%F in ("JNativeHook*") do (
    echo Found: "%%~nxF"
echo Generic Jar clicker Found
pause>nul
)

cls
:service
::credit to azik
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
setlocal enabledelayedexpansion

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq dps" /fi "services eq dps" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: DPS'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: DPS ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Sysmain" /fi "services eq Sysmain" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: Sysmain'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Sysmain ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq PcaSvc" /fi "services eq PcaSvc" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: PcaSvc'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: PcaSvc ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Dusmsvc" /fi "services eq Dusmsvc" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: Dusmsvc'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Dusmsvc ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Eventlog" /fi "services eq Eventlog" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: Eventlog'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Eventlog ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq Appinfo" /fi "services eq Appinfo" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: Appinfo'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: Appinfo ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)

for /f "tokens=2" %%a in ('tasklist /svc /fi "services eq DcomLaunch" /fi "services eq DcomLaunch" ^| findstr /i "svchost.exe"') do set pid=%%a

if not defined pid (
    powershell -Command "$result = 'Process Not Running: BAM'; Write-Host $result
) else (
powershell -Command "$process = Get-Process | Where-Object {$_.Id -eq %pid%}; if ($process) { $result = 'Process Name: BAM ' + ' Start Time: ' + $process.StartTime; Write-Host $result}"
)
echo The user's Currently time and date: %r%%date%\%time%
::credit to azik
pause>nul
:Psreadline
cls
if exist "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" (
    echo %r%Opening Powershell History in 3 seconds!%d%
    ping localhost -n 3 >nul
    notepad "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt"
    echo Press Any key to continue!
    pause>nul
    goto PCACLIENT
) else (
    goto PCACLIENT
)
:PCACLIENT
cls
set "url=https://cdn.discordapp.com/attachments/978643087372996648/1120364506539892788/Service-Execution.exe"
set "output=%appdata%\SS\Tools\Service-Execution.exe"
curl -o %output% %url% 
start "" %output%


:q
cls
echo %d%Would you like to use FSUTIL Commands Or JournalTrace?
echo %d%[%g%1%d%]                  %g%Fsutil Commands
echo %d%[%g%2%d%]                  %g%Journal Trace
set /p M=""
if %M% == 1 goto fsutil
if %M% == 2 goto JournalTrace
goto q

:JournalTrace
cls
set "url=https://cdn.discordapp.com/attachments/976953467291709590/1120359023267561675/JournalTrace.exe"
set "output=%appdata%\SS\Tools\JournalTrace.exe"
curl -o %output% %url%
%output%
:fsutilcommands2
echo %d%Done! Would You Like To Use Fsutil Commands? %r%[Y/N]%d%
set /p "M="
if %M%==Y goto fsutil
if %M%==N goto eventlog
goto fsutilcommands2

:Fsutil
cls
setlocal enabledelayedexpansion
set folderPath=%appdata%\SS\Fsutils
if exist "%folderPath%" (
    rd /s /q "%folderPath%"
)
mkdir %appdata%\SS\Fsutils\Macros 2>nul
mkdir %appdata%\SS\Fsutils\Extra 2>nul
mkdir %appdata%\SS\Fsutils\EXE 2>nul
mkdir %appdata%\SS\Fsutils\DLL 2>nul
mkdir %appdata%\SS\Fsutils\PFs 2>nul
mkdir %appdata%\SS\Fsutils\JAR 2>nul
mkdir %appdata%\SS\Fsutils\BAT 2>nul
mkdir %appdata%\SS\Fsutils\CrashDump 2>nul
mkdir %appdata%\SS\Fsutils\Archives 2>nul
mkdir %appdata%\SS\Fsutils 2>nul
fsutil usn readjournal c: csv >> %appdata%\SS\Fsutils\FsutilJournal.txt
set Fsutil="%appdata%\SS\Fsutils\FsutilJournal.txt"
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x80000200" >> "%appdata%\SS\Fsutils\EXE\DeletedExes.txt"
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x00080000" >> "%appdata%\SS\Fsutils\EXE\ObjectIDChange.txt"
findstr /i /c:".exe" "%Fsutil%" | findstr /i /c:"0x00001000" >> "%appdata%\SS\Fsutils\EXE\RenamedExes.txt"
findstr /i /c:".mcf" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\glorious.txt
findstr /i /c:".cuecfg" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\corsair.txt
findstr /i /c:".db" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\logitech.txt
findstr /i /c:".com" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Macros\Macroswitcher.txt
findstr /i /c:".crdownload" "%Fsutil%" >> %appdata%\SS\Fsutils\Extra\DownloadCache.txt
findstr /i /c:".evtx" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Extra\DeletedEventLog.txt
findstr /i /c:"?" "%Fsutil%" >> %appdata%\SS\Fsutils\Extra\EmptyCharacter.txt
findstr /i /c:"jnativehook" "%Fsutil%" >> %appdata%\SS\Fsutils\Extra\Jnat.txt
findstr /i /c:"0x00080000" "%Fsutil%" | findstr /i /c:"0x00000005" >> %appdata%\SS\Fsutils\Extra\DataTruncation.txt
findstr /i /c:".jar" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\JAR\RenamedJars.txt
findstr /i /c:".jar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\JAR\DeletedJars.txt
findstr /i /c:".jar" "%Fsutil%" | findstr /i /c:"0x00000020" >> %appdata%\SS\Fsutils\JAR\AllJars.txt
findstr /i /c:"Data Truncation" "%Fsutil%" | findstr /i /c:".jar" >> %appdata%\SS\Fsutils\JAR\JarDataTruncation.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\PFs\RenamedPF.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\PFs\DeletedPF.txt
findstr /i /c:".pf" "%Fsutil%" | findstr /i /c:"0x00008000" >> %appdata%\SS\Fsutils\PFs\Prefetch.txt
findstr /i /c:".bat" "%Fsutil%" | findstr /i /c:"0x00001000" >> %appdata%\SS\Fsutils\BAT\RenamedBats.txt
findstr /i /c:".bat" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\BAT\DeletedBats.txt
findstr /i /c:".dmp" "%Fsutil%" | findstr /i /c:".exe" >> %appdata%\SS\Fsutils\CrashDump\CrashDmp.txt
findstr /i /c:".exe.log" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\CrashDump\DeletedAppCrash.txt
findstr /i /c:".rar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Archives\DeletedRar.txt
findstr /i /c:".zip" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Archives\DeletedZip.txt
findstr /i /c:".7z" "%Fsutil%" | findstr /i /c:"0x80000200" >>  %appdata%\SS\Fsutils\Archives\Deleted7z.txt
findstr /i /c:".tar" "%Fsutil%" | findstr /i /c:"0x80000200" >> %appdata%\SS\Fsutils\Archives\DeletedTar.txt
findstr /i /c:".gz" "%Fsutil%" | findstr /i /c:"0x80000200" >>  %appdata%\SS\Fsutils\Archives\DeletedGz.txt
cls
echo Finished! Press Any Button To Continue
pause>nul
:eventlog
mkdir %appdata%\SS\EventLog 2>nul
cls
echo Scanning EventLog. . .
set "output=%appdata%\SS\EventLog"
wevtutil qe Application /q:"*[System/EventID=3079]" /f:text /c:1 /rd:true /e:root >> JournalDeletion.txt > %output%\JournalDeletion.txt
wevtutil qe Security /q:"*[System/EventID=1102]" /f:text /c:1 /rd:true /e:root >> EvLogCleared.txt > %output%\EvLogCleared.txt
wevtutil qe Security /q:"*[System/EventID=1100]" /f:text /c:1 /rd:true /e:root >> EvLogStopped.txt > %output%\EvLogStopped.txt
wevtutil qe Security /q:"*[System/EventID=1104]" /f:text /c:1 /rd:true /e:root >> EvLogMax.txt > %output%\EvLogMax.txt
wevtutil qe Security /q:"*[System/EventID=4616]" /f:text /c:1 /rd:true /e:root >> TimeChanger.txt > %output%\TimeChanger.txt
wevtutil qe Security /q:"*[System/EventID=4672]" /f:text /c:1 /rd:true /e:root >> AdminNewUser.txt > %output%\AdminNewUser.txt
wevtutil qe Security /q:"*[System/EventID=4624]" /f:text /c:1 /rd:true /e:root >> UserLogin.txt > %output%\UserLogin.txt
wevtutil qe Security /q:"*[System/EventID=4647]" /f:text /c:1 /rd:true /e:root >> UserLogout.txt > %output%\UserLogout.txt
wevtutil qe Security /q:"*[System/EventID=4688]" /f:text /c:1 /rd:true /e:root >> NewProcessCreated.txt > %output%\NewProcessCreated.txt
wevtutil qe Security /q:"*[System/EventID=4689]" /f:text /c:1 /rd:true /e:root >> ProcessTerminated.txt > %output%\ProcessTerminated.txt
wevtutil qe Security /q:"*[System/EventID=4697]" /f:text /c:1 /rd:true /e:root >> ServiceInstalled.txt > %output%\ServiceInstalled.txt
wevtutil qe Security /q:"*[System/EventID=6416]" /f:text /c:1 /rd:true /e:root >> ExternalDevice.txt > %output%\ExternalDevice.txt
wevtutil qe Security /q:"*[System/EventID=6420]" /f:text /c:1 /rd:true /e:root >> DriverDisabled.txt > %output%\DriverDisabled.txt
wevtutil qe Security /q:"*[System/EventID=4799]" /f:text /c:1 /rd:true /e:root >> ShadowCopiesDeleted.txt > %output%\ShadowCopiesDeleted.txt
wevtutil qe Security /q:"*[System/EventID=4798]" /f:text /c:1 /rd:true /e:root >> RegPermsChanged.txt > %output%\RegPermsChanged.txt
start "" %output%
echo %d%Press Any button to continue!
pause>nul
:RecordingSoftwares
cls
:check_process
setlocal enabledelayedexpansion
set "processes=mirillis wmcap playclaw XSplit Screencast camtasia dxtory nvcontainer obs64 bdcam RadeonSettings Fraps CamRecorder XSplit.Core ShareX Action lightstream streamlabs webrtcvad openbroadcastsoftware movavi.screen.recorder icecreamscreenrecorder smartpixel d3dgear gadwinprintscreen apowersoftfreescreenrecorder bandicamlauncher hypercam loiloilgamerecorder nchexpressions captura vokoscreenNG simple.screen.recorder recordmydesktop kazam gtk-recordmydesktop screenstudio screenkey jupyter-notebook"
for %%p in (%processes%) do (
    tasklist /fi "ImageName eq %%p.exe" /fo csv 2>nul | find /I "%%p" >nul
    if !errorlevel! equ 0 (
        echo %d%%%%p Is Recording. Would you like me to close it? [Y/N]
        set /p "M="
        if "!M!" == "Y" (
            taskkill /f /im %%p.exe /t >nul
        ) else (
            goto vpn
        )
    )
)

endlocal
:vpn
:checkvpns
setlocal enabledelayedexpansion
set "processes=pia-client ProtonVPNService IpVanish WindScribe ExpressVPN NordVPN CyberGhost pia-tray SurfShark VyprVPN HSSCP TunnelBear ProtonVPN"
for %%p in (%processes%) do (
    tasklist /fi "ImageName eq %%p.exe" /fo csv 2>nul | find /I "%%p" >nul
    if !errorlevel! equ 0 (
        echo A VPN is running on the user's computer! The VPN is %d%%%%p.
        echo %d%[%g%1%d%]                  %g%Continue the Screenshare
        echo %d%[%g%2%d%]                  %g%End the Screenshare
        set /p M=""
        if "%M%" == "1" (
            taskkill /f /im %%p.exe /t >nul
        ) 
        if "%M%" == "2" goto end
    )
)

::Accounts
:vanilaaccounts
del %appdata%\SS\Alts.txt 2>nul
cls
echo %c%========== Accounts: ==========%d% > Alts.txt >> %appdata%\SS\Alts.txt
set search_string="name"
set file_path=%appdata%\.minecraft\usercache.json
if exist %file_path% (
    findstr /C:%Search_string% %file_path% > Alts.txt >> %appdata%\SS\Alts.txt
    goto lunar
) else (
    goto lunar
)
:lunar
set search_string="username" 
set file_path=C:\Users\%username%\.lunarclient\settings\game\accounts.json
if exist %file_path% (
findstr /C:%Search_string% %file_path% > Alts.txt >> %appdata%\SS\Alts.txt
goto cosmic
) else (
    goto cosmic
)

:cosmic
set search_string="displayName"
set file_path=%appdata%\.minecraft\cosmic\accounts.json
if exist %file_path% (
findstr /C:%Search_string% %file_path% > Alts.txt >> %appdata%\SS\Alts.txt
goto tll
) else (
    goto tll
)

:tll
set search_string="username" 
set file_path=%appdata%\.tlauncher\legacy\Minecraft\game\tlauncher_profiles.json
if exist %file_path% (
findstr /C:%Search_string% %file_path% > Alts.txt >> %appdata%\SS\Alts.txt
goto tl
) else (
    goto tl
)


:tl
set search_string="displayName"
set file_path2=%appdata%\.minecraft\TlauncherProfiles.json
if exist %file_path2% (
findstr /C:%Search_string% %file_path% > Alts.txt >> %appdata%\SS\Alts.txt
goto orbit
) else (
    goto orbit
)

:orbit
set "folderPath=%appdata%\Orbit-Launcher\launcher-minecraft\cachedImages\faces"
if exist %folderPath% (
    goto orbit2
    ) else (
        goto open
    )
:orbit2
cd "" %appdata%\Orbit-Launcher\launcher-minecraft\cachedImages\faces 2>nul
 echo %c% Orbit Accounts:%c%

for %%F in ("%folderPath%\*") do (
    echo %%~nxF > Alts.txt >> %appdata%\SS\Alts.txt
)

    
:open
notepad %appdata%\SS\Alts.txt
echo %d%Press any button to Continue!
pause>nul


:modfolder
cls
set "folderPath=%appdata%\.minecraft\mods"
cd "%appdata%\.minecraft\mods" 2>nul
if %errorlevel% equ 0 (
    goto modfolder2
    )
    if %errorlevel% neq 0 (
        goto orbitmodfolder
    )

:modfolder2
 echo %c%Mods Folder!%c%
 echo. %r%
for %%F in ("%folderPath%\*") do (
    echo %%~nxF
)
:orbitmodfolder
set "folderpath=%appdata%\Orbit-Launcher\launcher-minecraft\mods"
cd %folderpath%
if %errorlevel% equ 0 (
    goto orbitmodfolder2
)
if %errorlevel% neq 0 (
    echo Press Any Key To Go To The Menu!
    pause>nul
    goto luyten2
)


:orbitmodfolder2
echo.
echo.
echo.
echo.
 echo %d%Orbit Mods Folder!%d%
 echo. %r%
for %%F in ("%folderPath%\*") do (
    echo %%~nxF
)
echo.
echo.
:luyten2
set /p M="%c%Would You Like To Install Luyten And Open Mods Folder?%c%%d%[Y/N]%d%"
if %M% == Y goto luyten3
If %M% == N goto ACQ
goto luyten2

:luyten3
cls
echo %d% Downloading Luyten!
mkdir %appdata%\SS\ManualTools 2>nul
start "" %appdata%\Orbit-Launcher\launcher-minecraft\mods
start "" %appdata%\.minecraft\mods
powershell (new-object System.Net.WebClient).DownloadFile('https://github.com/deathmarine/Luyten/releases/download/v0.5.4_Rebuilt_with_Latest_depenencies/luyten-0.5.4.exe','%appdata%\SS\ManualTools\Luyten.exe')
"%appdata%\SS\ManualTools\Luyten.exe"
pause>nul

:ACQ
cls
echo Would You like to do ActiviesCache? [Y/N]
set /p "M="
if %M% == Y goto activiescache
if %M% == N goto cd
goto ACQ


:activiescache
cls
setlocal enabledelayedexpansion

set "targetFile=ActivitiesCache.db"
set "targetFolder=C:\Users\%USERNAME%\AppData\Local\ConnectedDevicesPlatform"

REM Count the number of target files found
set "count=0"
for /r "%targetFolder%" %%F in ("%targetFile%") do (
    set /a "count+=1"
    set "filePath=%%~dpF"
    set "fileName=%%~nxF"
    set "fileFullPath=%%~fF"

    echo [%r%!count!%d%] File: !fileName!
    echo    Directory: !filePath!
echo.
)

if %count% EQU 0 (
    echo No "%targetFile%" file found.
    goto :EOF
)

if %count% EQU 1 (
    echo "%targetFile%" file found at: %filePath%
    goto :EOF
)

echo Multiple "%targetFile%" files found.
set /p "choice=%r%Enter the number of the file to select: "%d%

set /a "choice=choice-1"
set "count=0"
for /r "%targetFolder%" %%F in ("%targetFile%") do (
    if !count! EQU %choice% (
        set "filePath=%%~dpF"
        goto :BreakLoop
    )
    set /a "count+=1"
)
:BreakLoop
:eof

mkdir %appdata%\SS\Automatic 
cls
set "url=https://f001.backblazeb2.com/file/EricZimmermanTools/net6/WxTCmd.zip"
set "output=%appdata%\SS\Automatic\WxTCmd.zip"
set "zipFile=%appdata%\SS\Automatic\WxTCmd.zip"
set "extractDir=%appdata%\SS\Automatic"

curl -o "%output%" "%url%"
ping localhost -n 3 >nul
powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%extractDir%' -Force"
cls
setlocal enabledelayedexpansion
mkdir %appdata%\SS\Automatic\WxTCmd 2>nul
cd %appdata%\SS\Automatic
WxTCmd.exe -f "%filePath%\%targetFile%" --csv "%appdata%\SS\Automatic\WxTCmd"
cd %appdata%\SS\Automatic\WxTCmd
del *_*_Activity_PackageIDs.csv
del *_*_Activity.csv
cd %appdata%\SS\Automatic
del SQLite.interop.dll
set "folderPath=%appdata%\SS\Automatic\WxTCmd"

set "activityop="
set "count=0"
for %%F in ("%folderPath%\*") do (
    set /a count+=1
    set "activityop=%%F"
)


cls
mkdir %appdata%\SS\Automatic\Timelineexplorer 2>nul
set "url=https://f001.backblazeb2.com/file/EricZimmermanTools/net6/TimelineExplorer.zip"
set "output=%appdata%\SS\Automatic\TimelineExplorer.zip"
set "zipFile=%appdata%\SS\Automatic\TimelineExplorer.zip"
set "extractDir=%appdata%\SS\Automatic\"
curl -o "%output%" "%url%"
ping localhost -n 3 >nul
powershell -Command "Expand-Archive -Path '%zipFile%' -DestinationPath '%extractDir%' -Force"
cls

set "timelineExePath=%appdata%\SS\Automatic\TimelineExplorer\TimelineExplorer.exe"
start "" "%timelineExePath%" "%activityop%"
echo Press any key to continue!
pause>nul
endlocal
:CD
cls
if exist  "C:\Users\%username%\AppData\Local\CrashDumps" (
    start "C:\Users\%username%\AppData\Local\CrashDumps"
    goto macros
) else (
    goto macros
)
echo Look for any suspicious files!

:macros
:startMacros
cls
echo %r%Scan Started!
echo.
echo.
cls
set "localAppData=%LOCALAPPDATA%"
set "appData=%APPDATA%"
set "programFilesX86=%PROGRAMFILES(X86)%"
set "programFiles=%PROGRAMFILES%"
set "Logitech=%localAppData%\LGHUB\settings.db"
set "Glorious=C:\Users\%username%\AppData\Local\BY-COMBO2\mac"
set "Glorious1=C:\ProgramData\Glorious Core\userdata\guru\data\MacroDB.db" //
set "Glorious2=C:\ProgramData\Glorious Core\userdata\guru\data\DevicesDB.db" // 
set "corsair=%appData%\corsair\CUE\config.cuecfg"
set "bloody=%programFilesX86%\Bloody7\Bloody7\UserLog\Mouse\TLcir_9EFF3FF4\language\Settings\EnvironmentVar.ini"
set "steel=%appData%\steelseries-engine-3-client\Session Storage\000003.log"
set "Alienware=%ALLUSERSPROFILE%\Alienware\AlienWare Command Center\fxmetadata\.json"
set "Motospeed=%programFiles%\Gaming MouseV30\record.ini"
set "Marsgaming=%programFilesX86%\Gaming Mouse\Config.ini"
set "Marsgaming2=%localAppData%\BY-8801-GM917-v108\curid.dtc"
set "Ayax=%programFiles%\AYAX GamingMouse\config.bin"
set "T2=%localAppData%\BY-COMBO\pro.dtc"
set "Xenon200=%programFilesX86%\Xenon200\Configs"
set "Reddragon=%appData%\REDRAGON\GamingMouse\config.ini"
set "Reddragon2=%appData%\REDRAGON\GamingMouse\macro.ini"
set "Reddragon3=%appData%\REDRAGON\GamingMouse\Macro"
set "Blackweb=C:\Blackweb Gaming AP\config"
set "Razer1=%PROGRAMDATA%\Razer\Razer Central\Accounts"
set "Razer2=%LOCALAPPDATA%\Razer\Synapse3\Settings" 
set "Razer3=C:\ProgramData\Razer\Synapse3\Log"
set "Razer4=%localAppData%\Razer\Synapse\log\macros\MacrosRazer3.txt" 
set "RazerT=C:\ProgramData\Razer\Synapse3\Log\SynapseService.log" 
set "Roccat=C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\macro\macro_list.dat" 
set "Roccat2=C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\macro\custom_macro_list.dat" 
set "Roccat3=C:\Users\%username%\AppData\Roaming\ROCCAT\SWARM\macro\macro_list.dat" 
set "General1=C:\users\%username%\appdata\BYCOMBO2\mac\*mcf" 
set "KromKolt=C:\Users\%username%\AppData\Local\VirtualStore\Program Files (x86)\KROM KOLT\Config\sequence.dat" 
set "Asus=C:\users\%username%\documents\ASUS\ROG\ROG Armoury\common\macro\*.GMAC" 
set "Fantech=C:\Program Files (x86)\FANTECH VX7 Gaming Mouse\config.ini" 
set "T16=%LOCALAPPDATA%\BY-COMBO\curid.dct" 
set "T161=%LOCALAPPDATA%\BY-COMBO\pro.dct" 
set "LIX=C:\Program Files (x86)\SPC Gear" 
set "Marvo=%localAppData%\BY-8801-GM917-v108\curid.dct" 
set "Marvo2=%localAppData%\BY-8801-GM917-v108\pro.dct" 
set "ReDragon=C:\Users%username%\AppData\Roaming\REDRAGON\GamingMouse\config.ini" 
set "ReDragon2=C:\Users%username%\AppData\Roaming\REDRAGON\GamingMouse\macro.ini"
set "ReDragon3=C:\Users%username%\AppData\Roaming\REDRAGON\GamingMouse" 
set "ReDragonM7=C:\Users%USERNAME%\Documents\M711\*.MacroDB"

echo %d%Would you like to Run Fsutil Commands? [Y/N]
set /p M=""
if %M% == Y goto Fsutil
if %M% == N goto start

:Fsutil
mkdir %appdata%\SS\Fsutils\Mouse
cls
fsutil usn readjournal c: csv | findstr /i /c:.mck | findstr /i /c:0x80000200 >> T16Macro.txt > %appdata%\SS\Fsutils\Mouse\T16Macro.txt
fsutil usn readjournal c: csv | findstr /i /c:.amc2 | findstr /i /c:0x80000200 >> BloodyMacros.txt > %appdata%\SS\Fsutils\Mouse\BloodyMacros.txt
fsutil usn readjournal c: csv | findstr /i /c:.mcf | findstr /i /c:0x80000200 >> Glorious.txt > %appdata%\SS\Fsutils\Mouse\Glorious.txt
fsutil usn readjournal c: csv | findstr /i /c:.cuecfg | findstr /i /c:0x80000200 >> Corsair.txt > %appdata%\SS\Fsutils\Mouse\Corsair.txt
start "" %appdata%\SS\Fsutils\Mouse
echo Press Any key to continue!
pause>nul


:start
cls
if exist "%Roccat%" (
    for %%A in ("%Roccat%") do (
        echo %d%Roccat mouse detected, Modified at: %%~tA
    ) 
)


if exist "%Roccat2%" (
    for %%A in ("%Roccat2%") do (
        echo %d%Roccat detected, Modified at: %%~tA
    ) 
)



if exist "%Roccat3%" (
    for %%A in ("%Roccat3%") do (
        echo %d%Roccat mouse detected, Modified at: %%~tA
    ) 
)

if exist "%General1%" (
    for %%A in ("%General1%") do (
        echo %d%Glorious, Ajazz, AVF, yanpol or uRage Macro detected, Modified at: %%~tA
    ) 
)


if exist "%KromKolt%" (
    for %%A in ("%KromKolt%") do (
        echo %d%KromKolt Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%Asus%" (
    for %%A in ("%Asus%") do (
        echo %d%Asus Macro detected, Modified at: %%~tA
    ) 
)

if exist "%Fantech%" (
    for %%A in ("%Fantech%") do (
        echo %d%Fantech Mouse detected, Modified at: %%~tA
    ) 
)

if exist "%T161%" (
    for %%A in ("%T161%") do (
        echo %d%T16 Mouse detected, Modified at: %%~tA
    ) 
)




if exist "%T16%" (
    for %%A in ("%T16%") do (
        echo %d%T16 Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%LIX%" (
    for %%A in ("%LIX%") do (
        echo %d%Lix Mouse detected, Modified at: %%~tA
    ) 
)



if exist "%Marvo%" (
    for %%A in ("%Marvo%") do (
        echo %d%Marvo Mouse detected, Modified at: %%~tA
    ) 
)



if exist "%Marvo2%" (
    for %%A in ("%Marvo2%") do (
        echo %d%Marvo Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%ReDragon%" (
    for %%A in ("%ReDragon%") do (
        echo %d%ReDragon Mouse detected, Modified at: %%~tA
    ) 
)




if exist "%ReDragon2%" (
    for %%A in ("%ReDragon2%") do (
        echo %d%ReDragon Mouse detected, Modified at: %%~tA
    ) 
)


if exist "%ReDragon3%" (
    for %%A in ("%ReDragon3%") do (
        echo %d%ReDragon Mouse detected, Modified at: %%~tA
    ) 
)

if exist "%ReDragonM7%" (
    for %%A in ("%ReDragonM7%") do (
        echo %d%ReDragon M711 Mouse detected, Modified at: %%~tA
    ) 
)



findstr /C:"turbo: true" "%RazerT%" 2>nul
if %errorlevel% equ 0 (
    echo Razer Turbo mode Is Activated
)

findstr /C:"MacroClient:Delete" "%Razer4%" 2>nul
if %errorlevel% equ 0 (
    echo Detected a Deleted Razer Macro
)

if exist "%Razer1%" (
    for %%A in ("%Razer1%") do (
        echo %d%Razer mouse detected, Modified at: %%~tA
    ) 
)

if exist "%Razer2%" (
    for %%A in ("%Razer2%") do (
        echo %d%Razer mouse detected, Modified at: %%~tA
    ) 
)

if exist "%Razer3%" (
    for %%A in ("%Razer3%") do (
        echo %d%Razer mouse detected, Modified at: %%~tA
    ) 
)

if exist "%Logitech%" (
    for %%A in ("%Logitech%") do (
        echo %d%Logitech mouse detected, Modified at: %%~tA
    )
    
)

if exist "%Glorious%" (
    for %%A in ("%Glorious%") do (
        echo Glorious mouse detected, Modified at: %%~tA
         )
    )

if exist "%corsair%" (
    for %%A in ("%Glorious%") do (
    echo Corsair mouse detected, Modified at: %%~tA
     )
)
if exist "%bloody%" (
    for %%A in ("%bloody%") do (
        echo Bloody mouse detected, Modified at: %%~tA
    )
)

if exist "%steel%" (
    for %%A in ("%bloody%") do (
        echo SteelSeries mouse detected, Modified at: %%~tA
    )
)

if exist "%Alienware%" (
    for %%A in ("%Alienware%") do (
        echo Alienware mouse detected, Modified at: %%~tA
    )
)
if exist "%Motospeed%" (
    for %%A in ("%Motospeed%") do (
        echo Motospeed mouse detected, Modified at: %%~tA
    )
)

if exist "%Marsgaming%" (
    for %%A in ("%Marsgaming%") do (
        echo Marsgaming mouse detected, Modified at: %%~tA
    )
)

if exist "%Marsgaming2%" (
    for %%A in ("%Marsgaming2%") do (
        echo Marsgaming mouse detected, Modified at: %%~tA
    )
)

if exist "%Ayax%" (
 for %%A in ("%Ayax%") do (
        echo Ayax mouse detected, Modified at: %%~tA
    )
)

if exist "%T2%" (
 for %%A in ("%T2%") do (
        echo T2 mouse detected, Modified at: %%~tA
    )
)

if exist "%Xenon200%" (
    for %%A in ("%Xenon200%") do (
        echo Xenon200 mouse detected, Modified at: %%~tA
    )
)
if exist "%Reddragon%" (
    for %%A in ("%Reddragon%") do (
        echo RedDragon mouse detected, Modified at: %%~tA
    )
)

if exist "%Reddragon2%" (
    for %%A in ("%Reddragon2%") do (
        echo RedDragon mouse detected, Modified at: %%~tA
    )
)
if exist "%Reddragon3%" (
    for %%A in ("%Reddragon3%") do (
        echo RedDragon mouse detected, Modified at: %%~tA
    )
)

if exist "%Blackweb%" (
     for %%A in ("%Blackweb%") do (
        echo Blackweb mouse detected, Modified at: %%~tA
    )
)
echo Scan Finished
echo The User's Current time:%r% %date%\%TIME%
set folderPath=%appdata%\SS\Fsutils\Mouse

if exist "%folderPath%" (
    rd /s /q "%folderPath%"
)
echo %c%Press any Button to Continue!
pause>nul

echo %d%.
:tools
mkdir %appdata%\SS\Tools    
cls
set "output=%appdata%\SS\Tools\bam-tool.exe"
set "url=https://cdn.discordapp.com/attachments/1014632218183860334/1015378472329302016/bam-tool.exe"
curl -o "%Output%" "%url%"
start %output%
echo Press any key to continue!
pause>nul
cls
set "output=%appdata%\SS\Tools\journal-tool.exe"
set "url=https://cdn.discordapp.com/attachments/1014632218183860334/1014637785694621706/journal-tool.exe"
curl -o "%output%" "%url%"
start %output%
echo Press any key to continue!
pause>nul
cls
set "output=%appdata%\SS\Tools\sgrm-tool.exe"
set "url=https://cdn.discordapp.com/attachments/1014632218183860334/1014637785061277766/sgrm-tool.exe"
curl -o "%output%" "%url%"
start %output%
echo Press any key to continue!
pause>nul
cls
set "output=%appdata%\SS\Tools\usb-tool.exe"
set "url=https://cdn.discordapp.com/attachments/1014632218183860334/1015006494082748467/usb-tool.exe"
curl -o "%output%" "%url%"
start %output%
echo Press any key to continue!
pause>nul
cls
:DREFiles
cls
set "url=https://cdn.discordapp.com/attachments/978643087372996648/1121788785005449256/DRE-Files.exe"
set "output=%appdata%\SS\Tools\DRE-Files.exe"
curl -o "%output%" "%url%"
start %output%
:injecteddll
cls
set "url=https://cdn.discordapp.com/attachments/978643087372996648/1121791599848992848/InjectedDLL.exe"
set "output=%appdata%\SS\Tools\InjectedDLL.exe"
curl -o "%output%" "%url%"
start %output%
:recentfileview
cls
set "url=https://cdn.discordapp.com/attachments/978643087372996648/1121792441293484062/RecentFilesView.exe"
set "output=%appdata%\SS\Tools\RecentFilesView.exe"
curl -o "%output%" "%url%"
start %output%
pause>nul

:Reg 
cls
echo Would you like to use Registry Explorer and RegScanner, RegEdit Keys or Not use Registry Editor?
echo.
echo %d%[%u%EXP%d%]             Registry Explorer And RegScanner
echo %d%[%u%KEY%d%]             Registry Editor Keys
echo %d%[%u%CON%d%]             Continue The SS Tool
echo.
set /p M="%d%Choose An Option:%u%"

if %M% == EXP goto Explorer
if %M% == KEY goto RegEdit
if %M% == CON goto ContinueReg
goto Reg
:RegEdit
cls
echo Would you like to go to the Regedit Menu Or just run them Automatically?
echo.
echo %d%[%u%Menu%d%]         Regedit Menu
echo %d%[%u%Auto%d%]         Run them Automatically
echo.
set /p M="%d%Choose An Option:%u%"

If %M% == Menu goto RegeditMenu 
If %M% == Auto goto RegeditMenuAuto
goto RegEdit




:RegeditMenu
cls
echo Would You like to use Every Regedit Path or Just the useful ones 
echo.
echo %d%[%u%All%d%]         Every Regedit Path
echo %d%[%u%Use%d%]         Only useful Regedit Paths
echo.
set /p M="%d%Choose An Option:%u%"

If %M% == All goto Allregedit
If %M% == Use goto Useregedit
goto RegeditMenu




:RegeditMenuAuto
cls
echo Would You like to use Every Regedit Path or Just the useful ones?
echo.
echo %d%[%u%All%d%]         Every Regedit Path
echo %d%[%u%Use%d%]         Only useful Regedit Paths
echo.
set /p M="%d%Choose An Option:"

If %M% == All goto AllregeditAuto   
If %M% == Use goto UseregeditAuto
goto RegeditMenuAuto


:Allregedit
cls
echo Which Regedit Path would you like to go to?
echo.
echo %d%[%u%BAM%d%]         ExecutableFilesRan
echo %d%[%u%DSR%d%]         DisallowRun
echo %d%[%u%MUI%d%]         MUICache
echo %d%[%u%UAS%d%]         UserAssist
echo %d%[%u%Arc%d%]         ArcHistory
echo %d%[%u%APS%d%]         AppSwitched
echo %d%[%u%FTA%d%]         FileTypeAssociations
echo %d%[%u%OSD%d%]         OpenSaveDialogBox
echo %d%[%u%PFP%d%]         PrefetchParameters
echo %d%[%u%MLV%d%]         MountedVolumes
echo %d%[%u%EXP%d%]         ExecutedPrograms
echo %d%[%u%OWL%d%]         OpenWhitelist
echo %d%[%u%RDS%d%]         RecentDocs
echo %d%[%u%SJV%d%]         ShowJumpView
echo %d%[%u%LVP%d%]         LastVisitedPidlMRU
echo %d%[%u%ENV%d%]         Environment
echo %d%[%u%FWR%d%]         FirewallRules
echo %d%[%u%UNI%d%]         Uninstall
echo %d%[%u%PRS%d%]         PropertyStore
echo %d%[%u%DRI%d%]         DirectInput
echo %d%[%u%SFD%d%]         SetFileDate
echo %d%[%u%CID%d%]         CIDsizeMRU1
echo %d%[%u%TYP%d%]         TypedPaths
echo %d%[%u%SMI%d%]         StartMenuInternet
echo %d%[%u%CPR%d%]         CommandProcessor
echo %d%[%u%VIC%d%]         VolumeInfoCache
echo %d%[%u%HKI%d%]         HKIDS1
echo %d%[%u%USB%d%]         USBStorage
echo %d%[%u%RUN%d%]         RunMru
echo %d%[%u%TRC%d%]         Tracing
echo %y%[%b%END%y%]         Go to the end of the Program
set /p M="%d%Choose A Path:"

if %M% == BAM goto BAMReg
if %M% == DSR goto DSR
if %M% == MUI goto MUI
if %M% == UAS goto UAS
if %M% == Arc goto Arc
if %M% == APS goto APS
if %M% == FTA goto FTA
if %M% == OSD goto OSD
if %M% == PFP goto PFP
if %M% == MLV goto MLV
if %M% == EXP goto EXP
if %M% == OWL goto OWL
if %M% == RDS goto RDS
if %M% == SJV goto SJV
if %M% == LVP goto LVP
if %M% == ENV goto ENV
if %M% == FWR goto FWR
if %M% == UNI goto UNI
if %M% == PRS goto PRS
if %M% == DRI goto DRI
if %M% == SFD goto SFD
if %M% == CID goto CID
if %M% == TYP goto TYP
if %M% == SMI goto SMI
if %M% == CPR goto CPR
if %M% == VIC goto VIC
if %M% == HKI goto HKI
if %M% == USB goto USBStorage
if %M% == RUN goto RUNMRU
if %M% == TRC goto TRC
if %M% == END goto end
goto Allregedit



:BAMReg
echo %d%.
cls
taskkill /f /im regedit.exe 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /f
start regedit
goto Allregedit

:DSR
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f
start regedit
goto Allregedit

:MUI
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
start regedit
goto Allregedit

:UAS
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
start regedit
goto Allregedit

:Arc
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory" /f
start regedit
goto Allregedit

:APS
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /f
start regedit
goto Allregedit

:FTA
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts" /f
start regedit
goto Allregedit

:OSD
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
start regedit
goto Allregedit

:PFP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /f
start regedit
goto Allregedit

:MLV
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices" /f
start regedit
goto Allregedit

:EXP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
start regedit
goto Allregedit

:OWL
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.dll\OpenWithList" /f
start regedit
goto Allregedit

:RDS
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
start regedit
goto Allregedit

:SJV
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /f
start regedit
goto Allregedit

:LVP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
start regedit
goto Allregedit

:ENV
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f
start regedit
goto Allregedit

:FWR
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f
start regedit
goto Allregedit

:UNI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" /f
start regedit
goto Allregedit

:PRS
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore" /f

start regedit
goto Allregedit

:DRI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectInput" /f
start regedit
goto Allregedit

:SFD
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\nononsense\SetFileDate" /f
start regedit
goto Allregedit

:CID
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU" /f
start regedit
goto Allregedit

:TYP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
start regedit
goto Allregedit

:SMI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" /f
start regedit
goto Allregedit

:CPR
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /f
start regedit
goto Allregedit

:VIC
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\VolumeInfoCache" /f
start regedit
goto Allregedit

:HKI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\AMD\HKIDs" /f
start regedit
goto Allregedit

:USBStorage
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR" /f
start regedit
goto Allregedit

:RUNMRU
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\" /f
start regedit
goto Allregedit

:TRC
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Tracing" /f
start regedit
goto Allregedit

:Useregedit
cls
echo Which Regedit Path would you like to go to?
echo.
echo %d%[%u%BAM%d%]         ExecutableFilesRan
echo %d%[%u%MUI%d%]         MUICache
echo %d%[%u%OSD%d%]         OpenSaveDialogBox
echo %d%[%u%EXP%d%]         ExecutedPrograms (Store)
echo %d%[%u%LVP%d%]         LastVisitedPidlMRU
set /p "Choose A Path:"

if %M% == BAM goto BAMReg1
if %M% == MUI goto MUI1
if %M% == OSD goto OSD1
if %M% == EXP goto EXP1
if %M% == LVP goto LVP1
goto Useregedit

:BAMReg1
echo %d%.
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /f
start regedit
goto Useregedit

:MUI1
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
start regedit
goto Useregedit

:OSD1
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
start regedit
goto Useregedit

:EXP1
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
start regedit
goto Useregedit

:LVP1
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
start regedit
goto Useregedit


::Automatic Regedit

:AllregeditAuto 
:BAMReg
echo %d%.
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:DSR
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:MUI
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:UAS
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:Arc
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\WinRAR\ArcHistory" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:APS
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:FTA
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:OSD
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:PFP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:MLV
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:EXP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:OWL
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.dll\OpenWithList" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:RDS
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:SJV
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\ShowJumpView" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:LVP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:ENV
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:FWR
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\FirewallRules" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:UNI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:PRS
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\LowRegistry\Audio\PolicyConfig\PropertyStore" /f

start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:DRI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectInput" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:SFD
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\nononsense\SetFileDate" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:CID
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:TYP
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:SMI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Clients\StartMenuInternet" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:CPR
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:VIC
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Search\VolumeInfoCache" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:HKI
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\AMD\HKIDs" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:USBStorage
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum\USBSTOR" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:RUNMRU
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:TRC
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Tracing" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

::Useful Automatic

:UseregeditAuto
:BAMReg1
echo %d%.
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\State\UserSettings" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:MUI1
cls
taskkill /f /im regedit.exe /t
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:OSD1
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:EXP1
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul

:LVP1
cls
taskkill /f /im regedit.exe /t 
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit /v LastKey /t REG_SZ /d "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
start regedit
echo %c%Press Any Key To Continue!%d%
pause>nul
goto end
:Explorer
echo .%d%
cls
set "output=%appdata%\SS\Tools\RegistryExplorer.zip"
set "url=https://cdn.discordapp.com/attachments/1068919624604864523/1122176002722906142/RegistryExplorer.zip"
set "extractDir=%appdata%\SS\Tools"
curl -o "%output%" "%url%"
ping localhost -n 3 >nul
powershell -Command "Expand-Archive -Path '%output%' -DestinationPath '%extractDir%' -Force"
ping localhost -n 1 >nul
start %appdata%\SS\Tools\RegistryExplorer\RegistryExplorer.exe
echo Press Any key to continue!
pause>nul
goto RegScanner


:RegScanner
cls
echo Would you like to use Registry Scanner? [Y/N]
set /p M=""
if %M% == Y goto Regscanner1
if %M% == N goto end
:Regscanner1
cls
set "url=https://cdn.discordapp.com/attachments/1068919624604864523/1122178368780116069/RegScanner.exe"
set "output=%appdata%\SS\Tools\RegScanner.exe"
curl -o %output% %url%
start %output%
echo Press any key to continue!
pause>nul
goto end
:ContinueReg
:end
cls
echo.
echo.
echo.
echo.
echo.
echo.
echo.
chcp 65001 >nul
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo                 %c%             ██████╗ ███████╗██╗   ██╗███████╗███╗   ██╗ ██████╗ ███████╗
echo                              ██╔══██╗██╔════╝██║   ██║██╔════╝████╗  ██║██╔════╝ ██╔════╝
echo                              ██████╔╝█████╗  ██║   ██║█████╗  ██╔██╗ ██║██║  ███╗█████╗  
echo                              ██╔══██╗██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║   ██║██╔══╝  
echo                              ██║  ██║███████╗ ╚████╔╝ ███████╗██║ ╚████║╚██████╔╝███████╗
echo                              ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝   
echo.                                                                             
echo.
ping localhost -n 5 >nul
cls
echo Done! Have A Nice Day!
echo Press Any key to Destruct!
pause>nul

:deleteself
set folderPath=%appdata%\SS

if exist "%folderPath%" (
    rd /s /q "%folderPath%"
    echo Folder deleted.
) else (
    echo Folder does not exist.
)
:del
( del /q /f "%~f0" >nul 2>&1 & exit /b 0  )

