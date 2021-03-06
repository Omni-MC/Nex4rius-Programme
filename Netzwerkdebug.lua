local component = require("component")
local event = require("event")
local term = require("term")

term.clear()
component.getPrimary("modem").open(100)

local d = io.open("log", "w")
local function lesen(...)
  for k, v in pairs({...}) do
    d:write(tostring(v) .. "   ")
    term.write(tostring(v) .. "   ")
  end
  d:write("\n")
  term.write("\n")
end

while true do
  local _, _, _, _, _, a, b, c, d, e, f, g, h = event.pull("modem_message")
  lesen(a, b, c, d, e ,f , g, h)
end
d:close()
