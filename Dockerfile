FROM jenkins/jenkins:lts-jdk11

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"
# # Delay for CasC + disable install wizard
# ENV JAVA_OPTS="-Dio.jenkins.plugins.casc.ConfigurationAsCode.initialDelay=9000 -Djenkins.install.runSetupWizard=false"

# # JCasC Plugin pointer to config/secret values
# ENV SECRETS="/var/jenkins_home/"

# Add Jenkins init files
COPY src/ /usr/share/jenkins/ref/

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# install tools
# USER root

USER jenkins
