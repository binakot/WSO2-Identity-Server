# WSO2-Identity-Server

WSO2 Identity Server ready-to-use docker image 👤 👀

Based on [OpenJDK 8 official image](https://github.com/docker-library/openjdk/blob/master/8-jdk/Dockerfile).

Docker image with:
* [WSO2 Identity Server](https://wso2.com/identity-and-access-management) 

Current versions of components:
* WSO2 Identity Server: [**5.5.0**](https://github.com/wso2/product-is/releases/tag/v5.5.0)

How to build:

```bash
$ docker build -t binakot/wso2-is .
```

How to run:

```bash
$ docker run -d --name wso2-is binakot/wso2-is
```

## Endpoints

* [Carbon dashboard](https://localhost:9443/carbon)

* [User dashboard](https://localhost:9443/dashboard)
