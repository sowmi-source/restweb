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


#  Build the app 
FROM maven:3.9.6-eclipse-temurin-21

WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

#  Run the app
FROM openjdk:21-slim

WORKDIR /app
COPY target/* .jar  app.jar

CMD ["java", "-jar", "app.jar"]



# # ---------- STAGE 1: BUILD ----------
# FROM maven:3.9.6-eclipse-temurin-21 AS builder

# WORKDIR /app
# COPY . .
# RUN mvn clean package -DskipTests

# # ---------- STAGE 2: RUNTIME ----------
# FROM openjdk:21-slim

# WORKDIR /app
# COPY --from=builder /app/target/*.jar app.jar

# CMD ["java", "-jar", "app.jar"]
# # #   image name - demoapp