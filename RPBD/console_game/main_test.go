package main

import (
	"testing"

	"github.com/Doyzha/TBD/tree/console_game-2/RPBD/console_game/functions"
	"github.com/stretchr/testify/assert"
)

func TestNight(t *testing.T) { //Ночь
	Hero := functions.New(10, 100, 20, 30)
	Hero.night()
	New_Hero := functions.New(8, 120, 18, 25)
	assert.Equal(t, Hero, New_Hero)
}

func TestSleep(t *testing.T) { //Сон днём
	Hero := functions.New(10, 100, 20, 30)
	Hero.sleep()
	New_Hero := functions.New(8, 120, 18, 25)
	assert.Equal(t, Hero, New_Hero)
}

func TestWin_lose(t *testing.T) { //Победа
	Hero := functions.New(10, 100, 100, 30)
	Hero.win_lose()
	New_Hero := functions.New(10, 100, 100, 30)
	assert.Equal(t, Hero, New_Hero)
}

func TestLose(t *testing.T) { //Поражение
	Hero := functions.New(0, 100, 80, 30)
	Hero.win_lose()
	long_n, hp_n, honor_n, weight_n = 0, 100, 80, 30
	assert.Equal(t, Hero, New_Hero)
}
