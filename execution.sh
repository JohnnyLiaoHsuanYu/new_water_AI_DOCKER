#!/bin/bash

IMAGE_NAME="dr_py_base"
CONTAINER_NAME="dr_container"
PYTHON_SCRIPT="dr_model_prediction_faster_record_rain_AWS.py"

# check if the image exists
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    echo "Docker image '$IMAGE_NAME' not found. Building Docker image..."
    docker build -t $IMAGE_NAME image/py
else
    echo "Docker image '$IMAGE_NAME' already exists."
fi

# execute the container & the python script
echo "Starting Docker container..."
container_id=$(docker run -v .:/app/ -it --name $CONTAINER_NAME -d $IMAGE_NAME python $PYTHON_SCRIPT)

echo "Container ID: $container_id"

# wait 
# pid=$(docker exec $container_id pgrep -f $PYTHON_SCRIPT)
# echo "Python script PID: $pid"
# tail --pid=$pid -f /dev/null
docker wait $container_id

# remove the container
echo "Stopping and removing container..."
docker stop $container_id
docker rm $container_id