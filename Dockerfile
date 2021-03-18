
FROM websphere-liberty:20.0.0.9-full-java8-ibmjava AS liberty

FROM quay.io/openshift/origin-jenkins-agent-base:4.5

# ENV GRADLE_VERSION=6.3
# ENV GRADLE_USER_HOME=/home/jenkins/.gradle

# RUN curl -skL -o /tmp/gradle-bin.zip https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
#     mkdir -p /opt/gradle && \
#     unzip -q /tmp/gradle-bin.zip -d /opt/gradle && \
#     ln -sf /opt/gradle/gradle-$GRADLE_VERSION/bin/gradle /usr/local/bin/gradle && \
#     rm -f /tmp/gradle-bin.zip && \
#     chown -R 1001:0 /opt/gradle && \
#     chmod -R g+rw /opt/gradle && \
#     mkdir /home/jenkins/.gradle && \
#     chmod 775 /home/jenkins/.gradle && \
#     alternatives --auto java

ENV ANT_VERSION=1.10.6
ENV ANT_HOME=/opt/ant/apache-ant-${ANT_VERSION}
ENV JDK_DOWNLOAD_URL=https://javadl.oracle.com/webapps/download/GetFile/1.8.0_281-b09/89d678f2be164786b292527658ca1605/linux-i586/jdk-8u281-linux-x64.tar.gz
ENV JDK_PACKAGE_FILENAME=jdk-8u281-linux-x64.tar.gz
ENV JDK_DIR=jdk1.8.0_281
ENV JAVA_HOME=/opt/java/${JDK_DIR}
ENV WLP_HOME=/opt/ibm/wlp
ENV J2EE_JAR=${WLP_HOME}/lib/com.ibm.ws.javaee.platform.v8_1.0.44.jar

# Install Ant
RUN curl -sKL -o /tmp/ant-bin.zip https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.zip && \
    mkdir -p /opt/ant && \
    unzip -q /tmp/ant-bin.zip -d /opt/ant && \
    ln -sf /opt/ant/apache-ant-$ANT_VERSION/bin/ant /usr/local/bin/ant && \
    rm -rf /tmp/ant-bin.zip && \
    chown -R 1001:0 /opt/ant && \
    chmod -R g+rw /opt/ant
#    alternatives --auto java

# Install Oracle JDK 8
RUN wget --no-cookies --no-check-certificate -O /tmp/${JDK_PACKAGE_FILENAME} --header "Cookie: oraclelicense=accept-securebackup-cookie" ${JDK_DOWNLOAD_URL} && \
    mkdir -p /opt/java && \
    gtar -zxvf /tmp/${JDK_PACKAGE_FILENAME} -C /opt/java && \
    rm -rf /tmp/${JDK_PACKAGE_FILENAME} && \
    chown -R 1001:0 /opt/java && \
    chmod -R g+rw /opt/java

# Install needed libraries (J2EE_JAR etc)
# RUN mkdir -p /opt/lib
# COPY lib/*.jar /opt/lib/
# RUN chown -R 1001:0 /opt/lib && \
#     chmod -R g+rw /opt/lib

# COPY lib/wlp-javaee8-20.0.0.9.zip /tmp
# RUN mkdir -p /opt/WebSphere && \
#     unzip /tmp/wlp-javaee8-20.0.0.9.zip -d /opt/WebSphere && \
#     rm -rf /tmp/wlp-javaee8-20.0.0.9.zip && \
#     chown -R 1001:0 /opt/WebSphere && \
#     chmod -R g+rw /opt/WebSphere

# Install Liberty
RUN mkdir -p /opt/ibm/wlp
COPY --from=liberty /opt/ibm/wlp /opt/ibm/wlp
RUN chown -R 1001:0 /opt/ibm && \
    chmod -R g+rw /opt/ibm


USER 1001
