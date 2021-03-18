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
ENV JDK_DOWNLOAD_URL=https://javadl.oracle.com/webapps/download/GetFile/1.8.0_281-b09/89d678f2be164786b292527658ca1605/linux-i586/jdk-8u281-linux-x64.tar.gz
ENV JDK_PACKAGE_FILENAME=jdk-8u281-linux-x64.tar.gz
ENV JDK_DIR=jdk1.8.0_281
ENV JAVA_HOME=/opt/java/${JDK_DIR}

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

USER 1001
