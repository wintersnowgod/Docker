## Pihole
- A DNS server adblocker.  
- set `password`, `TZ`, and `port` env variables in .env file. for example in .env file set  
```
password=yourpassword
TZ=Asia/Shanghai
port=84
dns_upstreams="8.8.8.8;8.8.4.4;2001:4860:4860:0:0:0:0:8888"
dns_hosts="ip1.ip1.ip1.ip1 whatevernameyouwant1;ip2.ip2.ip2.ip2 whatevernameyouwant2"

#Tailscale env
TS_AUTHKEY=addyourtailscaleauthkeyhere
TS_STATE_DIR=./pihole/tailscale/state
TS_CONFIG_DIR=./pihole/tailscale/config

```
- #use `port=84,443os` if want https://pi.hole to work  
- The dns_upstreams is the upstream dns you want to use. This is needed. Here it is google dns by default.  
- hosts is if you use another devies that justshows as ip in query you can add the ip and name to show proper name.  
- I use pihole with a docker tailscale sidecar so i dont need to set the `port` env variable. I need to set the tailscale authkey in the above env file though.  
- If you dont want to use pihole with tailscale in docker then remove all lines after `ts-pihole`.  
- after that you can   
- either change the `network mode` line to be:-  
```
network_mode: host
```
and also uncomment `FTLCONF_webserver_port: ${port}` line and set the `port` env variable in .env file. This will make the DNS to be your localhost ie `127.0.0.1`  
- or remove the `network_mode` line and uncomment the `ports:` and its contents. This will make the DNS to be the output of following command  
```
ip addr show docker0 | grep inet | awk '{print $2}' | sed 's|/.*||'
```
- Run with  
`docker compose -f pihole.yaml -p pihole up -d`  
- To stop the container  
`docker compose -f pihole.yaml -p pihole down` 
- You can access the control dashboard through  
http://localhost:84/admin  
- For any additional info refer to  
https://github.com/pi-hole/docker-pi-hole/  
