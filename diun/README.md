## Diun
- Sends notification if the docker images have updates.  
- It has variety of features so check out the documentation on link below for full configuration.  
- .env file with environments:- edit as necessary:  
```
TZ=Asia/Shanghai

#for email notifications
DIUN_NOTIF_MAIL_HOST=
DIUN_NOTIF_MAIL_PORT=
DIUN_NOTIF_MAIL_SSL=
DIUN_NOTIF_MAIL_INSECURESKIPVERIFY=
DIUN_NOTIF_MAIL_LOCALNAME=
DIUN_NOTIF_MAIL_USERNAME=
DIUN_NOTIF_MAIL_PASSWORD=
DIUN_NOTIF_MAIL_FROM=
DIUN_NOTIF_MAIL_TO=                     #comma separated if multiple
```
- I have provided a diun-notif.py python script for webhook notification using dbus for host system ie to get the notifications in your pc itself. You can configure other like email (as in above env file) or discord or telegram etc. check in documentation below.  
- Run with  
`docker compose -f diun.yml -p diun up -d`  
- To stop the container  
`docker compose -f diun.yml -p diun down`  
- For any additional info refer to  
https://github.com/crazy-max/diun  
https://crazymax.dev/diun/  
