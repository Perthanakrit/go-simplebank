postgres:
	docker run --name simple-bank-postgres -p 5430:5432 -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -d postgres:latest
createdb:
	docker exec -it simple-bank-postgres createdb --username=myuser --owner=myuser simple_bank
dropdb:
	docker exec -it simple-bank-postgres dropdb simple_bank

migrateup:
	 migrate -path db/migration -database "postgresql://myuser:mypassword@localhost:5430/simple_bank?sslmode=disable" -verbose up

migratedown:
	 migrate -path db/migration -database "postgresql://myuser:mypassword@localhost:5430/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrationup migrationdown