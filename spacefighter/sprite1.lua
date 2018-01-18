--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:df67c6a5ab2b3cd67c61c7b8e696c2be:cc53e28648f33ea696cf1ef015dbf802:56786d2ef8b6629d3358022ef8f5dc5f$
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
            -- jet_00001
            x=294,
            y=2,
            width=38,
            height=16,

            sourceX = 2,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00002
            x=212,
            y=2,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00003
            x=170,
            y=2,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00004
            x=410,
            y=2,
            width=36,
            height=16,

            sourceX = 4,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00005
            x=372,
            y=2,
            width=36,
            height=16,

            sourceX = 4,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00006
            x=334,
            y=2,
            width=36,
            height=16,

            sourceX = 4,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00007
            x=254,
            y=2,
            width=38,
            height=16,

            sourceX = 2,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00008
            x=128,
            y=2,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00009
            x=86,
            y=2,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00010
            x=44,
            y=2,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
        {
            -- jet_00011
            x=2,
            y=2,
            width=40,
            height=16,

            sourceX = 0,
            sourceY = 4,
            sourceWidth = 40,
            sourceHeight = 22
        },
    },
    
    sheetContentWidth = 448,
    sheetContentHeight = 20
}

SheetInfo.frameIndex =
{

    ["jet_00001"] = 1,
    ["jet_00002"] = 2,
    ["jet_00003"] = 3,
    ["jet_00004"] = 4,
    ["jet_00005"] = 5,
    ["jet_00006"] = 6,
    ["jet_00007"] = 7,
    ["jet_00008"] = 8,
    ["jet_00009"] = 9,
    ["jet_00010"] = 10,
    ["jet_00011"] = 11,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
