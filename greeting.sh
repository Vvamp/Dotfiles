#!/bin/bash
time=$(date +"%l:%M %p")
_date_=$(date +"%A %d-%m-%Y")
weeknr=$(date +"%V")
quote=$(fortune -s | sed 's/-- /\n    -- /')

set_color red
echo -e "It's $_date_ at$time"
echo "Week #$weeknr"
echo "Welcome, Vincent"
echo ""
echo "\"$quote\""

