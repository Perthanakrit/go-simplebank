postgres:
	docker run --name postgres -p 5430:5432 -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -d postgres:latest
createdb:
	docker exec -it postgres createdb --username=myuser --owner=myuser simple_bank
dropdb:
	docker exec -it postgres dropdb simple_bank

migrationup:
	 migrate -path db/migration -database "postgresql://myuser:mypassword@localhost:5430/simple_bank?sslmode=disable" -verbose up

migrationdown:
	 migrate -path db/migration -database "postgresql://myuser:mypassword@localhost:5430/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrationup migrationdown