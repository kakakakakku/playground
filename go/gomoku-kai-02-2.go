package main

import (
	"fmt"
	"strconv"
)

// FizzBuzz を defer を使って上の値からスタックして panic 後に出力する
// 特に意味は無いなぁ
func main() {
	loop := 30

	defer func() {
		if r := recover(); r != nil {
			fmt.Println("リカバー！", r)
		}
	}()

	for i := loop; i >= 1; i-- {
		defer fmt.Println(fizzbuzz(i))
	}

	panic("")
}

func fizzbuzz(i int) string {
	if i%3 == 0 && i%5 == 0 {
		return "Fizz Buzz"
	} else if i%3 == 0 {
		return "Fizz"
	} else if i%5 == 0 {
		return "Buzz"
	} else {
		return strconv.Itoa(i)
	}
}
