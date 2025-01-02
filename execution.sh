#!/bin/bash

container_id=$(docker run -v .:/app/ -it --name dr_container -d dr_py_base python dr_model_prediction_faster_record_rain_AWS.py)
echo $container_id
# sleep 5

pid=$(docker exec $container_id pgrep -f dr_model_prediction_faster_record_rain_AWS.py)
tail --pid=$pid -f /dev/null

docker stop $container_id
docker rm $container_id