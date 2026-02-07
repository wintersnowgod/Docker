## Suwayomi
- It is a webapp to read manga like mihon. It uses mihon extensions.  
- env variables for .env file in my setup  
```
TZ=Asia/Shanghai
username=setyourusername
password=setyourpassword
```
- There is a permission mismatch so after you run the compose for the first time it will error out after creating the `./suwayomi/data` dir. If this happens You will need to do  
```
sudo chown -R "$USER":"$USER" ./suwayomi
```
And restart the docker so proper files can be created.
- Access url  
http://localhost:4567  
- For additional info refer to  
https://github.com/Suwayomi/Suwayomi-Server-docker  
