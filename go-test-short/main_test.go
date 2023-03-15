package main

import (
	"testing"
)

func TestCase1(t *testing.T) {
	got := 1
	want := 1
	if got != want {
		t.Errorf("got %d, want %d", want, got)
	}
}

func TestCase2(t *testing.T) {
	if testing.Short() {
		t.SkipNow()
		// t.Skip("it skipped")
		// t.Skipf("it skipped because `testing.Short()` is %t", testing.Short())
	}
	got := 1
	want := 1
	if got != want {
		t.Errorf("got %d, want %d", want, got)
	}
}
