include .env
export
pwd=$(shell pwd)

run:
	#docker container run --name $(NAME) -d -p 8888:80 -v $(pwd):/usr/share/nginx/html nginx:alpine
	@if [ ! -e $(IP_ADDRESS).crt ]; then \
		./generate_key.sh; \
		sudo mkdir -p $(GITLAB_CONFIG)/ssl; \
		sudo cp $(IP_ADDRESS).crt $(GITLAB_CONFIG)/ssl; \
	fi	
	docker-compose up -d

up: run
	#docker container run --name $(NAME) -d -p 8888:80 -v $(pwd):/usr/share/nginx/html nginx:alpine

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
