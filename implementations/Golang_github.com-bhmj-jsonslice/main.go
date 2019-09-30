package main

import (
	"github.com/bhmj/jsonslice"
	"os"
	"io/ioutil"
	"fmt"
)

func main() {
	selector := os.Args[1]

	data, err := ioutil.ReadAll(os.Stdin)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}

	result, err := jsonslice.Get(data, selector)
	if err != nil {
		fmt.Fprintln(os.Stderr, err)
		os.Exit(1)
	}
	fmt.Print(string(result))
}
