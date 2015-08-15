require 'os'
require 'io'
require 'string'

-- "find_subtitles" tries to do two simple things:
-- 1. use python's subliminal for downloading subtitles
-- 2. load any subtitles found within movie folder
-- (this function binds letter "s")

-- function for capturing cli response
-- Reference: http://stackoverflow.com/questions/132397
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
return string.sub(s, 0, -2)
end

function find_subtitles()

	-- use subliminal to fetch english subtitles from all providers (change en to your preference if needed)
	mp.msg.info("Searching for subtitles..")
	local ss = os.capture("subliminal download --provider opensubtitles --provider podnapisi --provider thesubdb --provider tvsubtitles -l en -v '" .. mp.get_property("path") .. "'")
	-- you can also use this if you join addict7d (replace user and pass with yours; use no quotes just the strings)
	-- local ss = os.capture("subliminal --addic7ed user pass download --provider addic7ed --provider opensubtitles --provider podnapisi --provider thesubdb --provider tvsubtitles -l en -v '" .. mp.get_property("path") .. "'")

	-- strip unnecessary info (as of version 1.0.1 the string matchings below are working ... dont know for how long though
	ss = string.gsub(ss,"(Collecting videos)",'')
	ss = string.gsub(ss,"(Downloading subtitles)",'')
	ss = string.gsub(ss,"(1 video collected / 0 video ignored / 0 error)",'')
	ss = string.gsub(ss,"\n",'')	
	if string.match(ss,"0 video collected / 1 video ignored / 0 error") then
		ss = "Subtitle already in path.. "
	end	
	
	-- Possible messages: 
	-- "1 subtitle downloaded for <FILENAME>", if subliminal returned without errors 
	-- "Subtitle already in path..", if there are already subtitles in the folder
        --  <captured errors>, if something gone wrong
	mp.osd_message(string.format(" %s",ss),4)		
	
	-- no matter what happened, try to load *.srt files (if any)
    	for filename in io.popen('ls -a'):lines() do
		if string.find(filename,'srt') then

			--sub_add mpv command does not like spaces so we just rename each file
			--without them (if any)
			if string.find(filename,' ') then
				ss = string.gsub(filename,"( )",'')
				os.rename(filename,ss)
				filename = ss	
			end

			--load the file(s)
			mp.command("sub_add " .. filename .. "")
		end		
    	end
end

mp.add_key_binding("s", "subtitles", find_subtitles)
