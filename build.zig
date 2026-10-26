const std = @import("std");

const Translator = @import("translate_c").Translator;

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const sdls_include_path = b.option([]const u8, "sdls_include_path", "Path to directory containing SDL3, SDL3_ttf and SDL3_image include directories");

    const translate_c = b.dependency("translate_c", .{});

    const translator: Translator = .init(translate_c, .{
        .c_source_file = b.path("src/c.h"),
        .target = target,
        .optimize = optimize,
    });

    const mod = b.addModule("anim_popup", .{
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{
                .name = "c",
                .module = translator.mod,
            },
        },
    });

    if (sdls_include_path) |include| {
        mod.addIncludePath(.{ .cwd_relative = include });
    }

    mod.addImport("anim_popup", mod);
}
