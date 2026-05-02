#!/usr/bin/env bash

suggest_ports() {
    echo "Free ports:"

    START=3000
    END=9000
    COUNT=5
    found=0

    for ((port=START; port<=END; port++)); do
        if ! lsof -i :$port >/dev/null 2>&1; then
            echo "- $port"
            ((found++))
        fi

        if [ "$found" -ge "$COUNT" ]; then
            break
        fi
    done
}

check_port() {
    PORT=$1

    if lsof -i :$PORT >/dev/null 2>&1; then
        PROCESS=$(lsof -ti :$PORT | xargs ps -p | tail -n 1)
        echo "❌ Port $PORT is BUSY"
        echo "$PROCESS"
    else
        echo "✅ Port $PORT is FREE"
    fi
}

case "$1" in
    suggest)
        suggest_ports
        ;;
    check)
        check_port "$2"
        ;;
esac