FROM ubuntu:latest
WORKDIR /
RUN apt update && apt upgrade -y && apt install -y git maven sudo
RUN git clone https://github.com/neonblu/qortal-docker pre && cd pre && chmod +x go.sh && echo
EXPOSE 12388
CMD ./pre/go.sh
