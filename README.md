# Watch-Store-Management
An old version java web project about watch e-commerce using netbeans 8 with JDK1.8 and Apache Tomcat 8.0.27. This project also contain dockerfie, database.script to create in Microsoft SQL Server. 

# Docker build (CMD)
- To build image:

docker build -t watchstoremanagement .

- To ruin container:

docker run -d -p 8080:8080 --name watchstoremanagement-container watchstoremanagement

- Then you can go to url home page:

http://localhost:8080/WatchStoreManagement
