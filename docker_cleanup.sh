#!/bin/bash
#
# The gitlab runner didn't clean up the already used images and terminated volumes according to this known BUG:
# https://gitlab.com/gitlab-org/gitlab-runner/issues/2980
# This script handle the clean up of these things.
#

sudo -s
docker rm $(docker ps -q -f status=exited)
docker volume rm $(docker volume ls -qf dangling=true)
docker rmi $(docker images --filter "dangling=true" -q --no-trunc)
