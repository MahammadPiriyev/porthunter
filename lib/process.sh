#!/usr/bin/env bash

kill_process() {
    PORT=$1

    PIDS=$(lsof -ti :$PORT)

    if [ -z "$PIDS" ]; then
        echo "No process found on port $PORT"
        exit 0
    fi

    echo "Processes on port $PORT:"
    ps -p $PIDS

    read -p "Kill these processes? (y/n): " confirm

    if [[ "$confirm" == "y" ]]; then
        kill -9 $PIDS
        echo "Killed processes on port $PORT"
    else
        echo "Cancelled"
    fi
}

case "$1" in
    kill)
        kill_process "$2"
        ;;
esac