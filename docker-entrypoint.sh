#!/bin/bash

set -e
# Exit on fail

cd src

exec "$@"
# Finally call command issued to the docker service
