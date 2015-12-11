package main

import (
	"bufio"
	"fmt"
	"os"
)

func main() {
	filePath := "color_codes.txt"

	f, err := os.Open(filePath)
	if err != nil {
		fmt.Println(err)
		os.Exit(2)
	}

	lines := ReadFile(f)
	fmt.Println(lines)

	f.Close()
}

func ReadFile(f *os.File) []string {
	lines := []string{}
	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}
	return lines
}
