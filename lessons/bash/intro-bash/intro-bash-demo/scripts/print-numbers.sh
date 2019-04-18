echo "This script will print numbers from 1 to 100 in:"
sleep 1
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1

echo "printng numbers"
sleep 0.5
for i in $(seq 100);
do
    echo $i
    sleep 0.03
done
