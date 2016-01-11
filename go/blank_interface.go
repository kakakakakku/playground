package main

import (
	"fmt"
)

func main() {
	// 空インターフェースを定義する
	var x interface{}

	// 空インタフェースにはどんな型も代入できる
	// int の場合
	num := 0
	x = num
	fmt.Println(x)

	// string の場合
	str := "hello"
	x = str
	fmt.Println(x)
}
