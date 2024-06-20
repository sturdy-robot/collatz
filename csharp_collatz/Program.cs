using System.Diagnostics;

internal class Program
{
    static long Collatz(long seed)
    {
        long steps = 0;
        long n = seed;
        while (n > 1)
        {
            if (n % 2 == 0)
            {
                n /= 2;
            }
            else
            {
                n = (n * 3) + 1;
            }
            steps++;
        }
        return steps;
    }

    static void Main()
    {
        Stopwatch stopwatch = new Stopwatch();
        stopwatch.Start();

        for (long seed = 1; seed <= 1_000_000_000L; seed++)
        {
            long collatzResult = Collatz(seed);
            if (seed % 1_000_000L == 0)
            {
                Console.WriteLine($"Seed: {seed} Steps: {collatzResult}");
            }
        }

        stopwatch.Stop();
        double elapsedSeconds = stopwatch.Elapsed.TotalSeconds;
        Console.WriteLine($"Took {elapsedSeconds} seconds");
    }
}
