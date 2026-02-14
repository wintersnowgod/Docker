## Immich  
- It is a image server.  
- rename `example.env` to .env file and edit at least `DB_PASSWORD` to set password. eg:-  
```
DB_PASSWORD=yourpassword
```  
- About hwaccel.ml and hwaccel.trannscoding  
- If you dont want to use hwaccel.ml and hwaccel.transcoding then in pihole.yml search for the 2 `extends:` line and comment them and their contents.  
- If you want to use hwaccel.ml and hwaccel.transcoding then uncomment the 2 `extends:` line in pihole.yml and in the `service:` line change the content to your hardware as directed in their comment respectively.  
- REMEMBER THAT THEY ARE HARDWARE DEPENDENT SO CHECK THE OFFICIAL GUIDE FOR WHAT THEY SHOULD BE SET TO:  
https://docs.immich.app/features/ml-hardware-acceleration/  
https://docs.immich.app/features/hardware-transcoding/  
- The two yml file dont need to be edited only pihole.yml need to be edited normally.  
- Run with  
`docker compose -f immich.yml -p immich up -d`  
- To stop the container  
`docker compose -f immich.yml -p immich down`  
- and access it through  
http://localhost:2283  
- For any additional info refer to  
https://github.com/immich-app/immich  
