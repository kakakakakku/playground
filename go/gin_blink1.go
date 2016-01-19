package main

import (
	"time"

	"github.com/gin-gonic/gin"
	"github.com/hink/go-blink1"
)

var blink, err = blink1.OpenNextDevice()

var redState = blink1.State{
	Red:      255,
	Green:    0,
	Blue:     0,
	Normal:   0,
	FadeTime: 2 * time.Second,
	Duration: 2 * time.Second,
}

var greenState = blink1.State{
	Red:      0,
	Green:    255,
	Blue:     0,
	Normal:   0,
	FadeTime: 2 * time.Second,
	Duration: 2 * time.Second,
}

var blueState = blink1.State{
	Red:      0,
	Green:    0,
	Blue:     255,
	Normal:   0,
	FadeTime: 2 * time.Second,
	Duration: 2 * time.Second,
}

var orangeState = blink1.State{
	Red:      243,
	Green:    152,
	Blue:     0,
	Normal:   0,
	FadeTime: 2 * time.Second,
	Duration: 2 * time.Second,
}

var purpleState = blink1.State{
	Red:      167,
	Green:    87,
	Blue:     168,
	Normal:   0,
	FadeTime: 2 * time.Second,
	Duration: 2 * time.Second,
}

func main() {
	r := gin.Default()

	r.GET("/ping", func(c *gin.Context) {
		c.String(200, "pong")
	})

	r.GET("/colors", func(c *gin.Context) {
		c.String(200, `/colors/red
/colors/green
/colors/blue
/colors/orange
/colors/purple`)
	})

	r.GET("/colors/red", func(c *gin.Context) {
		red()
		c.String(200, "")
	})

	r.GET("/colors/green", func(c *gin.Context) {
		green()
		c.String(200, "")
	})

	r.GET("/colors/blue", func(c *gin.Context) {
		blue()
		c.String(200, "")
	})

	r.GET("/colors/orange", func(c *gin.Context) {
		orange()
		c.String(200, "")
	})

	r.GET("/colors/purple", func(c *gin.Context) {
		purple()
		c.String(200, "")
	})

	r.Run(":8080")
}

func red() {
	pattern := &blink1.Pattern{
		Repeat:      0,
		RepeatDelay: 0,
		States: []blink1.State{
			redState,
			blink1.OffState,
		},
	}

	err = blink.RunPattern(pattern)
	if err != nil {
		panic(err)
	}
}

func green() {
	pattern := &blink1.Pattern{
		Repeat:      0,
		RepeatDelay: 0,
		States: []blink1.State{
			greenState,
			blink1.OffState,
		},
	}

	err = blink.RunPattern(pattern)
	if err != nil {
		panic(err)
	}
}

func blue() {
	pattern := &blink1.Pattern{
		Repeat:      0,
		RepeatDelay: 0,
		States: []blink1.State{
			blueState,
			blink1.OffState,
		},
	}

	err = blink.RunPattern(pattern)
	if err != nil {
		panic(err)
	}
}

func orange() {
	pattern := &blink1.Pattern{
		Repeat:      0,
		RepeatDelay: 0,
		States: []blink1.State{
			orangeState,
			blink1.OffState,
		},
	}

	err = blink.RunPattern(pattern)
	if err != nil {
		panic(err)
	}
}

func purple() {
	pattern := &blink1.Pattern{
		Repeat:      0,
		RepeatDelay: 0,
		States: []blink1.State{
			purpleState,
			blink1.OffState,
		},
	}

	err = blink.RunPattern(pattern)
	if err != nil {
		panic(err)
	}
}

// Close（呼んでないけど）
func close() {
	blink.Close()
}
