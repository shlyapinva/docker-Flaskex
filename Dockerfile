FROM ubuntu:latest

LABEL maintainer="shlyapinva@mail.ru"

ARG USER=ubuntu

RUN useradd -m ${USER} && \
    apt-get update -yq && \
    apt-get install -yq python3-pip git && \
    apt-get clean && \
    rm -rf \
      /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/*

USER ${USER}

WORKDIR /home/${USER}
      
RUN git clone https://github.com/anfederico/Flaskex &&\
    cd Flaskex && \
    pip3 install -r requirements.txt

CMD  cd Flaskex && python3 app.py

EXPOSE 5000
