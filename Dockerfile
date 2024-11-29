# Use the official JDK 1.8 image as a base image
FROM openjdk:8-jdk

# Set environment variables
ENV CATALINA_HOME=/usr/local/apache-tomcat-8.0.27
ENV PATH=$CATALINA_HOME/bin:$PATH

# Download and install Apache Tomcat 8.0.27
RUN wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.27/bin/apache-tomcat-8.0.27.tar.gz \
    && tar xvf apache-tomcat-8.0.27.tar.gz \
    && mv apache-tomcat-8.0.27 $CATALINA_HOME \
    && rm apache-tomcat-8.0.27.tar.gz

# Copy the web application WAR file to the Tomcat webapps directory
COPY dist/WatchStoreManagement.war $CATALINA_HOME/webapps/

# Expose the port Tomcat runs on
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]