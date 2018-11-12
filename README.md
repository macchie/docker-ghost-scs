# Ghost Platform with Docker, SSL and Cloud Storage

![Docker Automated build](https://img.shields.io/docker/automated/macchie/ghost-scs.svg)
![Docker Build Status](https://img.shields.io/docker/build/macchie/ghost-scs.svg)
![Docker Stars](https://img.shields.io/docker/stars/macchie/ghost-scs.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/macchie/ghost-scs.svg)

The goal was to set up Ghost on a Docker host machine with a Cloud asset storage (AWS or DigitalOcean) and enable HTTPS using Let’s Encrypt for certificate generation and auto-renewal.

This recipe can either be used via docker-compose or docker stack deploy (on Swarm enabled Docker hosts), i created a GitHub Repository with docker-compose files and some useful scripts.

It combines three Docker images: 
- **valian/docker-nginx-auto-ssl**: i found this to be a good solution to enable SSL, basically it's a nginx proxy that can be configured via env variables for multi-domain certificate generation and renewal
- **mysql:5.7**: really nothing to say here, it's just our Ghost database
- **macchie/ghost-scs**: that's the image you will build using the Dockerfile, an hosted version is also available on DockerHub so you don't actually need to build your own unless you need further customization

In addition you can use a custom driver for your Ghost content volume, i used local-persist, its just a normal docker volume but you can specify it's path on the disk and the data won't get deleted if you destroy the volume.
To install local-persist driver on your system just run this command and uncomment the volumes driver options in your compose file:

```bash
curl -fsSL https://raw.githubusercontent.com/CWSpear/local-persist/master/scripts/install.sh | sudo bash
```

In conclusion, spin up your configuration with:

```bash
docker-compose up --build
```

on you development machine, or deploy a stack on a Docker Swarm by running:

```bash
docker stack deploy -c docker-compose.production.yml MYSTACKNAME
```

Additional informations and resources you may want to check in case of problems:

- **Local Persist Volume Plugin for Docker** https://github.com/CWSpear/local-persist
- **docker-nginx-auto-ssl** https://github.com/Valian/docker-nginx-auto-ssl
- **Ghost DigitalOcean Storage Adapter** https://github.com/shiva-hack/ghost-digitalocean
- **Ghost AWS S3 Storage Adapter** https://github.com/colinmeinke/ghost-storage-adapter-s3

Enjoy your new Ghost Blog :)