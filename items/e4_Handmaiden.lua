SMODS.Atlas{
  key = 'Maidenregalia',
    path = 'Handmaiden.png',
    px = 69,
    py = 93,
}

SMODS.Joker {
    key = "regaliamaiden",
        loc_txt= {
        name = 'Handmaiden',
        text = { "{C:spades}Spade{} cards played in a {C:attention}#2#{}",
        "gain {X:mult,C:white}x#1#{} Mult.",
    "Change the poker hand",
    "after end of the round"
        }
    },
    atlas = 'Maidenregalia',
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 8,
    pools = {["pseudoregamod"] = true},
    
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    
    
    ---al huge part of this code down there was recopied with nh6574's 'Vanilla Remade' in order to make the change of hands work
    ---Vanilla Remade is really a huge saver tbh
	config = { extra = { xmult = 1.5, poker_hand = 'High Card' } },
        loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, localize(card.ability.extra.poker_hand, 'poker_hands') } }
    end,

    calculate = function(self, card, context)
        if context.scoring_name == card.ability.extra.poker_hand then
            if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end

        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible and k ~= card.ability.extra.poker_hand then
                    _poker_hands[#_poker_hands + 1] = k
                end
            end
            card.ability.extra.poker_hand = pseudorandom_element(_poker_hands, pseudoseed('cymbal_regaliamaiden'))
            return {
                message = "New Hand !"
            }
        end
    end,

    set_ability = function(self, card, initial, delay_sprites)
        local _poker_hands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible and k ~= card.ability.extra.poker_hand then
                _poker_hands[#_poker_hands + 1] = k
            end
        end
        card.ability.extra.poker_hand = pseudorandom_element(
            _poker_hands,
            pseudoseed(
                (card.area and card.area.config.type == 'title') 
                and 'cymbal_false_regaliamaiden' 
                or 'cymbal_regaliamaiden'
            )
        )
    end,
}
