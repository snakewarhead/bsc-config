#!/bin/bash

DIR_DATA="/wallet/bsc/data"

RPC_ADDR="192.168.1.105"
RPC_PORT="7005"

LISTENNING_PORT=30301

$DIR_DATA/stop.sh
echo -e "Starting \n"

$DIR_DATA/geth_linux -targetgaslimit 429496729500 --datadir $DIR_DATA --port $LISTENNING_PORT --rpc --rpcaddr $RPC_ADDR --rpcport $RPC_PORT -rpcapi "personal,db,eth,net,web3" --allow-insecure-unlock -networkid 2016 -maxpeers 5 -rpccorsdomain "*" console

echo $! >$DIR_DATA/node.pid
