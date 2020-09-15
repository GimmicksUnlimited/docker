#docker compose to spin up graphite and grafana containers and have their config/data mounted as volumes.



# Docker/Docker Compose Setup

these are steps to setup docker compose on raspberry-pi borrowed from https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/

```
sudo apt-get install apt-transport-https ca-certificates software-properties-common -y
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker pi
sudo curl https://download.docker.com/linux/raspbian/gpg
echo "deb https://download.docker.com/linux/raspbian/ stretch stable" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get upgrade
systemctl start docker.service
docker info
# setup docker compose
sudo pip3 install docker-compose
```


#setup
create data dir for graphite
```
mkdir ./gdata
export GRAPHITE_DATA3=$(pwd)/gdata
```



# start
```
docker-compose -f docker-compose.yml up -d
```
after runnning above you should be able to access graphite at http://localhost:8080 and grafana at http://localhost/

you can also send metrics to graphite with following loop:
```
while true; do echo -n "example:$((RANDOM % 100))|c" | nc -w 1 -u 127.0.0.1 8125; done
```


at this point default admin/admin account is available to access grafana 
 - login with admin/admin 
 - add graphite data source using http://graphite:8080/ as a access point.
 - create a dashboard with metric stats.example (from above)






# stop

```
docker-compose -f docker-compose.yml down
```


