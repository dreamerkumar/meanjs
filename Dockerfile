FROM ubuntu:latest
MAINTAINER Matt Koski <connectwithvkumar@gmail.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list

RUN apt-get update 

RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node

RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node
RUN chmod 777 -R /Development

RUN npm install -g yo bower grunt-cli generator-meanjs@0.1.12 express

# RUN curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

EXPOSE 80:80
EXPOSE 443:443
EXPOSE 3000:3000



RUN echo "\n##############################\n1. Create a new user with adduser, 'su' into that user.\n2. 'yo meanjs' to scaffold your app in the current directory.\n3. Start mongo in the background (e.g. 'mongod &')\n##############################\n"

RUN echo "Changing current directory to Development"
RUN cd /Development
RUN echo "Getting latest file from the repo"
RUN git clone https://github.com/dreamerkumar/meanjs.git
RUN echo "Navigating to the meanjs directory"
RUN cd meanjs
RUN echo "Running npm install"
RUN npm install
RUN echo "Running grunt build" 
RUN grunt build
RUN NODE_ENV=production grunt