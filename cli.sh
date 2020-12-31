#!/bin/bash

DIR_DATA="/wallet/bsc/data"

$DIR_DATA/geth_linux --datadir $DIR_DATA "$@"
