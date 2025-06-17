SMODS.Atlas {
    key = "pseudoblinds",
    path = "blinds.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "boss_memory",
    key = "boss_memory",
    atlas = "pseudoblinds",
    mult = 3,
    pos = { y = 0 },
    dollars = 8,
    loc_txt = {
        name = 'Distored Memory',
        text = {
            'Unmodified cards are debuffed',
        },
    },
    boss = { showdown = true },
    boss_colour = HEX('521844'),
    


    recalc_debuff = function(self, card)
        for i = 1, #G.deck.cards do
            local c = G.deck.cards[i]
            if c.seal == nil and c.edition == nil and c.ability.set == "Default" then
                c:set_debuff(true)
            end
        end
    end,
    
    disable = function(self)
       for i = 1, #G.deck.cards do
            G.deck.cards[i]:set_debuff(false)
       end
    end,

    defeat = function(self)
       for i = 1, #G.jokers.cards do
            G.deck.cards[i]:set_debuff(false)
       end
    end,
}
