-- Pip
SMODS.Atlas{
    key = 'untextured',
    path = 'untextured.png',
    px = 69,
    py = 93,
}
SMODS.Joker {
    key = "untextured",
        loc_txt= {
        name = 'U..  extu  ..d J.k. r',
        text = { "{C:inactive} (Has a chance to do something.)",
    },},
    atlas = 'untextured',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 1,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    config = { extra = {mult = 20, chips=100, xmult = 3, dollar=25}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.mult}  }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local effects = {}

            if math.random(1,6) == 1 then
                table.insert(effects, {
                    message = "+" .. card.ability.extra.mult,
                    mult_mod = card.ability.extra.mult
                })
            end

            if math.random(1,6) == 1 then
                table.insert(effects, {
                    message = "+" .. card.ability.extra.chips,
                    chip_mod = card.ability.extra.chips
                })
            end

            if math.random(1,6) == 1 then
                table.insert(effects, {
                    message = "x" .. card.ability.extra.xmult,
          			  Xmult_mod = card.ability.extra.xmult
                })
            end
            
            return effects[1]
        end            
		if context.end_of_round and (G.GAME.blind.boss) and context.main_eval and not context.blueprint and math.random(1,20) == 1 then
            dollars_mod = card.ability.extra.dollar
            return {
                dollars = card.ability.extra.dollar
            }
        end
    end
}

