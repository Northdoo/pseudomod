SMODS.Atlas{
    key = 'worthyblade_regalia',
    path = 'WorthyBlade.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "regalia_worthyblade",
        loc_txt= {
        name = 'Worthy Blade',
        text = { 'If  {C:attention}first discard{} only has {C:attention}1{} card',
        "destroy it and give Mult depending on it's {C:attention}rank{}",
        "{C:inactive} (ex : Ace = 11, K/Q/J = 10, etc..)",
        '{C:inactive}(Currently at {C:mult}#1#{} {C:inactive}Mult){}',
        }
    },
    atlas = 'worthyblade_regalia',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 5,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
	config = { extra = { mult = 1, mult_gain = 0 } },
        loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult, card.ability.extra.mult_gain } }
    end,
    
        calculate = function(self, card, context)
                if context.first_hand_drawn then
            local eval = function() return G.GAME.current_round.discards_used == 0 and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
        
            if context.discard and not context.blueprint and G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 and context.full_hand[1]:get_id() >= 1 and context.full_hand[1]:get_id() <= 14  then
                 
            local discarded_card = context.full_hand[1]
            local id = discarded_card:get_id()
            local value = 0

            if id == 14 then
                value = 11 -- Ace
            elseif id >= 11 and id <= 13 then
                value = 10 -- J, Q, K
            elseif id >= 2 and id <= 10 then
                value = id
            end
        
                card.ability.extra.mult_gain  = value
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain 
		card.ability.extra.mult_gain = 0
        return {
            message = "Upgrade!",
            remove = true
        }
    end

    if context.joker_main then
        return {
            mult = card.ability.extra.mult
        }
    end
end
}
