## Syncyomi
- It is a application to sync your Tachiyomi/Mihon and their forks library cross device if supported.  
- set `TZ` env variable in .env file eg:-  
```
TZ=Asia/Shanghai
```
- create the folder syncyomi/config  
- Run with  
`docker compose -f syncyomi.yml -p syncyomi up -d`  
- To stop the container  
`docker compose -f syncyomi.yml -p syncyomi down`  
- and access it through  
http://localhost:8282  
- if you cant access then edit the file `syncyomi/config/config.toml` and set  
```
host = "0.0.0.0"
```  
and restart the docker  
- For any additional info refer to  
https://github.com/SyncYomi/SyncYomi  
