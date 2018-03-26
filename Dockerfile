FROM ubuntu

MAINTAINER The Other Person <dev@theotherperson.com>

# Get Apache
RUN apt-get update
RUN apt-get install -y apache2
RUN a2enmod rewrite

# Get PHP
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y software-properties-common
RUN apt-get install -y  python-software-properties
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php5.6
RUN apt-get install -y  php-pear php5.6-curl php5.6-dev php5.6-gd php5.6-mbstring php5.6-zip php5.6-mysql php5.6-xml libapache2-mod-php5.6
RUN update-alternatives --set php /usr/bin/php5.6

# Get cURL, git, Node.js/NPM, sendmail
RUN apt-get install -y curl sendmail
RUN chmod 0777 /usr/local/bin
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install -y git
RUN apt-get install -y nodejs npm

# Get Phantomjs
RUN apt-get update
RUN apt-get install build-essential chrpath libssl-dev libxft-dev -y
RUN apt-get install libfreetype6 libfreetype6-dev -y
RUN apt-get install libfontconfig1 libfontconfig1-dev -y
RUN cd ~
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN tar xvjf phantomjs-2.1.1-linux-x86_64.tar.bz2
RUN mv phantomjs-2.1.1-linux-x86_64 /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin
