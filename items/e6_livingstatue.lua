SMODS.Atlas{
  key = 'statueliving',
    path = 'LivingStatue.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "statuelviing",
        loc_txt= {
        name = 'Living Satue',
        text = { "{X:mult,C:white}x#1#{} Mult for each",
        "{C:attention}Stone Cards{} played in your hand"
    },},
    atlas = 'statueliving',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
        config = { extra = {xmult = 2, chips = 25}},
        loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.xmult,card.ability.extra.mult }  }
    end, 
        
    calculate = function(self, card, context)
    if context.individual then
       --[[ if context.cardarea == G.hand and SMODS.has_enhancement(context.other_card, "m_stone") and not context.end_of_round then
            return {
                mult = card.ability.extra.mult
            }
        end ]]

        if context.cardarea == G.play and SMODS.has_enhancement(context.other_card, "m_stone") then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
end
}
            
