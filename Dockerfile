#Build java web app container image
FROM hub.c.163.com/wuxukun/maven-aliyun:3-jdk-8
MAINTAINER chen "1792266893@qq.com"

#Make java and tomcat install directory
RUN mkdir /usr/local/java
RUN mkdir /usr/local/tomcat

#Copy jre and tomcat into image
ADD jdk1.8.0_191 /usr/local/java/
ADD apache-tomcat-7.0.92 /usr/local/tomcat/

ENV PATH $PATH:/usr/local/java/bin
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin
RUN mkdir -p $CATALINA_HOME


ADD pom.xml /tmp/build/
ADD src /tmp/build/src

RUN cd /tmp/build && mvn install \    
        && mv target/yxr.war /usr/local/tomcat/webapps/yxr.war \
        && mv target/yxr /usr/local/tomcat/webapps/yxr \   
        && cd / && rm -rf /tmp/build
RUN cd /usr/local/tomcat/bin \
        && chmod +x catalina.sh &&  chmod +x startup.sh
#Expose http port
EXPOSE 8080

#CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
