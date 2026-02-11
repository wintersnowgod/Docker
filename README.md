### My Docker Compose yaml files
- Install docker first.  
- Read the individual explanation of the dockers provided inside their directories first as some might require additional configuration before starting them.  
- A `.env` file for any compose you want to use and read the description for what env variables to set  
- The syntax for the .env file is  
```
env=value
```
- I have created a simple "dockerstart", "dockerstop" and "dockerrestart" script to easily start and stop all the dockers easily so you can also use that.   
- I do not use any reverse proxy as of now and do not own a domain so i have not included any reverse proxy for the dockers.  
- I use tailscale to access my services across devices.  
- Note:- All I dont use the .yml files inside compose-file dir inside their directories anymore.
