# docker-teamcity-ubuntu
Docker packaging for TeamCity professional on top of Ubuntu 14.04 with Oracle  Java 8 from WebUpd8

This is a bit ugly, I run more that I should in one container, but it works...

To run it, clone this repo, then:

```
wget http://download-cf.jetbrains.com/teamcity/TeamCity-9.0.2.tar.gz
docker build --tag tcserver .
docker run --detach tcserver
```

the server should be reachable at http://localhost:8111
