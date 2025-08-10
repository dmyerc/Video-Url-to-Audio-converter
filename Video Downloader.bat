@ECHO OFF
SETLOCAL EnableDelayedExpansion
ECHO.
ECHO Video Downloader addon!
ECHO.
ECHO If you run into any errors, view the readme file. Chances r u need to install ffmpeg or install new version of ytdlp.exe

:start
ECHO.
ECHO ======================================================================================================================
ECHO.
SET /P URL="[Enter URL of video or playlist to download] "
ECHO.
ECHO ======================================================================================================================
goto formatList

:formatList
ECHO.
yt-dlp --list-formats -F %URL%
ECHO.
ECHO ======================================================================================================================
goto downloadSingle


:downloadSingle
ECHO.
SET /P format="Paste ID of the version you wish to download: "
ECHO.
ECHO ======================================================================================================================
ECHO.
yt-dlp_x86 -f %format% --ffmpeg-location "ffmpeg/bin" --audio-quality 0 -i --ignore-config --recode-video mp4 --hls-prefer-native -o "VideoDownloads/%%(title)s.%%(ext)s" %URL% 
ECHO.
ECHO If successful, video file(s) located in 'VideoDownloads' folder
ECHO.
ECHO ======================================================================================================================
ECHO.

SET /P response="[Finished? (enter y/n)] "

if "!response!"=="n" (
	goto start
) else (
	goto end
)


:end
ECHO.
ECHO ======================================================================================================================
ECHO.
ECHO Exiting Application
PAUSE
EXIT
