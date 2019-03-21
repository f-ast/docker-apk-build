from openjdk:8-jdk-alpine as intt
RUN apk add -U --cache maven git
RUN git clone https://github.com/sjbutler/intt
RUN cd intt && mvn -Dmaven.javadoc.skip=true install 
RUN cd .. && rm -rf intt && cp $HOME/.m2/repository/uk/org/facetus/intt/0.8.8-SNAPSHOT/intt-0.8.8-SNAPSHOT.jar /usr/lib/intt.jar
