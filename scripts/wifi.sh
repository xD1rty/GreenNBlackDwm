wifiname=$(iwgetid -r)
ip=$(ip route get 1.2.3.4 | awk '{print $7}')

if [[ -z "$wifiname" ]]
then
    echo "no connection"
else
    echo "$wifiname $ip"
fi