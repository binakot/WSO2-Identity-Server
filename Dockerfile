# https://github.com/docker-library/openjdk/blob/master/8-jdk/Dockerfile
FROM openjdk:8-jdk

MAINTAINER Ivan Muratov, binakot@gmail.com

# https://wso2.com/products/carbon/release-matrix
# https://github.com/wso2/product-is/releases/tag/v5.5.0
ENV WSO2_IS_VERSION 5.5.0
ENV WSO2_IS_SHA256 ce0365083c6df62dc737d12218b3ce0fff4509f887e2a88f398803bafa50fa30
ENV HOSTNAME localhost

RUN set -ex \
    && wget -P /opt --user-agent="docker" --referer="http://connect.wso2.com/wso2/getform/reg/new_product_download" \
        http://product-dist.wso2.com/products/identity-server/${WSO2_IS_VERSION}/wso2is-${WSO2_IS_VERSION}.zip \
    && echo "${WSO2_IS_SHA256} /opt/wso2is-${WSO2_IS_VERSION}.zip" | sha256sum -c - \
    && apt-get update && apt-get install -y zip && apt-get clean \
    && unzip /opt/wso2is-${WSO2_IS_VERSION}.zip -d /opt \
    && rm /opt/wso2is-${WSO2_IS_VERSION}.zip \
    && mv /opt/wso2is-${WSO2_IS_VERSION} /opt/wso2is

ADD ./setup.sh /opt
RUN chmod +x /opt/setup.sh
RUN /opt/setup.sh

# https://docs.wso2.com/display/IS550/Default+Ports+of+WSO2+Products
EXPOSE 9443 9763 8000 10500

WORKDIR /opt/wso2is
ENTRYPOINT ["bin/wso2server.sh"]