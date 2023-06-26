function create()
    setDefaultCamZoom(0.75)

    --makeSprite("space", "images/miku/hall/spacebg.png", -290, -200, true)
    --setSpriteScrollFactor("space", 0.2 , 0.2)
    --addSprite("space")

    --makeSprite("earth", "images/miku/hall/earth.png", 90, -220, true)
    --setSpriteScrollFactor("earth", 0.35, 0.1)
    --setSpriteScale("earth", 1.7, 1.7)
    --addSprite("earth")

    makeSprite("back", "images/miku/hall/bg.png", -200, -250, true)
    setSpriteScrollFactor("back", 0.35, 0.1)
    setSpriteScale("back", 1.4, 1.4)
    addSprite("back")

    makeSprite("sun", "images/miku/hall/sun.png", 1300, -30, true)
    setSpriteScrollFactor("sun", 0.5, 0.2)
    setSpriteScale("sun", 1.8, 1.8)
    --addSprite("sun")
    setSpriteBlendMode("sun", "lighten")

    makeSprite("back", "images/miku/hall/meltstageback.png", -30, -330, true)
    setSpriteScale("back", 1, 1)
    setSpriteScrollFactor("back", 0.8, 0.8)
    --addSprite("back")
    setSpriteAlpha("back", 0.82)

    makeSprite("front", "images/miku/hall/meltfloor.png", -350, 370, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")
    setSpriteAlpha("front", 0.82)
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


function stepHit()
    if curStep == 128 then
        performSpriteAlphaTween("titlefadein", "melt", 1, 1)
    elseif curStep == 158 then
        performSpriteAlphaTween("titlefadeout", "melt", 0, 0.2)
    elseif curStep == 164 then
        destroySprite("melt")
    end

    if curStep == 400 or curStep == 528 or curStep == 1152 or curStep == 1756 then
        playActorAnimation("boyfriend", "hey")
    end

    if curStep == 1312 or curStep == 1793 then
        setActorSpeed("girlfriend", 2)
    elseif curStep == 1345 then
        setActorSpeed("girlfriend", 1)
    end
end