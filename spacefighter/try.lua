--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:56f1f268857a136f10a951a9555c5430:3e7cb2d71c6da03505c2acfaea1921c1:fbb3aa607425b3d45ac74d65a48c8236$
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
            -- try0001
            x=832,
            y=195,
            width=238,
            height=191,

            sourceX = 10,
            sourceY = 25,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0002
            x=1072,
            y=195,
            width=236,
            height=189,

            sourceX = 12,
            sourceY = 27,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0003
            x=490,
            y=2,
            width=244,
            height=187,

            sourceX = 12,
            sourceY = 31,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0004
            x=736,
            y=2,
            width=246,
            height=185,

            sourceX = 12,
            sourceY = 37,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0005
            x=2,
            y=2,
            width=240,
            height=207,

            sourceX = 4,
            sourceY = 16,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0006
            x=404,
            y=203,
            width=220,
            height=213,

            sourceX = 9,
            sourceY = 13,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0007
            x=626,
            y=191,
            width=204,
            height=207,

            sourceX = 25,
            sourceY = 17,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0008
            x=2,
            y=211,
            width=186,
            height=243,

            sourceX = 35,
            sourceY = 0,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0009
            x=190,
            y=211,
            width=212,
            height=231,

            sourceX = 16,
            sourceY = 11,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0010
            x=244,
            y=2,
            width=244,
            height=199,

            sourceX = 0,
            sourceY = 27,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- try0011
            x=984,
            y=2,
            width=238,
            height=191,

            sourceX = 10,
            sourceY = 25,
            sourceWidth = 258,
            sourceHeight = 243
        },
    },
    
    sheetContentWidth = 1310,
    sheetContentHeight = 456
}

SheetInfo.frameIndex =
{

    ["try0001"] = 1,
    ["try0002"] = 2,
    ["try0003"] = 3,
    ["try0004"] = 4,
    ["try0005"] = 5,
    ["try0006"] = 6,
    ["try0007"] = 7,
    ["try0008"] = 8,
    ["try0009"] = 9,
    ["try0010"] = 10,
    ["try0011"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
