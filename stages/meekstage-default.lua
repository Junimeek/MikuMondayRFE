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
end