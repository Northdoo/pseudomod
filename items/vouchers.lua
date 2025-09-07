SMODS.Atlas{
    key = 'slider',
    path = 'voucheringaround.png',
    px = 71,
    py = 95,
}


SMODS.Voucher {
    key = 'slide',
        loc_txt= {
        name = 'Slide',
    	text = {
        "{C:inactive}(By itself, a useless Voucher.){}",
    }
},
    atlas = 'slider',
    pos = { x = 0, y = 0 },
    redeem = function(self, card)
        check_for_unlock({ 'slide_redeemed' })
    end
}

--Solar Wind
SMODS.Atlas{
    key = 'solarwind',
    path = 'voucheringaround.png',
    px = 71,
    py = 95,
}

SMODS.Voucher {
    key = 'solarwind',
        loc_txt= {
        name = 'Solar Wind',
    	text = {
        "Create a {C:attention}Double Tag{} for each blind skipped",
        "{C:inactive}(Complete itself with the Slide Voucher.){}",
    }
},
requires = { 'v_cymbal_slide' },
    atlas = 'solarwind',
    pos = { x = 1, y = 0 },
    redeem = function(self, card)
        check_for_unlock({ 'solarwind_redeemed' })
    end,
            calculate = function(self, card,context)
                if context.skip_blind and not context.blueprint then
                    add_tag(Tag('tag_double'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                end
            end
}

--Slide Ultra Hop
SMODS.Atlas{
    key = 'ultahop',
    path = 'voucheringaround.png',
    px = 71,
    py = 95,
}
SMODS.Voucher {
    key = 'slideultrahop',
        loc_txt= {
        name = 'Slide Ultrahop',
    	text = {
        "{C:attention}+1{} Ante",
        "{X:attention,C:white}+35%{} Blind Chips Requirement",
        "{C:dark_edition}+2{} Joker slots",
        "Gain {C:red}+#1#{} discards",
    }
},
    requires = { 'v_cymbal_solarwind' },
    atlas = 'ultahop',
    pos = { x = 1, y = 1 },
    
    config = { extra = { discards = 2 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards } }
    end,
    redeem = function(self, card)
    ease_ante(1)
    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
    G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + 1
    G.GAME.starting_params.ante_scaling = G.GAME.starting_params.ante_scaling * 1.35
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discards
    ease_discard(card.ability.extra.discards)
        G.E_MANAGER:add_event(Event({
            func = function()
                if G.jokers then
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 2
                end
                return true
            end
        }))
    end
}

