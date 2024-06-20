import time


def collatz(seed: int) -> int:
    steps = 0
    while seed > 1:
        if seed % 2 == 0:
            seed /= 2
        else:
            seed = (3 * seed) + 1
        steps += 1
    
    return steps


def main():
    start = time.time()
    for seed in range(1, 1_000_000_001):
        steps = collatz(seed)
        if (seed % 1_000_000 == 0):
            print(f"Seed {seed} Steps: {steps}")
    
    stop = time.time()
    elapsed = stop - start
    print(f"Took {elapsed} seconds")


if __name__ == '__main__':
    main()
