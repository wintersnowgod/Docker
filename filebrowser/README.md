## Filebrowser  
- It is a filebrowser to access your files remotely from web. 
- You can specify the directory to access in the compose file by setting `dir` env variable in your `.env` file.  
eg:-  
```
dir=/home
```  
- After running it for the first time see the `docker logs filebrowser` for the randomly generated password for user `admin`. Take care because it will only be shown once  
- Run with  
`docker compose -f filebrowser.yml -p filebrowser up -d`  
- To stop the container  
`docker compose -f filebrowser.yml -p filebrowser down`  
- and access it through  
http://localhost:82  
- For any additional info refer to  
https://github.com/filebrowser/filebrowser  
https://filebrowser.org/installation.html  
