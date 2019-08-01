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
#Upgrade pip
ENV HOME /home/${USER}
WORKDIR ${HOME}
USER ${USER}

