logs
====

Logstash + Kibana + Elastic Search

Getting started:
- vagrant up
- vagrant ssh
- sh /home/vagrant/codeshare/scripts/elastic_install.sh
- sh /home/vagrant/codeshare/scripts/logstash_kibana_install.sh
- open /usr/share/nginx/html/kibana-latest/config.js Line 20 change port 9200 to 9220
- Point browser to http://localhost:4545/kibana-latest/index.html
- At this point you have Kibana running, but no log data is shown, lets run some sample data into elastic search with the help of logstash.
- Put sample data into codeshare/logs folder
- Navigate to the folder where logstash.jar exists and run sudo java -jar logstash.jar agent -f codeshare/config/logstash.conf, you might need to edit logstash.conf to point to your logs folder