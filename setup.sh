#!/bin/sh

set -e

find /opt/wso2is/repository/conf -type f -exec sed -i "s/localhost/$HOSTNAME/g" {} \;

exit 0
