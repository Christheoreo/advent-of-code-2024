const std = @import("std");
const ArrayList = std.ArrayList;

const input = @embedFile("./input.txt");
const part1example = @embedFile("./part1example.txt");
const part2example = @embedFile("./part2example.txt");

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

pub fn main() !void {
    const part1Answer = solvePartOne(input);
    std.debug.print("Part 1  = {any}.\n", .{part1Answer});
    const part2Answer = solvePartTwo(input);
    std.debug.print("Part 2  = {any}.\n", .{part2Answer});
}

pub fn solvePartOne(data: []const u8) !u32 {
    var lines = std.mem.split(u8, data, "\n");
    const allocator = std.heap.page_allocator;

    var currentPos: Point = Point{ .x = 0, .y = 0 };

    var grid = ArrayList([]const u8).init(allocator);
    defer grid.deinit();
    var lineIndex: i32 = 0;
    while (lines.next()) |line| {
        defer lineIndex += 1;
        try grid.append(line);
        var index: u32 = 0;
        while (index < line.len) : (index += 1) {
            if (line[index] == '^') {
                const xx: i32 = @intCast(index);
                const yy: i32 = @intCast(lineIndex);
                currentPos = Point{ .x = xx, .y = yy };
            }
        }
    }

    var unique_points = std.AutoHashMap(Point, u32).init(allocator);
    defer unique_points.deinit();

    var inGrid: bool = true;

    const Direction = enum { north, south, east, west };
    // find the startingPos
    var direction = Direction.north;

    const totalRows: usize = grid.items.len;
    const totalCols: usize = grid.items[0].len;
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
            inGrid = false;
            break;
        }
        const xx: usize = @intCast(nextPos.x);
        const yy: usize = @intCast(nextPos.y);
        const b = grid.items[yy][xx];

        if (b != '#') {
            currentPos = nextPos;
            try unique_points.put(nextPos, 0);
            continue;
        }

        switch (direction) {
            Direction.north => {
                direction = Direction.east;
            },
            Direction.east => {
                direction = Direction.south;
            },
            Direction.south => {
                direction = Direction.west;
            },
            else => {
                direction = Direction.north;
            },
        }
    }

    return unique_points.count();
}

pub fn solvePartTwo(data: []const u8) !u32 {
    // My theory
    // run through everyone once, and capture and direction your going with the x, y Points
    // then go around and start adding an obstacle, and work out if it intercepts a point going in the same direction, if SO then that casues an infinite lock!
    var lines = std.mem.split(u8, data, "\n");
    const allocator = std.heap.page_allocator;

    var currentPos: Point = Point{ .x = 0, .y = 0 };

    var grid = ArrayList([]const u8).init(allocator);
    defer grid.deinit();
    var lineIndex: i32 = 0;
    while (lines.next()) |line| {
        defer lineIndex += 1;
        try grid.append(line);
        var index: u32 = 0;
        while (index < line.len) : (index += 1) {
            if (line[index] == '^') {
                const xx: i32 = @intCast(index);
                const yy: i32 = @intCast(lineIndex);
                currentPos = Point{ .x = xx, .y = yy };
            }
        }
    }

    var unique_points = std.AutoHashMap(Point, u32).init(allocator);
    defer unique_points.deinit();

    var inGrid: bool = true;

    const Direction = enum { north, south, east, west };
    // find the startingPos
    var direction = Direction.north;

    const totalRows: usize = grid.items.len;
    const totalCols: usize = grid.items[0].len;
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
            inGrid = false;
            break;
        }
        const xx: usize = @intCast(nextPos.x);
        const yy: usize = @intCast(nextPos.y);
        const b = grid.items[yy][xx];

        if (b != '#') {
            currentPos = nextPos;
            try unique_points.put(nextPos, 0);
            continue;
        }

        switch (direction) {
            Direction.north => {
                direction = Direction.east;
            },
            Direction.east => {
                direction = Direction.south;
            },
            Direction.south => {
                direction = Direction.west;
            },
            else => {
                direction = Direction.north;
            },
        }
    }

    return unique_points.count();
}

test "solve part one" {
    const expected: u32 = 41;

    const actual = solvePartOne(part1example);

    try std.testing.expectEqual(expected, actual);
}

test "solve part two" {
    const expected: u32 = 10;

    const actual = solvePartTwo(part2example);

    try std.testing.expectEqual(expected, actual);
}
