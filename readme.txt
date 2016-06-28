To use this framework to connect to sql server, you have to make sure you've already install FreeTDS & tiny_tds
tiny_tds could be included in gemfile, but make sure before install tiny_tds, please install FreeTDS first

install FreeTDS
1. download freetds-0.91 (this is the version used currently) and unzipped
2. switch to the directory and execute:
./configure --prefix=/usr/local/freetds
make
sudo make install

Directories&files:

Gemfile # could use it for easily managing libararies

