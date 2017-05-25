#!/bin/bash

cd web_modules

echo "========== Starting build of node modules of web modules ==========="

sh build-node-modules.sh

echo "========== Build of Node modules of web modules complete ==========="

echo "========== Starting build of code of web modules ==========="

sh build-code.sh

echo "========== Build of Code of web modules complete ==========="

cd ../proxy

echo "========== Starting build of nginx ==========="

sh build-nginx.sh

echo "========== Build of nginx complete ==========="

cd ../app1

echo "========== Starting build of node modules of App1 ==========="

sh build-node-modules.sh

echo "========== Build of Node modules of App1 complete ==========="

echo "========== Starting build of code of App1 ==========="

sh build-code.sh

echo "========== Build of Code of App1 complete ==========="

cd ../app2

echo "========== Starting build of node modules of App2 ==========="

sh build-node-modules.sh

echo "========== Build of Node modules of App2 complete ==========="

echo "========== Starting build of code of App2 ==========="

sh build-code.sh

echo "========== Build of Code of App2 complete ==========="

echo "========== Build Complete ==========="