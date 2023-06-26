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

    makeAnimatedSparrowSprite("simps", "images/miku/bunch_of_simps", -35, 550, true)
    addSpritePrefixAnimation("simps", "bounce", "Downer Crowd Bob", 24, false)
    setSpriteScale("simps", 1.23, 1.23)
    setSpriteScrollFactor("simps", 1.2, 0.7)
    addSprite("simps", true)
end

function beatHit()
    if curBeat == 196 or curBeat == 276 or curBeat == 356 then
        playActorAnimation("boyfriend", "hey", true)
    end

    if curBeat % 2 == 1 then
        playSpriteAnimation("simps", "bounce", true)
    end
end

function goodNoteHit(noteData, isSustainNote, mustPress, noteType)
    if noteType == "bfHey" then
        giveHealth(0.023)
        playActorAnimation("boyfriend", "hey", true)
    end
end