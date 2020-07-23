THIS_FILE := $(lastword $(MAKEFILE_LIST))
IMAGE := mfortysix-ntwo/grpc-api:1.0
MAKE_BUILD_DOCKER_IMAGE := docker build -t $(IMAGE) -f Dockerfile .
MAKE_REMOVE_PREVIOUS_CONTAINERS := docker-compose rm -fsv
MAKE_BUILD_CONTAINERS_AND_RUN := docker-compose up --build
MAKE_STOP_RUNNING_CONTAINERS  := docker-compose stop
MAKE_SHOW_STOPED_CONTAINERS := docker-compose ps -a
MAKE_RESTART_CONTAINERS := docker-compose restart –no-build
MAKE_REMOVE_CONTAINERS := docker-compose down -v
MAKE_CLEAN_DOCKER := make docker-clean
MAKE_BUILD_TEST_CONTAINERS_AND_RUN := docker-compose -f docker-compose-test.yml up --build --exit-code-from test --abort-on-container-exit
MAKE_CLEAN_REMOVE_IMAGES := -docker rmi `docker images -q -f dangling=true` --force
MAKE_CLEAN_REMOVE_DANGALING := -docker volume rm `docker volume ls -f dangling=true -q`
.PHONY: up stop start down test docker-clean help
help:
    make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
up:
        echo "Spining-Up Containers"
        $(MAKE_BUILD_CONTAINERS_AND_RUN)
        $(MAKE_REMOVE_PREVIOUS_CONTAINERS)
        $(MAKE_BUILD_CONTAINERS_AND_RUN)
stop:
        echo "Stoping Containers"
        $(MAKE_STOP_RUNNING_CONTAINERS)
        $(MAKE_SHOW_STOPED_CONTAINERS)
start:
        echo "Starting Containers"
        $(MAKE_RESTART_CONTAINERS)
        $(MAKE_SHOW_STOPED_CONTAINERS)
down:
        echo "Tearing-Down Containers"
        $(MAKE_REMOVE_CONTAINERS)
        $(MAKE_CLEAN_DOCKER)
test:
        echo "Spining-Up Test Containers"
        $(MAKE_REMOVE_PREVIOUS_CONTAINERS)
        $(MAKE_CLEAN_DOCKER)
        $(MAKE_BUILD_TEST_CONTAINERS_AND_RUN)
docker-clean:
        echo "Delete all untagged (i.e dangling <none>) images"
        $(MAKE_CLEAN_REMOVE_IMAGES)
        $(MAKE_CLEAN_REMOVE_DANGALING)
