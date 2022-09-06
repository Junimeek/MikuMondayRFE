function create()
    setDefaultCamZoom(1)

    makeSprite("back", "images/miku/polkka/back.png", 0, 0, true)
    setSpriteScale("back", 1, 1)
    setSpriteScrollFactor("back", 0, 0)
    addSprite("back")

end

function postCreate()
    setActorPosition("opponent", 120, 30)
    setActorPosition("boyfriend", 960, 340)
    setActorPosition("girlfriend", 540, 0)
    setSpriteOrder("back", 4)
end

function preSongCountdown()
    setUIElementVisibility(false)
end

function stepHit()
    if curStep == 0 then
        performOpponentStrumYTween("moveX0Lol", 0, -200, 0.01, "cubeInOut")
        performOpponentStrumYTween("moveX1Lol", 1, -200, 0.01, "cubeInOut")
        performOpponentStrumYTween("moveX2Lol", 2, -200, 0.01, "cubeInOut")
        performOpponentStrumYTween("moveX3Lol", 3, -200, 0.01, "cubeInOut")
        performPlayerStrumYTween("moveY0Lol", 0, -200, 0.01, "cubeInOut")
        performPlayerStrumYTween("moveY1Lol", 1, -200, 0.01, "cubeInOut")
        performPlayerStrumYTween("moveY2Lol", 2, -200, 0.01, "cubeInOut")
        performPlayerStrumYTween("moveY3Lol", 3, -200, 0.01, "cubeInOut")
    elseif curStep == 15 then
        makeSprite("t03", "images/miku/polkka/text/t03.png", -110, -60, true)
        addSprite("t03")
    elseif curStep == 77 then
        destroySprite("t03")
    elseif curStep == 79 then
        makeSprite("t04", "images/miku/polkka/text/t04.png", -110, -60, true)
        addSprite("t04")
    elseif curStep == 141 then
        destroySprite("t04")
    elseif curStep == 143 then
        makeSprite("t08", "images/miku/polkka/text/t08.png", -110, -60, true)
        addSprite("t08")
    elseif curStep == 167 then
        performOpponentStrumYTween("moveX0Lol", 0, defaultOpponentStrumY0, 0.5, "cubeInOut")
        performOpponentStrumYTween("moveX1Lol", 1, defaultOpponentStrumY1, 0.5, "cubeInOut")
        performOpponentStrumYTween("moveX2Lol", 2, defaultOpponentStrumY2, 0.5, "cubeInOut")
        performOpponentStrumYTween("moveX3Lol", 3, defaultOpponentStrumY3, 0.5, "cubeInOut")
        performPlayerStrumYTween("moveY0Lol", 0, defaultPlayerStrumY0, 0.5, "cubeInOut")
        performPlayerStrumYTween("moveY1Lol", 1, defaultPlayerStrumY1, 0.5, "cubeInOut")
        performPlayerStrumYTween("moveY2Lol", 2, defaultPlayerStrumY2, 0.5, "cubeInOut")
        performPlayerStrumYTween("moveY3Lol", 3, defaultPlayerStrumY3, 0.5, "cubeInOut")
    elseif curStep == 183 then
        setUIElementVisibility(true)
        destroySprite("t08")
        makeSprite("t05", "images/miku/polkka/text/t05.png", -110, -60, true)
        addSprite("t05")
    elseif curStep == 223 then
        setSpriteVisibility("t05", false)
        makeSprite("t06", "images/miku/polkka/text/t06.png", -110, -60, true)
        addSprite("t06")
    elseif curStep == 255 then
        setSpriteVisibility("t06", false)
        makeSprite("t07", "images/miku/polkka/text/t07.png", -110, -60, true)
        addSprite("t07")
    elseif curStep == 391 then
        setSpriteVisibility("t07", false)
    elseif curStep == 399 then
        makeSprite("t09", "images/miku/polkka/text/t09.png", -110, -60, true)
        addSprite("t09")
    elseif curStep == 459 then
        destroySprite("t09")
        setSpriteVisibility("t05", true)
    elseif curStep == 475 then
        setSpriteVisibility("t05", false)
        setSpriteVisibility("t06", true)
    elseif curStep == 491 then
        setSpriteVisibility("t06", false)
        setSpriteVisibility("t07", true)
    elseif curStep == 511 then
        setSpriteVisibility("t07", false)
    elseif curStep == 523 then
        makeSprite("t10", "images/miku/polkka/text/t10.png", -110, -60, true)
        addSprite("t10")
    elseif curStep == 527 then
        destroySprite("t10")
    elseif curStep == 651 then
        makeSprite("t11", "images/miku/polkka/text/t11.png", -110, -60, true)
        addSprite("t11")
    elseif curStep == 735 then
        destroySprite("t11")
    end
end