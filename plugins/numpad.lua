local keymap = require "core.keymap"

local numpad_map = {
  ["keypad 7"] = "home",
  ["keypad 8"] = "up",
  ["keypad 9"] = "pageup",
  ["keypad 4"] = "left",
  ["keypad 6"] = "right",
  ["keypad 1"] = "end",
  ["keypad 2"] = "down",
  ["keypad 3"] = "pagedown",
  ["keypad 0"] = "insert",
  ["keypad ."] = "delete",
}

local fix_numpad_map = {
  ["keypad /"] = "/",
  ["keypad *"] = "*",
  ["keypad -"] = "-",
  ["keypad +"] = "+",
}

local numlock = false

local press = keymap.on_key_pressed

keymap.on_key_pressed = function(k)
  if k == "numlock" then
    numlock = not numlock
    return true
  end
  if not numlock or keymap.modkeys["shift"] then
    k = numpad_map[k] or k
  end
  k = fix_numpad_map[k] or k
  return press(k)
end
