@echo off
setlocal

rem ---- Settings ----
set "PLAYLIST=PLAYLIST_URL"
set "OUTFILE=%~dp0playlist.csv"
set "TMPJSON=%TEMP%\yt_playlist_%RANDOM%.json"

rem Use yt-dlp.exe next to this .bat if present, otherwise from PATH
set "YTDLP=yt-dlp"
if exist "%~dp0yt-dlp.exe" set "YTDLP=%~dp0yt-dlp.exe"

echo Fetching playlist...
"%YTDLP%" --flat-playlist -J --encoding utf-8 --no-warnings "%PLAYLIST%" > "%TMPJSON%"
if errorlevel 1 (
    echo ERROR: yt-dlp failed.
    del "%TMPJSON%" 2>nul
    pause
    exit /b 1
)

rem Convert JSON to CSV (title,url) - proper quoting, UTF-8 with BOM for Excel
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$j = Get-Content -Raw -Encoding UTF8 -LiteralPath $env:TMPJSON | ConvertFrom-Json;" ^
  "$j.entries | ForEach-Object { [pscustomobject]@{ title = $_.title; url = 'https://www.youtube.com/watch?v=' + $_.id } } |" ^
  "Export-Csv -LiteralPath $env:OUTFILE -NoTypeInformation -Encoding UTF8;" ^
  "Write-Host ('Saved ' + @($j.entries).Count + ' videos to ' + $env:OUTFILE)"

del "%TMPJSON%" 2>nul
pause
