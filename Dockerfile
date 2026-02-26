//FROM openjdk:17-alpine
FROM alpine/java:21-jdk
COPY HelloWorld.java HelloWorld.java
RUN javac HelloWorld.java
CMD java HelloWorld
