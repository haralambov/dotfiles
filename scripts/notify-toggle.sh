#!/usr/bin/env sh
# Taken from -> https://gist.github.com/JCGoran/926bdb17e140e65ee4156500f1459671

# the main command to send
comm="xfconf-query -c xfce4-notifyd -p /do-not-disturb"
# query for status
status="$(${comm})"
# if 'Do not disturb' is off, we send a notification, and then turn it on
if [ "${status}" = "false" ]
then
    eval "${comm} -T"
# otherwise we first turn it off, and then send the notification
elif [ "${status}" = "true" ]
then
    eval "${comm} -T"
fi
