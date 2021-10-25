!/bin/bash
set -e
set -x

virtualenv -p python3 .
source ./bin/activate

wget https://storage.googleapis.com/local-implicit-grids/pretrained_ckpt.zip
unzip  pretrained_ckpt.zip && rm pretrained_ckpt.zip

mkdir -p demo_data
wget https://cs.uwaterloo.ca/~c2batty/bunny_watertight.obj
mv -f bunny_watertight.obj demo_data
