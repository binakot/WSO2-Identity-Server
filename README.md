# WSO2-Identity-Server

WSO2 Identity Server ready-to-use docker image 👤 👀

Based on [OpenJDK 8 official image](https://github.com/docker-library/openjdk/blob/master/8-jdk/Dockerfile).

Docker image with:
* [WSO2 Identity Server](https://wso2.com/identity-and-access-management) 

Current versions of components:
* OpenJDK [**8u171**](https://buildd.debian.org/status/logs.php?pkg=openjdk-8)
* WSO2 Identity Server: [**5.5.0**](https://github.com/wso2/product-is/releases/tag/v5.5.0)

How to build:

```bash
$ docker build -t binakot/wso2-identity-server .
```

How to run:

```bash
$ docker run -d --name wso2is -p 9443:9443 binakot/wso2-identity-server
```

## Endpoints

* [Dashboard](https://localhost:9443)
