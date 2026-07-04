## Docktail
- Simple way to create docker services to tailscale services.  
- Only needs to provide labels for the docker compose files. No need for tailscale sidecars for each service.  
- .env file with environments:- edit as necessary:  
```
TAILSCALE_OAUTH_CLIENT_ID=yourclientid
TAILSCALE_OAUTH_CLIENT_SECRET=youroauthclientsecret
IGNORE_SERVICE_NAMES=service1,service2,... #services to ignore (useful for the services which are not from docker or else docktail will revoke those services)
```
- Setup:- First you need to create an oauth token by following these steps
1. you will need some tags for this. Add this in your ACL at https://login.tailscale.com/admin/acls/file.  
```
"tagOwners": {
    "tag:server":         ["autogroup:admin"],
    "tag:docktail":        ["autogroup:admin"],
},
"autoApprovers": {
    "services": {
        "tag:docktail": ["tag:server"],
    },
},
```
you can change the tags as you see fit but I use `server` for my host machine and `docktail` for my docktail services (by the way the default tags for the services is `container` but I changed it to `docktail`` in the compose file.)  
Then tag your host machine for the services as server in your machines dashboard in https://login.tailscale.com/admin/machines  
click at the `...` next to your machine-goto Edit ACL tags-and choose the tag `server`.  
2. Now, Go to https://login.tailscale.com/admin/settings/trust-credentials and create a new `oauth` credential with scopes  
```
general-services = read,write
devices-core = read,write
```
and choose tag `docktail` for both when prompted.  
- Now the setup on the tailscale website is done. Everything else is done on your compose files with labels.  
- In each of your preferred compose file to appear in tailscale services, add these on the services:-
```
    labels:
      - "docktail.service.enable=true"
      - "docktail.service.name=yourpreferredservicename"
      - "docktail.service.port=theportatwhichyouaccesstheservice"
      - "docktail.service.service-port=443" #the port at which the tailscale exposes the service. leave this 443 if you just want https access
      - "docktail.tags=tag:docktail" #the tag to do for the service. need docktail tag or else it will error.
```
- OPTIONAL:- If you need to set different ports in tailscale services on the same service you can do it this way for the label using numbered labels-  
```
    labels:
      - "docktail.service.enable=true"
      - "docktail.service.name=yourservice"
      - "docktail.service.port=80"
      - "docktail.service.service-port=443"
      - "docktail.service.1.enable=true"
      - "docktail.service.1.name=yourservice"
      - "docktail.service.1.port=53"
      - "docktail.service.1.service-port=53"
      - "docktail.service.1.protocol=tcp" #default protocol is https so no need to specify for https. only specify if not https
      - "docktail.tags=tag:docktail"
```
`yourservice` should be the same service for both if you want it in same service. different if you want 2 services from same docker with different ports  
- Run with  
`docker compose -f docktail.yml -p docktail up -d`  
- To stop the container  
`docker compose -f docktail.yml -p docktail down`  
- It should now appear automatically in your tailscale services at https://login.tailscale.com/admin/services   
- For any additional info refer to  
https://github.com/marvinvr/docktail  
https://docktail.org/docs  
