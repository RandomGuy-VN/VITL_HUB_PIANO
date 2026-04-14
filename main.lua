    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    
    local LoadGui = Instance.new("ScreenGui")
    LoadGui.Name = "VitlLoadingScreen"
    LoadGui.ResetOnSpawn = false
    LoadGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local successGui = pcall(function() LoadGui.Parent = game:GetService("CoreGui") end)
    if not successGui then LoadGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end

    local FullscreenCover = Instance.new("Frame")
    FullscreenCover.Size = UDim2.fromScale(1, 1)
    FullscreenCover.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    FullscreenCover.BackgroundTransparency = 1
    FullscreenCover.ZIndex = 0
    FullscreenCover.Parent = LoadGui

    local MainFrame = Instance.new("Frame")
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 340, 0, 130)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.BackgroundTransparency = 1
    MainFrame.ZIndex = 1
    MainFrame.Parent = LoadGui
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 12)
    UICorner.Parent = MainFrame

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(255, 255, 255)
    UIStroke.Thickness = 1.5
    UIStroke.Transparency = 1
    UIStroke.Parent = MainFrame

    local StrokeGradient = Instance.new("UIGradient")
    StrokeGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    StrokeGradient.Parent = UIStroke

    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    Shadow.BackgroundTransparency = 1
    Shadow.Position = UDim2.new(0.5, 0, 0.5, 3)
    Shadow.Size = UDim2.new(1, 40, 1, 40)
    Shadow.ZIndex = 0
    Shadow.Image = "rbxassetid://6015897043"
    Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    Shadow.ImageTransparency = 1
    Shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    TitleLabel.Position = UDim2.new(0, 0, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBlack
    TitleLabel.Text = "VITL PIANO"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 28
    TitleLabel.TextTransparency = 1
    TitleLabel.ZIndex = 2
    TitleLabel.Parent = MainFrame

    local TitleGradient = Instance.new("UIGradient")
    TitleGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 150, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    TitleGradient.Parent = TitleLabel

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Size = UDim2.new(1, 0, 0, 15)
    SubtitleLabel.Position = UDim2.new(0, 0, 0, 45)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Font = Enum.Font.GothamMedium
    SubtitleLabel.Text = "Made by vitl1107 with <3"
    SubtitleLabel.TextColor3 = Color3.fromRGB(180, 180, 220)
    SubtitleLabel.TextSize = 12
    SubtitleLabel.TextTransparency = 1
    SubtitleLabel.ZIndex = 2
    SubtitleLabel.Parent = MainFrame

    local StatusLabel = Instance.new("TextLabel")
    StatusLabel.Size = UDim2.new(1, 0, 0, 20)
    StatusLabel.Position = UDim2.new(0, 0, 0, 75)
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Font = Enum.Font.GothamSemibold
    StatusLabel.Text = "Initializing..."
    StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
    StatusLabel.TextSize = 13
    StatusLabel.TextTransparency = 1
    StatusLabel.ZIndex = 2
    StatusLabel.Parent = MainFrame

    local BarBackground = Instance.new("Frame")
    BarBackground.Size = UDim2.new(0, 280, 0, 6)
    BarBackground.Position = UDim2.new(0.5, 0, 0, 105)
    BarBackground.AnchorPoint = Vector2.new(0.5, 0)
    BarBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    BarBackground.BackgroundTransparency = 1
    BarBackground.ClipsDescendants = true
    BarBackground.ZIndex = 2
    BarBackground.Parent = MainFrame

    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = BarBackground

    local BarFill = Instance.new("Frame")
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BarFill.BackgroundTransparency = 1
    BarFill.ZIndex = 2
    BarFill.Parent = BarBackground

    local BarFillCorner = Instance.new("UICorner")
    BarFillCorner.CornerRadius = UDim.new(1, 0)
    BarFillCorner.Parent = BarFill

    local BarGradient = Instance.new("UIGradient")
    BarGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 0, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
    })
    BarGradient.Parent = BarFill

    local isLoading = true
    task.spawn(function()
        local direction = 1
        local offset = 0
        while isLoading and MainFrame.Parent do
            offset = offset + (task.wait() * 0.4 * direction)
            if offset >= 0.8 then direction = -1 offset = 0.8 end
            if offset <= 0.2 then direction = 1 offset = 0.2 end
            TitleGradient.Offset = Vector2.new(offset - 0.5, 0)
            StrokeGradient.Rotation = offset * 360
        end
    end)
    
    local fadeInTime = 0.6
    TweenService:Create(FullscreenCover, TweenInfo.new(fadeInTime), {BackgroundTransparency = 0.35}):Play()
    TweenService:Create(MainFrame, TweenInfo.new(fadeInTime), {BackgroundTransparency = 0.05}):Play()
    TweenService:Create(UIStroke, TweenInfo.new(fadeInTime), {Transparency = 0}):Play()
    TweenService:Create(Shadow, TweenInfo.new(fadeInTime), {ImageTransparency = 0.3}):Play()
    TweenService:Create(TitleLabel, TweenInfo.new(fadeInTime), {TextTransparency = 0}):Play()
    TweenService:Create(SubtitleLabel, TweenInfo.new(fadeInTime), {TextTransparency = 0}):Play()
    TweenService:Create(StatusLabel, TweenInfo.new(fadeInTime), {TextTransparency = 0}):Play()
    TweenService:Create(BarBackground, TweenInfo.new(fadeInTime), {BackgroundTransparency = 0}):Play()
    TweenService:Create(BarFill, TweenInfo.new(fadeInTime), {BackgroundTransparency = 0}):Play()
    task.wait(fadeInTime)

    local function updateLoading(text, progress)
        StatusLabel.Text = text
        TweenService:Create(BarFill, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(progress, 0, 1, 0)}):Play()
        task.wait(0.1)
    end

    updateLoading("Loading Configuration...", 0.2)

    local config = {
        language = "vi",
        supported_executors = "all",
        song_list_url = ""
    }

    local user_config = getgenv().PianoTuDong_Config or {}
    if user_config.language then config.language = user_config.language end
    if user_config.supported_executors then config.supported_executors = user_config.supported_executors end
    if user_config.song_list_url then config.song_list_url = user_config.song_list_url end

    if isfile and isfile("PianoTuDong_Config.json") then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile("PianoTuDong_Config.json"))
        end)
        if success and type(result) == "table" then
            if result.language then config.language = result.language end
            if result.supported_executors then config.supported_executors = result.supported_executors end
            if result.song_list_url then config.song_list_url = result.song_list_url end
        end
    end

    local function saveConfig()
        if writefile then
            writefile("PianoTuDong_Config.json", HttpService:JSONEncode(config))
        end
    end

    local translations = {
        vi = {
            Tabs = { Songs = "Bài Hát", AddSong = "Thêm Bài Hát", Scripts = "Script Storage", Settings = "Cài Đặt" },
            SongTab = { List = "Danh Sách Bài Hát", BPM = "BPM:", Genre = "Thể loại:", Artist = "Ca sĩ:", UnknownGenre = "Chưa rõ", UnknownArtist = "Đang cập nhật" },
            AddSong = {
                Section = "Thông Tin Bài Hát Mới",
                Name = "Tên Bài Hát", NameDesc = "Nhập tên bài hát", NamePH = "VD: Nơi Này Có Anh",
                Artist = "Ca Sĩ / Tác Giả", ArtistDesc = "Nhập tên ca sĩ hoặc tác giả", ArtistPH = "VD: Sơn Tùng M-TP",
                Genre = "Thể Loại", GenreDesc = "Nhập thể loại nhạc", GenrePH = "VD: Nhạc Trẻ",
                Script = "Script Bài Hát", ScriptDesc = "Dán toàn bộ script lua (tự nhận BPM & URL)", ScriptPH = "bpm = 138\nloadstring(...)...",
                AddBtn = "Thêm Bài Hát Vào Danh Sách", AddBtnDesc = "Bài hát sẽ được thêm và chạy ngay",
                Success = "Thành công", Added = "Đã thêm và chạy bài hát: ",
                Error = "Lỗi", ErrorMsg = "Không tìm thấy BPM hoặc URL trong script! Hãy điền tên bài hát và dán script đúng định dạng."
            },
            Scripts = {
                ExecUrl = "Thực Thi Bằng Link (Execute by URL)",
                URL = "URL của Script", URLDesc = "Dán link script (Raw) vào đây",
                ExecBtn = "Thực Thi (Execute)", ExecBtnDesc = "Chạy script từ link trên với BPM đã chọn",
                ExecCode = "Thực Thi Bằng Code (Execute Code)",
                Code = "Mã Script (Lua Code)", CodeDesc = "Dán mã lua vào đây",
                CodeBtn = "Thực Thi Code (Execute Code)", CodeBtnDesc = "Chạy đoạn mã lua trên với BPM đã chọn",
                Executed = "Script đã được thực thi!", ExecError = "Lỗi khi chạy: "
            },
            Settings = {
                Section = "Cài Đặt Ngôn Ngữ",
                Language = "Ngôn Ngữ (Language)", LanguageDesc = "Chọn ngôn ngữ (Cần Rejoin)",
                SongListUrl = "Song List URL (Gist)", SongListUrlDesc = "Link JSON danh sách bài hát từ Gist (Cần Rejoin)"
            }
        },
        en = {
            Tabs = { Songs = "Songs", AddSong = "Add Song", Scripts = "Script Storage", Settings = "Settings" },
            SongTab = { List = "Song List", BPM = "BPM:", Genre = "Genre:", Artist = "Artist:", UnknownGenre = "Unknown", UnknownArtist = "Updating" },
            AddSong = {
                Section = "New Song Info",
                Name = "Song Name", NameDesc = "Enter song name", NamePH = "Ex: Shape of You",
                Artist = "Artist / Author", ArtistDesc = "Enter artist name", ArtistPH = "Ex: Ed Sheeran",
                Genre = "Genre", GenreDesc = "Enter genre", GenrePH = "Ex: Pop",
                Script = "Song Script", ScriptDesc = "Paste full lua script (auto-detects BPM & URL)", ScriptPH = "bpm = 138\nloadstring(...)...",
                AddBtn = "Add Song To List", AddBtnDesc = "Song will be added and played immediately",
                Success = "Success", Added = "Added and playing song: ",
                Error = "Error", ErrorMsg = "Could not detect BPM or URL from script! Please enter song name and paste a valid script."
            },
            Scripts = {
                ExecUrl = "Execute by URL",
                URL = "Script URL", URLDesc = "Paste raw script link here",
                ExecBtn = "Execute", ExecBtnDesc = "Run script from link with selected BPM",
                ExecCode = "Execute by Code",
                Code = "Script Code (Lua)", CodeDesc = "Paste lua code here",
                CodeBtn = "Execute Code", CodeBtnDesc = "Run lua code with selected BPM",
                Executed = "Script executed successfully!", ExecError = "Error executing: "
            },
            Settings = {
                Section = "Language Settings",
                Language = "Language", LanguageDesc = "Select language (Requires Rejoin)",
                SongListUrl = "Song List URL (Gist)", SongListUrlDesc = "JSON song list URL from Gist (Requires Rejoin)"
            }
        }
    }

    local T = translations[config.language] or translations.vi

    updateLoading("Loading Custom Songs...", 0.4)

    local customSongs = {}
    if isfile and isfile("PianoTuDong_Songs.json") then
        local success, result = pcall(function()
            return HttpService:JSONDecode(readfile("PianoTuDong_Songs.json"))
        end)
        if success and type(result) == "table" then
            customSongs = result
        end
    end

    local function saveCustomSongs()
        if writefile then
            writefile("PianoTuDong_Songs.json", HttpService:JSONEncode(customSongs))
        end
    end

    local LOADER_URL = "https://cdn.jsdelivr.net/gh/hellohellohell012321/TALENTLESS@main/loader_main.lua"

    local function playSong(songBpm, songUrl)
        bpm = songBpm
        getgenv().bpm = songBpm
        loadstring(game:HttpGet(LOADER_URL, true))()
        loadstring(game:HttpGet(songUrl, true))()
    end

    local function parseScript(code)
        local detectedBpm = tonumber(code:match("bpm%s*=%s*(%d+)"))
        local detectedUrl = code:match('game:HttpGet%(%s*"(https?://gist[^"]+)"%s*[,%)]')
            or code:match('game:HttpGet%(%s*"(https?://raw[^"]+)"%s*[,%)]')
            or code:match('game:HttpGet%(%s*"(https?://pastebin[^"]+)"%s*[,%)]')
        return detectedBpm, detectedUrl
    end

    local function executeScript(code, fallbackBpm)
        local detectedBpm, detectedUrl = parseScript(code)
        if detectedUrl then
            playSong(detectedBpm or fallbackBpm or 100, detectedUrl)
            return true
        end
        return false
    end

    local gistSongs = {}
    
    updateLoading("Loading Playlists...", 0.6)

    if config.song_list_url and config.song_list_url ~= "" then
        local url = config.song_list_url
        -- Try direct fetch first, then fallback proxies for blocked domains
        local raw = nil
        local success = pcall(function()
            raw = game:HttpGet(url, true)
        end)
        if not success or not raw or raw == "" then
            pcall(function()
                raw = game:HttpGet("https://corsproxy.io/?" .. url, true)
            end)
        end
        if not raw or raw == "" then
            pcall(function()
                raw = game:HttpGet("https://api.allorigins.win/raw?url=" .. url, true)
            end)
        end
        if raw and raw ~= "" then
            local ok, result = pcall(function()
                return HttpService:JSONDecode(raw)
            end)
            if ok and type(result) == "table" then
                gistSongs = result
            end
        end
    end

    local songs = {
        {Name = "🇻🇳 Một Vòng Việt Nam", BPM = 80, Artist = "Tùng Dương", Playlist = "Nhạc Việt", URL = "https://gist.githack.com/talentless-custom-songs/0e1ab3611189b1dbf3f8690105a26af6/raw/custom_song.lua"},
        {Name = "🌸 Senbonzakura", BPM = 154, Artist = "KuroUsa-P", Playlist = "Anime", URL = "https://gist.githack.com/talentless-custom-songs/4354adb24eb94c61ea3751710e19782d/raw/custom_song.lua"},
        {Name = "🌾 Hoa Cỏ Lau", BPM = 110, Artist = "Phong Max", Playlist = "Nhạc Trẻ", URL = "https://gist.githack.com/talentless-custom-songs/08a8157c3e81eb88f4db0a29566c308d/raw/custom_song.lua"},
        {Name = "🍀 Bóng Lá Rơi", BPM = 160, Artist = "MinkAK", Playlist = "Nhạc Trẻ", URL = "https://gist.githack.com/talentless-custom-songs/3c48d58a7437119d19b8d092e3c3d4ce/raw/custom_song.lua"},
        {Name = "❤️ Nơi Này Có Anh", BPM = 90, Artist = "Sơn Tùng M-TP", Playlist = "Nhạc Trẻ", URL = "https://gist.githack.com/talentless-custom-songs/01bd21299c602916c5c0842c981d7eeb/raw/custom_song.lua"},
        {Name = "✨ Phép Màu", BPM = 75, Artist = "MAYDAYs ft. Minh Tốc", Playlist = "Nhạc Trẻ", URL = "https://gist.githack.com/talentless-custom-songs/d2cb23731589c93ebfa2a5898e756a8e/raw/custom_song.lua"},
        {Name = "🌙 Trước Khi Em Tồn Tại", BPM = 125, Artist = "Thắng", Playlist = "Nhạc Indie", URL = "https://gist.githack.com/talentless-custom-songs/8d9489182f11db41f8bb9b624ef4836b/raw/custom_song.lua"},
        {Name = "⚡ Lightning Moment (Chinese Phone)", BPM = 120, Artist = "DJ Okawari", Playlist = "Nhạc Nhật", URL = "https://gist.githack.com/talentless-custom-songs/9a2602f41fd715c76b3c10ef23c5fdbd/raw/custom_song.lua"},
        {Name = "🚲 Đường Tôi Chở Em Về", BPM = 95, Artist = "buitruonglinh", Playlist = "Nhạc Trẻ", URL = "https://gist.githack.com/talentless-custom-songs/bc413abfc7fe92a73a1dbb133fbb429b/raw/custom_song.lua"},
        {Name = "🌹 Thiếu Niên Hoa Hồng", BPM = 96, Artist = "Lâm Ngạn Tuấn", Playlist = "Nhạc Hoa", URL = "https://gist.githack.com/talentless-custom-songs/fd00ea249c1526b162fc609277a83253/raw/custom_song.lua"},
        {Name = "🥀 Cry For Me", BPM = 92, Artist = "Michita", Playlist = "Nhạc Nhật", URL = "https://gist.githack.com/talentless-custom-songs/019cce19eda34efd0ea79c6e97506f61/raw/custom_song.lua"},
        {Name = "🕵️ Conan", BPM = 145, Artist = "Katsuo Ono", Playlist = "Anime", URL = "https://gist.githack.com/talentless-custom-songs/1a6face5e4703f7d68ca91714df407d3/raw/custom_song.lua"},
        {Name = "Mayonaka No Door (Stay With Me)", BPM = 115, Artist = "Miki Mastubara", Playlist = "Nhạc Nhật", URL = "https://gist.githack.com/talentless-custom-songs/c4e716829c39031a73324fa7024f20f7/raw/custom_song.lua"}
    }

    local allSongs = {}
    for _, s in ipairs(songs) do table.insert(allSongs, s) end
    for _, s in ipairs(gistSongs) do table.insert(allSongs, s) end
    if customSongs and type(customSongs) == "table" then
        for _, s in ipairs(customSongs) do table.insert(allSongs, s) end
    end

    updateLoading("Loading GUI Library...", 0.8)
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua", true))()

    local SCRIPT_VERSION = "V1.25 Stable"

    local Window = WindUI:CreateWindow({
        Title = " VITL PIANO | " .. SCRIPT_VERSION,
        Icon = "music",
        Author = "vitl1107 | " .. SCRIPT_VERSION,
        Folder = "PianoTuDong",
        Size = UDim2.fromOffset(580, 460),
        Transparent = false,
        Theme = "Dark",
        SideBarWidth = 200,
    })

    -- Songs Tab
    local SongTab = Window:Tab({
        Title = T.Tabs.Songs,
        Icon = "music",
    })

    local SongSection = SongTab:Section({ Title = T.SongTab.List })

    for _, song in ipairs(allSongs) do
        local sBpm = tostring(song.BPM or 100)
        local sPlaylist = song.Playlist or T.SongTab.UnknownGenre
        local sArtist = song.Artist or T.SongTab.UnknownArtist
        SongSection:Button({
            Title = song.Name or "???",
            Desc = T.SongTab.BPM .. " " .. sBpm .. " | " .. T.SongTab.Genre .. " " .. sPlaylist .. " | " .. T.SongTab.Artist .. " " .. sArtist,
            Callback = function()
                pcall(playSong, song.BPM or 100, song.URL)
            end
        })
    end

    -- Add Song Tab
    local CustomSongTab = Window:Tab({
        Title = T.Tabs.AddSong,
        Icon = "plus",
    })

    local JsonSection = CustomSongTab:Section({ Title = T.Settings.SongListUrl })

    JsonSection:Input({
        Title = T.Settings.SongListUrl,
        Desc = T.Settings.SongListUrlDesc,
        Value = config.song_list_url or "",
        Placeholder = "https://pastefy.app/xxxxx/raw",
        Callback = function(Value)
            config.song_list_url = Value
            saveConfig()
        end
    })

    CustomSongTab:Divider()

    local AddSection = CustomSongTab:Section({ Title = T.AddSong.Section })

    local NewSongName = ""
    AddSection:Input({
        Title = T.AddSong.Name,
        Desc = T.AddSong.NameDesc,
        Value = "",
        Placeholder = T.AddSong.NamePH,
        Callback = function(Value) NewSongName = Value end
    })

    local NewSongArtist = ""
    AddSection:Input({
        Title = T.AddSong.Artist,
        Desc = T.AddSong.ArtistDesc,
        Value = "",
        Placeholder = T.AddSong.ArtistPH,
        Callback = function(Value) NewSongArtist = Value end
    })

    local NewSongPlaylist = ""
    AddSection:Input({
        Title = T.AddSong.Genre,
        Desc = T.AddSong.GenreDesc,
        Value = "",
        Placeholder = T.AddSong.GenrePH,
        Callback = function(Value) NewSongPlaylist = Value end
    })

    local NewSongScript = ""
    AddSection:Input({
        Title = T.AddSong.Script,
        Desc = T.AddSong.ScriptDesc,
        Value = "",
        Placeholder = T.AddSong.ScriptPH,
        Type = "Textarea",
        Callback = function(Value) NewSongScript = Value end
    })

    AddSection:Button({
        Title = T.AddSong.AddBtn,
        Desc = T.AddSong.AddBtnDesc,
        Callback = function()
            if NewSongName == "" or NewSongScript == "" then
                WindUI:Notify({ Title = T.AddSong.Error, Content = T.AddSong.ErrorMsg, Duration = 5, Icon = "alert-circle" })
                return
            end

            local detectedBpm, detectedUrl = parseScript(NewSongScript)
            if not detectedUrl then
                WindUI:Notify({ Title = T.AddSong.Error, Content = T.AddSong.ErrorMsg, Duration = 5, Icon = "alert-circle" })
                return
            end

            local bpmNumber = detectedBpm or 100

            table.insert(customSongs, {
                Name = NewSongName,
                BPM = bpmNumber,
                Artist = NewSongArtist ~= "" and NewSongArtist or T.SongTab.UnknownArtist,
                Playlist = NewSongPlaylist ~= "" and NewSongPlaylist or T.SongTab.UnknownGenre,
                URL = detectedUrl
            })
            saveCustomSongs()

            SongSection:Button({
                Title = NewSongName,
                Desc = T.SongTab.BPM .. " " .. tostring(bpmNumber) .. " | " .. T.SongTab.Genre .. " " .. (NewSongPlaylist ~= "" and NewSongPlaylist or T.SongTab.UnknownGenre) .. " | " .. T.SongTab.Artist .. " " .. (NewSongArtist ~= "" and NewSongArtist or T.SongTab.UnknownArtist),
                Callback = function()
                    pcall(playSong, bpmNumber, detectedUrl)
                end
            })

            pcall(playSong, bpmNumber, detectedUrl)
            WindUI:Notify({ Title = T.AddSong.Success, Content = T.AddSong.Added .. NewSongName, Duration = 5, Icon = "check" })
        end
    })

    -- Scripts Tab
    local ScriptTab = Window:Tab({
        Title = T.Tabs.Scripts,
        Icon = "folder",
    })

    local ExecUrlSection = ScriptTab:Section({ Title = T.Scripts.ExecUrl })

    local CustomBPM = 100
    ExecUrlSection:Slider({
        Title = T.AddSong.BPM,
        Value = { Min = 10, Max = 300, Default = 100 },
        Step = 1,
        Callback = function(Value) CustomBPM = Value; getgenv().bpm = Value end
    })

    local CustomScriptUrl = ""
    ExecUrlSection:Input({
        Title = T.Scripts.URL,
        Desc = T.Scripts.URLDesc,
        Value = "",
        Placeholder = "https://raw.githubusercontent.com/...",
        Callback = function(Value) CustomScriptUrl = Value end
    })

    ExecUrlSection:Button({
        Title = T.Scripts.ExecBtn,
        Desc = T.Scripts.ExecBtnDesc,
        Callback = function()
            if CustomScriptUrl ~= "" then
                local success, err = pcall(playSong, CustomBPM, CustomScriptUrl)
                if success then
                    WindUI:Notify({ Title = T.AddSong.Success, Content = T.Scripts.Executed, Duration = 5, Icon = "check" })
                else
                    WindUI:Notify({ Title = T.AddSong.Error, Content = T.Scripts.ExecError .. tostring(err), Duration = 5, Icon = "alert-circle" })
                end
            end
        end
    })

    ScriptTab:Divider()

    local ExecCodeSection = ScriptTab:Section({ Title = T.Scripts.ExecCode })

    local CustomScriptCode = ""
    ExecCodeSection:Input({
        Title = T.Scripts.Code,
        Desc = T.Scripts.CodeDesc,
        Value = "",
        Placeholder = "Paste a full script (auto-detects BPM & URL)",
        Type = "Textarea",
        Callback = function(Value) CustomScriptCode = Value end
    })

    ExecCodeSection:Button({
        Title = T.Scripts.CodeBtn,
        Desc = T.Scripts.CodeBtnDesc,
        Callback = function()
            if CustomScriptCode ~= "" then
                -- Auto-patch: try to detect BPM and song URL from pasted script
                local patched = executeScript(CustomScriptCode, CustomBPM)
                if patched then
                    WindUI:Notify({ Title = T.AddSong.Success, Content = T.Scripts.Executed, Duration = 5, Icon = "check" })
                    return
                end
                -- Fallback: run as raw lua code
                getgenv().bpm = CustomBPM
                local success, err = pcall(function()
                    loadstring(game:HttpGet(LOADER_URL, true))()
                    loadstring(CustomScriptCode)()
                end)
                if success then
                    WindUI:Notify({ Title = T.AddSong.Success, Content = T.Scripts.Executed, Duration = 5, Icon = "check" })
                else
                    WindUI:Notify({ Title = T.AddSong.Error, Content = T.Scripts.ExecError .. tostring(err), Duration = 5, Icon = "alert-circle" })
                end
            end
        end
    })

    -- Settings Tab
    local SettingsTab = Window:Tab({
        Title = T.Tabs.Settings,
        Icon = "settings",
    })

    local SettingsSection = SettingsTab:Section({ Title = T.Settings.Section })

    SettingsSection:Dropdown({
        Title = T.Settings.Language,
        Desc = T.Settings.LanguageDesc,
        Values = {"vi", "en"},
        Value = config.language,
        Multi = false,
        Callback = function(Value)
            if config.language ~= Value then
                config.language = Value
                saveConfig()
            end
        end
    })

    SongTab:Select()

    -- Mini Toggle Button
    local isWindowOpen = true

    local ToggleBtn = Instance.new("ScreenGui")
    ToggleBtn.Name = "PianoToggleBtn"
    ToggleBtn.ResetOnSpawn = false
    ToggleBtn.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Button = Instance.new("TextButton")
    Button.Name = "Toggle"
    Button.Size = UDim2.fromOffset(40, 40)
    Button.Position = UDim2.new(0, 10, 0.5, -20)
    Button.AnchorPoint = Vector2.new(0, 0.5)
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Text = "🎹"
    Button.TextSize = 20
    Button.Font = Enum.Font.GothamBold
    Button.AutoButtonColor = true
    Button.BorderSizePixel = 0
    Button.Parent = ToggleBtn

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 10)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(80, 80, 80)
    Stroke.Thickness = 1
    Stroke.Parent = Button

    -- Make draggable
    local dragging, dragStart, startPos
    Button.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Button.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    Button.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Button.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    Button.MouseButton1Click:Connect(function()
        if isWindowOpen then
            Window:Close()
            isWindowOpen = false
        else
            Window:Open()
            isWindowOpen = true
        end
    end)

    if game:GetService("CoreGui") then
        ToggleBtn.Parent = game:GetService("CoreGui")
    else
        ToggleBtn.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end

    updateLoading("Complete!", 1)
    task.wait(0.5)
    local fadeOutTime = 0.5
    isLoading = false
    TweenService:Create(FullscreenCover, TweenInfo.new(fadeOutTime), {BackgroundTransparency = 1}):Play()
    TweenService:Create(MainFrame, TweenInfo.new(fadeOutTime), {BackgroundTransparency = 1}):Play()
    TweenService:Create(UIStroke, TweenInfo.new(fadeOutTime), {Transparency = 1}):Play()
    TweenService:Create(Shadow, TweenInfo.new(fadeOutTime), {ImageTransparency = 1}):Play()
    TweenService:Create(TitleLabel, TweenInfo.new(fadeOutTime), {TextTransparency = 1}):Play()
    TweenService:Create(SubtitleLabel, TweenInfo.new(fadeOutTime), {TextTransparency = 1}):Play()
    TweenService:Create(StatusLabel, TweenInfo.new(fadeOutTime), {TextTransparency = 1}):Play()
    TweenService:Create(BarBackground, TweenInfo.new(fadeOutTime), {BackgroundTransparency = 1}):Play()
    TweenService:Create(BarFill, TweenInfo.new(fadeOutTime), {BackgroundTransparency = 1}):Play()
    task.wait(fadeOutTime)
    LoadGui:Destroy()
