SMODS.Atlas{
  key = 'heg',
    path = 'halfegg.png',
    px = 71,
    py = 95,
}

SMODS.Joker {
    key = "heg",
        loc_txt= {
        name = 'Half-Hatched Egg',
        text = { "{C:blue} +35{} Chips",
    },},
    atlas = 'heg',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 1,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = { extra = {chips = 35}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips}  }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
			return {
				message = "+".. card.ability.extra.chips,
				chip_mod = card.ability.extra.chips
			}
        end
    end
}

