#!/bin/bash


set -e
set -x

mkdir release

export NVM_DIR="/usr/local/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


source ./env.sh
done=$( env_detect )
if ! $done
then
    nvm use --delete-prefix v8.10.0 --slient
    npm cache clean -f
    npm -v
    #npm config set registry http://registry.npm.pt.mi.com
    npm config set registry https://registry.npm.taobao.org
fi

npm install --no-optional

npm run build

cp -r deploy dist/* release/
