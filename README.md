# Collatz conjecture benchmarks

I recently saw a [thread](https://x.com/VictoriqueM/status/1803439917378277524) on Twitter about [Collatz conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture) tests in Java and Go. I decided to turn this into a programming languages benchmark competition. Might be a good exercise to try to optimize them in the future and see how far we can go with each language.

I chose a few programming languages I was most comfortable with (and others I hadn't really used before) just to see how they performed.

## Compilation orientations

I tried different approaches for every language, and tried to extract the best performance I could from each language in terms of compilation/interpretation.

- **C**: I used `gcc` and `clang` to see which one was faster. I used the `-O3` optimization level for both.
- **Java**: I used `java -server -XX:+TieredCompilation -XX:+OptimizeStringConcat Collatz.java` to compile the program. I can't find more levels of optimization, so if you know any way to optimize this even further, let me know.
- **Go**: I used `go build -ldflags="-s -w"`.
- **Python**: I ran with CPython and PyPy, just to see which one gave better results.
- **Rust**: I used `cargo run --release`.
- **Zig**: I used `zig build -Doptimize=ReleaseFast run`.

## Host system info

Tests were run in the following system:

- 8 × Intel® Core™ i7-7700HQ CPU @ 2.80GHz
- 31.2 GiB of RAM
- Linux 6.9.4-200.fc40.x86_64 x86_64 (Fedora 40)
- KDE Plasma 6.0.3
- NVIDIA GeForce GTX 1060/PCIe/SSE2
- X11

## Compiler/interpreter versions

- **GCC**: `gcc (GCC) 14.1.1 20240607 (Red Hat 14.1.1-5)`
- **Clang**: `clang version 18.1.6 (Fedora 18.1.6-3.fc40)`
- **Java**: `openjdk 21.0.3 2024-04-16 OpenJDK Runtime Environment (Red_Hat-21.0.3.0.9-1) (build 21.0.3+9) OpenJDK 64-Bit Server VM (Red_Hat-21.0.3.0.9-1) (build 21.0.3+9, mixed mode, sharing)`
- **Go**: `go1.22.4 linux/amd64` 
- **Rust**: `cargo 1.79.0 (ffa9cf99a 2024-06-03) rustc 1.79.0 (129f3b996 2024-06-10)`
- **Zig**: `0.13.0`
- **CPython**: `3.12.3`
- **PyPy**: `Python 3.10.13 (e771d98753f3, Mar 21 2024, 07:23:10) [PyPy 7.3.15 with GCC 14.0.1 20240217 (Red Hat 14.0.1-0)]`

## My results

I tried to be as fair as possible when running the tests. I did at least 5 runs for each implementation. I closed all other non-related tasks and left only one test running at a time to get the best results I could.

The following results represent the BEST time I got from each implementation.

- Clang: 188.731460s
- GCC: 284.562273s
- Rust: 181.007164461s
- Go: 343.290495614s
- Zig: 184.844000s 
- Java: 409.995s
- Python: Pending
- C#: Pending


| Position | Language         | Time (in seconds) |
| -------- | ---------------- | ----------------- |
| 1        | Rust             | 181.007164461      |
| 2        | Zig              | 184.844000        |
| 3        | C (Clang)        | 188.731460        |
| 4        | C (GCC)          | 284.562273        |
| 5        | Go               | 343.290495614     |
| 6        | Java             | 409.995           |


### Comments

#### Rust

I'm not surprised that Rust tops the list. I kind of expected Zig to take that position, but since I'm not a Zig programmer and I just quickly hacked my way to get something working in Zig, I guess that's just fair that Rust took that spot. Rust is a pretty fast programming language, and to be fair, the `cargo run` command, without optimizations, was actually pretty slow.

#### Zig

Initially, I was using the version of Zig that Fedora ships in dnf. It was version 0.11.0, and I was not aware that Zig 0.13.0 was already out. So I got an average time of around 240s for each run, which was putting Zig behind Clang. When I saw that I was running an old version of Zig, I downloaded the newer one and uninstalled 0.11.0. I had to recreate the `zig.build` file with the zig tool, and then run the program once more. On its first run, it got to 187.35 seconds, being faster than Clang, and very close to Rust. That's definitely very impressive that in just a few versions Zig managed to get even faster.

#### C

I was shocked by the difference between GCC and Clang in this benchmark. The same code, with the same level of optimization, managed to be roughly 100 seconds faster in Clang than in GCC. That's just wild!

#### Go

I sort of expected Go to be better placed here. I couldn't find many ways to optimize the compilation further. Perhaps some code optimizations could help Go in the benchmark here?

#### Java

Not surprised at all. I sort of knew Java would be way low in the table, I just didn't think it would be that slower compared to Go.


