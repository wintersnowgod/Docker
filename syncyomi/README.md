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
