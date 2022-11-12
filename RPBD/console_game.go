package main

import (
	"fmt"
	"math/rand"
	"syscall"
	"time"
)

var long, hp, honor, weight = 10, 100, 20, 30
var a, enemy_weight, total_weight int

func main() {
	fmt.Println("\nВаши параметры:", "\nДлина норы =", long, "\nЗдоровье =", hp, "\nУважение =", honor, "\nВес =", weight)
	win_lose()
	fmt.Println("\nНаступает день!\n\nЧем заняться сегодня: \n1 - Копать нору \n2 - Поесть травки \n3 - Пойти подраться \n4 - Поспать весь день\n ")
	fmt.Scanln(&a)
	if a == 1 {
		dig(a)
	} else if a == 2 {
		grass(a)
	} else if a == 3 {
		fight(a)
	} else if a == 4 {
		sleep()
	} else {
		main()
	}
}

func dig(a int) {
	fmt.Println("\n1 - Копать нору Интенсивно \n2 - Копать нору Лениво\n ")
	fmt.Scanln(&a)
	if a == 1 {
		long += 5
		hp -= 30
	} else if a == 2 {
		long += 2
		hp -= 10
	} else {
		dig(a)
	}
	win_lose()
	night()
}

func grass(a int) {
	fmt.Println("1 - Поесть травки Жухлой \n2 - Поесть травки Зеленой\n ")
	fmt.Scanln(&a)
	if a == 1 {
		hp += 10
		weight += 15
	} else if a == 2 {
		if honor < 30 {
			hp -= 30
		} else {
			hp += 30
			weight += 30
		}
	} else {
		grass(a)
	}
	win_lose()
	night()
}

func fight(a int) {
	fmt.Println("\n1 - Со слабым существом \n2 - Со средним существом \n3 - С сильным существом\n ")
	fmt.Scanln(&a)
	if a == 1 {
		enemy_weight = 30
	} else if a == 2 {
		enemy_weight = 50
	} else if a == 3 {
		enemy_weight = 70
	} else {
		fight(a)
	}
	total_weight = enemy_weight + weight
	rand.Seed(time.Now().UnixNano())
	var (
		chance_to_win float64 = float64(weight) / float64(total_weight)
		random_chance float64 = rand.Float64()
	)
	if random_chance <= chance_to_win {
		fmt.Println("\nВы победили! Уважение получено!\n ")
		if enemy_weight-weight/2 < 0 {
			honor += 5
		} else {
			honor += enemy_weight - weight/2
		}
	} else {
		fmt.Println("\nВы проиграли! Теряй здоровье!\n ")
		if enemy_weight-weight/2 < 0 {
			hp -= 5
		} else {
			hp -= enemy_weight - weight/2
		}
	}
	win_lose()
	night()
}

func sleep() {
	fmt.Println("\nВы решили проспать весь день.")
	long -= 2
	hp += 20
	honor -= 2
	weight -= 5
	win_lose()
	night()
}

func night() {
	fmt.Println("\nВаши параметры в конце дня:", "\nДлина норы =", long, "\nЗдоровье =", hp, "\nУважение =", honor, "\nВес =", weight)
	fmt.Println("\nНаступает ночь!")
	long -= 2
	hp += 20
	honor -= 2
	weight -= 5
	win_lose()
	main()
}

func win_lose() {
	if honor >= 100 {
		fmt.Println("\nУра! Победа!")
		syscall.Exit(0)
	} else if long <= 0 || hp <= 0 || honor <= 0 || weight <= 0 {
		fmt.Println("\nYOU DIED или ВЫ УМЕРЛИ")
		syscall.Exit(0)
	}
}

