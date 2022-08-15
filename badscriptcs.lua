include("badscript.lua")
local sizes = 25
local message = "No clip is deactivavated"


surface.CreateFont( "TheDefaultSettings", {
	font = "Arial", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = sizes,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

hook.Add("HUDPaint", "DrawMyHud", function()
   
    surface.SetTextColor( 255, 255, 255 ) -- Set text color
	surface.SetTextPos(0,0)
	surface.SetFont( "TheDefaultSettings" ) -- Set the font
	surface.DrawText(message)


end)

net.Receive("noclipallowstrue", function()

	message = "No clip is activated"
	print(message)


end)

net.Receive("noclipallowsfalse", function()

	message = "No clip is deactivavated"
	print(message)


end)