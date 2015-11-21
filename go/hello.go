package main

import (
	"fmt"
)

// 独自の型を定義する
type ID int
type Priority int

func main() {
	fmt.Println("hello world")

	// Call ProcessTask
	id := 3
	priority := 5
	ProcessTask(id, priority)

	// Call ProcessTaskWithType
	var id2 ID = 3
	var priority2 Priority = 5
	ProcessTaskWithType(id2, priority2)

	// 構造体を定義する
	// ハッシュ内の最後のカンマも必須
	var task Task = Task{
		ID:     1,
		Detail: "buy the milk",
		done:   true,
	}

	fmt.Println(task.ID)
	fmt.Println(task.Detail)
	fmt.Println(task.done)
	fmt.Printf("%s\n", task)

	// 構造体の定義と同じ順番なら Key を省略できる
	var task2 Task = Task{
		1,
		"buy the milk",
		true,
	}

	fmt.Println(task2.ID)
	fmt.Println(task2.Detail)
	fmt.Println(task2.done)
	fmt.Printf("%s\n", task2)
}

func ProcessTask(id, priority int) {
	fmt.Println(id)
	fmt.Println(priority)
}

func ProcessTaskWithType(id ID, priority Priority) {
	// int ではなく独自の型で指定できる
	// 型の適合をコンパイル時に検出できるようになる
	fmt.Println(id)
	fmt.Println(priority)
}

type Task struct {
	// 大文字で始まると Public
	// 小文字で始まると Package
	ID     int
	Detail string
	done   bool
}

func (task Task) String() string {
	str := fmt.Sprintf("[%d] %s", task.ID, task.Detail)
	return str
}
