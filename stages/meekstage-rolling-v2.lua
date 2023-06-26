function create()
    setDefaultCamZoom(0.9)
    setCameraBGColor("camGame", "#FFFFFF")

    makeActor("rollingMikuColor", false, -210, -130)
    makeActor("rollingBfColor", true, 690, -10)

    addActor("rollingBfColor")
    addActor("rollingMikuColor")
    
end

function postCreate()
    setCameraPosition(930, 170)
    
    setActorPosition("opponent", -210, -130)
    setActorPosition("boyfriend", 690, -10)
    setSpriteVisibility("gfSprite", false)
    setSpriteScrollFactor("bfSprite", 0)
    setSpriteScrollFactor("dadSprite", 0)
    setActorScrollFactor("rollingBfColor", 0)
    setActorScrollFactor("rollingMikuColor", 0)

    makeSprite("logo", "images/miku/namegrafix/rollinggirl.png", 260, 310, true)
    addSprite("logo")
    --centerSpriteXY("logo", true, false)
    setSpriteScrollFactor("logo", 0)
    setSpriteAlpha("logo", 0)

    makeSprite("pvcredit", "images/miku/namegrafix/rollinggirl-pvcredit.png", 260, 310, true)
    addSprite("pvcredit")
    centerSpriteXY("pvcredit", true, false)
    setSpriteScrollFactor("pvcredit", 0)
    setSpriteAlpha("pvcredit", 0)


    -- stuff related to the transition to green
    makeSprite("overwhite", "images/miku/rolling/whiteSquare.png", 640, 380, false)
    setSpriteScrollFactor("overwhite", 0, 0)
    setSpriteScale("overwhite", 91, 55)
    addSprite("overwhite")
    setSpriteAlpha("overwhite", 0)

    makeSprite("overgreen", "images/miku/rolling/greenSquare.png", 640, 380, false)
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

    makeSprite("hug", "images/miku/rolling/hug.png", 330, 130, true)
    setSpriteScrollFactor("hug", 0)
    setSpriteScale("hug", 0.8, 0.8)
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
    setSpriteBlendMode("overlay", "darken")
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
        destroySprite("vignette")
    end

    if curStep == 1 then
        --setCameraBGColor("camGame", "#57ed89")
        setActorVisibility("rollingMikuColor", false)
        setActorVisibility("rollingBfColor", false)
    elseif curStep == 1677 then
        changeTargetActor("boyfriend", "rollingBfColor", true)
        changeTargetActor("opponent", "rollingMikuColor", true)
        setActorVisibility("rollingBfColor", true)
        setActorVisibility("rollingMikuColor", true)
        setActorVisibility("boyfriend", false)
        setActorVisibility("opponent", false)
    elseif curStep == 2184 then
        setActorVisibility("rollingMikuColor", false)
        setActorVisibility("rollingBfColor", false)
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