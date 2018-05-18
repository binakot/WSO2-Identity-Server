# https://github.com/docker-library/openjdk/blob/master/8-jdk/Dockerfile
FROM openjdk:8-jdk

MAINTAINER Ivan Muratov, binakot@gmail.com

# https://github.com/wso2/product-is/releases/tag/v5.5.0
ENV WSO2_IS_VERSION 5.5.0
ENV WSO2_IS_SHA256 ce0365083c6df62dc737d12218b3ce0fff4509f887e2a88f398803bafa50fa30
RUN set -ex \
    && wget -O /opt/wso2is.zip --user-agent="docker" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" \
        http://product-dist.wso2.com/products/identity-server/$WSO2_IS_VERSION/wso2is-$WSO2_IS_VERSION.zip \
    && echo "$WSO2_IS_SHA256 /opt/wso2is.zip" | sha256sum -c - \
    && unzip /opt/wso2is.zip -d /opt \
    && rm /opt/wso2is.zip

# https://docs.wso2.com/display/IS550/Default+Ports+of+WSO2+Products
EXPOSE 9443 9763 8000 10500

WORKDIR /opt/wso2is-$WSO2_IS_VERSION
ENTRYPOINT ["bin/wso2server.sh"]
