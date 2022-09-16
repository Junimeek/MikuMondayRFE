function create()
    setDefaultCamZoom(0.75)

    makeSprite("space", "images/miku/hall/spacebg.png", -250, -150, true)
    setSpriteScrollFactor("space", 0.4 , 0.4)
    addSprite("space")

    makeSprite("back", "images/miku/hall/meltstageback.png", -30, -330, true)
    setSpriteScale("back", 1, 1)
    setSpriteScrollFactor("back", 0.8, 0.8)
    addSprite("back")

    makeSprite("front", "images/miku/hall/meltfloor.png", -350, 370, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")
end

function postCreate()
    setActorPosition("opponent", 120, -70)
    setActorPosition("boyfriend", 990, 280)
    setActorPosition("girlfriend", 540, -100)

    --addToBoyfriendCamFollow(-500, -500)

    makeSprite("melt", "images/miku/namegrafix/melt.png", 200, 400, true)
    setSpriteScale("melt", 1.5, 1.5)
    setSpriteScrollFactor("melt", 0, 0)
    addSprite("melt")
    setSpriteAlpha("melt", 0)
end

function beatHit()
    if curBeat == 32 then
        performSpriteAlphaTween("titlefade", "melt", 1.4, 1)
    elseif curBeat == 40 then
        destroySprite("melt")
    end
end

function stepHit()
    if curStep == 400 or curStep == 528 or curStep == 1152 or curStep == 1756 then
        playActorAnimation("boyfriend", "hey")
    end
end