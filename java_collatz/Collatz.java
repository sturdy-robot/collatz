public class Main {
    public static void main(String[] args) {
        long start = System.currentTimeMillis();
        for (long seed = 1; seed <= 1_000_000_000; seed++) {
            long collatzResult = collatz(seed);
            if (seed % 1_000_000 == 0) {
                System.out.printf("Seed: %d Steps: %d\n", seed, collatzResult);
            }
        }

        long stop = System.currentTimeMillis();
        float timeElapsed = (float)(stop - start) / 1000.0f;

        System.out.println("Took " + timeElapsed + " seconds");
    }

    public static long collatz(long seed) {
        long steps = 0;
        while (seed > 1) {
            if (seed % 2 == 0) {
                seed /= 2;
            } else {  
                seed = seed * 3 + 1;
            }
            steps++;
        }

        return steps;
    }
}