DOCKER_PATH	=	/home/msainton/data
COMMAND	=	docker compose

all		: build up

build :
	mkdir -p $(DOCKER_PATH)/wordpress
	mkdir -p $(DOCKER_PATH)/mariadb
	$(COMMAND) -f srcs/docker-compose.yml build

up		:
	$(COMMAND) -f srcs/docker-compose.yml up -d

clean:
	docker system prune -a --volumes
	docker rm -vf wordpress nginx
	docker rmi -f wordpress nginx

fclean: clean
	sudo rm -rf ${DOCKER_PATH}

re : fclean all

.PHONY: all re down clean fclean