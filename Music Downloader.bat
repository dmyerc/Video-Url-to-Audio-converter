@ECHO OFF
SETLOCAL EnableDelayedExpansion
ECHO.
ECHO Welcome to a very barebones audio downloader!
ECHO This program accepts links from youtube, soundcloud, bandcamp and many other sites.
ECHO.

ECHO The full list of compatible streaming sites can be found at the link below:
ECHO https://ytdl-org.github.io/youtube-dl/supportedsites.html
ECHO.
ECHO All output files are in .wav format
ECHO.
ECHO If you run into any errors, view the readme file. Chances r u need to install ffmpeg or install new version of ytdlp.exe

:start
ECHO.
ECHO ======================================================================================================================
ECHO.
SET /P URL="[Enter URL] "
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
yt-dlp -f %format% --ffmpeg-location "ffmpeg/bin" --extract-audio --audio-format wav --audio-quality 0 -i --ignore-config --hls-prefer-native -o "MusicDownloads/%%(title)s.%%(ext)s" %URL%  
ECHO.
ECHO If successful, wav file(s) located in 'MusicDownloads' folder
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


