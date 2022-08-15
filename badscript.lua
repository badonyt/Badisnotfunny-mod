local OwnerSteamID = "STEAM_0:1:564501531"
util.AddNetworkString("noclipallowstrue")
util.AddNetworkString("noclipallowsfalse")
AddCSLuaFile("badscriptcs.lua")
local noclipallow = false
hook.Add("PlayerNoClip", "isInNoClip", function(ply, desiredState)
    if ply:SteamID() == OwnerSteamID or ply:IsAdmin() == true then return end
    if desiredState then 
        print(ply:Name() .. " is no clipping, his steam id: " .. ply:SteamID())   
    else
        print(ply:Name() .. " stopped no clipping, his steam id: " .. ply:SteamID())
    end
    if(!noclipallow)then
        ply:Kill() 
    end
end)

hook.Add("GravGunPunt", "UnquieName", function(ply, ent)
    if ply:SteamID() == OwnerSteamID or ply:IsAdmin()then
    print(ply:Name() .. " destroyed this class," .. ent:GetClass())
    ent:Remove()
    end
end)

hook.Add("PlayerSay", "UnquieName", function(ply, mes)
    print(ply)
    if(ply:SteamID() == OwnerSteamID or ply:IsAdmin())then
        if(mes == "!noclipallow")then
            if(noclipallow == true)then
                noclipallow = false
                print("noclipallow is false")
                ply:Say("noclipallow is false",false)
                net.Start("noclipallowsfalse")
                net.Broadcast()
            else
                noclipallow = true
                print("noclipallow is true")
                ply:Say("noclipallow is true",false)
                net.Start("noclipallowstrue")
                net.Broadcast()
            end
        elseif(mes == "!mat 1")then
            RunConsoleCommand("mat_fullbright", "1")                
        elseif(mes == "!mat 0")then
            RunConsoleCommand("mat_fullbright", "0")       
        end

    
    end


end)

-- https://wiki.facepunch.com/gmod/Global.DrawMotionBlur 