-- [[ Main Variables ]]
local Requester = request or http_request or (http and http.request) or syn.request
local __CheckSelfDestroyTable__ = {
    Url = "https://pastebin.com/raw/rMCEzKnE",
    Method = "GET",
    Headers = {['Content-Type'] = "application/json"}
}
---

-- [[ Security ]] --
local __CheckRequest__ = Requester(__CheckSelfDestroyTable__)

if __CheckRequest__.StatusCode == 404 then PlayersService.LocalPlayer:Kick('Script or version of script is fully disabled by Husam!\n\nEven Husam can not manage to get this version up again, how ever Husam can easily publish a new version like this so you can get help of Husam#0001') end

if __CheckRequest__.StatusCode ~= 404 then
    local function __CheckSpoof__(CheckId)
        repeat wait() until game:GetService('Players'):GetPlayerByUserId(CheckId)
        local UserID_Data = game:HttpGet('https://users.roblox.com/v1/users/'..CheckId, true)
        local User = game:GetService('Players'):GetPlayerByUserId(CheckId)
        if UserID_Data and User then
            print('Husam#0001: Spoof Checking')
        else
            return
        end
        local DecodedData_User = game:GetService('HttpService'):JSONDecode(UserID_Data)
        if User.Name ~= User.Character.Name then
            game.Players.LocalPlayer:Kick("Husam#0001: Don't waste your time with spoofing (could be error, if it is error then rejoin and ignore or take help of me)")
            return
        end
        if game:GetService('Players'):GetUserIdFromNameAsync(User.Name) ~= User.UserId then
            game.Players.LocalPlayer:Kick("Husam#0001: Don't waste your time with spoofing (could be error, if it is error then rejoin and ignore or take help of me)")
            return
        end
        if User.DisplayName ~= DecodedData_User.displayName then
            game.Players.LocalPlayer:Kick("Husam#0001: Don't waste your time with spoofing (could be error, if it is error then rejoin and ignore or take help of me)")
            return
        end
        if DecodedData_User.isBanned then
            game.Players.LocalPlayer:Kick("Husam#0001: Don't waste your time with spoofing (could be error, if it is error then rejoin and ignore or take help of me)")
            return
        end
        if User then
            for i,v in pairs(game.Players:GetCharacterAppearanceAsync(tonumber(CheckId)):GetChildren()) do
                if v:IsA('Accessory') then
                    if User.Character:FindFirstChild(v.Name) then else
                        game.Players.LocalPlayer:Kick("Husam#0001: Don't waste your time with spoofing (could be error, if it is error then rejoin and ignore or take help of me)")
                        return
                    end
                end
            end
        else
            game.Players.LocalPlayer:Kick("Husam#0001: User not found for spoof check (join with controller account first then alts if you're using altcontrol or script based on putting someone else id")
        end
    end

    __CheckSpoof__(getgenv().AntiSpoofCheckId)
else
    game.Players.LocalPlayer:Kick('Husam#0001: An error occured with security check, please dm husam and screenshot this\n\nError Code: j17eq4nc')
end