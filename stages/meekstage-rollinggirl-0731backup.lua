function create()
    setDefaultCamZoom(0.9)

    makeSprite("green", "images/miku/rolling/green.png", 200, -200, true)
    setSpriteScale("green", 5, 5)
    addSprite("green")

    makeSprite("bg", "images/miku/rolling/bg.png", 200, -200, true)
    setSpriteScale("bg", 5, 5)
    addSprite("bg")

    makeActor("rollingBf2", true, 900, 0)
    makeActor("rollingMikuColor", false, 0, -120)
    makeActor("rollingBfColor", true, 900, 0)

    makeAnimatedSparrowSprite("reach", "images/miku/rolling/BF REACH", 540, 300, true)
    addSpritePrefixAnimation("reach", "reach", "BF REACH SMOL", 24, false)
    setSpriteScrollFactor("reach", 0, 0)
    addSprite("reach", true)
    setSpriteScale("reach", 1.4, 1.4)
end

function postCreate()
    setActorPosition("opponent", 0, -120)
    setActorPosition("boyfriend", 900, 0)
    setSpriteVisibility("gfSprite", false)
    setCameraPosition(850, 369)

    makeSprite("vignette", "images/miku/rolling/vignette.png", 0, 0, true)
    setSpriteScrollFactor("vignette", 0, 0)
    setSpriteScale("vignette", 1.2, 1.2)
    setSpriteOrder("vignette", 15)
    addSprite("vignette")

    makeAnimatedSparrowSprite("overlay", "images/miku/rolling/overlay", 120, -30, true)
    addSpritePrefixAnimation("overlay", "vcr", "idle", 24, true)
    setSpriteScrollFactor("overlay", 0, 0)
    addSprite("overlay", true)
    setSpriteScale("overlay", 1.4, 1.3)
    setSpriteOrder("overlay", 16)
    playSpriteAnimation("overlay", "vcr")

    makeSprite("hug", "images/miku/rolling/hug.png", 340, 130, true)
    setSpriteScrollFactor("hug", 0)
    setSpriteScale("hug", 1, 1)
    addSprite("hug")
    setSpriteOrder("hug", 17)

    setSpriteVisibility("reach", false)
    setSpriteVisibility("hug", false)
    setActorVisibility("rollingBfColor", false)
    setActorVisibility("rollingMikuColor", false)
end

function stepHit()
    if curStep == 15 then
        makeSprite("logo", "images/miku/namegrafix/rollinggirl.png", 469, 400, true)
        addSprite("logo")
    elseif curStep == 79 then
        destroySprite("logo")
    elseif curStep == 1120 then
        playActorAnimation("boyfriend", "glance")
    elseif curStep == 1125 then
        changeActor("boyfriend", "rollingBf2", true, true, false)
    elseif curStep == 1660 then
        setActorVisibility("rollingBf2", false)
        setSpriteVisibility("bfSprite")
        setSpriteVisibility("dadSprite", false)
        setSpriteVisibility("reach", true)
        playSpriteAnimation("reach", "reach")
    elseif curStep == 1666 then
        changeActor("opponent", "rollingMikuColor", true, true, true)
        changeActor("boyfriend", "rollingBfColor", true, true, true)
    elseif curStep == 1679 then
        destroySprite("bg")
        destroySprite("reach")
        setSpriteVisibility("hug", true)
        destroySprite("overlay")
    elseif curStep == 1693 then
        setActorVisibility("rollingBfColor", true)
        setActorVisibility("rollingMikuColor", true)
        setSpriteVisibility("bfSprite", true)
        setSpriteVisibility("dadSprite", true)
        destroySprite("hug")
    elseif curStep == 2183 then
        setActorVisibility("dadSprite", false)
        setActorVisibility("rollingMikuColor", false)
        setActorVisibility("bfSprite", false)
        setActorVisibility("rollingBfColor", false)
        destroySprite("green")
        destroySprite("vignette")
    end
end