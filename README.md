# bsc-config

## geth

download from `https://github.com/binance-chain/bsc/releases`

## path tree

```
mkdir -p /wallet/bsc/data
```

## install config

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/snakewarhead/bsc-config/master/install.sh)"
```

## Sync From Snapshot (Recommended)

1. `nohup -cO geth.tar.lz4 "<paste snapshot URL here?" &`, or use aria2c `aria2c -o geth.tar.lz4 -x 4 -s 12 "URL TO ASIA ENDPOINT" "URL TO EU ENDPOINT" "URL TO US ENDPOINT"`

1. `sudo apt install liblz4-tool` and `nohup tar -I lz4 -xvf geth.tar.lz4 --strip-components=2 &`

## crontab

```bash
*/10 * * * * /wallet/bsc/data/checkrunning.sh
0 6 * * * /wallet/bsc/data/start.sh
```

## cmd

cli
```bash
./cli.sh account new
./cli.sh account list

```

console
```bash
personal.unlockAccount(personal.listAccounts[0])

# eth.resend(tx, optional gas price, optional gas limit)
eth.resend(eth.pendingTransactions[0], web3.toWei(20, 'gwei'))
```

rpc
```bash
curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"personal_unlockAccount","params":["0xfbdd4f9a9b04eb35bce49bcb55615502bc9f5f58","123456"],"id":1}'

curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x0", false],"id":1}'

curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'

curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0xde0096fea35c538dcfe7cddacfd808cba596deb0", "latest"],"id":1}'

curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["0x4C0552", "0x0"],"id":1}'

curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"eth_getTransactionByHash","params":["0x2e486c610ac9a9d85279d8e1390ac0f9434aaf0356d47b2c29319d71fc941fc7"],"id":1}'

curl -X POST -H 'Content-Type: application/json' -i 'http://localhost:7000' --data '{"jsonrpc":"2.0","method":"eth_getTransactionReceipt","params":["0xf1d7fa887340b90aeb5aeeeef71ec0efc99e3c5bbb34a809fcd033f6562205e0"],"id":1}'
```
