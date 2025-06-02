--- MOD_NAME: Pseudoregalia Mod
--- MOD_ID: pseudomod
--- MOD_AUTHOR: Northdoo MIIdris
--- MOD_DESCRIPTION: AAAAAAAAAAAAA
--- PREFIX: cymbal
---Thanks for the Yahimod, Talisman Mod and the Balatro server to exist, otherwise i would have probably struggled a lot just for ONE joker.


------------MOD CODE -------------------------

G.C.PSEUDOGOLD = HEX("FFFFFF")
G.C.PSEUDOBLACK = HEX("111111")
G.C.mid_flash = 0
G.C.vort_time = 7
G.C.vort_speed = 0.3

-- from cryptid apparently
local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	G.SPLASH_BACK:define_draw_steps({
			{
				shader = "splash",
				send = {
					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
           			{name = 'vort_speed', val = G.C.vort_speed},
            		{name = 'colour_1', ref_table = G.C, ref_value = 'PSEUDOBLACK'},
            		{name = 'colour_2', ref_table = G.C, ref_value = 'PSEUDOGOLD'},
            		{name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
				},
			},
		})
	return ret
end
--I'll be honest, i've no clue if this does actually something, i just took it from the YahiMod cuz i wasn't sure the game was working
SMODS.ObjectType({
	key = "pseudoregamod",
	default = "j_reserved_parking",
	cards = {
	["sol"]= true,
	},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

--Load item files
local files = NFS.getDirectoryItems(SMODS.current_mod.path  .. "/items")
for _, file in ipairs(files) do
	print("[PSEUDOMOD] Loading lua file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end
---------------------------------------
------------MOD CODE END----------------------
