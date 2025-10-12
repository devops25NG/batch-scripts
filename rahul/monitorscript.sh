DISK_LIMIT=50 
RAM_LIMIT=50 
EMAIL="rahuld06097@gmail.com" 

TEMP="/tmp/sys_warn.txt" 
> $TEMP


disk=$(df / | awk 'NR==2 {print $5}' | sed 's/%//') 

if [ $disk -ge $DISK_LIMIT ]; then
    echo "Disk usage is high: $disk%" >> $TEMP
fi

ram=$(free | awk '/Mem:/ {printf "%.0f", $3/$2*100}')

if [ $ram -ge $RAM_LIMIT ]; then
    echo "RAM usage is high: $ram%" >> $TEMP
fi

if [ -s $TEMP ]; then
    mail -s "System Warning" $EMAIL < $TEMP
fi

