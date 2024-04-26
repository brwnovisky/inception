all: hosts volumes fix up

fix:
	sudo apt -y purge "^virtualbox-.*"
	sudo apt -y autoremove
	sudo apt -y install docker-compose-plugin

hosts:
	@bash ./requirements/tools/hosts.sh

volumes:
	@sudo mkdir -p /home/bluiz-al/data/wordpress
	@sudo docker volume create --driver local --opt type=none --opt device=/home/bluiz-al/data/wordpress --opt o=bind wordpress
	@sudo mkdir -p /home/bluiz-al/data/mariadb
	@sudo docker volume create --driver local --opt type=none --opt device=/home/bluiz-al/data/mariadb --opt o=bind mariadb
	@sudo mkdir -p /home/bluiz-al/data/static
	@sudo docker volume create --driver local --opt type=none --opt device=/home/bluiz-al/data/static --opt o=bind static

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

inspec:
	docker exec -it wordpress /bin/bash

clean:
	@docker volume rm mariadb
	@docker volume rm wordpress
	@docker volume rm static
	@sudo rm -rf /home/bluiz-al/data/mariadb
	@sudo rm -rf /home/bluiz-al/data/wordpress
	@sudo rm -rf /home/bluiz-al/data/static

fclean: clean
	docker builder prune -f

re: down fclean all
