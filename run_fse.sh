#! /bin/sh
set -e
set -x

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

pushd $SCRIPTPATH

apt install python3-pip
apt-get install wget

make requirements

wget https://storage.googleapis.com/local-implicit-grids/pretrained_ckpt.zip
unzip  pretrained_ckpt.zip && rm pretrained_ckpt.zip

mkdir -p demo_data
wget https://cs.uwaterloo.ca/~c2batty/bunny_watertight.obj
mv -f bunny_watertight.obj demo_data

make run

popd

make test
