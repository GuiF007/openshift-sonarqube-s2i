# Sonarqube image

This is based on the [official SonarQube image](https://github.com/SonarSource/docker-sonarqube) but it's compatible with Openshift permission policy.

## Deployment on Openshift

For example, if you want to deploy the version 7.7-community on Openshift in a cicd project, you can run:

```sh
oc project cicd
version=7.7-community
# Build the new image based on the imported image
oc new-build https://github.com/GuiF007/openshift-sonarqube-s2i.git \
    --strategy=docker \
    --to=sonarqube-ocp:7.7-community \
    --name=sonarqube-ocp
# Create the SonarQube deployment with PostgreSQL
oc new-app -f https://raw.githubusercontent.com/GuiF007/openshift-sonarqube-s2i/master/openshift/sonarqube-postgresql-template.yml -p SONARQUBE_VERSION=${version} -p POSTGRESQL_PASSWORD=sonar
```

Reference: https://github.com/arnaud-deprez/sonarqube-docker.git