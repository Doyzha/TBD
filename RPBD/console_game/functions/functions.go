package functions

import (
	"fmt"
	"math/rand"
	"syscall"
	"time"
)

type options struct {
	long   int64
	hp     int64
	honor  int64
	weight int64
}

func New(long, hp, honor, weight int64) *options {
	return &options{long, hp, honor, weight}
}

func (opt *options) day() {
	fmt.Println("\nВаши параметры:", "\nДлина норы =", opt.long, "\nЗдоровье =", opt.hp, "\nУважение =", opt.honor, "\nВес =", opt.weight)
	opt.win_lose()
	fmt.Println("\nНаступает день!\n\nЧем заняться сегодня: \n1 - Копать нору \n2 - Поесть травки \n3 - Пойти подраться \n4 - Поспать весь день\n ")
	var a int
	fmt.Scanln(&a)
	if a == 1 {
		opt.dig()
	} else if a == 2 {
		opt.grass()
	} else if a == 3 {
		opt.fight()
	} else if a == 4 {
		opt.sleep()
	} else {
		opt.day()
	}
}

func (opt *options) dig() {
	fmt.Println("\n1 - Копать нору Интенсивно \n2 - Копать нору Лениво\n ")
	var a int
	fmt.Scanln(&a)
	a = 1
	if a == 1 {
		opt.long += 5
		opt.hp -= 30
	} else if a == 2 {
		opt.long += 2
		opt.hp -= 10
	} else {
		opt.dig()
	}
	opt.win_lose()
	//night()
}

func (opt *options) grass() {
	fmt.Println("1 - Поесть травки Жухлой \n2 - Поесть травки Зеленой\n ")
	var a int
	fmt.Scanln(&a)
	if a == 1 {
		opt.hp += 10
		opt.weight += 15
	} else if a == 2 {
		if opt.honor < 30 {
			opt.hp -= 30
		} else {
			opt.hp += 30
			opt.weight += 30
		}
	} else {
		opt.grass()
	}
	opt.win_lose()
	//night()
}

func (opt *options) fight() {
	var enemy_weight, total_weight int64
	fmt.Println("\n1 - Со слабым существом \n2 - Со средним существом \n3 - С сильным существом\n ")
	var a int
	fmt.Scanln(&a)
	if a == 1 {
		enemy_weight = 30
	} else if a == 2 {
		enemy_weight = 50
	} else if a == 3 {
		enemy_weight = 70
	} else {
		opt.fight()
	}
	total_weight = enemy_weight + opt.weight
	rand.Seed(time.Now().UnixNano())
	var (
		chance_to_win float64 = float64(opt.weight) / float64(total_weight)
		random_chance float64 = rand.Float64()
	)
	if random_chance <= chance_to_win {
		fmt.Println("\nВы победили! Уважение получено!\n ")
		if enemy_weight-opt.weight/2 < 0 {
			opt.honor += 5
		} else {
			opt.honor += enemy_weight - opt.weight/2
		}
	} else {
		fmt.Println("\nВы проиграли! Теряй здоровье!\n ")
		if enemy_weight-opt.weight/2 < 0 {
			opt.hp -= 5
		} else {
			opt.hp -= enemy_weight - opt.weight/2
		}
	}
	opt.win_lose()
	//night()
}

func (opt *options) sleep() {
	fmt.Println("\nВы решили проспать весь день.")
	opt.long -= 2
	opt.hp += 20
	opt.honor -= 2
	opt.weight -= 5
	opt.win_lose()
	//night()
}

func (opt *options) night() {
	fmt.Println("\nВаши параметры в конце дня:", "\nДлина норы =", opt.long, "\nЗдоровье =", opt.hp, "\nУважение =", opt.honor, "\nВес =", opt.weight)
	fmt.Println("\nНаступает ночь!")
	opt.long -= 2
	opt.hp += 20
	opt.honor -= 2
	opt.weight -= 5
	opt.win_lose()
	//day()
}

func (opt *options) win_lose() {
	if opt.honor >= 100 {
		fmt.Println("\nУра! Победа!")
		syscall.Exit(0)
	} else if opt.long <= 0 || opt.hp <= 0 || opt.honor <= 0 || opt.weight <= 0 {
		fmt.Println("\nYOU DIED или ВЫ УМЕРЛИ")
		syscall.Exit(0)
	}
}
