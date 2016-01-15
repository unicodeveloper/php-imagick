#!/bin/bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get install pkg-config libmagickwand-dev -y
cd /tmp
wget http://pecl.php.net/get/imagick-3.4.0RC2.tgz
tar xvzf imagick-3.4.0RC2.tgz
cd imagick-3.4.0RC2
phpize
./configure
make install
rm -rf /tmp/imagick-3.4.0RC2*
echo extension=imagick.so >> /etc/php/7.0/cli/php.ini
service php7.0-fpm restart
service nginx restart
