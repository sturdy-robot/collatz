package main

import (
	"fmt"
	"time"
)

func collatz(seed int64) int {
	var steps = 0
	for seed > 1 {
		if seed % 2 == 0 {
			seed /= 2
		} else {
			seed = 3 * seed + 1
		}
		steps++
	}

	return steps
}

func main() {
	start := time.Now()
	var seed int64

	for seed = 1; seed <= 1_000_000_000; seed++ {
		var steps = collatz(seed)
		if seed % 1_000_000 == 0 {
			fmt.Println("Seed:", seed, "Steps:", steps)
		}
	}
	fmt.Println("Took", time.Since(start).Seconds(), "seconds")
}