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

    -- hidden stuff
    makeSprite("darkness", "images/miku/darkness.png", -200, -130, true)
    setSpriteScale("darkness", 1, 1)
    setSpriteScrollFactor("darkness", 0, 0)
    addSprite("darkness")

    makeSprite("kokoro", "images/miku/namegrafix/kokoro.png", 240, 300, true)
    setSpriteScale("kokoro", 1.6, 1.6)
    setSpriteScrollFactor("kokoro", 0, 0)
    addSprite("kokoro")

    makeSprite("grassbg", "images/miku/kokoro/kokorograssbg.png", -370, -220, true)
    setSpriteScale("grassbg", 0.8, 0.8)
    setSpriteScrollFactor("grassbg", 0, 0)
    addSprite("grassbg")

    makeSprite("message", "images/miku/kokoro/kokoromessage.png", -370, -220, true)
    setSpriteScale("message", 0.8, 0.8)
    setSpriteScrollFactor("message", 0, 0)
    addSprite("message")

    makeSprite("grassfade", "images/miku/kokoro/kokorograssbgfade.png", -370, -220, true)
    setSpriteScale("grassfade", 0.8, 0.8)
    setSpriteScrollFactor("grassfade", 0, 0)
    addSprite("grassfade")

end

function postCreate()
    setActorPosition("opponent", 120, 380)
    setActorPosition("boyfriend", 960, 340)
    setActorPosition("girlfriend", 540, 0)
    setSpriteVisibility("kokoro", false)
    setSpriteOrder("kokoro", 10)
    setSpriteOrder("darkness", 8)
    setSpriteAlpha("grassbg", 0)
    setSpriteOrder("grassbg", 11)
    setSpriteVisibility("message", false)
    setSpriteOrder("message", 12)
    setSpriteAlpha("grassfade", 0)
    setSpriteOrder("grassfade", 13)
end

function beatHit()
    if curBeat == 2 then
        setSpriteVisibility("kokoro", true)
    elseif curBeat == 17 then
        setSpriteVisibility("kokoro", false)
    elseif curBeat == 19 then
        setSpriteAlpha("darkness", 0)
        destroySprite("kokoro")
        destroySprite("grassbg")
        destroySprite("grassfade")
        destroySprite("message")
        resetCameraPosition(0, 0)
    --elseif curBeat == 416 then
        --setSpriteAlpha("grassbg", 100)
        --setSpriteAlpha("grassfade", 100)
        --setSpritePosition("message", -370, 500)
        --setSpriteVisibility("message", true)
    --elseif curBeat == 417 then
        --performSpriteYTween("scroll", "message", -1000, 33)
    end
end