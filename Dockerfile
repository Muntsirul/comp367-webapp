# Use Tomcat with JDK 11 as base image
FROM tomcat:9.0-jdk11

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to Tomcat webapps directory as ROOT.war
COPY target/comp367-webapp.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
