local scMod = 8


function create()
    setDefaultCamZoom(0.8)

    makeSprite("sky", "images/miku/sakura/weebSky.png", 800, 450, false)
    setSpriteScale("sky", scMod, scMod)
    setSpriteScrollFactor("sky", 0.1, 0.1)
    addSprite("sky")

    makeSprite("school", "images/miku/sakura/sakuraSchool.png", -840, -520, true)
    setSpriteScale("school", 0.9, 0.9)
    setSpriteScrollFactor("school", 0.6, 0.9)
    addSprite("school")

    makeSprite("street", "images/miku/sakura/sakuraStreet.png", -750, 440, true)
    setSpriteScale("street", 0.9, 0.9)
    setSpriteScrollFactor("street", 1, 1)
    addSprite("street")

    makeSprite("treebark", "images/miku/sakura/weebTreesBack.png", 670, 230, false)
    setSpriteScale("treebark", scMod, scMod)
    setSpriteScrollFactor("treebark", 0.95, 0.95)
    addSprite("treebark")

    makeAnimatedPackerSprite("trees", "images/miku/sakura/weebTrees", 500, 100, false)
    setSpriteScale("trees", scMod, scMod)
    setSpriteScrollFactor("trees", 0.9, 0.9)
    addSprite("trees", true)
    addSpritePrefixAnimation("trees", "treeLoop", "trees_", 12, true)
    playSpriteAnimation("trees", "treeLoop")
end

function postCreate()
    setActorPosition("opponent", 100, 0)
    setActorPosition("boyfriend", 990, 310)
    setActorPosition("girlfriend", 500, -120)
    setSpriteScrollFactor("gfSprite", 1, 1)

    makeAnimatedSparrowSprite("petals", "images/miku/sakura/petals", 666, 400, false)
    setSpriteScale("petals", scMod, scMod)
    setSpriteScrollFactor("petals", 0.3, 0.3)
    addSprite("petals", true)
    addSpritePrefixAnimation("petals", "petalLoop", "PETALS ALL", 24, true)
    playSpriteAnimation("petals", "petalLoop")
end