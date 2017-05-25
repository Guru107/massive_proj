#!/bin/bash

cd proxy

echo "========== Starting Nginx ==========="

sh run.sh

cd ../app1

echo "========== Starting App1 ==========="

sh run.sh

cd ../app2

echo "========== Starting App2 ==========="

sh run.sh
