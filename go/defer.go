package main

import (
	"fmt"
)

func main() {
	// === Start sample1() ===
	// 3
	// 0
	// === Start sample2() ===
	// 0
	// 1
	// 2
	// 3
	// 4
	// Defer :  4
	// Defer :  3
	// Defer :  2
	// Defer :  1
	// Defer :  0
	// === Start sample3() ===
	// 4
	sample1()
	sample2()
	i := sample3()
	fmt.Println(i)
}

func sample1() {
	// `defer` は評価時の値を保持するため `0` のまま出力される
	fmt.Println("=== Start sample1() ===")
	i := 0
	defer fmt.Println(i)
	i++
	i++
	i++
	fmt.Println(i)
	return
}

func sample2() {
	// `defer` は複数をスタックすることができ、LIFO で返ってくる
	fmt.Println("=== Start sample2() ===")
	for i := 0; i < 5; i++ {
		fmt.Println(i)
		defer fmt.Println("Defer : ", i)
	}
}

func sample3() (i int) {
	// `defer` で返り値 i に対してインクリメントが行われるため、`4` が返る
	fmt.Println("=== Start sample3() ===")
	defer func() {
		i++
		i++
		i++
	}()
	return 1
}
