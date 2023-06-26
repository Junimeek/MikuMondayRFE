function create()
    setDefaultCamZoom(0.8)
    setCameraBGColor("camGame", "#000000") -- temporary fix for a bug in RFE

    makeSprite("back", "images/miku/cyberspace/back.png", 160, 100, true)
    setSpriteScale("back", 2, 2)
    setSpriteScrollFactor("back", 0.5, 0.5)
    addSprite("back")

    makeSprite("screens2", "images/miku/cyberspace/screens2.png", -240, -180, true)
    setSpriteScrollFactor("screens2", 0.6, 0.6)
    addSprite("screens2")
    setSpriteAlpha("screens2", 0.3)

    makeSprite("screens1", "images/miku/cyberspace/screens1.png", -240, -180, true)
    setSpriteScrollFactor("screens1", 0.8, 0.8)
    addSprite("screens1")
    setSpriteAlpha("screens1", 0.6)

    makeSprite("front", "images/miku/cyberspace/front.png", -170, -40, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")

    makeSprite("spotmeekgr", "images/miku/cyberspace/spotlight-ground.png", 150, 725, true)
    setSpriteScrollFactor("spotmeekgr", 1, 1)
    setSpriteScale("spotmeekgr", 1.5, 1.5)
    addSprite("spotmeekgr")
    setSpriteAlpha("spotmeekgr", 0)

    makeSprite("spotbfgr", "images/miku/cyberspace/spotlight-ground.png", 950, 690, true)
    setSpriteScrollFactor("spotbfgr", 1, 1)
    setSpriteScale("spotbfgr", 1.5, 1.5)
    addSprite("spotbfgr")
    setSpriteAlpha("spotbfgr", 0)
end

function postCreate()
    setActorPosition("opponent", 120, 30)
    setActorPosition("boyfriend", 960, 340)
    setActorPosition("girlfriend", 540, 0)
    setSpriteScrollFactor("gfSprite", 1, 1)

    makeSprite("spotmeek", "images/miku/cyberspace/spotlight.png", 150, -525, true)
    setSpriteScrollFactor("spotmeek", 1, 1)
    setSpriteScale("spotmeek", 1.5, 1.6)
    addSprite("spotmeek")
    setSpriteAlpha("spotmeek", 0)

    makeSprite("spotbf", "images/miku/cyberspace/spotlight.png", 950, -555, true)
    setSpriteScrollFactor("spotbf", 1, 1)
    setSpriteScale("spotbf", 1.5, 1.6)
    addSprite("spotbf")
    setSpriteAlpha("spotbf", 0)

    makeSprite("overblack", "images/miku/cyberspace/blackSquare.png", 630, 360)
    setSpriteScrollFactor("overblack", 0, 0)
    setSpriteScale("overblack", 105, 60)
    addSprite("overblack")

    makeSprite("overwhite", "images/miku/cyberspace/whiteSquare.png", 630, 360)
    setSpriteScrollFactor("overwhite", 0, 0)
    setSpriteScale("overwhite", 145, 100)
    addSprite("overwhite")
    setSpriteAlpha("overwhite", 0)

    makeAnimatedSparrowSprite("resetscreen", "images/miku/cyberspace/resetscreen", 520, 280, false)
    addSpritePrefixAnimation("resetscreen", "reset", "reset screen", 24, false)
    setSpriteScale("resetscreen", 2, 2)
    setSpriteScrollFactor("resetscreen", 0, 0)
    addSprite("resetscreen", true)

    makeSprite("logo", "images/miku/namegrafix/intensevoice.png", 310, 220, true)
    setSpriteScrollFactor("logo", 0, 0)
    setSpriteScale("logo", 1.2, 1.2)
    addSprite("logo")
    setSpriteBlendMode("logo", "lighten")
end

function stepHit()
    if curStep == 30 then
        playSpriteAnimation("resetscreen", "reset")
        destroySprite("logo")
    elseif curStep == 64 then
        setDefaultCamZoom(0.8)
        destroySprite("resetscreen")
        performSpriteAlphaTween("blackout", "overblack", 0, 0.7, "cubeout")
    elseif curStep == 799 then
        performSpriteAlphaTween("blackin", "overblack", 1, 1.8, "cubein")
    elseif curStep == 815 then
        setCameraPosition(780, 369)
        setSpriteVisibility("back", false)
        setSpriteVisibility("front", false)
        setSpriteAlpha("dadSprite", 0)
        setSpriteAlpha("bfSprite", 0)
        setSpriteAlpha("gfSprite", 0)
        setDefaultCamZoom(0.6)
        setSpriteAlpha("screens1", 0)
        setSpriteAlpha("screens2", 0)
    elseif curStep == 816 then -- meek on
        setSpriteAlpha("overblack", 0)
        performSpriteAlphaTween("gfon", "gfSprite", 0.15, 0.1)
        meekOn()
    elseif curStep == 830 then
        bfOn()
        meekOff()
    elseif curStep == 846 then
        meekOn()
        bfOff()
    elseif curStep == 862 then
        bfOn()
        meekOff()
    elseif curStep == 876 then
        meekOn()
    elseif curStep == 880 then -- both off
        performSpriteAlphaTween("meekoff2", "dadSprite", 0, 0.1)
        performSpriteAlphaTween("meekgroff2", "spotmeekgr", 0, 0.1)
        performSpriteAlphaTween("meekspotoff2", "spotmeek", 0, 0.1)
        performSpriteAlphaTween("bfoff2", "bfSprite", 0, 0.1)
        performSpriteAlphaTween("bfgroff2", "spotbfgr", 0, 0.1)
        performSpriteAlphaTween("bfspotoff2", "spotbf", 0, 0.1)
        performSpriteAlphaTween("gfoff", "gfSprite", 0, 0.1)
    elseif curStep == 884 then
        performSpriteAlphaTween("s1o", "screens1", 1, 0.1)
    elseif curStep == 900 then
        performSpriteAlphaTween("s2o", "screens2", 0.9, 0.1)
    elseif curStep == 912 then
        performSpriteAlphaTween("meekon2", "dadSprite", 1, 0.1)
        performSpriteAlphaTween("meekgron2", "spotmeekgr", 1, 0.1)
        performSpriteAlphaTween("meekspoton2", "spotmeek", 1, 0.1)
        performSpriteAlphaTween("bfon2", "bfSprite", 1, 0.1)
        performSpriteAlphaTween("bfgron2", "spotbfgr", 1, 0.1)
        performSpriteAlphaTween("bfspoton2", "spotbf", 1, 0.1)
        performSpriteAlphaTween("gfon2", "gfSprite", 0.15, 0.1)
    elseif curStep == 936 then
        setDefaultCamZoom(0.8)
        setSpriteVisibility("back", true)
        setSpriteVisibility("front", true)
        setSpriteAlpha("gfSprite", 1)
        setSpriteAlpha("screens1", 0.8)
        setSpriteAlpha("screens2", 0.6)
        destroySprite("spotbf")
        destroySprite("spotbfgr")
        destroySprite("spotmeek")
        destroySprite("spotmeekgr")
        setSpriteAlpha("overwhite", 1)
    elseif curStep == 937 then
        performSpriteAlphaTween("flash", "overwhite", 0, 0.8)
    elseif curStep == 944 then
        resetCameraPosition(0, 0)
    end
end

function meekOn()
    performSpriteAlphaTween("meekon", "dadSprite", 1, 0.1)
    performSpriteAlphaTween("meekgron", "spotmeekgr", 1, 0.1)
    performSpriteAlphaTween("meekspoton", "spotmeek", 1, 0.1)
end

function meekOff()
    performSpriteAlphaTween("meekoff", "dadSprite", 0, 0.1)
    performSpriteAlphaTween("meekgroff", "spotmeekgr", 0, 0.1)
    performSpriteAlphaTween("meekspotoff", "spotmeek", 0, 0.1)
end

function bfOn()
    performSpriteAlphaTween("bfon", "bfSprite", 1, 0.1)
    performSpriteAlphaTween("bfgron", "spotbfgr", 1, 0.1)
    performSpriteAlphaTween("bfspoton", "spotbf", 1, 0.1)
end

function bfOff()
    performSpriteAlphaTween("bfoff", "bfSprite", 0, 0.1)
    performSpriteAlphaTween("bfgroff", "spotbfgr", 0, 0.1)
    performSpriteAlphaTween("bfspotoff", "spotbf", 0, 0.1)
end