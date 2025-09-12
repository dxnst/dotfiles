local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local wifi = sbar.add("item", "widgets.wifi", {
  position = "right",
  icon = {
    font = {
      style = settings.font.style_map["Bold"],
      size = 14.0,
    },
    padding_right = 4,
  },
  label = { drawing = false },
 })

local wifi_bracket = sbar.add("bracket", "widgets.wifi.bracket", {
  wifi.name,
}, {
  background = { color = colors.grey },
})

sbar.add("item", { position = "right", width = settings.group_paddings })

wifi:subscribe({"wifi_change", "system_woke"}, function(env)
  sbar.exec("ipconfig getifaddr en0", function(ip)
    local connected = not (ip == "")
    wifi:set({
      icon = {
        string = connected and icons.wifi.connected or icons.wifi.disconnected,
        color = connected and colors.frost or colors.magenta,
      },
    })
  end)
end)
