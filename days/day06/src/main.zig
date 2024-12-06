const std = @import("std");
const ArrayList = std.ArrayList;

const input = @embedFile("./input.txt");
const part1example = @embedFile("./part1example.txt");
const part2example = @embedFile("./part2example.txt");

pub fn main() !void {
    const part1Answer = solvePartOne(input);
    // const part1Answer = solvePartOne(part1example);
    std.debug.print("Part 1  = {any}.\n", .{part1Answer});
    // const part2Answer = solvePartTwo(input);
    // std.debug.print("Part 2  = {any}.\n", .{part2Answer});
}

pub fn solvePartOne(data: []const u8) !u32 {
    var lines = std.mem.split(u8, data, "\n");
    const allocator = std.heap.page_allocator;

    const Point = struct {
        const Self = @This();
        x: i32,
        y: i32,

        // Custom hash function for Point
        fn hash(self: Self) i32 {
            // XOR the x and y coordinates to create a hash value
            return self.x ^ self.y;
        }

        // Custom equality function for Point
        fn eq(self: Self, other: Self) bool {
            return self.x == other.x and self.y == other.y;
        }
    };
    var currentPos: Point = Point{ .x = 0, .y = 0 };

    var grid = ArrayList([]const u8).init(allocator);
    defer grid.deinit();
    var lineIndex: i32 = 0;
    while (lines.next()) |line| {
        defer lineIndex += 1;
        try grid.append(line);
        // var length = line.len;
        // var buffer = try allocator.alloc(u8, length);
        // defer allocator.free(buffer);
        var index: u32 = 0;
        while (index < line.len) : (index += 1) {
            if (line[index] == '^') {
                const xx: i32 = @intCast(index);
                const yy: i32 = @intCast(lineIndex);
                currentPos = Point{ .x = xx, .y = yy };
            }
        }
        // std.debug.print("Line = {s}\n", .{line});
    }

    // var positions = ArrayList(Point).init(allocator);
    // defer positions.deinit();
    var unique_points = std.AutoHashMap(Point, u32).init(allocator);
    defer unique_points.deinit();

    var inGrid: bool = true;

    // var map = std.AutoHashMap([]u8, u32).init(
    //     allocator,
    // );
    // defer map.deinit();
    const Direction = enum { north, south, east, west };
    // find the startingPos
    var direction = Direction.north;

    const totalRows: usize = grid.items.len;
    const totalCols: usize = grid.items[0].len;
    // const key = std.fmt.format("{any},{any}", .{ currentPos.x, currentPos.y });
    // const x: u8 = @intCast(currentPos.x);
    // const y: u8 = @intCast(currentPos.y);
    // var key = [_]u8{ x, ',', y };
    // try map.put(key[0..], 1);
    try unique_points.put(currentPos, 0);

    while (inGrid) {
        var nextPos: Point = Point{ .x = 0, .y = 0 };
        switch (direction) {
            Direction.north => {
                //
                nextPos = Point{ .x = currentPos.x, .y = currentPos.y - 1 };
            },
            Direction.east => {
                //
                nextPos = Point{ .x = currentPos.x + 1, .y = currentPos.y };
            },
            Direction.south => {
                //
                nextPos = Point{ .x = currentPos.x, .y = currentPos.y + 1 };
            },
            else => {
                //
                nextPos = Point{ .x = currentPos.x - 1, .y = currentPos.y };
            },
        }

        // is it in bounds?

        if (nextPos.x < 0 or nextPos.x >= totalCols or nextPos.y < 0 or nextPos.y >= totalRows) {
            std.debug.print("Breaking at x {any}, y {any}\n", .{ nextPos.x, nextPos.y });
            inGrid = false;
            break;
        }

        // it is in bounds
        // const k = std.fmt.format("{any},{any}", .{ nextPos.x, nextPos.y });
        // const xx: u8 = @intCast(nextPos.x);
        // const yy: u8 = @intCast(nextPos.y);
        // var k = [_]u8{ xx, ',', yy };
        // if (!map.contains((k[0..]))) {
        //     try map.put(k[0..], 1);
        //     // try map.put(k, 1);
        // }
        const xx: usize = @intCast(nextPos.x);
        const yy: usize = @intCast(nextPos.y);
        const b = grid.items[yy][xx];

        if (b != '#') {
            std.debug.print("Morning {any} from {any},{any} to {any},{any}\n", .{ direction, currentPos.x, currentPos.y, nextPos.x, nextPos.y });
            currentPos = nextPos;
            try unique_points.put(nextPos, 0);
            continue;
        }

        switch (direction) {
            Direction.north => {
                //
                std.debug.print("Turning right from {any} to {any}\n", .{ direction, Direction.east });
                direction = Direction.east;
            },
            Direction.east => {
                std.debug.print("Turning right from {any} to {any}\n", .{ direction, Direction.south });
                direction = Direction.south;
            },
            Direction.south => {
                //
                std.debug.print("Turning right from {any} to {any}\n", .{ direction, Direction.west });
                direction = Direction.west;
            },
            else => {
                //
                std.debug.print("Turning right from {any} to {any}\n", .{ direction, Direction.north });
                direction = Direction.north;
            },
        }
    }

    // std.debug.print("Line = {c}\n", .{grid.items[0][4]});

    return unique_points.count();
}

pub fn solvePartTwo(data: []const u8) !u32 {
    _ = data;
    return 1;
}

test "solve part one" {
    const expected: u32 = 41;

    const actual = solvePartOne(part1example);

    try std.testing.expectEqual(expected, actual);
}

// test "solve part two" {
//     const expected: u32 = 10;

//     const actual = solvePartTwo(part2example);

//     try std.testing.expectEqual(expected, actual);
// }
