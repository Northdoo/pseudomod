SMODS.Atlas{
    key = 'jeri',
    path = 'jeri.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "jeri",
        loc_txt= {
        name = "Lil' Jeri",
        text = {"{X:mult,C:white}x0.35{} Mult after",
    "played hand but gain",
    "{C:money}3${} for the end of round cashout",
    "{C:inactive}(Resets each round){}",
        "{C:inactive}(Currently at{C:money} #1#${}{C:inactive}) "
        },},
    atlas = 'jeri',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    config = { extra = {dollar = 0,additional = 3, xmult = 0.35}},
    
    	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.dollar, card.ability.extra.additional, card.ability.extra.mult}  }
	end,
    
    
    calculate = function(self, card, context)

        if context.joker_main then
    card.ability.extra.dollar = (card.ability.extra.dollar + card.ability.extra.additional)
            return {
                xmult = card.ability.extra.xmult,
                extra = {
                    message = "+3$",
                    color = G.C.MONEY
                    
                }
            }
        end
    end,

    calc_dollar_bonus = function(self, card)
        local result = (card.ability.extra.dollar)
        card.ability.extra.dollar = 0
        return result
    end
}
