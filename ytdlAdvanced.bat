@ECHO OFF
color 0A
ECHO ======================================================================================================================
ECHO.
SET /P URL="[Enter video URL] "
ECHO.
ECHO ======================================================================================================================
goto formatList

:formatList
ECHO.
youtube-dl -F %URL%
ECHO.
ECHO ======================================================================================================================
goto downloadSingle


:downloadSingle
ECHO.
SET /P format="Select format: "
ECHO.
ECHO ======================================================================================================================
ECHO.
youtube-dl -x --audio-format wav Downloads/%%(title)s.%%(ext)s -f %format% -i --ignore-config --hls-prefer-native %URL%
ECHO.
ECHO ======================================================================================================================
ECHO.
ECHO Done!
PAUSE
EXIT

