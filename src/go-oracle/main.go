package main

import (
	"database/sql"
	"fmt"

	_ "github.com/mattn/go-oci8"
)

func main() {
	db, err := sql.Open("oci8", "scott/tiger@localhost:1521/orcl")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer db.Close()

	rows, err := db.Query("select sysdate from dual")
	if err != nil {
		fmt.Println(err)
		return
	}
	defer rows.Close()

	var sysdate string
	for rows.Next() {
		_ = rows.Scan(&sysdate)
	}
	fmt.Printf("Sysdate is: %s\n", sysdate)
}
