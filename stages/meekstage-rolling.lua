function create()
    setDefaultCamZoom(0.9)
    setCameraBGColor("camGame", "#FFFFFF")

    makeActor("rollingMikuColor", false, 0, -120)
    makeActor("rollingBfColor", true, 900, 0)
end

function postCreate()
    setActorPosition("opponent", 0, -120)
    setActorPosition("boyfriend", 900, 0)
    setSpriteVisibility("gfSprite", false)
    setCameraPosition(850, 369)

    makeSprite("logo", "images/miku/namegrafix/rollinggirl.png", 469, 320, true)
    addSprite("logo")
    makeSprite("pvcredit", "images/miku/namegrafix/rollinggirl-pvcredit.png", 469, 320, true)
    addSprite("pvcredit")
    setSpriteAlpha("logo", 0)
    setSpriteAlpha("pvcredit", 0)

    -- stuff related to the transition to green

    makeSprite("overwhite", "images/miku/rolling/whiteSquare.png", 640, 380, true)
    setSpriteScrollFactor("overwhite", 0, 0)
    setSpriteScale("overwhite", 91, 55)
    addSprite("overwhite")
    setSpriteAlpha("overwhite", 0)

    makeSprite("overgreen", "images/miku/rolling/greenSquare.png", 640, 380, true)
    setSpriteScrollFactor("overgreen", 0, 0)
    setSpriteScale("overgreen", 91, 55)
    addSprite("overgreen")
    setSpriteVisibility("overgreen", false)

    makeAnimatedSparrowSprite("reach", "images/miku/rolling/BF REACH", 540, 300, true)
    addSpritePrefixAnimation("reach", "reach", "BF REACH SMOL", 24, false)
    setSpriteScrollFactor("reach", 0, 0)
    setSpriteScale("reach", 1.4, 1.4)
    addSprite("reach", true)
    setSpriteAlpha("reach", 0)

    makeSprite("hug", "images/miku/rolling/hug.png", 340, 130, true)
    setSpriteScrollFactor("hug", 0)
    setSpriteScale("hug", 0.9, 0.9)
    addSprite("hug")
    setSpriteVisibility("hug", false)

    -- vignette and overlay thing
    makeSprite("vignette", "images/miku/rolling/vignette.png", 0, 0, true)
    setSpriteScrollFactor("vignette", 0, 0)
    setSpriteScale("vignette", 1.2, 1.2)
    addSprite("vignette")

    makeAnimatedSparrowSprite("overlay", "images/miku/rolling/overlay", 120, -30, true)
    addSpritePrefixAnimation("overlay", "vcr", "idle", 24, true)
    setSpriteScrollFactor("overlay", 0, 0)
    addSprite("overlay", true)
    setSpriteScale("overlay", 1.4, 1.3)
    playSpriteAnimation("overlay", "vcr")
end

function stepHit()
    if curStep == 16 then
        performSpriteAlphaTween("logoin", "logo", 1, 0.1)
    elseif curStep == 78 then
        performSpriteAlphaTween("logoout", "logo", 0, 0.1)
    elseif curStep == 80 then
        performSpriteAlphaTween("pvin", "pvcredit", 1, 0.1)
    elseif curStep == 140 then
        performSpriteAlphaTween("pvout", "pvcredit", 0, 0.1)
    elseif curStep == 152 then
        destroySprite("logo")
        destroySprite("pvcredit")
    elseif curStep == 1661 then
        performSpriteAlphaTween("whitein", "overwhite", 1, 0.1)
        performSpriteAlphaTween("reachin", "reach", 1, 0.1)
        playSpriteAnimation("reach", "reach")
    elseif curStep == 1667 then
        changeActor("opponent", "rollingMikuColor", true, true, true)
        changeActor("boyfriend", "rollingBfColor", true, true, true)
    elseif curStep == 1680 then
        setCameraBGColor("camGame", "#57ed89")
        setSpriteAlpha("overgreen", 1)
        setSpriteAlpha("vignette", 0.7)
        setSpriteVisibility("hug", true)
        setSpriteVisibility("overgreen", true)
        destroySprite("reach")
        destroySprite("overlay")
        destroySprite("overwhite")
    elseif curStep == 1700 then
        performSpriteAlphaTween("hugout", "hug", 0, 0.3)
        performSpriteAlphaTween("greenout", "overgreen", 0, 0.3)
    elseif curStep == 1720 then
        destroySprite("overgreen")
        destroySprite("hug")
    elseif curStep == 2184 then
        setCameraBGColor("camGame", "#000000")
        setActorVisibility("dadSprite", false)
        setActorVisibility("rollingMikuColor", false)
        setActorVisibility("bfSprite", false)
        setActorVisibility("rollingBfColor", false)
        destroySprite("vignette")
    end
end

local glanceValue = 69

function beatHit()
    if curBeat == 280 then
        playActorAnimation("boyfriend", "glance")
    elseif curBeat == 282 then
        glanceValue = 420
    elseif curBeat == 307 then
        glanceValue = 69
    end

    if glanceValue == 420 then
        playActorAnimation("boyfriend", "glanceLoop")
    end
end