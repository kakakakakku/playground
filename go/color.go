package main

import (
	"fmt"
	"strconv"
)

func main() {
	code := "3B5998"
	r, g, b := ConvertColorCodeToRGB(code)
	fmt.Println(code, ":", r, g, b)
}

// カラーコード（例えば `3B5998`）を入力すると
// RGB ごとに10進数に変換した整数（例えば `59` `89` `152`）を多値で返す
func ConvertColorCodeToRGB(code string) (int64, int64, int64) {
	r, _ := strconv.ParseInt(code[0:2], 16, 64)
	g, _ := strconv.ParseInt(code[2:4], 16, 64)
	b, _ := strconv.ParseInt(code[4:6], 16, 64)
	return r, g, b
}
