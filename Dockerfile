FROM java:8

VOLUME /opt

COPY target/tutorial-1.0.1-SNAPSHOT.jar /opt/web.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/web.jar","-Dtargethost={weblogic.ip}"]


