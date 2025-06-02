-- Goatling


SMODS.Atlas{
    key = 'goatling',
    path = 'goatling.png',
    px = 71,
    py = 95,
}
SMODS.Joker {
    key = "goatling",
        loc_txt= {
        name = 'Goatling',
        text = { "{X:chips,C:white}x3{} {C:blue}Chips",
                    "For any card that scores",
                    "that isn't a {C:attention}King, Queen or Jack{} ",
    },},
    atlas = 'goatling',
    pos = {x = 0, y = 0},
    soul_pos = {x = 0, y = 1},
    rarity = 4,
    cost = 30,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    
    config = { extra = {x_chips = 3}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.x_chips_gain}  }
    end,
    calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play and (context.other_card:get_id() <= 10 or context.other_card:get_id() == 14) then
            return {
               x_chips = card.ability.extra.x_chips,
               x_chips_message = {message = "x" .. tostring(card.ability.extra.x_chips)}
            }
        end
    end
}

