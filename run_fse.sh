#! /bin/bash
set -e
set -x

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

export PYTHONPATH="$PWD:$PYTHONPATH"

pushd $SCRIPTPATH

apt install python3-pip
apt-get install wget
apt install unzip

make requirements

wget https://storage.googleapis.com/local-implicit-grids/pretrained_ckpt.zip
unzip  pretrained_ckpt.zip && rm pretrained_ckpt.zip

wget http://storage.googleapis.com/local-implicit-grids/demo_data.zip
unzip demo_data.zip; rm demo_data.zip

mkdir -p demo_data
wget https://cs.uwaterloo.ca/~c2batty/bunny_watertight.obj
mv -f bunny_watertight.obj demo_data

make run

popd

make test
