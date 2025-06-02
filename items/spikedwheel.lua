--wheel_of_fortune
--the reason why 'Oops ! All 6's won't work is because i didn't coded correctly for Balatro to actualy take the chance value as a changable variable, or whatever that means, i consider fixing that in a future update but that's not my priority for now.

SMODS.Atlas{
  key = 'spiwheel',
    path = 'spikewheel.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "spiwheel",
        loc_txt= {
        name = 'Spiked Wheel',
        text = { "{C:blue} +100{} Chips",
        		"{C:green}1 in 6{} chance to create",
        		"{C:tarot,T:c_wheel_of_fortune} The Wheel of Fortune{}",
        		"{C:inactive}(Immune to 'Oops! All 6s)'{}",
    },},
    atlas = 'spiwheel',
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 5,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    
    
    
    config = { extra = {chips = 100}},
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chips}  }
    end,
      calculate = function(self, card, context)
        if context.joker_main then
            if math.random(1, 6) == 1 and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                SMODS.add_card{
                    set = 'Tarot',
                    key = 'c_wheel_of_fortune',
                    skip_materialize = false,
                }
            end

            return {
                message = "+" .. card.ability.extra.chips,
                chip_mod = card.ability.extra.chips
            }
        end
    end
}
