shell:
	docker-compose exec -u ${UID}:${UID} php sh

up:
	docker-compose up --build -d --remove-orphans

down:
	docker-compose down --remove-orphans
