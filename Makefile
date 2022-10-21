
postgres:
	docker run --name postgres12 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=mysecretpasword -d -p 5432:5432 postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:mysecretpasword@localhost:5432/simple_bank?sslmode=disable" -verbose up

migreatedown:	
	migrate -path db/migration -database "postgresql://root:mysecretpasword@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc: 
	docker run --rm -v ${pwd}:/src -w /src kjconroy/sqlc generate 


.PHONY:  postgres createdb dropdb migrateup migratedown sqlc