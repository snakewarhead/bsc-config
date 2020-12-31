#!/bin/bash

DIR_DATA="/wallet/bsc/data"

RPC_ADDR="192.168.1.105"
RPC_PORT="7005"

LISTENNING_PORT=5432

$DIR_DATA/stop.sh
echo -e "Starting \n"

$DIR_DATA/geth_linux --config $DIR_DATA/config.toml --datadir $DIR_DATA --port $LISTENNING_PORT --rpc --rpcaddr $RPC_ADDR --rpcport $RPC_PORT -rpcapi personal,db,eth,net,web3 --allow-insecure-unlock >$DIR_DATA/stdout.txt 2>$DIR_DATA/stderr.txt &
echo $! >$DIR_DATA/node.pid
