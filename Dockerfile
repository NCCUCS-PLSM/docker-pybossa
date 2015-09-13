FROM nccucsplsm/plsm-base

RUN rm /etc/service/sshd/down
RUN apt-get update
RUN apt-get install --yes git-core postgresql-server-dev-all libpq-dev python-psycopg2 python-dev build-essential libjpeg-dev libssl-dev swig libffi-dev python-setuptools
RUN easy_install pip

RUN git clone --recursive https://github.com/PyBossa/pybossa /pybossa
WORKDIR pybossa

RUN pip install -U pip
RUN pip install -r ./requirements.txt

EXPOSE 5000
