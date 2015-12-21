package main

import (
	"fmt"
	"strings"
)

//     *
//    **
//   ***
//  ****
// *****
func main() {
	for i := 1; i <= 5; i++ {
		fmt.Printf("%5s\n", strings.Repeat("*", i))
	}
}
