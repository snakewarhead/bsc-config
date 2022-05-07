#!/bin/bash

DIR_DATA="/wallet/bsc/data"

$DIR_DATA/stop.sh
echo -e "Starting \n"

$DIR_DATA/geth_linux --config $DIR_DATA/config.toml --datadir $DIR_DATA --diffsync --rpc.allow-unprotected-txs --txlookuplimit 0 >$DIR_DATA/stdout.txt 2>$DIR_DATA/stderr.txt &
echo $! >$DIR_DATA/node.pid

