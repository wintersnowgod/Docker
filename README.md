### My Docker Compose yaml files
- Install docker first.  
- Read the individual explanation of the dockers provided below first as some might require additional configuration before starting them.  
- I have created a simple "dockerstart", "dockerstop" and "dockerrestart" script to easily start and stop all the dockers easily so you can also use that.   
- I do not use any reverse proxy as of now and do not own a domain so i have not included any reverse proxy for the dockers.  
- I use tailscale to access my services across devices.  
- Make `.env` file for any compose you want to use and read the description for what env variables to set  
- The syntax for the .env file is  
```
env=value
```  
    
## searxng
- It is a locally hosted privacy search engine which is configured to get the results from other search engines like brave, google, bing, and many more   
- For searxng, I have provided a template as "searxng-template" directory.  
- Rename that "searxng-template" directory to "searxng" first  
- then open the terminal in the directory containing the searxng.yaml file and generate the secret key using this command  
`sed -i "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng/config/settings.yml`  
- On a Mac:  
`sed -i '' "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng/config/settings.yml`  
- To use custom domain ie https url set `SEARXNG_BASE_URL` env in .env file eg:-  
```
SEARXNG_BASE_URL=https://yourdomain.domain
```  
- Now you are free to start the container using  
`docker compose -f searxng.yaml -p searxng up -d`  
- To stop the container  
`docker compose -f searxng.yaml -p searxng down`  
- You can access the searxng search now in  
http://localhost:8181  
- Inside the "searxng/config" dir, there is a "settings.yml" file where"use_default_settings=true" is used which uses all default settings except for the modified ones that are below that line. If you want to modify all the other settings for your own needs then you can access the full settings.yml file with the given command and edit it as you see fit. Do not remove the secret-key that was generated though.  
`docker cp searxng:/usr/local/searxng/searx/settings.yml ./default-settings.yml`  
- For any additional info refer to  
https://github.com/searxng/searxng-docker  
  
## Vaultwarden
- It is a selfhosting alternative for bitwarden password manager. you can use this with the official bitwarden clients.  
- Set `TZ` env variable and also to use a custom domain ie https url set `VAULTWARDEN_DOMAIN` in .env file eg:-  
```
VAULTWARDEN_DOMAIN=https://yourdomain.domain
TZ=Asia/Shanghai
```  
- Run with  
`docker compose -f vaultwarden.yaml -p vaultwarden up -d`  
- To stop the container  
`docker compose -f vaultwarden.yaml -p vaultwarden down`  
- Access it with  
http://localhost:81  
- If you cant access it then you may need https for which you will need a domain and reverse proxy.  
- For any additional info refer to  
https://github.com/dani-garcia/vaultwarden  
  
## Watchtower
- It is just for updating the docker images periodically thats all.  
- Run with  
`docker compose -f watchtower.yaml -p watchtower up -d`  
- To stop the container  
`docker compose -f watchtower.yaml -p watchtower down`  
- For any additional info refer to  
https://github.com/containrrr/watchtower  

## Filebrowser  
- It is a filebrowser to access your files remotely from web. You can specify the directory to access in the compose file by setting `dir` env variable in your .env file.
eg:-  
```
dir=/home
```  
- Run with  
`docker compose -f filebrowser.yaml -p filebrowser up -d`  
- To stop the container  
`docker compose -f filebrowser.yaml -p filebrowser down`  
- and access it through  
http://localhost:82  
- For any additional info refer to  
https://github.com/filebrowser/filebrowser  
## Immich  
- It is a image server.  
- rename `example.env` to .env file and edit at least `DB_PASSWORD` to set password. eg:-  
```
DB_PASSWORD=yourpassword
```  
- Run with  
`docker compose -f immich.yaml -p immich up -d`  
- To stop the container  
`docker compose -f immich.yaml -p immich down`  
- and access it through  
http://localhost:2283  
- For any additional info refer to  
https://github.com/immich-app/immich  

## Pihole
- A DNS server adblocker.  
- set `password`, `TZ`, and `port` env variables in .env file. for example in .env file set  
```
password=yourpassword
TZ=Asia/Shanghai
port=84
```
- #use `port=84,443os` if want https://pi.hole to work  
- Run with  
`docker compose -f pihole.yaml -p pihole up -d`  
- To stop the container  
`docker compose -f pihole.yaml -p pihole down`  
- and access it through  
http://localhost:84  
- For any additional info refer to  
https://github.com/pi-hole/docker-pi-hole/  

## Syncthing
- It is a very useful application to sync files between devices  
- Run with  
`docker compose -f syncthing.yaml -p syncthing up -d`  
- To stop the container  
`docker compose -f syncthing.yaml -p syncthing down`  
- and access it through  
http://localhost:8384  
- For any additional info refer to  
https://github.com/syncthing/syncthing  

## Suwayomi
- It is a webapp to read manga like mihon. It uses mihon extensions.  
- env variables for .env file in my setup  
```
TZ=Asia/Shanghai
username=setyourusername
password=setyourpassword
```
- Access url  
http://localhost:4567  
- For additional info refer to  
https://github.com/Suwayomi/Suwayomi-Server-docker  
  

## Syncyomi
- It is a application to sync your Tachiyomi/Mihon and their forks library cross device if supported.  
- set `TZ` env variable in .env file eg:-  
```
TZ=Asia/Shanghai
```
- Run with  
`docker compose -f syncyomi.yaml -p syncyomi up -d`  
- To stop the container  
`docker compose -f syncyomi.yaml -p syncyomi down`  
- and access it through  
http://localhost:8282  
- For any additional info refer to  
https://github.com/SyncYomi/SyncYomi  

## Tailscale
- It is a very important service with variety of use. I normally use it to access my services across device.  
- The reason why i dont use tailscale in docker is because connecting its service to other machines goes through DERP relay instead of direct connection  
- This is because docker uses NAT connection.  
- So this causes very slow loading of my services.  
- Using tailscale on host native pkg has direct connection so it is much faster.  
- With my insufficient knowledge about any networking I could not find a way to fix direct connection for docker container tailscale.  
- If anyone can help me please reach out on issues or email. Thank you.  
- I have included it here just in case.  
- To use it first create a .env file with these:-  
```
TS_AUTHKEY=yourauthkey
TS_STATE_DIR=./example/tailscale/state
TS_CONFIG_DIR=./tailscale/config
TS_SERVE_CONFIG=
porttomake=
portofservice=
#port* are for the webapp or service connected to tailscale to expose on localhost:port. the "portofservice" is the port of the actual app. 
#like searxng has port 8080 by default. the "porttomake" is the port you want it to be in. 
#So if you set 8181:8080 then the searxng will be accessable in http://localhost:8181 instead of the default http://localhost:8080
```
- Also add the compose of other service in the same file as the tailscale compose file.  
- and rename the file accordingly  
eg:- if using tailscale for the searxng then add searxng compose contents in the tailscale compose file and rename the file as ts-searxng.yaml  
- replace the word `example` everywhere with the service name for example:- searxng  
- Run with  
`docker compose -f ts-searxng.yaml -p ts-searxng up -d`  
- To stop the container  
`docker compose -f ts-searxng.yaml -p ts-searxng down`  
- Then your service will be in your tailscale
- For any additional info refer to  
https://github.com/tailscale-dev/docker-guide-code-examples  
