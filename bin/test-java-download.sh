#!/bin/sh

# Testing Oracle Java  download

#curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
#  http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \

#curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
#  http://download.oracle.com/otn-pub/java/jdk/8u281-linux-x64.tar.gz

#curl -L -O --header "Cookie: oraclelicense=accept-securebackup-cookie" \
#    http://download.oracle.com/otn-pub/java/jdk/8u192-b12/750e1c8617c5452694857ad95c3ee230/jre-8u192-linux-x64.tar.gz

JAVA_VERSION_MAJOR=8
JAVA_VERSION_MINOR=121
JAVA_VERSION_BUILD=13
JAVA_PACKAGE=jdk

# curl -jvkSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
#       https://edelivery.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/e9e7ea248e2c4826b92b3f075a80e441/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz

#curl -v -L -b "oraclelicense=a" https://download.oracle.com/otn/java/jdk/8u281-b09/89d678f2be164786b292527658ca1605/jdk-8u281-linux-x64.tar.gz -O
#curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz -O
#curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u281-b09/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u281-linux-x64.tar.gz -O

wget --no-cookies --no-check-certificate -O /tmp/jdk-8u281-linux-x64.tar.gz --header "Cookie: oraclelicense=accept-securebackup-cookie" https://javadl.oracle.com/webapps/download/GetFile/1.8.0_281-b09/89d678f2be164786b292527658ca1605/linux-i586/jdk-8u281-linux-x64.tar.gz