-- vv Change to 'false' if you don't want the captions turned on. vv
local captionsAreActive = true

function create()
    setDefaultCamZoom(0.8)

    makeSprite("back", "images/miku/secretpolice/stageBack.png", -560, -430, true)
    setSpriteScale("back", 0.9, 0.9)
    setSpriteScrollFactor("back", 0.5, 0.5)
    addSprite("back")

    makeSprite("front", "images/miku/secretpolice/stageFront.png", -570, 500, true)
    setSpriteScale("front", 1, 1)
    setSpriteScrollFactor("front", 1, 1)
    addSprite("front")
end

function postCreate()
    setActorPosition("opponent", 50, -70)
    setActorPosition("boyfriend", 860, 320)
    setActorPosition("girlfriend", 440, -60)
    setActorScrollFactor("girlfriend", 1, 1)
    
    makeSprite("overblue", "images/miku/secretpolice/overBlue.png", 600, 350, false)
    setSpriteScale("overblue", 110, 70)
    setSpriteScrollFactor("overblue", 0, 0)
    addSprite("overblue")
    setSpriteBlendMode("overblue", "add")
    setSpriteAlpha("overblue", 0.1)

    makeSprite("overred", "images/miku/secretpolice/overRed.png", 600, 350, false)
    setSpriteScale("overred", 110, 70)
    setSpriteScrollFactor("overred", 0, 0)
    addSprite("overred")
    setSpriteBlendMode("overred", "add")
    setSpriteAlpha("overred", 0.1)
    setSpriteVisibility("overred", false)

    -- red and blue lights
    makeSprite("lights1", "images/miku/secretpolice/stageLights1.png", -570, 500, true)
    setSpriteScale("lights1", 1, 1)
    setSpriteScrollFactor("lights1", 1, 1)
    addSprite("lights1")

    makeSprite("lights2", "images/miku/secretpolice/stageLights2.png", -570, 500, true)
    setSpriteScale("lights2", 1, 1)
    setSpriteScrollFactor("lights2", 1, 1)
    addSprite("lights2")
    setSpriteVisibility("lights2", false)

    -- captions
    makeSprite("cap01", "images/mikuCaptions/secret-police/t01.png", 0, 120, false)
    centerSpriteXY("cap01", true, false)
    setSpriteScrollFactor("cap01", 0, 0)

    makeSprite("cap02", "images/mikuCaptions/secret-police/t02.png", 0, 120, false)
    centerSpriteXY("cap02", true, false)
    setSpriteScrollFactor("cap02", 0, 0)

    makeSprite("cap03", "images/mikuCaptions/secret-police/t03.png", 0, 120, false)
    centerSpriteXY("cap03", true, false)
    setSpriteScrollFactor("cap03", 0, 0)

    makeSprite("cap04", "images/mikuCaptions/secret-police/t04.png", 0, 120, false)
    centerSpriteXY("cap04", true, false)
    setSpriteScrollFactor("cap04", 0, 0)

    makeSprite("cap05", "images/mikuCaptions/secret-police/t05.png", 0, 120, false)
    centerSpriteXY("cap05", true, false)
    setSpriteScrollFactor("cap05", 0, 0)

    makeSprite("cap06", "images/mikuCaptions/secret-police/t06.png", 0, 120, false)
    centerSpriteXY("cap06", true, false)
    setSpriteScrollFactor("cap06", 0, 0)

    makeSprite("cap07", "images/mikuCaptions/secret-police/t07.png", 0, 120, false)
    centerSpriteXY("cap07", true, false)
    setSpriteScrollFactor("cap07", 0, 0)

    makeSprite("cap08", "images/mikuCaptions/secret-police/t08.png", 0, 120, false)
    centerSpriteXY("cap08", true, false)
    setSpriteScrollFactor("cap08", 0, 0)

    makeSprite("cap09", "images/mikuCaptions/secret-police/t09.png", 0, 120, false)
    centerSpriteXY("cap09", true, false)
    setSpriteScrollFactor("cap09", 0, 0)

    makeSprite("cap10", "images/mikuCaptions/secret-police/t10.png", 0, 120, false)
    centerSpriteXY("cap10", true, false)
    setSpriteScrollFactor("cap10", 0, 0)

    makeSprite("cap11", "images/mikuCaptions/secret-police/t11.png", 0, 120, false)
    centerSpriteXY("cap11", true, false)
    setSpriteScrollFactor("cap11", 0, 0)

    makeSprite("cap12", "images/mikuCaptions/secret-police/t12.png", 0, 120, false)
    centerSpriteXY("cap12", true, false)
    setSpriteScrollFactor("cap12", 0, 0)

    makeSprite("cap13", "images/mikuCaptions/secret-police/t13.png", 0, 120, false)
    centerSpriteXY("cap13", true, false)
    setSpriteScrollFactor("cap13", 0, 0)

    makeSprite("cap14", "images/mikuCaptions/secret-police/t14.png", 0, 120, false)
    centerSpriteXY("cap14", true, false)
    setSpriteScrollFactor("cap14", 0, 0)
end

function beatHit()
    if curBeat == 16 then
        makeSprite("title", "images/miku/namegrafix/secret-police.png", 200, 60, true)
        setSpriteScale("title", 1, 1)
        setSpriteScrollFactor("title", 0)
        addSprite("title")
    elseif curBeat == 32 then
        destroySprite("title")
    end

    if curBeat % 2 == 1 then
        setSpriteVisibility("lights1", true)
        setSpriteVisibility("lights2", false)
    elseif curBeat % 2 == 0 then
        setSpriteVisibility("lights1", false)
        setSpriteVisibility("lights2", true)
    end

    if curBeat % 4 == 2 then
        setSpriteVisibility("overblue", true)
        setSpriteVisibility("overred", false)
    elseif curBeat % 2 == 0 then
        setSpriteVisibility("overblue", false)
        setSpriteVisibility("overred", true)
    end
end

function stepHit()
    if songName == "Secret Police" and captionsAreActive == true then
        if curStep == 60 then
            addSprite("cap14") -- GO!
        elseif curStep == 66 then
            destroySprite("cap14")
        elseif curStep == 186 then
            addSprite("cap01") -- omae ga   nounou to   kurashiteru ma ni
        elseif curStep == 224 then
            destroySprite("cap01")
        elseif curStep == 254 then
            addSprite("cap02") -- omao no   mawari no   subete no monotachi
        elseif curStep == 272 then
            destroySprite("cap02")
            addSprite("cap03") -- tatoeba rinjin, douryou   sara ni wa
        elseif curStep == 288 then
            destroySprite("cap03")
        elseif curStep == 324 then
            addSprite("cap04") -- himitsu keisatsu
        elseif curStep == 352 then
            removeSprite("cap04")
        elseif curStep == 388 then
            addSprite("cap05") -- kokkahoanbu na no da!
        elseif curStep == 448 then
            removeSprite("cap05")
        elseif curStep == 452 then
            addSprite("cap06") -- himitsu keisatsu   yami ni magireu
        elseif curStep == 512 then
            removeSprite("cap06")
        elseif curStep == 576 then
            addSprite("cap07") -- asa kara   ban made   omae o   miru
        elseif curStep == 640 then
            removeSprite("cap07")
        elseif curStep == 698 then
            addSprite("cap08") -- omae o   jihaku ni   oikomu tame
        elseif curStep == 736 then
            destroySprite("cap08")
        elseif curStep == 766 then
            addSprite("cap09") -- kurikaesareru   goumon   aruiwa
        elseif curStep == 784 then
            destroySprite("cap09")
        elseif curStep == 800 then
            addSprite("cap10") -- omao no   daiji na mono o   hitojichi
        elseif curStep == 816 then
            destroySprite("cap10")
        elseif curStep == 836 then
            addSprite ("cap11") -- himitsu keisatsu   seifu chokuzoku
        elseif curStep == 900 then
            destroySprite("cap11")
            addSprite("cap05") -- kokkahoanbu na no da!
        elseif curStep == 960 then
            removeSprite("cap05")
        elseif curStep == 1088 then
            addSprite("cap12") -- kuru hi mo   kuru hi mo   omae o   miru
        elseif curStep == 1120 then
            removeSprite("cap12")
        elseif curStep == 1152 then
            addSprite("cap12") -- kuru hi mo   kuru hi mo   omae o   miru
        elseif curStep == 1184 then
            destroySprite("cap12")
        elseif curStep == 1220 then
            addSprite("cap04") -- himitsu keisatsu
        elseif curStep == 1248 then
            destroySprite("cap04")
        elseif curStep == 1284 then
            addSprite("cap05") -- kokkahoanbu na no da!
        elseif curStep == 1344 then
            destroySprite("cap05")
        elseif curStep == 1348 then
            addSprite("cap06") -- himitsu keisatsu   yami ni magireu
        elseif curStep == 1412 then
            destroySprite("cap06")
            addSprite("cap13") -- SPY katsudou   torishimari
        elseif curStep == 1472 then
            destroySprite("cap13")
            addSprite("cap07") -- asa kara   ban made   omae o   miru
        elseif curStep == 1728 then
            destroySprite("cap07")
        end
    end
end
