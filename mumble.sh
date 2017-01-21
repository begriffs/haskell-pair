echo "-----> Installing mumble chat server"
apt-get install mumble-server debconf-utils

echo "-----> Configuring mumble chat server"
debconf-set-selections <<EOF
mumble-server   mumble-server/password          password  mumblepair
mumble-server   mumble-server/use_capabilities  boolean   true
mumble-server   mumble-server/start_daemon      boolean   true
EOF

cp /vagrant/config/mumble-server.ini /etc
service mumble-server restart
