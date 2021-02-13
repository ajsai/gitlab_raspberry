include .env
export
pwd=$(shell pwd)

run:
	@if [ ! -e $(IP_ADDRESS).crt ]; then \
		./generate_key.sh; \
		sudo mkdir -p $(GITLAB_CONFIG)/ssl; \
		sudo cp $(IP_ADDRESS).crt $(GITLAB_CONFIG)/ssl; \
		sudo cp $(IP_ADDRESS).key $(GITLAB_CONFIG)/ssl; \
	fi	
	docker-compose up -d

run-x64:
	@if [ ! -e $(IP_ADDRESS).crt ]; then \
		./generate_key.sh; \
		sudo mkdir -p $(GITLAB_CONFIG)/ssl; \
		sudo cp $(IP_ADDRESS).crt $(GITLAB_CONFIG)/ssl; \
	fi	
	docker-compose -f docker-compose-x64.yml up -d

up: run

up-x64: run-x64

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
