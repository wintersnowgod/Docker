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
