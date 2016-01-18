package main

import (
	"fmt"
	"strings"
)

func main() {
	center := 4

	for i := 1; i <= 7; i++ {
		if i%2 == 1 {
			fmt.Printf("%s%s\n", strings.Repeat(" ", center-i/2), strings.Repeat("*", i))
		}
	}

	for i := 5; i >= 1; i-- {
		if i%2 == 1 {
			fmt.Printf("%s%s\n", strings.Repeat(" ", center-i/2), strings.Repeat("*", i))
		}
	}

}
