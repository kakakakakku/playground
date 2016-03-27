package main

import (
	"fmt"
	"time"

	"github.com/jinzhu/now"
	"github.com/leekchan/timeutil"
)

func main() {
	n := time.Now()

	// 標準ライブラリでフォーマットする
	fmt.Println(n)                               // 2016-03-25 19:05:54.785208 +0900 JST
	fmt.Println(n.Format("2006-01-02"))          // 2016-03-25
	fmt.Println(n.Format("2006-01-02 15:04:05")) // 2016-03-25 19:05:54
	fmt.Println(n.Format(time.ANSIC))            // Fri Mar 25 19:05:54 2016
	fmt.Println(n.Format(time.RubyDate))         // Fri Mar 25 19:05:54 +0900 2016
	fmt.Println(n.Format(time.RFC3339))          // 2016-03-25T19:05:54+09:00

	// timeutil を使ってフォーマットする
	fmt.Println(timeutil.Strftime(&n, "%Y-%m-%d"))             // 2016-03-25
	fmt.Println(timeutil.Strftime(&n, "%a %b %d %H:%M:%S %Y")) // Fri Mar 25 19:05:54 2016

	// now を使って日付計算をする
	// 普通に変数名で `now` を使ってると名前解決ができないため、気を付ける必要がありそう
	fmt.Println(now.BeginningOfMonth()) // 2016-03-01 00:00:00 +0900 JST
	fmt.Println(now.EndOfMonth())       // 2016-03-31 23:59:59.999999999 +0900 JST
}
