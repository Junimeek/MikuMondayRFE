local missTotal = 0 -- Counts total misses

function create()
    setDefaultCamZoom(0.78)

    setCameraBGColor("camGame", "#5E142B")

    makeSprite("windows", "images/miku/church/windows.png", -420, -300, true)
    setSpriteScale("windows", 0.8, 0.8)
    setSpriteScrollFactor("windows", 0.4, 0.4)
    addSprite("windows")

    makeSprite("spikeL", "images/miku/church/spikeL.png", -400, -180, true)
    setSpriteScale("spikeL", 1, 1)
    setSpriteScrollFactor("spikeL", 0.6, 0.6)
    addSprite("spikeL")

    makeSprite("spikeR", "images/miku/church/spikeR.png", 1169, -180, true)
    setSpriteScale("spikeR", 1, 1)
    setSpriteScrollFactor("spikeR", 0.6, 0.6)
    addSprite("spikeR")

    makeSprite("front", "images/miku/church/ground.png", -670, 400, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")
end

function postCreate()
    setActorPosition("opponent", 0, 40)
    setActorPosition("boyfriend", 1060, 340)
    addToBoyfriendCamFollow(-60, -60)
    setActorPosition("girlfriend", 440, -100)
    setSpriteScrollFactor("gfSprite", 1, 1)

    makeSprite("sekai", "images/miku/namegrafix/worldismine-title", 220, 540, true)
    setSpriteScale("sekai", 1.3, 1.3)
    setSpriteScrollFactor("sekai", 0, 0)
    addSprite("sekai")
    setSpriteAlpha("sekai", 0)

    makeSprite("ryo", "images/miku/namegrafix/worldismine-ryo.png", 1020, 60, true)
    setSpriteScale("ryo", 1.5, 1.5)
    setSpriteScrollFactor("ryo", 0, 0)
    addSprite("ryo")
    setSpriteAlpha("ryo", 0)
end

function stepHit()
    if curStep == 2 then
        performSpriteYTween("moveup", "sekai", 400, 3, "cubeout")
        performSpriteYTween("movedown", "ryo", 150, 3, "cubeout")
        performSpriteAlphaTween("titlefadein", "sekai", 1, 1)
        performSpriteAlphaTween("artistfadein", "ryo", 1, 1)
    elseif curStep == 40 then
        performSpriteAlphaTween("titlefadeout", "sekai", 0, 0.2)
        performSpriteAlphaTween("artistfadeout", "ryo", 0, 0.2)
    elseif curStep == 60 then
        destroySprite("sekai")
        destroySprite("ryo")
    elseif curStep == 224 or curStep == 1312 or curStep == 1792 then
        playActorAnimation("boyfriend", "hey")
    elseif curStep == 1760 then
        setCameraPosition(740, 333)
    elseif curStep == 1792 then
        resetCameraPosition(0, 0)
    end
end

function goodNoteHit(noteData, isSustainNote, mustPress, noteType)
    if noteType == "bfHey" then
        giveHealth(0.023)
        playActorAnimation("boyfriend", "hey", true)
    end
end