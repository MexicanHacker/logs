cd ~
# download logstash
wget https://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar -O logstash.jar

sudo yum install nginx -y

wget https://download.elasticsearch.org/kibana/kibana/kibana-latest.tar.gz
tar -xf kibana-latest.tar.gz
rm kibana-latest.tar.gz
sudo mv kibana-latest/ /usr/share/nginx/html

sudo service nginx restart