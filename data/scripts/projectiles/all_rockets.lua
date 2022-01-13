local choice = dofile_once("data/scripts/lib/randoms.lua")
local opts = function() return choice(53, {"rocket", "rocket_tier_2", "rocket_tier_3"})
dofile_once("data/scripts/projectiles/_spells_to_x.lua")("rocket", true, opts)