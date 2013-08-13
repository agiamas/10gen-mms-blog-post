## bootstrap script for blog post
## assumes mongodb at path

BASE_DIR="~/data/mongodb/10gen-mms-blog-post"
DATA_DIR="$BASE_DIR""/data"
LOG_DIR="$BASE_DIR""/logs"
LOG_FILE="$LOG_DIR""/mongod.log"
#create data directory
#mkdir -p $DATA_DIR
#create log directory
#mkdir -p $LOG_DIR
echo $DATA_DIR
echo $LOG_DIR
#start up mongodb on background, pointing it to the data path 
#mongod --dbpath $DATA_DIR --logpath $LOG_FILE &

#start tailing the log file
tail -100f $LOG_FILE