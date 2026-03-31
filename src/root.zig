pub const c = @cImport({
    @cInclude("SDL3/SDL.h");
});

pub const anim = @import("anim.zig");
pub const raster = @import("raster.zig");
