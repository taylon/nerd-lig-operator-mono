FROM ubuntu:19.10

RUN mkdir operator-mono
WORKDIR operator-mono

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update
RUN apt-get install -y software-properties-common 
RUN add-apt-repository ppa:fontforge/fontforge
RUN apt-get update

RUN apt-get install -y fonttools git npm fontforge python-fontforge python-configparser curl

RUN git clone https://github.com/kiliman/operator-mono-lig.git
RUN mkdir ./operator-mono-lig/build
RUN cd ./operator-mono-lig && npm install

RUN curl -Lo nerd-fonts.tar.gz https://github.com/ryanoasis/nerd-fonts/archive/v2.0.0.tar.gz
RUN mkdir nerd-fonts && tar -xf nerd-fonts.tar.gz -C nerd-fonts --strip-components 1
RUN rm -f nerd-fonts.tar.gz

ENV INPUT=/operator-mono/operator-mono-lig/original 
ENV OUTPUT=/operator-mono/operator-mono-lig/build

CMD ["./build.sh"]
