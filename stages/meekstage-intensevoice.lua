function create()
    setDefaultCamZoom(0.8)

    makeSprite("back", "images/miku/intensevoice/back.png", 160, 100, true)
    setSpriteScale("back", 2, 2)
    setSpriteScrollFactor("back", 0.5, 0.5)
    addSprite("back")

    makeSprite("screens2", "images/miku/intensevoice/screens2.png", -240, -180, true)
    setSpriteScrollFactor("screens2", 0.6, 0.6)
    addSprite("screens2")
    setSpriteAlpha("screens2", 0.3)

    makeSprite("screens1", "images/miku/intensevoice/screens1.png", -240, -180, true)
    setSpriteScrollFactor("screens1", 0.8, 0.8)
    addSprite("screens1")
    setSpriteAlpha("screens1", 0.6)

    makeSprite("front", "images/miku/intensevoice/front.png", -170, -40, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")

    makeAnimatedSparrowSprite("resetscreen", "images/miku/intensevoice/resetscreen", 520, 280, false)
    addSpritePrefixAnimation("resetscreen", "reset", "reset screen", 24, false)
    setSpriteScale("resetscreen", 2, 2)
    setSpriteScrollFactor("resetscreen", 0, 0)
    addSprite("resetscreen", true)

    makeSprite("spotmeekgr", "images/miku/intensevoice/spotlight-ground.png", 150, 725, true)
    setSpriteScrollFactor("spotmeekgr", 1, 1)
    setSpriteScale("spotmeekgr", 1.5, 1.5)
    addSprite("spotmeekgr")
    setSpriteVisibility("spotmeekgr", fasle)

    makeSprite("spotbfgr", "images/miku/intensevoice/spotlight-ground.png", 950, 690, true)
    setSpriteScrollFactor("spotbfgr", 1, 1)
    setSpriteScale("spotbfgr", 1.5, 1.5)
    addSprite("spotbfgr")
    setSpriteVisibility("spotbfgr", false)
end

function postCreate()
    setActorPosition("opponent", 120, 30)
    setActorPosition("boyfriend", 960, 340)
    setActorPosition("girlfriend", 540, 0)
    setSpriteOrder("resetscreen", 10)

    makeSprite("spotmeek", "images/miku/intensevoice/spotlight.png", 150, -525, true)
    setSpriteScrollFactor("spotmeek", 1, 1)
    setSpriteScale("spotmeek", 1.5, 1.6)
    addSprite("spotmeek")
    setSpriteVisibility("spotmeek")

    makeSprite("spotbf", "images/miku/intensevoice/spotlight.png", 950, -555, true)
    setSpriteScrollFactor("spotbf", 1, 1)
    setSpriteScale("spotbf", 1.5, 1.6)
    addSprite("spotbf")
    setSpriteVisibility("spotbf")
end

function stepHit()
    if curStep == 29 then
        playSpriteAnimation("resetscreen", "reset")
    elseif curStep == 63 then
        destroySprite("resetscreen")
    elseif curStep == 811 then
        setSpriteVisibility("back", false)
        setSpriteVisibility("front", false)
        setSpriteVisibility("dadSprite", false)
        setSpriteVisibility("bfSprite", false)
        setSpriteAlpha("gfSprite", 0)
        setDefaultCamZoom(0.6)
        setSpriteAlpha("screens1", 0)
        setSpriteAlpha("screens2", 0)
    elseif curStep == 815 then -- meek on
        setSpriteVisibility("dadSprite", true)
        setSpriteVisibility("spotmeekgr", true)
        setSpriteVisibility("spotmeek", true)
        setSpriteAlpha("gfSprite", 0.15)
    elseif curStep == 829 then -- bf on
        setSpriteVisibility("bfSprite", true)
        setSpriteVisibility("spotbfgr", true)
        setSpriteVisibility("spotbf", true)
    elseif curStep == 831 then -- meek off
        setSpriteVisibility("dadSprite", false)
        setSpriteVisibility("spotmeekgr", false)
        setSpriteVisibility("spotmeek", false)
    elseif curStep == 845 then -- meek on
        setSpriteVisibility("dadSprite", true)
        setSpriteVisibility("spotmeekgr", true)
        setSpriteVisibility("spotmeek", true)
    elseif curStep == 847 then -- bf off
        setSpriteVisibility("bfSprite", false)
        setSpriteVisibility("spotbfgr", false)
        setSpriteVisibility("spotbf", false)
    elseif curStep == 861 then -- bf on
        setSpriteVisibility("bfSprite", true)
        setSpriteVisibility("spotbfgr", true)
        setSpriteVisibility("spotbf", true)
    elseif curStep == 863 then -- meek off
        setSpriteVisibility("dadSprite", false)
        setSpriteVisibility("spotmeekgr", false)
        setSpriteVisibility("spotmeek", false)
    elseif curStep == 875 then -- meek on
        setSpriteVisibility("dadSprite", true)
        setSpriteVisibility("spotmeekgr", true)
        setSpriteVisibility("spotmeek", true)
    elseif curStep == 879 then -- both off
        setSpriteVisibility("dadSprite", false)
        setSpriteVisibility("spotmeekgr", false)
        setSpriteVisibility("spotmeek", false)
        setSpriteVisibility("bfSprite", false)
        setSpriteVisibility("spotbfgr", false)
        setSpriteVisibility("spotbf", false)
        setSpriteAlpha("gfSprite", 0)
    elseif curStep == 887 then
        setSpriteAlpha("screens1", 1)
    elseif curStep == 903 then
        setSpriteAlpha("screens2", 0.9)
    elseif curStep == 911 then
        setSpriteVisibility("dadSprite", true)
        setSpriteVisibility("spotmeekgr", true)
        setSpriteVisibility("spotmeek", true)
        setSpriteVisibility("bfSprite", true)
        setSpriteVisibility("spotbfgr", true)
        setSpriteVisibility("spotbf", true)
        setSpriteAlpha("gfSprite", 0.15)
    elseif curStep == 935 then
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
    end
end
