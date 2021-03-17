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
#https://archive.apache.org/dist/ant/binaries/apache-ant-1.10.6-bin.zip

RUN curl -sKL -o /tmp/ant-bin.zip https://archive.apache.org/dist/ant/binaries/apache-ant-${ANT_VERSION}-bin.zip && \
    mkdir -p /opt/ant && \
    unzip -q /tmp/ant-bin.zip -d /opt/ant && \
    ln -sf /opt/ant/apache-ant-$ANT_VERSION/bin/ant /usr/local/bin/ant && \
    rm -rf /tmp/ant-bin.zip && \
    chown -R 1001:0 /opt/ant && \
    chmod -R g+rw /opt/ant
#    alternatives --auto java

USER 1001

ENV ANT_HOME=/opt/ant/apache-ant-$ANT_VERSION
