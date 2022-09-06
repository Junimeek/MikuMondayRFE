function create()
    setDefaultCamZoom(0.78)

    makeSprite("back", "images/miku/worldismine/back.png", -30, -50, true)
    setSpriteScale("back", 1.3, 1.3)
    setSpriteScrollFactor("back", 0, 0)
    addSprite("back")

    makeSprite("windows", "images/miku/worldismine/windows.png", -420, -300, true)
    setSpriteScale("windows", 0.8, 0.8)
    setSpriteScrollFactor("windows", 0.4, 0.4)
    addSprite("windows")

    makeSprite("spikeL", "images/miku/worldismine/spikeL.png", -400, -180, true)
    setSpriteScale("spikeL", 1, 1)
    setSpriteScrollFactor("spikeL", 0.6, 0.6)
    addSprite("spikeL")

    makeSprite("spikeR", "images/miku/worldismine/spikeR.png", 1169, -180, true)
    setSpriteScale("spikeR", 1, 1)
    setSpriteScrollFactor("spikeR", 0.6, 0.6)
    addSprite("spikeR")

    makeSprite("front", "images/miku/worldismine/ground.png", -670, 400, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")

    makeSprite("songname", "images/miku/namegrafix/worldismine-title", 220, 940, true)
    setSpriteScale("songname", 2.6, 2.6)
    setSpriteScrollFactor("songname", 0, 0)
    addSprite("songname")

    makeSprite("songartist", "images/miku/namegrafix/worldismine-ryo.png", 1180, -260, true)
    setSpriteScale("songartist", 3, 3)
    setSpriteScrollFactor("songartist", 0, 0)
    addSprite("songartist")

    -- note splashes
    --makeAnimatedSparrowSprite("purplesplash", "images/noteSplashes", 100, 100, true)
    --addSpritePrefixAnimation("purplesplash", "note splash red 10", "splash", 24, false)
    --setSpriteScale("purplesplash", 1, 1)
    --setSpriteScrollFactor("purplesplash", 0, 0)
    --addSprite("purplesplash")

end

function postCreate()
    setActorPosition("opponent", 0, 40)
    setActorPosition("boyfriend", 1060, 340)
    addToBoyfriendCamFollow(-60, -60)
    setActorPosition("girlfriend", 440, -100)
    setSpriteScrollFactor("gfSprite", 1, 1)
    setSpriteOrder("songname", 15)
    setSpriteOrder("songartist", 16)
    setSpriteOrder("purplesplash", 17)
end

function beatHit()
    if curBeat == 9 then
        setSpriteVisibility("songname", false)
        setSpriteVisibility("songartist", false)
    elseif curBeat == 10 then
        destroySprite("songname")
        destroySprite("songartist")
    elseif curBeat == 55 then
        playActorAnimation("boyfriend", "hey")
    elseif curBeat == 447 then
        playActorAnimation("boyfriend", "hey")
    end
end

function stepHit()
    if curStep == 1 then
        performSpriteYTween("moveup", "songname", 510, 2)
        performSpriteYTween("movedown", "songartist", 160, 2)
    end
end

--function goodNoteHit()
--    playSpriteAnimation("purplesplash", "splash")
--end