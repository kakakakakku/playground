package main

import (
	"fmt"
	"net/http"
	"strconv"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		n := r.FormValue("n")
		i, _ := strconv.Atoi(n)
		fmt.Fprint(w, fizzbuzz(i))
	})

	http.ListenAndServe("localhost:4000", nil)
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
