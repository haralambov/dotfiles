#!/bin/bash

upower -i $(upower -e | grep -i BAT) | grep -i percentage | awk '{print $2}'

