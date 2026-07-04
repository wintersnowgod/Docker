## Filebrowser Quantum  
- It is a fork of filebrowser to access your files remotely from web. 
- In order to specify the specify the directory to access, you need to:-
1. Edit the `config.yml` in `./filebrowser/data/config.yml` and add `- path` under the `sources`
eg:-  
```
sources:
    ...........
    - path: "/yourpreferredname"
      name: yourpreferredlabel
      config:
        defaultEnabled: true # new users automatically get access to the source
    .......
```
2. Edit the compose file and add under `volumes`:-
```
volumes:
    ........
    - /yourpathtoshare:/yourpreferredname_fromtheconfigfile
    ........
```
- To set the admin password make a `.env` file and add:-
```
FILEBROWSER_ADMIN_PASSWORD=yourpreferredpassword
```
- Make sure that the `.config` file exists in `./filebrowser/data/config.yml` and start the docker container
- Run with  
`docker compose -f filebrowserquantum.yml -p filebrowserquantum up -d`  
- To stop the container  
`docker compose -f filebrowserquantum.yml -p filebrowserquantum down`  
- and access it through  
http://localhost:8900  
- For any additional info refer to  
https://github.com/gtsteffaniak/filebrowser  
https://filebrowserquantum.com/en/docs/user-guides  
