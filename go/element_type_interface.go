package main

import (
	"fmt"
)

// Element で空インターフェイスを定義する
type Element interface{}

func main() {
	// string を代入する
	var element Element = "hello"

	// 型をチェックする
	// `value, ok = element.(T)` で `ok` に `true` が返る
	if value, ok := element.(int); ok {
		fmt.Println("int value:%d", value)
	} else if value, ok := element.(string); ok {
		fmt.Println("string value:%d", value)
	} else {
		fmt.Println("other")
	}

	// switch 文を使うパターンでもチェックできる
	// `element.(type) で現在の型が返る
	switch value := element.(type) {
	case int:
		fmt.Println("int value:%d", value)
	case string:
		fmt.Println("string value:%d", value)
	default:
		fmt.Println("other")
	}
}
