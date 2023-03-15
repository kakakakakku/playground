package main

import (
	"testing"
	"testing/fstest"
)

func TestCount(t *testing.T) {
	t.Run("File does not exist.", func(t *testing.T) {
		fs := fstest.MapFS{}
		want := 0
		got, _ := countFiles(fs)
		assertCount(t, got, want)
	})

	t.Run("One file exists.", func(t *testing.T) {
		fs := fstest.MapFS{
			"helloworld.md": {Data: []byte("helloworld")},
		}
		want := 1
		got, _ := countFiles(fs)
		assertCount(t, got, want)
	})

	t.Run("Two files exist.", func(t *testing.T) {
		fs := fstest.MapFS{
			"helloworld.md":  {Data: []byte("helloworld")},
			"helloworld2.md": {Data: []byte("helloworld2")},
		}
		want := 2
		got, _ := countFiles(fs)
		assertCount(t, got, want)
	})
}

func assertCount(t *testing.T, got, want int) {
	t.Helper()
	if got != want {
		t.Errorf("got %d, want %d", want, got)
	}
}
