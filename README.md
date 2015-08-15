## find_subtitles <img src="https://cloud.githubusercontent.com/assets/8236909/9288343/8b64fb36-434a-11e5-980c-bd2cf67cb0a2.jpg" width="30">
###### find_subtitles is a lua script for mpv to (down)load subtitles
Ttries to do two simple things:
* use python's subliminal for downloading subtitles
* load any subtitles found within movie folder

------
###### Prerequisites
* some linux distribution with basic bash shell support (i use ubuntu 14.04)
* [mpv](http://mpv.io) player
* python with [subliminal](https://github.com/Diaoul/subliminal) (version 1.0.1 works fine, older will not). I recommend *pip* for easy peasy installation.

###### Using
* copy script to ~/.config/mpv/scripts
* press "s" while playing a movie and after some time you will see an osd message indicating status (the subtitle is automatically donwloaded and loaded)

###### Notes
* Assumes subliminal is available from terminal (if you use it from a non-default path you need change  
* As it captures console output with Lua system calls i doubt it will work in windows without changes

