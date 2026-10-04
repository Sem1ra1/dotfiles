function ytmp3
    yt-dlp -x --audio-format mp3 -o "$argv[2]/%(title)s.%(ext)s" $argv[1]
end
