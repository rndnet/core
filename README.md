# Core

Use rndnet-server or rndnet-scheduler as standalone service


Install
-------

-  build.sh

Use as server container
---------------------------

1. Modify server params in files/rndnet/start-server.sh
2. Modify server config in files/rndnet/rndnet_server.conf
3. Modify server port in common file
4. Interactive mode start: start-it-server.sh
5. Daemon mode start: start-daemon-server.sh
    
Use as scheduler container
---------------------------

1. Modify scheduler user or other params in files/rndnet/start-sched.sh
2. Modify scheduler params in files/rndnet/rndnet-scheduler.json.

3. Get/generate rndnet-scheduler.key and put it to files/rndnet/

4. Interactive mode start: start-it-sched.sh
5. Daemon mode start: start-daemon-sched.sh
