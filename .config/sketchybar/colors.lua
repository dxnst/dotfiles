return {
  black = 0xff2e3440,
  white = 0xffeceff4,
  red = 0xffbf616a,
  green = 0xffa3be8c,
  blue = 0xff5e81ac,
  yellow = 0xffebcb8b,
  orange = 0xffd08770,
  magenta = 0xffb48ead,
  frost = 0xff88c0d0,
  grey = 0xff3b4252,
  transparent = 0x00000000,

  bar = {
    bg = 0xff2e3440,
    border = 0xff2e3440,
  },
  popup = {
    bg = 0xc02e3440,
    border = 0xff2e3440,
  },
  bg1 = 0xff2e3440,
  bg2 = 0xff2e3440,

  with_alpha = function(color, alpha)
    if alpha > 1.0 or alpha < 0.0 then return color end
    return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
  end,
}
