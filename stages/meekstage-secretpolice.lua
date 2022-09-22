function create()
    setDefaultCamZoom(0.8)

    makeSprite("back", "images/miku/secretpolice/stageBack.png", -560, -430, true)
    setSpriteScale("back", 0.9, 0.9)
    setSpriteScrollFactor("back", 0.5, 0.5)
    addSprite("back")

    makeSprite("front", "images/miku/secretpolice/stageFront.png", -570, 500, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")
end

function postCreate()
    setActorPosition("opponent", 50, -70)
    setActorPosition("boyfriend", 860, 320)
    setActorPosition("girlfriend", 440, -60)
    setActorScrollFactor("girlfriend", 1, 1)
    
    makeSprite("overblue", "images/miku/secretpolice/overBlue.png", 600, 350, false)
    setSpriteScale("overblue", 110, 70)
    setSpriteScrollFactor("overblue", 0, 0)
    addSprite("overblue")
    setSpriteBlendMode("overblue", "add")
    setSpriteAlpha("overblue", 0.1)

    makeSprite("overred", "images/miku/secretpolice/overRed.png", 600, 350, false)
    setSpriteScale("overred", 110, 70)
    setSpriteScrollFactor("overred", 0, 0)
    addSprite("overred")
    setSpriteBlendMode("overred", "add")
    setSpriteAlpha("overred", 0.1)
    setSpriteVisibility("overred", false)

    -- red and blue lights
    makeSprite("lights1", "images/miku/secretpolice/stageLights1.png", -570, 500, true)
    setSpriteScale("lights1", 1, 1)
    setSpriteScrollFactor("lights1", 1, 1)
    addSprite("lights1")

    makeSprite("lights2", "images/miku/secretpolice/stageLights2.png", -570, 500, true)
    setSpriteScale("lights2", 1, 1)
    setSpriteScrollFactor("lights2", 1, 1)
    addSprite("lights2")
    setSpriteVisibility("lights2", false)
end

function beatHit()
    if curBeat == 16 then
        makeSprite("title", "images/miku/namegrafix/secret-police.png", 200, 60, true)
        setSpriteScale("title", 1, 1)
        setSpriteScrollFactor("title", 0)
        addSprite("title")
    elseif curBeat == 32 then
        destroySprite("title")
    end

    if curBeat % 2 == 1 then
        setSpriteVisibility("lights1", true)
        setSpriteVisibility("lights2", false)
    elseif curBeat % 2 == 0 then
        setSpriteVisibility("lights1", false)
        setSpriteVisibility("lights2", true)
    end

    if curBeat % 4 == 2 then
        setSpriteVisibility("overblue", true)
        setSpriteVisibility("overred", false)
    elseif curBeat % 2 == 0 then
        setSpriteVisibility("overblue", false)
        setSpriteVisibility("overred", true)
    end
end