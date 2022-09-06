function create()
    setDefaultCamZoom(0.8)

    makeSprite("back", "images/miku/back.png", -260, -130, true)
    setSpriteScale("back", 1, 1)
    setSpriteScrollFactor("back", 0.5, 0.5)
    addSprite("back")

    makeSprite("front", "images/miku/front.png", -170, -40, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")

    makeSprite("melt", "images/miku/namegrafix/melt.png", 375, 380, true)
    setSpriteScale("melt", 3, 3)
    setSpriteScrollFactor("melt", 0, 0)
    addSprite("melt")
end

function postCreate()
    setActorPosition("opponent", 120, 30)
    setActorPosition("boyfriend", 960, 340)
    setActorPosition("girlfriend", 540, 0)
    setSpriteOrder("melt", 9)
    setSpriteAlpha("melt", 0)
end

function beatHit()
    if curBeat == 31 then
        setSpriteAlpha("melt", 100)
    elseif curBeat == 39 then
        setSpriteAlpha("melt", 0)
        destroySprite("melt")
    end
end