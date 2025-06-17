SMODS.Atlas{
  key = 'trichandelier',
    path = 'Chandelier.png',
    px = 69,
    py = 93,
}


SMODS.Joker {
    key = "trichandelier",
        loc_txt= {
        name = 'Trimask Chandelier',
        text = { 
        "Gain {X:mult,C:white}x#2#{} Mult everytime",
        "you play a {C:attention}Three of a Kind{}",
        "{C:inactive}(Currently at {}{X:mult,C:white}x#1#{} {C:inactive}Mult ){}",
        }
    },
    atlas = 'trichandelier',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
	config = { extra = { xmult = 1, xmult_gain = 0.3 } },
        loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,

    calculate = function(self, card, context)
            if context.before and context.scoring_name == "Three of a Kind" then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return {
                    message = "Upgrade !",
                }
            end

        if context.joker_main then
            return {
          	xmult = card.ability.extra.xmult
            }
        end
    end
}
