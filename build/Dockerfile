FROM ubuntu:latest
WORKDIR /
RUN apt update && apt install -y git curl sudo
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt upgrade -y && sudo apt install -y nodejs yarn maven zip unzip
RUN git clone https://github.com/neonblu/qortal-docker pre && cd pre && chmod +x go.sh && echo yeet2
EXPOSE 12388
EXPOSE 12392
EXPOSE 12399
EXPOSE 12391
CMD ./pre/go.sh
