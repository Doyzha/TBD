package main

import (
	"github.com/Doyzha/TBD/tree/console_game-2/RPBD/console_game/functions"
)

func main() {

	options := functions.New(10, 100, 20, 30)

	for {
		options.day()
		options.night()
	}

}
