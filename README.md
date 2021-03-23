# spm-jenkins-agent
Container image for Jenkins agent for building IBM Cúram Social Program Management

## Introduction
The application build process of IBM Cúram Social Program Management requires [specific set of tools and libraries](https://www.ibm.com/support/knowledgecenter/SS8S5A_7.0.11/com.ibm.curam.content.doc/install_DevelopmentEnvironment/c_install_prerequisite_software.html). This container images packages those required tools and libraries in together with Jenkins agent libraries to form a easy-to-use package for building the SPM application with [Jenkins](https://www.jenkins.io/).

## Tools included
- [Apache Ant](https://ant.apache.org/) 1.10.6
- [Oracle Java JDK](https://www.oracle.com/java/technologies/javase-downloads.html#JDK8) 1.8.0_281
- [IBM WebSphere Liberty](https://www.ibm.com/support/knowledgecenter/en/SSEQTP_liberty/as_ditamaps/welcome_liberty.html) 20.0.0.9
