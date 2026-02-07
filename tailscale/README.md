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
```
- If you want to pair it with a service you can copy the content of this file to that yml and set `network_mode: service:ts-example`
- In the tailscale.yml file replace `example` lines with the tailscale service you will use this together with.
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
