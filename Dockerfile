FROM openjdk:8-jdk

MAINTAINER Ivan Muratov, binakot@gmail.com

# https://github.com/wso2/product-is/releases/tag/v5.5.0
ENV WSO2_IS_VERSION 5.5.0
ENV WSO2_IS_SHA256 29801172ce57f1ef04f3bbbde9bb3c737b46fbc69f8827f651381dc2e5f532ce
RUN set -ex \
    \
    && apt-get update && apt-get install --no-install-recommends -y \
        maven \
    && rm -rf /var/lib/apt/lists/* \
    \
    && wget -O wso2is.tar.gz "https://github.com/wso2/product-is/archive/v$WSO2_IS_VERSION.tar.gz" \
    && echo "$WSO2_IS_SHA256 *wso2is.tar.gz" | sha256sum -c - \
    && mkdir -p /usr/src/wso2is \
    && tar \
        --extract \
        --file wso2is.tar.gz \
        --directory /usr/src/wso2is \
        --strip-components 1 \
    && rm wso2is.tar.gz \
    \
    && cd /usr/src/wso2is \
    && mvn --version \
    && mvn clean install -Dmaven.test.skip=true \
    && rm -rf ~/.m2/repository

# https://docs.wso2.com/display/IS550/Default+Ports+of+WSO2+Products
EXPOSE 9443 9763 8000 10500

WORKDIR /opt/wso2is/product-is/modules/distribution/target
ENTRYPOINT ["bin/wso2server.sh"]
