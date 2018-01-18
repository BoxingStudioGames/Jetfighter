--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0620362a26f7d91d1a989227c806f140:bcbc81d67c2ac2c2e31133fc4d803b12:ff6ed9a539a848dae2d91c7b3e7c2dd2$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- Explosion_001
            x=302,
            y=125,
            width=37,
            height=35,

            sourceX = 64,
            sourceY = 66,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Explosion_002
            x=417,
            y=77,
            width=51,
            height=53,

            sourceX = 58,
            sourceY = 57,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Explosion_003
            x=417,
            y=2,
            width=73,
            height=73,

            sourceX = 47,
            sourceY = 48,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Explosion_005
            x=302,
            y=2,
            width=113,
            height=121,

            sourceX = 29,
            sourceY = 26,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Explosion_006
            x=171,
            y=2,
            width=129,
            height=143,

            sourceX = 20,
            sourceY = 17,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Explosion_007
            x=2,
            y=2,
            width=167,
            height=163,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 167,
            sourceHeight = 167
        },
        {
            -- Explosion_009
            x=2,
            y=2,
            width=167,
            height=163,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 167,
            sourceHeight = 167
        },
    },
    
    sheetContentWidth = 492,
    sheetContentHeight = 167
}

SheetInfo.frameIndex =
{

    ["Explosion_001"] = 1,
    ["Explosion_002"] = 2,
    ["Explosion_003"] = 3,
    ["Explosion_005"] = 4,
    ["Explosion_006"] = 5,
    ["Explosion_007"] = 6,
    ["Explosion_009"] = 7,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
