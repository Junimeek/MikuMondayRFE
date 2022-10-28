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
end

function postCreate()
    setActorPosition("opponent", 120, 30)
    setActorPosition("boyfriend", 960, 340)
    setActorPosition("girlfriend", 540, 0)

    makeSprite("overlay1", "images/miku/disappearance/overlay1.png", -170, -100, true)
    setSpriteScale("overlay1", 1, 1)
    setSpriteScrollFactor("overlay1", 0, 0)
    addSprite("overlay1")

    makeSprite("overlay2", "images/miku/disappearance/overlay2.png", -170, -100, true)
    setSpriteScale("overlay2", 1, 1)
    setSpriteScrollFactor("overlay2", 0, 0)
    addSprite("overlay2")

    makeSprite("overlay3", "images/miku/disappearance/overlay3.png", -170, -100, true)
    setSpriteScale("overlay3", 1, 1)
    setSpriteScrollFactor("overlay3", 0, 0)
    addSprite("overlay3")

    setSpriteVisibility("overlay2", false)
    setSpriteVisibility("overlay3", false)
end

function beatHit()
    if curBeat % 7 == 1 then
        setSpriteVisibility("overlay3", false)
        performSpriteYTween("resetypos", "overlay3", 1000, 0.1)
    elseif curBeat % 7 == 2 then
        setSpriteVisibility("overlay3", true)
        performSpriteYTween("goingup", "overlay3", -600, 1.2)
    --elseif curBeat == 1 or curBeat == 31 or curBeat == 51 or curBeat == 71 or curBeat == 91 then
        --setSpriteVisibility("overlay2", false)
        --performSpriteYTween("resetypieceofsh", "overlay2", 1069, 0.1)
    --elseif curBeat == 2 or curBeat == 32 or curBeat == 52 or curBeat == 72 or curBeat == 92 then
        --setSpriteVisibility("overlay2", true)
        --performSpriteYTween("goinup", "overlay2", -1200, 4.20)
    elseif curBeat == 68 then
        setSpriteAlpha("overlay1", 0)
        setSpriteAlpha("overlay2", 0)
        setSpriteAlpha("overlay3", 0)
    elseif curBeat == 292 then
        setSpriteAlpha("overlay1", 100)
        setSpriteAlpha("overlay2", 100)
        setSpriteAlpha("overlay3", 100)
    end
end

function stepHit()
    if curStep == 1906 then
        destroySprite("back")
        destroySprite("front")
        setSpriteVisibility("bfSprite", false)
        setSpriteVisibility("gfSprite", false)
        setSpriteVisibility("dadSprite", false)
    end
end