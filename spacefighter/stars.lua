--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:8d011abba988f5e2c2f7a9b2f4b6eec5:f30c780c5ed44c54f7c359f79861f87d:3e1adc9746bd4cff89edc31501517ff6$
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
            -- start0001
            x=734,
            y=2,
            width=238,
            height=191,

            sourceX = 10,
            sourceY = 25,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0002
            x=496,
            y=2,
            width=236,
            height=189,

            sourceX = 12,
            sourceY = 27,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0003
            x=250,
            y=2,
            width=244,
            height=187,

            sourceX = 12,
            sourceY = 31,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0004
            x=2,
            y=2,
            width=246,
            height=185,

            sourceX = 12,
            sourceY = 37,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0005
            x=248,
            y=191,
            width=240,
            height=207,

            sourceX = 4,
            sourceY = 16,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0006
            x=696,
            y=195,
            width=220,
            height=213,

            sourceX = 9,
            sourceY = 13,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0007
            x=490,
            y=193,
            width=204,
            height=207,

            sourceX = 25,
            sourceY = 17,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0008
            x=974,
            y=2,
            width=186,
            height=243,

            sourceX = 35,
            sourceY = 0,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0009
            x=918,
            y=247,
            width=212,
            height=231,

            sourceX = 16,
            sourceY = 11,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0010
            x=2,
            y=189,
            width=244,
            height=199,

            sourceX = 0,
            sourceY = 27,
            sourceWidth = 258,
            sourceHeight = 243
        },
        {
            -- start0011
            x=734,
            y=2,
            width=238,
            height=191,

            sourceX = 10,
            sourceY = 25,
            sourceWidth = 258,
            sourceHeight = 243
        },
    },
    
    sheetContentWidth = 1162,
    sheetContentHeight = 480
}

SheetInfo.frameIndex =
{

    ["start0001"] = 1,
    ["start0002"] = 2,
    ["start0003"] = 3,
    ["start0004"] = 4,
    ["start0005"] = 5,
    ["start0006"] = 6,
    ["start0007"] = 7,
    ["start0008"] = 8,
    ["start0009"] = 9,
    ["start0010"] = 10,
    ["start0011"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
