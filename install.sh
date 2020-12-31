set -e

CONFIG_HOME=/wallet/bsc/data
DIR_DATA=/wallet/bsc/data
REMOTE=https://github.com/snakewarhead/bsc-config.git

mkdir -p "$CONFIG_HOME"
git clone "$REMOTE" "$CONFIG_HOME"

cd "$CONFIG_HOME"

wget $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep geth_linux |cut -d\" -f4) && chmod +x geth_linux
#wget $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep mainnet |cut -d\" -f4) && unzip mainnet.zip
#wget $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest |grep browser_ |grep testnet |cut -d\" -f4) && unzip testnet.zip

$DIR_DATA/geth_linux --datadir $DIR_DATA init $DIR_DATA/genesis.json

echo "install success"
