up () {
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

    sudo apt-get update

    sudo apt-get install -y mongodb-mongosh

    mongosh $MDB_CONNECTION_STRING;
}

case $1 in
  up)
    up
    ;;
  *)
    echo "Usage: $0 {up}"
    ;;
esac