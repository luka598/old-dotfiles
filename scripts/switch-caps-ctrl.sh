#Switch capslock and right control
xmodmap -e "remove Lock = Caps_Lock"
xmodmap -e "remove Control = Control_R"
xmodmap -e "keysym Control_R = Caps_Lock"
xmodmap -e "keysym Caps_Lock = Control_R"
xmodmap -e "add Lock = Caps_Lock"
xmodmap -e "add Control = Control_R"
