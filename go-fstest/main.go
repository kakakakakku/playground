package main

import (
	"fmt"
	"io/fs"
	"os"
)

func countFiles(fsys fs.FS) (int, error) {
	files, err := fs.ReadDir(fsys, ".")
	if err != nil {
		return 0, err
	}
	return len(files), nil
}

func main() {
	count, err := countFiles(os.DirFS("files"))
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(count)
}
