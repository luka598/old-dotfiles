#!/bin/bash
xinput
read -p 'Touchpad id: ' touchpadid
xinput set-prop $touchpadid 318 1
xinput set-prop $touchpadid 334 1
