-- Small Key
SMODS.Atlas{
    key = 'key',
    path = 'smol_key.png',
    px = 69,
    py = 93,
}
SMODS.Joker {
    key = "key",
        loc_txt= {
        name = 'Small Key',
        text = { "When entering in a {C:attention}Non-Boss Blind{}, gain {C:blue}+10{} Chips",
                     "{C:inactive}(Currently {C:blue}+#1# {C:inactive}Chips)",
    },},
    atlas = 'key',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 4,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = { extra = {chips = 0, additional = 10}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips, card.ability.extra.additional }  }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
			return {
				message = "+".. card.ability.extra.chips,
				chip_mod = card.ability.extra.chips
			}
        end
		if context.setting_blind and not (G.GAME.blind.boss) and context.main_eval and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.additional
            return {
                message = "Upgrade!",
            }
        end
    end
}

