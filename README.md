### My Docker Compose yaml files
- Install docker first
- Read the individual explanation of the dockers provided below first as some might require additional configuration before starting them.
- I have created a simple "start.sh" and "stop.sh" script to easily start and stop all the dockers easily so you can also use that. 
- I donot use any reverse proxy as of now and do not own a domain so i have not included any reverse proxy for the dockers.  
  
## searxng
- It is a locally hosted privacy search engine which is configured to get the results from other search engines like brave, google, bing, and many more   
- For searxng, I have provided a template as "searxng-template" directory.  
- Rename that "searxng-template" directory to "searxng" first  
- then open the terminal in the directory containing the searxng.yaml file and generate the secret key using this command  
`sed -i "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng/config/settings.yml`  
- On a Mac:  
`sed -i '' "s|ultrasecretkey|$(openssl rand -hex 32)|g" searxng/config/settings.yml`  
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
- Run with  
`docker compose -f vaultwarden.yaml -p vaultwarden up -d`  
- To stop the container  
`docker compose -f vaultwarden.yaml -p vaultwarden down`  
- Access it with  
http://localhost:81  
- If you cant access it then you may need https for which you will need a domain and reverse proxy.  
  
## Watchtower
- It is just for updating the docker images periodically thats all.  
- Run with  
`docker compose -f watchtower.yaml -p watchtower up -d`  
- To stop the container  
`docker compose -f watchtower.yaml -p watchtower down`  
