-- MYLF | Auto Loader FINAL (POST FIX)

local StarterGui = game:GetService("StarterGui")

local function notify(t, m, d)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = t,
            Text = m,
            Duration = d or 3
        })
    end)
end

local requestFunc =
    (syn and syn.request) or
    (http and http.request) or
    http_request or
    request

if not requestFunc then
    notify("MYLF", "Executor desteklenmiyor", 4)
    return
end

notify("MYLF", "Connecting...", 2)

local res = requestFunc({
    Url = "https://mylfhubdoors.bythekyol.workers.dev/",
    Method = "POST"
})

if not res or not res.Body then
    notify("MYLF", "Server cevap vermedi", 4)
    return
end

local ok, err = pcall(function()
    loadstring(res.Body)()
end)

if ok then
    notify("MYLF", "Inject başarılı", 3)
else
    notify("MYLF", "Load error", 4)
end

