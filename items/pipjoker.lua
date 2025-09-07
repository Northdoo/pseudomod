-- Pip
SMODS.Atlas{
    key = 'pipjoker',
    path = 'pipjoker.png',
    px = 69,
    py = 93,
}
SMODS.Joker {
    key = "pipjoker",
        loc_txt= {
        name = 'Pip',
        text = { "{C:red}+10{} Mul after",
                    "defeating the {C:attention}Boss Blind{}",
                    "{C:inactive}(Currently{C:mult} +#1#{}{C:inactive} Mult)",
    },},
    atlas = 'pipjoker',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 3,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = { extra = {mult = 0, mult_gain = 10}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult}  }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
			return {
				message = "+".. card.ability.extra.mult,
				mult_mod = card.ability.extra.mult
			}
        end
		if context.end_of_round and (G.GAME.blind.boss) and context.main_eval and not context.blueprint then
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
            return {
                message = "Upgrade!",
            }
        end
    end
}

