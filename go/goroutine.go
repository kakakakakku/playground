package main

// "imported and not used" になるので未使用パッケージには _ を付ける
import (
	"fmt"
	"log"
	"net/http"
	"sync"
	_ "time"
)

func main() {
	wait := new(sync.WaitGroup)
	urls := []string{
		"http://example.com",
		"http://example.net",
		"http://example.org",
	}
	for _, url := range urls {
		// WaitGroup に追加
		wait.Add(1)
		// Get をゴルーチンで実行する
		go func(url string) {
			res, err := http.Get(url)
			if err != nil {
				log.Fatal(err)
			}
			defer res.Body.Close()
			fmt.Println(url, res.Status)
			wait.Done()
		}(url)
	}
	// main() が終わらないように1秒待つ
	// time.Sleep(time.Second)

	// WaitGroup で待つ
	wait.Wait()
}
