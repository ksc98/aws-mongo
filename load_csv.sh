
if [ "$1" == "-h" ] || [ $# -eq 0 ]
    then
        echo "No arguments provided."
        echo "Usage: \$1 -> name of database"
        echo "       \$2 -> name of collection"
        echo "       \$3 -> csv file"
        echo "       \$4 -> local port"
        exit 0
    else
        mongoimport --type csv -d $1 -c $2 --headerline --drop $3 --port $4
fi

