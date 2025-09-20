rem yt-dlp.exe "https://www.youtube.com/watch?v=21bPE0BJdOA"  --list-formats
rem yt-dlp.exe "https://www.youtube.com/watch?v=21bPE0BJdOA"  -f "bestvideo[height<=?1080]+(258/256/140)/best"

yt-dlp.exe --ignore-errors --add-metadata --write-sub --sub-lang en,ta --embed-subs -f "(299/137)+(258/256/140)/bestvideo[height<=?1080]+(258/256/140)/bestvideo[ext=webm]+251/bestvideo[ext=webm]+(250/249)/best" https://www.youtube.com/watch?v=KwR64Zqov3k


pause

for /f "usebackq tokens=1-2 delims=;" %%a in ("new5.csv") do (
      echo %%a %%b 
	  
yt-dlp.exe --download-archive youtube-dl.list --ignore-errors --add-metadata --write-sub --sub-lang en,ta --write-thumbnail --embed-subs -f "(299/137)+(258/256/140)/bestvideo[height<=?1080]+(258/256/140)/bestvideo[ext=webm]+251/bestvideo[ext=webm]+(250/249)/best" %%b

)

rem yt-dlp.exe -f "617" "https://youtu.be/EJr3uAQwGek?si=oQVAwaiSGjgKclcM"



rem (1080res30fps h264 or vp9+5.1 or best audio) or (1080res60fps h264_hfr or vp9_hfr+best audio) or (720res30fps h264 or vp9+5.1 or best audio) or (720res60fps h264_hfr or vp9_hfr+best audio) or (best video[480 or less] + best audio)


rem yt-dlp.exe --download-archive youtube-dl.list --ignore-errors --add-metadata --write-sub --sub-lang en,ta --write-thumbnail --embed-subs -f "(137/248)+(258/256/140/bestaudio)/(303/299)+bestaudio/(136/247)+(258/256/140/bestaudio)/(302/298)+bestaudio/bestvideo[height<=?480]+bestaudio" "https://youtu.be/EJr3uAQwGek?si=oQVAwaiSGjgKclcM"

pause

