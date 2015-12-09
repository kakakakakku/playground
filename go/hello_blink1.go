package main

import (
	"github.com/hink/go-blink1"
	"time"
)

func main() {

	blink, err := blink1.OpenNextDevice()
	if err != nil {
		panic(err)
	}

	// 赤ステート
	redState := blink1.State{
		Red:      255,
		Green:    0,
		Blue:     0,
		Normal:   0,
		FadeTime: 2 * time.Second,
		Duration: 2 * time.Second,
	}

	// 緑ステート
	greenState := blink1.State{
		Red:      0,
		Green:    255,
		Blue:     0,
		Normal:   0,
		FadeTime: 2 * time.Second,
		Duration: 2 * time.Second,
	}

	// 青ステート
	blueState := blink1.State{
		Red:      0,
		Green:    0,
		Blue:     255,
		Normal:   0,
		FadeTime: 2 * time.Second,
		Duration: 2 * time.Second,
	}

	// オレンジステート
	orangeState := blink1.State{
		Red:      243,
		Green:    152,
		Blue:     0,
		Normal:   0,
		FadeTime: 2 * time.Second,
		Duration: 2 * time.Second,
	}

	// 紫ステート
	purpleState := blink1.State{
		Red:      167,
		Green:    87,
		Blue:     168,
		Normal:   0,
		FadeTime: 2 * time.Second,
		Duration: 2 * time.Second,
	}

	// 各ステートを連続で光らせる
	// ステートごとに消灯するために `OffState` を設定している
	pattern := &blink1.Pattern{
		Repeat:      1,
		RepeatDelay: 0,
		States: []blink1.State{
			redState,
			blink1.OffState,
			greenState,
			blink1.OffState,
			blueState,
			blink1.OffState,
			orangeState,
			blink1.OffState,
			purpleState,
			blink1.OffState,
		},
	}

	err = blink.RunPattern(pattern)
	if err != nil {
		panic(err)
	}
	blink.Close()

}
