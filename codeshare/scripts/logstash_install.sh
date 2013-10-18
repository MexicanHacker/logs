if [ ! -f /home/vagrant/codeshare/logstash/logstash-1.2.1-flatjar.jar ]; then
    wget https://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar
    sudo mv logstash-1.2.1-flatjar.jar /home/vagrant/codeshare/logstash/
fi