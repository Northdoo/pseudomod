SMODS.Atlas{
   key = 'regaliadeck',
    path = 'EnhancersPseudo.png',
    px = 71,
    py = 95,
}

SMODS.Back {
    key = "sybilian",
    atlas = 'regaliadeck',
    pos = { x = 1, y = 1 },
    config = { discards = 2,hands = -1 },

    loc_vars = function(self, info_queue, back)
        return { vars = { self.config.discards, self.config.hands } }
    end,

    apply = function()
        G.GAME.modifiers.scaling = (G.GAME.modifiers.scaling or 1) + 1
    end,

    loc_txt = {
        name = "Regalia Deck",
        text = {
            "{C:red}+2{} Discards and",
            "{C:blue}-1{} Hand",
            "every round",
            "{s:0.85}Required score{} {C:attention}scales faster{}",
             "{s:0.85}each{} {C:attention}Ante{}"
        }
    },
}
