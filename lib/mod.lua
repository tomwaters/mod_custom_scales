--
-- mod to allow loading of custom scales into MusicUtil
--

local mod = require 'core/mods'
local MusicUtil = require 'musicutil'

mod.hook.register("system_post_startup", "custom scales startup", function()
  local my_scales = {
    {name = "MajorTom", alt_names = {"Tomian"}, intervals = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, chords = {{1, 2, 3, 4, 5, 6, 7, 14}, {14, 15, 17, 18, 19, 20, 21, 22, 23}, {14, 15, 17, 19}, {1, 2, 3, 4, 5}, {1, 2, 4, 8, 9, 10, 11, 14, 15}, {14, 15, 17, 19, 21, 22}, {24, 26}, {1, 2, 3, 4, 5, 6, 7, 14}}},
    {name = "In Sen Pou", intervals = {0, 1, 5, 7, 8, 12}, chords = {{}, {1, 3}, {17, 18}, {24, 26}, {}, {}}}
  }
  
  for m = 1, #my_scales do
    local found = false
    for s = 1, #MusicUtil.SCALES do
      if MusicUtil.SCALES[s].name == my_scales[m].name then
        MusicUtil.SCALES[s] = my_scales[m]
        found = true
        break
      end
    end
    if found == false then
      table.insert(MusicUtil.SCALES, my_scales[m])
    end
  end
end)
