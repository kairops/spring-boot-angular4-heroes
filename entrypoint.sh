#!/bin/bash

# Wait for the database service to start
wait-for-it.sh -t 60 db:3306

# Create test database and load initial data if it does not exist yet
RESULT=`mysqlshow -h db --user=root --password=delldell|grep -v Wildcard|grep -o test`
if [ "$RESULT" != "test" ]; then
    echo "# Loading initial data"
    echo "create database test" | mysql -h db -u root --password=delldell
    mysql test -h db -u root --password=delldell < script/test.sql
fi

# Set the right database endpoint host
sed -i "s/localhost/db/g" backend/src/main/resources/application.properties

# Code files with "http://localhost:4200" reference
# backend/src/main/java/com/example/ng2boot/Ng2bootApplication.java
# frontend/src/main/frontend/protractor.conf.js

# Application warmup
mvn clean install 

# Backend start
cd backend
mvn spring-boot:run &

# Wait for the backend service to start
/usr/bin/wait-for-it.sh -t 60 localhost:8080

# Frontend start
cd /workspace/frontend/src/main/frontend
ng serve --host 0.0.0.0 --o --disable-host-check
