# FROM openjdk:21

# WORKDIR /newapp.
# COPY target/*.jar newapp.jar 
# RUN mvn clean install -D skipTests  
# COPY . ./apps
# CMD ["java","-jar","newapp.jar"]


# FROM openjdk:21

# RUN apt-get update && apt-get install -y maven

# WORKDIR /newapp


# COPY . .


# RUN mvn clean install

# COPY target/*.jar newapp.jar

# CMD ["java", "-jar", "newapp.jar"] 
# --------------error-----------------

# #  Build the app 
# FROM maven:3.9.6-eclipse-temurin-21

# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# #  Run the app
# FROM openjdk:21-slim

# WORKDIR /app

# COPY target/*.jar restfull-web-0.0.1-SNAPSHOT.jar
 
# CMD ["java", "-jar", "restfull-web-0.0.1-SNAPSHOT.jar"]



# # Stage 1: Build
# FROM maven:3.9.6-eclipse-temurin-17 AS build
# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# # Stage 2: Run
# FROM openjdk:17-jdk-slim
# WORKDIR /app
# COPY  /target/* .jar app.jar
# CMD ["java", "-jar", "app.jar"]

# Stage 1: Build
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests
RUN ls -l /app/target 
 # DEBUG line

# Stage 2: Run
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/restfull-web-0.0.1-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]
