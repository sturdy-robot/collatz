const std = @import("std");

fn collatz(seed: i64) i64 {
    var steps: i64 = 0;
    var n = seed;
    while (n > 1) : (steps += 1) {
        if (@rem(n, 2) == 0) {
            n = @divExact(n, 2);
        } else {
            n = (n * 3) + 1;
        }
    }
    return steps;
}

pub fn main() void {
    const start = @as(f64, @floatFromInt(std.time.milliTimestamp()));
    var seed: i64 = 1;
    while (seed <= 1_000_000_000) : (seed += 1) {
        const collatz_result = collatz(seed);
        if (@rem(seed, 1_000_000) == 0) {
            std.debug.print("Seed: {d} Steps: {d}\n", .{seed, collatz_result});
        }
    }
    const end = @as(f64, @floatFromInt(std.time.milliTimestamp()));
    const elapsed = @as(f64, @floatCast((end - start) / 1000.0));
    std.debug.print("Took {d:.6} seconds\n", .{elapsed});
}
