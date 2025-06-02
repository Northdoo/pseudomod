SMODS.Atlas{
   key = 'topenta',
    path = 'twopentacles.png',
    px = 71,
    py = 95,
}

SMODS.Consumable {
key = 'topenta',
set = "Tarot",
effect = "Enhance",
atlas = 'topenta',
pos = { x = 0, y = 0 },
cost = 4,

config = {
        -- How many cards can be selected.
        max_highlighted = 2,
        mod_conv = 'm_cymbal_sol',
},

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_cymbal_sol
--["m_cymbal_sol".. card.ability.mod_conv]
        return {vars = {max_highlighted}}
    end,
    loc_txt = {
        name = 'Two of Pentacles',
        text = {
	"Select up to 2 cards to", 
	"turn them into {C:attention}Sol Cards{}"
        },
    },
}
