#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import subprocess


def prettify_calendar():
    html = ""
    bullets = ["<span class='square'>■</span>", "<span class='heart'>♥</span>",
               "<span class='triangle'>▼</span>", "<span class='circle'>●</span>"]
    bullet_counter = 0

    # remove error from icalbuddy and get calendar info for today
    with open(os.devnull, 'w') as devnull:
        try:
            cmd = ["/usr/local/bin/icalBuddy", "-nrd", "-nc", "-b", "❤︎ ", "-eep", "location,url,notes,attendees", "eventsToday"]
            proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = proc.communicate()

            html, bullet_counter = display_events(html, "Today", out, bullets, bullet_counter)
            # print err
        except subprocess.CalledProcessError as e:
            print e

    # remove error from icalbuddy and get calendar info for tomorrow
    with open(os.devnull, 'w') as devnull:
        try:
            cmd = ["/usr/local/bin/icalBuddy", "-nrd", "-nc", "-b", "❤︎ ", "-eep", "location,url,notes,attendees", "eventsFrom:today+1", "to:today+1"]
            proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = proc.communicate()

            html, bullet_counter = display_events(html, "Tomorrow", out, bullets, bullet_counter)
        except subprocess.CalledProcessError as e:
            print "Error with icalBuddy: ", e.message

    print html


def display_events(html, what_day, raw_events, bullets, bullet_counter):
    events = raw_events.split("\n")
    # display events for the day
    if len(events) < 2:
        html += "<div class='today'>\n<div class='title'>No events planned for " + \
            what_day.lower()+"</div>\n</div>"
    else:
        html += "<div class='today'>\n<div class='title'>"+what_day+"'s Events</div>"
        for i in range(len(events)):
            if events[i].find("❤︎") != -1:
                html += "\n<div class='event_title'>" + \
                    events[i].replace("❤︎", bullets[bullet_counter])+"</div>"
                if bullet_counter < 3:
                    bullet_counter += 1
                else:
                    bullet_counter = 0
            elif events[i] == "":
                pass
            else:
                html += "\n<div class='event_time'>"+events[i]+"</div>"
        # close  div
        html += "\n</div>"
    return html, bullet_counter


prettify_calendar()
