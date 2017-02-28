# Tool Control Language Script
# Author:  Jordan Ulmer
# Date:        2017-02-28
# Purpose:     Quartus aliases
#Source: http://electronics.stackexchange.com/questions/17359/how-to-configure-my-favorite-editor-in-modelsim

# Usage: This line only needs to be ran once. I ran it directly in Modelsim's terminal.
        # set PrefSource(altEditor) external_editor

# Windows # TODO: Enable default MSIM text editor in Windows
# proc external_editor_windows {filename linenumber} {
#  exec "C:\Program Files\Sublime Text 3\sublime_text.exe" $filename:$linenumber &
# }
# set PrefSource(altEditor) external_editor_windows

# Linux
proc external_editor_linux {filename linenumber} {
    exec /usr/bin/subl $filename:$linenumber &
}
set PrefSource(altEditor) external_editor_linux
# vsim -c -do "set PrefSource(altEditor) external_editor_linux"
