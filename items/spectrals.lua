SMODS.Atlas{
   key = 'regalia_clearmind',
    path = 'spectralclearmind.png',
    px = 71,
    py = 95,
}

SMODS.Consumable {
key = 'regalia_clearmind',
set = "Spectral",
atlas = 'regalia_clearmind',
pos = { x = 0, y = 0 },
cost = 4,
soul_rate = 0.0093,

config = { extra = { slots = 3 } },  -- kept as-is

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.slots } }
    end,

    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 3
                                attention_text({
		        play_sound('timpani'),
                        text = "+3 Slots !",
                        scale = 1.3,
                        hold = 1.4,
		        major = card,
		        card:juice_up(0.3, 0.5),
                        backdrop_colour = G.C.SECONDARY_SET.Spectral,
                        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                end
                return true
            end,
        }))
        delay(0.6)
    end,

    can_use = function(self, card)
        return true
    end,

    loc_txt = {
        name = 'Clear Mind',
        text = {
            "{C:dark_edition,E:1}+3{} {E:1}Joker slots{}"
        },
    },
}
