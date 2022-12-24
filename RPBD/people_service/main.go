package main

import (
	"fmt"

	"github.com/Doyzha/TBD/tree/people_service/RPBD/people_service/service/store"
)

func main() {
	conn := "postgresql://doizha:ablbhektn@95.217.232.188:7777/doizha"
	s := store.NewStore(conn)
	fmt.Println(s.ListPeople())
	fmt.Println(s.GetPeopleByID(3))
}
