include .env
export
pwd=$(shell pwd)

run:
	#docker container run --name $(NAME) -d -p 8888:80 -v $(pwd):/usr/share/nginx/html nginx:alpine
	docker-compose up -d
up:
	#docker container run --name $(NAME) -d -p 8888:80 -v $(pwd):/usr/share/nginx/html nginx:alpine
	docker-compose up -d
down:
	docker-compose down

start:
	#docker start $(NAME)
	docker-compose start
stop:
	#docker stop $(NAME)
	docker-compose stop
ps:
	docker ps --all

logs:
	docker-compose logs -f

build:
	docker-compose build
