if [ ! -d "/usr/share/nginx/html/kibana-latest" ]; then
    wget https://download.elasticsearch.org/kibana/kibana/kibana-latest.tar.gz
    tar -xf kibana-latest.tar.gz
    rm kibana-latest.tar.gz
    sudo mv kibana-latest/ /usr/share/nginx/html
    sudo service nginx restart
fi