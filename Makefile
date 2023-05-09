COMMAND		=	docker compose

PATH		= /home/maxime/data

DOCKER_FILE	=	srcs/docker-compose.yml

all :	build

build :	
		mkdir -p /home/msainton/data/wordpress
		mkdir -p /home/msainton/data/proxy
		${COMMAND} -f srcs/docker-compose.yml build

up :	
		${COMMAND} -f srcs/docker-compose.yml up -d

clean :	${COMMAND} -f srcs/docker-compose.yml stop

fclean :	${COMMAND} -f srcs/docker-compose.yml stop
		docker system prune -a --force --volumes

re :		fclean build up