package main

import (
	"fmt"
	"log"
	"net/http"
)

type Hello struct{}

// `Hello` 型が `http.Handler` インタフェースを実装している
func (h Hello) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello!")
	fmt.Println(r)
}

func main() {
	var h Hello
	err := http.ListenAndServe("localhost:4000", h)
	if err != nil {
		log.Fatal(err)
	}
}
