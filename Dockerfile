FROM openjdk:17-alpine
COPY HelloWorld.java HelloWorld.java
RUN javac HelloWorld.java
CMD java HelloWorld
