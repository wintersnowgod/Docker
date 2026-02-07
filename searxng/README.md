## searxng
- It is a locally hosted privacy search engine which is configured to get the results from other search engines like brave, google, bing, and many more  
- Go to the docker-compose yml file and create a .env file with the following env variables  
```
SEARXNG_SECRET="ultrasecretkey"
```
- then open the terminal in the directory containing the searxng.yml file and generate the secret key using this command  
`sed -i "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng.yml`  
- On a Mac:  
`sed -i '' "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng.yml`  
- To use custom domain ie https url set `SEARXNG_BASE_URL` env in .env file eg:-  
```
SEARXNG_BASE_URL=https://yourdomain.domain/
```  
- Now you are free to start the container using  
`docker compose -f searxng.yml -p searxng up -d`  
- To stop the container  
`docker compose -f searxng.yml -p searxng down`  
- You can access the searxng search now in  
http://localhost:8181  
- Inside the "searxng/config" dir, there is a "settings.yml" file where"use_default_settings=true" is used which uses all default settings except for the modified ones that are below that line. If you want to modify all the other settings for your own needs then you can access the full settings.yml file with the given command and edit it as you see fit.  
`docker cp searxng:/usr/local/searxng/searx/settings.yml ./default-settings.yml`  
- For any additional info refer to  
https://github.com/searxng/searxng-docker  
