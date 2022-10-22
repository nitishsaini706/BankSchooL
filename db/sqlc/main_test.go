package db

import (
	"database/sql"
	"log"
	"os"
	"testing"
)

var testQueries *Queries

const (
	DBDriver = "psotgres"
	DBSource = "postgresql://root:mysecretpasword@localhost:5432/simple_bank?sslmode=disable"
)

func TestMain(m *testing.M) {
	conn, err := sql.Open(DBDriver, DBSource)
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	testQueries = New(conn)

	os.Exit(m.Run())
}
