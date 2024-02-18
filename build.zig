const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const module = b.addModule("known-folders", .{
        .source_file = .{ .path = "known-folders.zig" },
    });

    try b.modules.put(b.dupe("known-folders"), module);

    const lib = b.addStaticLibrary(.{
        .name = "known-folders",
        // In this case the main source file is merely a path, however, in more
        // complicated build scripts, this could be a generated file.
        .root_source_file = .{ .path = "known-folders.zig" },
        .target = target,
        .optimize = optimize,
    });

    b.installArtifact(lib);
}
