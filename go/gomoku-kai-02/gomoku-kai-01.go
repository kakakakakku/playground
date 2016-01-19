package main

import (
	"fmt"
	"strings"
)

// 中心点を定義する
var center = 4

//    *
//   ***
//  *****
// *******
//  *****
//   ***
//    *
func main() {
	// 上4段
	for i := 1; i <= 7; i++ {
		if i%2 == 1 {
			// 奇数
			outLine(i)
		}
	}

	// 下3段
	for i := 5; i >= 1; i-- {
		if i%2 == 1 {
			// 奇数
			outLine(i)
		}
	}
}

func outLine(i int) {
	// 中心点までの空白の数と出力文字の数を計算して出力する
	fmt.Printf("%s%s\n", strings.Repeat(" ", center-i/2), strings.Repeat("*", i))
}
