local curColor = 0

function create()
    --setDefaultCamZoom(0.75)
    setDefaultCamZoom(0.75)
    setCameraBGColor("camGame", "#000000")

    makeSprite("space", "images/miku/hall/spacebg.png", -290, -200, true)
    setSpriteScrollFactor("space", 0.02 , 0.02)
    addSprite("space")
    setSpriteAlpha("space", 0.4, 0.4)

    makeSprite("stars1", "images/miku/hall/meltstars1.png", -250, -200, true)
    setSpriteScrollFactor("stars1", 0.1, 0.1)
    setSpriteScale("stars1", 1.1, 1.1)
    addSprite("stars1")
    setSpriteAlpha("stars1", 0.7, 0.7)

    makeSprite("stars2", "images/miku/hall/meltstars2.png", -250, -200, true)
    setSpriteScrollFactor("stars2", 0.07, 0.07)
    setSpriteScale("stars2", 1.1, 1.1)
    addSprite("stars2")
    setSpriteAlpha("stars2", 0.5, 0.5)

    makeSprite("stars3", "images/miku/hall/meltstars3.png", -250, -200, true)
    setSpriteScrollFactor("stars3", 0.04, 0.04)
    setSpriteScale("stars3", 1.1, 1.1)
    addSprite("stars3")
    setSpriteAlpha("stars3", 0.3, 0.3)

    makeSprite("sun", "images/miku/hall/meltsun.png", 150, -50, true)
    setSpriteScrollFactor("sun", 0.5, 0.8)
    setSpriteScale("sun", 1, 1)
    addSprite("sun")

    makeSprite("earth", "images/miku/hall/meltearth.png", 150, 570, true)
    setSpriteScrollFactor("earth", 0.3, 0.15)
    setSpriteScale("earth", 1.6, 1.6)
    addSprite("earth")

    makeAnimatedSparrowSprite("kisekileft", "images/miku/hall/kiseki.png", 570, -100, true)
    setSpriteScrollFactor("kisekileft", 0.35, 0.1)
    setSpriteScale("kisekileft", 1.4, 1.4)
    addSprite("kisekileft", true)

    makeAnimatedSparrowSprite("kisekiright", "images/miku/hall/kiseki.png", 860, -100, true)
    setSpriteScrollFactor("kisekiright", 0.35, 0.1)
    setSpriteScale("kisekiright", 1.4, 1.4)
    addSprite("kisekiright", true)

    AddKisekiAnimations()

    --makeSprite("backing", "images/miku/hall/backing2.png", -100, -100, true)
    --setSpriteScrollFactor("backing", 0.35, 0.1)
    --setSpriteScale("backing", 1.4, 1.4)
    --addSprite("backing")

    makeSprite("backingleft", "images/miku/hall/backingleft.png", -275, -100, true)
    setSpriteScrollFactor("backingleft", 0.35, 0.1)
    setSpriteScale("backingleft", 1.4, 1.4)
    addSprite("backingleft")

    makeSprite("backingright", "images/miku/hall/backingright.png", 975, -100, true)
    setSpriteScrollFactor("backingright", 0.35, 0.1)
    setSpriteScale("backingright", 1.4, 1.4)
    addSprite("backingright")

    makeAnimatedSparrowSprite("stageback", "images/miku/hall/meltback", 450, 150, true)
    setSpriteScale("stageback", 1.9, 1.9)
    setSpriteScrollFactor("stageback", 0.75, 0.75)
    addSprite("stageback", true)
    setSpriteAlpha("stageback", 0.84)

    makeSprite("backlights", "images/miku/hall/meltbacklights", 460, 160)
    setSpriteScale("backlights", 1.9, 1.9)
    setSpriteScrollFactor("backlights", 0.75, 0.75)
    addSprite("backlights")
    setSpriteBlendMode("backlights", "overlay")
    setSpriteAlpha("backlights", 0.5)

    makeAnimatedSparrowSprite("lowerstage", "images/miku/hall/meltlowerstage", -190, 630, true)
    setSpriteScale("lowerstage", 1.3, 1.3)
    setSpriteScrollFactor("lowerstage", 1, 1)
    addSprite("lowerstage", true)
    setSpriteAlpha("lowerstage", 0.87)

    AddStageAnimations()

    makeSprite("upperstage", "images/miku/hall/meltupperstage.png", 500, 550, true)
    setSpriteScale("upperstage", 2, 2)
    setSpriteScrollFactor("upperstage", 1, 1)
    addSprite("upperstage")
end

function postCreate()
    setActorPosition("opponent", 120, 30)
    setActorPosition("boyfriend", 990, 380)
    setActorPosition("girlfriend", 540, -100)

    setActorScrollFactor("girlfriend", 1, 1)

    --addToBoyfriendCamFollow(-500, -500)

    makeSprite("melt", "images/miku/namegrafix/melt.png", 200, 400, true)
    setSpriteScale("melt", 1.5, 1.5)
    setSpriteScrollFactor("melt", 0, 0)
    addSprite("melt")
    setSpriteAlpha("melt", 0)

    curColor = 0
    playSpriteAnimation("stageback", "static", true)
    playSpriteAnimation("lowerstage", "static", true)
    playSpriteAnimation("kisekileft", "static", true)
    playSpriteAnimation("kisekiright", "static", true)

    makeSprite("white", "images/miku/common/white.png", 630, 330, true)
    setSpriteScale("white", 120, 70)
    setSpriteScrollFactor("white", 0, 0)
    addSprite("white")
    setSpriteAlpha("white", 0.02)
end

local speedmod = 19

function stepHit()
    if curStep == 1000 then
        playSpriteAnimation("kisekileft", "rainbow", true)
        playSpriteAnimation("kisekiright", "rainbow", true)
    elseif curStep == 1007 then
        performSpriteXTween("movebackingleft", "backingleft", -1475, speedmod)
        performSpriteXTween("movekisekileft", "kisekileft", -630, speedmod)
        performSpriteXTween("movebackingright", "backingright", 2175, speedmod)
        performSpriteXTween("movekisekiright", "kisekiright", 2060, speedmod)
    end

    if curStep == 1 then
        performSpriteAlphaTween("slowout", "white", 0, 2)
    elseif curStep == 1296 then
        setSpriteAlpha("white", 0.9)
        setSpriteAlpha("stageback", 0.80)
        setSpriteAlpha("lowerstage", 0.83)
    elseif curStep == 1297 then
        performSpriteAlphaTween("midout", "white", 0, 1.4)
    end

    if curStep == 112 then
        performSpriteAlphaTween("titlefadein", "melt", 1, 1)
    elseif curStep == 142 then
        performSpriteAlphaTween("titlefadeout", "melt", 0, 0.2)
    elseif curStep == 148 then
        destroySprite("melt")
    end

    if curStep == 384 or curStep == 512 or curStep == 1136 or curStep == 1748 then
        playActorAnimation("boyfriend", "hey")
    end
end

function AddKisekiAnimations()
    addSpritePrefixAnimation("kisekileft", "static", "rainbow_static", 24, false)
    addSpritePrefixAnimation("kisekileft", "rainbow", "rainbow_transition", 24, false)

    addSpritePrefixAnimation("kisekiright", "static", "rainbow_static", 24, false)
    addSpritePrefixAnimation("kisekiright", "rainbow", "rainbow_transition", 24, false)
end

function AddStageAnimations()
    addSpritePrefixAnimation("stageback", "static", "stageback_static", 24, false)
    addSpritePrefixAnimation("stageback", "r1", "stageback_rainbow1", 24, false)
    addSpritePrefixAnimation("stageback", "r2", "stageback_rainbow2", 24, false)
    addSpritePrefixAnimation("stageback", "r3", "stageback_rainbow3", 24, false)
    addSpritePrefixAnimation("stageback", "r4", "stageback_rainbow4", 24, false)
    addSpritePrefixAnimation("stageback", "r5", "stageback_rainbow5", 24, false)
    addSpritePrefixAnimation("stageback", "r6", "stageback_rainbow6", 24, false)
    addSpritePrefixAnimation("stageback", "r7", "stageback_rainbow7", 24, false)

    addSpritePrefixAnimation("lowerstage", "static", "lowerstage_static", 24, false)
    addSpritePrefixAnimation("lowerstage", "r1", "lowerstage_rainbow1", 24, false)
    addSpritePrefixAnimation("lowerstage", "r2", "lowerstage_rainbow2", 24, false)
    addSpritePrefixAnimation("lowerstage", "r3", "lowerstage_rainbow3", 24, false)
    addSpritePrefixAnimation("lowerstage", "r4", "lowerstage_rainbow4", 24, false)
    addSpritePrefixAnimation("lowerstage", "r5", "lowerstage_rainbow5", 24, false)
    addSpritePrefixAnimation("lowerstage", "r6", "lowerstage_rainbow6", 24, false)
    addSpritePrefixAnimation("lowerstage", "r7", "lowerstage_rainbow7", 24, false)
end

function beatHit()
    if curBeat >= 324 and curBeat < 432 then
        if curBeat % 2 == 0 then
            AdvanceColors()
        end
    elseif curBeat >= 432 then
        AdvanceColors()
    end
end

function AdvanceColors()
    if curColor < 7 then
        curColor = curColor + 1
    else
        curColor = 1
    end
    
    if curColor == 1 then
        playSpriteAnimation("stageback", "r1", true)
        playSpriteAnimation("lowerstage", "r1", true)
    elseif curColor == 2 then
        playSpriteAnimation("stageback", "r2", true)
        playSpriteAnimation("lowerstage", "r2", true)
    elseif curColor == 3 then
        playSpriteAnimation("stageback", "r3", true)
        playSpriteAnimation("lowerstage", "r3", true)
    elseif curColor == 4 then
        playSpriteAnimation("stageback", "r4", true)
        playSpriteAnimation("lowerstage", "r4", true)
    elseif curColor == 5 then
        playSpriteAnimation("stageback", "r5", true)
        playSpriteAnimation("lowerstage", "r5", true)
    elseif curColor == 6 then
        playSpriteAnimation("stageback", "r6", true)
        playSpriteAnimation("lowerstage", "r6", true)
    elseif curColor == 7 then
        playSpriteAnimation("stageback", "r7", true)
        playSpriteAnimation("lowerstage", "r7", true)
    end
end