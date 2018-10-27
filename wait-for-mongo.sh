#!/bin/sh

: ${MONGODB_HOST:=mongo}
: ${MONGODB_PORT:=27017}

until nc -z $MONGODB_HOST $MONGODB_PORT
do
    echo "Waiting for Mongo ($MONGODB_HOST:$MONGODB_PORT) to start..."
    sleep 0.5
done

eval $*
