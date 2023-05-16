DOCKER_PATH	=	/home/msainton/data
COMMAND	=	docker compose

all		: build up

build :
	mkdir -p $(DOCKER_PATH)/wordpress
	mkdir -p $(DOCKER_PATH)/mariadb
	$(COMMAND) -f srcs/docker-compose.yml build

up		:
	$(COMMAND) -f srcs/docker-compose.yml up -d

stop	:
	$(COMMAND) -f srcs/docker-compose.yml stop wordpress nginx mariadb

clean: stop
	docker system prune -a --force

fclean: stop
	sudo rm -rf ${DOCKER_PATH}
	docker system prune -a --force --volumes
	docker volume rm -f mariadb wordpress

re : fclean all

.PHONY: all re down clean fclean
