FROM sonarqube:7.7-community

USER root 

COPY bin/run.sh $SONARQUBE_HOME/bin/

#RUN echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
#CMD ["sysctl", "-p"]

RUN /bin/bash -c 'chown -R sonarqube:0 $SONARQUBE_HOME && \
    chmod -R g+rw $SONARQUBE_HOME && \
    find $SONARQUBE_HOME -type d -exec chmod g+x {} + && \
    chmod 775 $SONARQUBE_HOME/bin/run.sh'

USER sonarqube

# If you need proxy... Otherwise delete...
RUN echo "http.proxyHost=s9l2074.gie.intra" >> /opt/sonarqube/conf/sonar.properties
RUN echo "http.proxyPort=3128"  >> /opt/sonarqube/conf/sonar.properties

USER 1001