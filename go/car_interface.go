package main

import (
	"fmt"
	"strconv"
)

// Car インターフェース
type Car interface {
	run(int) string
	stop()
}

// MyCar 構造体
// 明示的に Car を implement する必要はなく要件を満たしていれば良い
// ダッグタイピング？
type MyCar struct {
	name  string
	speed int
}

func (u *MyCar) run(speed int) string {
	u.speed = speed
	return strconv.Itoa(speed) + "kmで走ります"
}

func (u *MyCar) stop() {
	fmt.Println("停止します")
	u.speed = 0
}

// 50kmで走ります
// 停止します
func main() {
	myCar := &MyCar{name: "マイカー", speed: 0}

	var i Car = myCar
	fmt.Println(i.run(50))
	i.stop()
}
