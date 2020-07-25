#################################################################################
##                         Makefile GNU build-tool                             ##
#################################################################################
##  Usage:                                                                     ##
##            Simplifying docker-compose operations using Makefile             ##
##  NOTE:                                                                      ##
##            Make sure to run all make commands within the terminal,          ##
##            from Makefile path location                                      ##
##                         $ make <command-name>                               ##
#################################################################################
##  Contact:                                                                   ##
##        Author:      Jonathan Farber                                         ##
##        GitHub:      https://github.com/FortySix-NTwo                        ##
##        Twitter:     https://twitter.com/_JonathanFarber                     ##
##        LinkedIn:    https://www.linkedin.com/in/jonathan-farber-7197aa19    ##
##                                                                             ##
##          for more information regarding Makefile's,                         ##
##          please follow this link -> https://www.gnu.org/software/make/      ##
#################################################################################
# Constent Commands
name:=	fortysix-ntwo/grpc-api:1.0
MAKE_BUILD_DOCKER_IMAGE	:=	docker build -t $(IMAGE) -f Dockerfile .
MAKE_REMOVE_PREVIOUS_CONTAINERS	:=	docker-compose rm -fsv
MAKE_BUILD_CONTAINERS_AND_RUN	:=	docker-compose up --build
MAKE_STOP_RUNNING_CONTAINERS	:=	docker-compose stop
MAKE_SHOW_STOPED_CONTAINERS	:=	docker-compose ps -a
MAKE_RESTART_CONTAINERS	:=	docker-compose restart –no-build
MAKE_REMOVE_CONTAINERS	:=	docker-compose down -v
MAKE_BUILD_TEST_CONTAINERS_AND_RUN	:=	docker-compose -f docker-compose-test.yml up --build --exit-code-from test --abort-on-container-exit
MAKE_CLEAN_REMOVE_IMAGES	:=	-docker rmi `docker images -q -f dangling=true` --force
MAKE_CLEAN_REMOVE_DANGALING	:=	-docker volume rm `docker volume ls -f dangling=true -q`
MAKE_EXEC_PSQL	=	docker-compose -f docker-compose.yml exec users-db psql -U @POSTGRES_USER

# Makefile commands
# make up
up:
	echo "Spining-Up Containers"
	$(MAKE_BUILD_CONTAINERS_AND_RUN)
	$(MAKE_REMOVE_PREVIOUS_CONTAINERS)
	$(MAKE_BUILD_CONTAINERS_AND_RUN)
# make stop
stop:
	echo "Stoping Containers"
	$(MAKE_STOP_RUNNING_CONTAINERS)
	$(MAKE_SHOW_STOPED_CONTAINERS)
# make start
start:
	echo "Starting Containers"
	$(MAKE_RESTART_CONTAINERS)
	$(MAKE_SHOW_STOPED_CONTAINERS)
# make down
down:
	echo "Tearing-Down Containers"
	$(MAKE_REMOVE_CONTAINERS)
	make docker-clean
# make test
test:
	echo "Spining-Up Test Containers"
	$(MAKE_REMOVE_PREVIOUS_CONTAINERS)
	make docker-clean
	$(MAKE_BUILD_TEST_CONTAINERS_AND_RUN)
# make psql
psql:
	echo "Executing PostgreSQL Command-Line Interface"
	$(MAKE_EXEC_PSQL)
# make docker-clean
docker-clean:
	echo "Delete all untagged (i.e dangling <none>) images"
	$(MAKE_CLEAN_REMOVE_IMAGES)
	$(MAKE_CLEAN_REMOVE_DANGALING)
