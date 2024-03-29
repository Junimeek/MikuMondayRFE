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
    SetSpriteData("logo", 0, 0, 1, 1, true)
    setSpriteAlpha("logo", 0)

    makeSprite("pvcredit", "images/miku/namegrafix/rollinggirl-pvcredit.png", 260, 310, true)
    SetSpriteData("pvcredit", 0, 0, 1, 1, true)
    centerSpriteXY("pvcredit", true, false)
    setSpriteAlpha("pvcredit", 0)


    -- stuff related to the transition to green
    makeSprite("overwhite", "images/miku/rolling/whiteSquare.png", 640, 380, false)
    SetSpriteData("overwhite", 0, 0, 91, 55, true)
    setSpriteAlpha("overwhite", 0)

    makeSprite("overgreen", "images/miku/rolling/greenSquare.png", 640, 380, false)
    SetSpriteData("overgreen", 0, 0, 91, 55, false)

    makeAnimatedSparrowSprite("reach", "images/miku/rolling/BF REACH", 540, 300, true)
    addSpritePrefixAnimation("reach", "reach", "BF REACH SMOL", 24, false)
    SetSpriteData("reach", 0, 0, 1.4, 1.4, true, true)
    setSpriteAlpha("reach", 0)

    makeSprite("hug", "images/miku/rolling/hug.png", 330, 130, true)
    SetSpriteData("hug", 0, 0, 0.8, 0.8, false)


    -- vignette and overlay thing
    makeSprite("vignette", "images/miku/rolling/vignette.png", 0, 0, true)
    SetSpriteData("vignette", 0, 0, 1.2, 1.2)

    makeAnimatedSparrowSprite("overlay", "images/miku/rolling/overlay", 120, -30, true)
    addSpritePrefixAnimation("overlay", "vcr", "idle", 24, true)
    SetSpriteData("overlay", 0, 0, 1.4, 1.3, true, true)
    setSpriteBlendMode("overlay", "darken")
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

function beatHit()
    if curBeat % 2 == 0 then
        if curBeat >= 282 and curBeat < 307 then
            playActorAnimation("boyfriend", "glanceLoop")
        elseif curBeat == 280 then
            playActorAnimation("boyfriend", "glance")
        end  
    end
end

function SetSpriteData(spriteName, scrollX, scrollY, scaleX, scaleY, isVisible, isActive)
    setSpriteScrollFactor(spriteName, scrollX, scrollY)
    setSpriteScale(spriteName, scaleX, scaleY)

    if isActive == true then
        addSprite(spriteName, true)
    else
        addSprite(spriteName, false)
    end

    if isVisible == false then
        setSpriteVisibility(spriteName, false)
    else
        setSpriteVisibility(spriteName, true)
    end
end