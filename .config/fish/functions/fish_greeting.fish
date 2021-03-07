function fish_greeting
 set time (date +"%l:%M %p")
 set _date_ (date +"%A %d-%m-%Y")
 set weeknr (date +"%V")
 set quote (fortune -s | sed 's/-- /\n    -- /')
 echo -e "It's $_date_ at$time"
 echo "Week #$weeknr"
 echo "Welcome, Vincent"
 echo ""
 #echo "\"$quote\""
echo "-- Todo --"
cat ~/todo.txt
end
