pub const c = @cImport({
    @cInclude("SDL3/SDL.h");
    @cInclude("SDL3_ttf/SDL_ttf.h");
    @cInclude("SDL3_image/SDL_image.h");
});

pub const anim = @import("anim.zig");
pub const raster = @import("raster.zig");
