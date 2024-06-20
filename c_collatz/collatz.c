#include <stdio.h>
#include <time.h>

long collatz(long seed) {
    long steps = 0;
    long n = seed;
    while (n > 1) {
        if (n % 2 == 0) {
            n /= 2;
        } else {
            n = (n * 3) + 1;
        }
        steps++;
    }
    return steps;
}

int main() {
    clock_t start = clock();
    for (long seed = 1; seed <= 1000000000L; seed++) {
        long collatz_result = collatz(seed);
        if (seed % 1000000L == 0) {
            printf("Seed: %ld Steps: %ld\n", seed, collatz_result);
        }
    }
    clock_t end = clock();
    double elapsed = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Took %f seconds", elapsed);
    return 0;
}