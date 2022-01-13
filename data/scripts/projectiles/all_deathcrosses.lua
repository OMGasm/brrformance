local choice = dofile_once("data/scripts/lib/randoms.lua")
local opts = function() return choice(543, {'death_cross', 'death_cross_big'})
dofile_once("data/scripts/projectiles/_spells_to_x.lua")("rocket", false, opts)