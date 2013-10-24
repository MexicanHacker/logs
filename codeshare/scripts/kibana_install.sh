if [ ! -d "/usr/share/nginx/html/kibana-latest" ]; then
    echo "Downloading and installing Kibana."
    wget https://download.elasticsearch.org/kibana/kibana/kibana-latest.tar.gz -q
    tar -xf kibana-latest.tar.gz
    rm kibana-latest.tar.gz
    sudo mv kibana-latest/ /usr/share/nginx/html
    sudo service nginx restart
fi