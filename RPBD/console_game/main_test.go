package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

var long_n, hp_n, honor_n, weight_n = 0, 0, 0, 0

func TestNight(t *testing.T) { //Ночь
	long, hp, honor, weight = 10, 100, 20, 30
	night()
	long_n, hp_n, honor_n, weight_n = 8, 120, 18, 25
	assert.Equal(t, long, long_n)
	assert.Equal(t, hp, hp_n)
	assert.Equal(t, honor, honor_n)
	assert.Equal(t, weight, weight_n)
}

func TestSleep(t *testing.T) { //Сон днём
	long, hp, honor, weight = 10, 100, 20, 30
	sleep()
	long_n, hp_n, honor_n, weight_n = 8, 120, 18, 25
	assert.Equal(t, long, long_n)
	assert.Equal(t, hp, hp_n)
	assert.Equal(t, honor, honor_n)
	assert.Equal(t, weight, weight_n)
}

func TestWin_lose(t *testing.T) { //Победа
	long, hp, honor, weight = 10, 100, 100, 30
	win_lose()
	long_n, hp_n, honor_n, weight_n = 10, 100, 100, 30
	assert.Equal(t, long, long_n)
	assert.Equal(t, hp, hp_n)
	assert.Equal(t, honor, honor_n)
	assert.Equal(t, weight, weight_n)
}

func TestLose(t *testing.T) { //Поражение
	long, hp, honor, weight = 0, 100, 80, 30
	win_lose()
	long_n, hp_n, honor_n, weight_n = 0, 100, 80, 30
	assert.Equal(t, long, long_n)
	assert.Equal(t, hp, hp_n)
	assert.Equal(t, honor, honor_n)
	assert.Equal(t, weight, weight_n)
}
