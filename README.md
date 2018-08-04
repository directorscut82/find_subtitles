## find_subtitles <img src="https://cloud.githubusercontent.com/assets/8236909/9288343/8b64fb36-434a-11e5-980c-bd2cf67cb0a2.jpg" width="30">
###### find_subtitles is a lua script for mpv to (down)load subtitles
Tries to do two simple things:
* use python's subliminal for downloading subtitles
* load any subtitles found within movie folder

------
###### Prerequisites
* a linux OS
* [mpv](http://mpv.io) player
* python with [subliminal](https://github.com/Diaoul/subliminal) (version(s) 1.0.1+ work fine, older will not). [ *pip* for easy peasy installation is recommended]

###### Using
* copy script to ~/.config/mpv/scripts (for some older versions than 0.9.2 it will propably be a slight different path; check [here](http://mpv.io/manual/master/#files))
* press "s" while playing a movie and after some time you will see an osd message indicating status (the subtitle will be automatically donwloaded and loaded)

###### Notes
* Assumes subliminal is available from terminal (if you use it from a non-default path you need to update line 38)
* Downloads English subtitles (if you require other languages you need to update line 38)
* As it captures console output with Lua system calls i doubt it will work in windows without changes

