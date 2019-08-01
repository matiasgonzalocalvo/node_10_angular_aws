FROM node:10
MAINTAINER Matias Calvo matiasgonzalocalvo@gmail.com

ENV USER fravega

#Install gcc para sam
# Add a dedicated jenkins system user
RUN useradd --system --shell /bin/bash --create-home --home /home/${USER} ${USER}
# install dependency
RUN apt update && apt install -y curl nodejs software-properties-common python-dev python-pip
RUN npm install -y npm@latest -g && npm install -g @angular/cli
RUN pip install awscli
#RUN apt-cache search terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/0.11.3/terraform_0.11.3_linux_amd64.zip \
  && unzip terraform_0.11.3_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.11.3_linux_amd64.zip
#Upgrade pip
ENV HOME /home/${USER}
WORKDIR ${HOME}
USER ${USER}

