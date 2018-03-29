Smarthome NG
============

Smarthome NG Docker file

You can run this container independet or orchestrate it with docker-compose

Start the individual container
------------------------------

* Create a local folder, which contains the settings e.g. 'etc', 
* create the folloginw files in that folder:
    logging.yaml, module.yaml, plugin.yaml, smarthome.yaml either manually
* or based on the defaults in etc-defaults.
* and link that /etc folder as volume into the container during startup

Run the container:
```
docker run \ 
    -v $(PWD)/etc:/usr/local/smarthome/etc \
    -p 8383:8383 \
    ralfbs/smarthomeng:latest
```

You should now be able to point your browser to http://localhost:8383 

in order to debug the container, you can login with the params -it and argument `bash`:

```
docker run \ 
    -it
    -v $(PWD)/etc:/usr/local/smarthome/etc \
    -p 8383:8383 \
    ralfbs/smarthomeng:latest \
    bash
```


docker-compose
--------------
```
version: '3'
services:

    smarthome-ng:
      image: ralfbs/smarthomeng:latest
      volumes:
       - ./config/smarthomeng/etc:/usr/local/smarthome/etc
      privileged: true
      ports:
        - 2323:2323
        - 2424:2424
        - 8383:8383
      restart: always
 ```






Credits
--------
This docker image is inspired by  
* docker imagehenfri/smarthome-ng 
* [install instructions for SmartHomeNG](https://www.smarthomeng.de/user/installation/komplettanleitung_smarthomeng.html)
 


Further reading
---------------

* [Anwender Dokumentation](https://www.smarthomeng.de/user/)

* [Source Files](https://github.com/smarthomeNG)

