## Go migration

### Create database postgresql in docker
- Create a postgresql container
```bash
docker run --name simple_bank -e POSTGRES_USER=myuser -e POSTGRES_PASSWORD=mypassword -p 5430:5432 -d postgres:alpine
```
- Create a database
```bash
docker exec -it postgres createdb --username=myuser --owner=myuser simple_bank
```

### Create migration

```bash
migrate -path db/migration -database "postgresql://myuser:mypassword@localhost:5430/simple_bank?sslmode=disable" -verbose up
```


