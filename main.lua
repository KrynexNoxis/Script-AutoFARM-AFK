local Jugadores = juego:GetService(„Jugadores")
local jugador = Jugadores.LocalPlayer
local playerGui = jugador:WaitForChild(„PlayerGui")

local función más larga pantalla de bienvenida()
    local welcomeGui = Instancia.nueva(„ScreenGui")
 bienvenidoGui.Nombre = „Pantalla de bienvenida"
 bienvenidoGui.ResetOnSpawn = falso
 bienvenidoGui.DisplayOrder = 9999999
 welcomeGui.Parent = playerGui
    
    local fondo = Instancia.new(„Marco")
 fondo.Nombre = "Fondo"
 fondo.Tamaño = UDim2.new(1, 0, 1, 0)
 fondo.Posicion = UDim2.new(0, 0, 0, 0)
 fondo.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 fondo.TransparenciaDeFondo = 0,5
 fondo.BorderSizePixel = 0
 fondo.Padre = bienvenidoGui
    
    local welcomeFrame = Instancia.nueva("Marco")
 bienvenidoFrame.Name = „Marco de bienvenida"
 welcomeFrame.Size = UDim2.new(0, 450, 0, 200)
 welcomeFrame.Position = UDim2.new(0,5, 0, 0.5, 0)
 welcomeFrame.AnchorPoint = Vector2.new(0,5, 0.5)
 welcomeFrame.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
 bienvenidoFrame.BorderSizePixel = 0
 welcomeFrame.Parent = welcomeGui
    
    local esquina = Instancia.nueva(„UICorner")
 esquina.CornerRadius = UDim.new(0, 12)
 esquina.Padre = welcomeFrame
    
    local trazo = Instancia.nueva(„UIStroke")
 trazo.Color = Color3.fromRGB(138, 43, 226)
 trazo.Espesor = 3
    stroke.Transparency = 0
    stroke.Parent = welcomeFrame
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "Title"
    titleLabel.Size = UDim2.new(1, -40, 0, 80)
    titleLabel.Position = UDim2.new(0, 20, 0, 40)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Sistema AFK/AUTO FARM"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 28
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.TextYAlignment = Enum.TextYAlignment.Center
    titleLabel.Parent = welcomeFrame
    
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Name = "Subtitle"
    subtitleLabel.Size = UDim2.new(1, -40, 0, 40)
    subtitleLabel.Position = UDim2.new(0, 20, 0, 120)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.Text = "Universal"
    subtitleLabel.TextColor3 = Color3.fromRGB(138, 43, 226)
    subtitleLabel.TextSize = 20
    subtitleLabel.Font = Enum.Font.Gotham
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    subtitleLabel.TextYAlignment = Enum.TextYAlignment.Center
    subtitleLabel.Parent = welcomeFrame
    
    welcomeFrame.BackgroundTransparency = 1
    titleLabel.TextTransparency = 1
    subtitleLabel.TextTransparency = 1
    stroke.Transparency = 1
    welcomeFrame.Size = UDim2.new(0, 400, 0, 180)
    
    backdrop.BackgroundTransparency = 1
    local backdropTween = backdrop:TweenSizeAndPosition(
        UDim2.new(1, 0, 1, 0),
        UDim2.new(0, 0, 0, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.3,
        true
    )
    
    for i = 1, 10 do
        backdrop.BackgroundTransparency = 1 - (i * 0.05)
        wait(0.03)
    end
    
    welcomeFrame:TweenSize(
        UDim2.new(0, 450, 0, 200),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Back,
        0.6,
        true
    )
    
    for i = 1, 10 do
        welcomeFrame.BackgroundTransparency = 1 - (i * 0.1)
        titleLabel.TextTransparency = 1 - (i * 0.1)
        subtitleLabel.TextTransparency = 1 - (i * 0.1)
        stroke.Transparency = 1 - (i * 0.1)
        wait(0.06)
    end
    
    wait(6.4)
    
    for i = 1, 10 do
        welcomeFrame.BackgroundTransparency = i * 0.1
        titleLabel.TextTransparency = i * 0.1
        subtitleLabel.TextTransparency = i * 0.1
        stroke.Transparency = i * 0.1
        backdrop.BackgroundTransparency = 0.5 + (i * 0.05)
        wait(0.03)
    end
    
    welcomeGui:Destroy()
end

local function initializeMainScript()
    local floatingButtonGui = Instance.new("ScreenGui")
    floatingButtonGui.Name = "FloatingButtonGui"
    floatingButtonGui.ResetOnSpawn = false
    floatingButtonGui.DisplayOrder = 999998
    floatingButtonGui.Parent = playerGui
    
    local floatingButton = Instance.new("TextButton")
    floatingButton.Name = "FloatingButton"
    floatingButton.Size = UDim2.new(0, 55, 0, 55)
    floatingButton.Position = UDim2.new(1, -75, 1, -75)
    floatingButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    floatingButton.BorderSizePixel = 0
    floatingButton.Text = "⬛"
    floatingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    floatingButton.TextSize = 28
    floatingButton.Font = Enum.Font.GothamBold
    floatingButton.AutoButtonColor = false
    floatingButton.Visible = false
    floatingButton.Active = true
    floatingButton.Draggable = false
    floatingButton.Parent = floatingButtonGui
    
    local floatingCorner = Instance.new("UICorner")
    floatingCorner.CornerRadius = UDim.new(1, 0)
    floatingCorner.Parent = floatingButton
    
    local floatingStroke = Instance.new("UIStroke")
    floatingStroke.Color = Color3.fromRGB(80, 20, 120)
    floatingStroke.Thickness = 2
    floatingStroke.Transparency = 0.3
    floatingStroke.Parent = floatingButton
    
    local dragging = false
    local dragInput
    local dragStart
    local startPos
    local isDragging = false
    
    local function update(input)
        local delta = input.Position - dragStart
        floatingButton.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
    
    floatingButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = floatingButton.Position
            isDragging = false
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    floatingButton.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            isDragging = true
            update(input)
        end
    end)
    
    floatingButton.MouseEnter:Connect(function()
        if not dragging then
            floatingButton:TweenSize(UDim2.new(0, 60, 0, 60), "Out", "Quad", 0.2, true)
            floatingButton.BackgroundColor3 = Color3.fromRGB(160, 60, 255)
        end
    end)
    
    floatingButton.MouseLeave:Connect(function()
        if not dragging then
            floatingButton:TweenSize(UDim2.new(0, 55, 0, 55), "Out", "Quad", 0.2, true)
            floatingButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
        end
    end)
    
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "BlackOverlayGui"
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 999999
    screenGui.Parent = playerGui

    local blackFrame = Instance.new("Frame")
    blackFrame.Name = "BlackScreen"
    blackFrame.Size = UDim2.new(1, 0, 1, 0)
    blackFrame.Position = UDim2.new(0, 0, 0, 0)
    blackFrame.AnchorPoint = Vector2.new(0, 0)
    blackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    blackFrame.BorderSizePixel = 0
    blackFrame.ZIndex = 999999
    blackFrame.Active = true
    blackFrame.Parent = screenGui

    local function blockAllInputs()
        blackFrame.InputBegan:Connect(function(input)
        end)
        
        blackFrame.InputEnded:Connect(function(input)
        end)
    end

    blockAllInputs()

    local closeButton = Instance.new("TextButton")
    closeButton.Name = "CloseButton"
    closeButton.Size = UDim2.new(0, 50, 0, 50)
    closeButton.Position = UDim2.new(1, -65, 0, 15)
    closeButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.TextSize = 32
    closeButton.Font = Enum.Font.GothamBold
    closeButton.AutoButtonColor = false
    closeButton.ZIndex = 1000000
    closeButton.Parent = screenGui

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(1, 0)
    uiCorner.Parent = closeButton

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(80, 20, 120)
    uiStroke.Thickness = 2
    uiStroke.Transparency = 0.3
    uiStroke.Parent = closeButton

    closeButton.MouseEnter:Connect(function()
        closeButton:TweenSize(UDim2.new(0, 55, 0, 55), "Out", "Quad", 0.2, true)
        closeButton.BackgroundColor3 = Color3.fromRGB(160, 60, 255)
    end)

    closeButton.MouseLeave:Connect(function()
        closeButton:TweenSize(UDim2.new(0, 50, 0, 50), "Out", "Quad", 0.2, true)
        closeButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
    end)

    local function reduceTextureQuality()
        local renderSettings = settings():GetService("RenderSettings")
        
        renderSettings.QualityLevel = Enum.QualityLevel.Level01
        renderSettings.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level04
        renderSettings.EditQualityLevel = Enum.QualityLevel.Level01
        
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.Brightness = 2
        lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
        lighting.Ambient = Color3.new(0.5, 0.5, 0.5)
        
        for _, effect in pairs(lighting:GetChildren()) do
            if effect:IsA("PostEffect") or effect:IsA("Sky") or effect:IsA("Atmosphere") then
                effect:Destroy()
            end
        end
        
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("MeshPart") or obj:IsA("Part") or obj:IsA("UnionOperation") then
                obj.Material = Enum.Material.SmoothPlastic
                obj.CastShadow = false
                
                if obj:IsA("BasePart") then
                    obj.Reflectance = 0
                end
            end
            
            if obj:IsA("Texture") or obj:IsA("Decal") then
                obj:Destroy()
            end
            
            if obj:IsA("ParticleEmitter") or obj:IsA("Beam") or obj:IsA("Trail") then
                obj.Enabled = false
            end
            
            if obj:IsA("SpecialMesh") then
                obj.TextureId = ""
            end
            
            if obj:IsA("Light") then
                obj.Enabled = false
            end
        end
        
        game:GetService("UserInputService").MouseIconEnabled = true
        settings().Rendering.QualityLevel = 1
    end

    local function closeBlackScreen()
        blackFrame:Destroy()
        closeButton:Destroy()
        
        floatingButton.Visible = true
        floatingButton.BackgroundTransparency = 1
        floatingButton.TextTransparency = 1
        floatingStroke.Transparency = 1
        floatingButton.Size = UDim2.new(0, 40, 0, 40)
        
        floatingButton:TweenSize(UDim2.new(0, 55, 0, 55), "Out", "Back", 0.5, true)
        
        for i = 1, 10 do
            floatingButton.BackgroundTransparency = 1 - (i * 0.1)
            floatingButton.TextTransparency = 1 - (i * 0.1)
 floatingStroke.Transparencia = 0.3 + (0.7 - (i* 0.07))
 esperar(0,03)
        fin
    fin
    
    local función reactivarBlackScreen()
        si está arrastrando entonces
 está arrastrando = falso
            retorno
        fin
        
        para yo = 1, 10 do
 botón flotante.TransparenciaDeFondo = i * 0.1
 botón flotante.Transparencia de texto = i * 0.1
 floatingStroke.Transparencia = 0.3 + (i * 0.07)
 esperar(0,02)
        fin
        
 botón flotante.Visible = falso
        
        local newBlackFrame = Instancia.new("Frame")
 nuevoBlackFrame.Nombre = "Pantalla negra"
 nuevoBlackFrame.Size = UDim2.new(1, 0, 1, 0)
 nuevoBlackFrame.Position = UDim2.new(0, 0, 0, 0)
 newBlackFrame.AnchorPoint = Vector2.new(0, 0)
 nuevoBlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
 nuevoBlackFrame.BorderSizePixel = 0
 nuevoBlackFrame.ZIndex = 999999
 nuevoBlackFrame.Activo = verdadero
 nuevoBlackFrame.Parent = screenGui
        
 blackFrame = nuevoBlackFrame
        
        local newCloseButton = Instancia.new("TextButton")
 nuevoBotónCerrar.Nombre = "Botón de cierre"
 nuevoBotónCerrar.Tamaño = UDim2.nuevo(0, 50, 0, 50)
 newCloseButton.Position = UDim2.new(1, -65, 0, 15)
 newCloseButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
 nuevoBotónCerrar.BorderSizePixel = 0
 nuevoBotónCerrar.Texto = "×"
 newCloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
 newCloseButton.TextSize = 32
 newCloseButton.Font = Enum.Font.GothamBold
 nuevoBotónCerrar.AutoButtonColor = false
 nuevoBotónCerrar.ZIndex = 1000000
 nuevoBotónCerrar.Padre = screenGui
        
        local newCorner = Instancia.new("UICorner")
 newCorner.CornerRadius = UDim.new(1, 0)
 nuevaEsquina.Padre = nuevoBotónCerrar
        
        local newStroke = Instancia.new("UIStroke")
 newStroke.Color = Color3.fromRGB(80, 20, 120)
 newStroke.Espesor = 2
 newStroke.Transparencia = 0,3
 newStroke.Parent = nuevoBotónCerrar
        
 newCloseButton.MouseEnter:Connect(function()
 nuevoBotónCerrar:TweenSize(UDim2.new(0, 55, 0, 55), "Out", "Quad", 0.2, true)
            newCloseButton.BackgroundColor3 = Color3.fromRGB(160, 60, 255)
        end)
        
        newCloseButton.MouseLeave:Connect(function()
 newCloseButton:TweenSize(UDim2.new(0, 50, 0, 50), "Out", "Quad", 0.2, true)
 newCloseButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
 fin)
        
 newCloseButton.MouseButton1Click:Connect(cerrarPantallaNegra)
 cerrarBotón = nuevoBotónCerrar
        
 newBlackFrame.InputBegan:Connect(función(entrada) fin)
 newBlackFrame.InputEnded:Connect(función(entrada) fin)
 fin

 cerrarBotón.BotónRatón1Clic:Conectar(cerrarPantallaNegra)
 botón flotante.Botón del mouse1Click:Conectar(reactivarPantalla negra)

 reducirCalidadDeTextura()

 local VirtualUser = juego:GetService("VirtualUser")
 local UserInputService = juego:GetService("UserInputService")

 jugador.Inactivo:Conectar(función()
 Usuario virtual: CaptureController()
 Usuario virtual:ClickButton2(Vector2.new())
 fin)

 función local showCreatorNotification()
 esperar(4)
        
 notificación localGui = Instance.new("ScreenGui")
 notificationGui.Name = "Notificación del creador"
 notificaciónGui.ResetOnSpawn = falso
 notificaciónGui.DisplayOrder = 1000000
 notificaciónGui.Parent = jugadorGui
        
 notifFrame local = Instance.new("Marco")
 notifFrame.Name = "Marco de notificación"
 notifFrame.Size = UDim2.new(0, 300, 0, 80)
 notifFrame.Position = UDim2.new(1, 320, 0, 20)
 notifFrame.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
 notifFrame.BorderSizePixel = 0
 notifFrame.Parent = notificaciónGui
        
 esquina local = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent = notifFrame
        
        local avatarImage = Instance.new("ImageLabel")
        avatarImage.Size = UDim2.new(0, 60, 0, 60)
        avatarImage.Position = UDim2.new(0, 10, 0, 10)
        avatarImage.BackgroundTransparency = 1
        avatarImage.Image = "rbxthumb://type=AvatarHeadShot&id=8088816856&w=150&h=150"
        avatarImage.Parent = notifFrame
        
        local avatarCorner = Instance.new("UICorner")
        avatarCorner.CornerRadius = UDim.new(1, 0)
        avatarCorner.Parent = avatarImage
        
        local creatorText = Instance.new("TextLabel")
        creatorText.Size = UDim2.new(0, 210, 0, 60)
        creatorText.Position = UDim2.new(0, 80, 0, 10)
        creatorText.BackgroundTransparency = 1
        creatorText.Text = "Creador del script\nFlixoraTech:"
        creatorText.TextColor3 = Color3.fromRGB(255, 255, 255)
        creatorText.TextSize = 16
        creatorText.Font = Enum.Font.GothamMedium
        creatorText.TextXAlignment = Enum.TextXAlignment.Left
        creatorText.TextYAlignment = Enum.TextYAlignment.Center
        creatorText.Parent = notifFrame
        
        notifFrame:TweenPosition(
            UDim2.new(1, -320, 0, 20),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Back,
            0.5,
            true
        )
        
        wait(7)
        
        notifFrame:TweenPosition(
            UDim2.new(1, 320, 0, 20),
            Enum.EasingDirection.In,
            Enum.EasingStyle.Back,
            0.4,
            true
        )
        
        wait(0.5)
        notificationGui:Destroy()
    end

    spawn(showCreatorNotification)

    local function showCreatorPageNotification()
        wait(12)
        
        local pageNotifGui = Instance.new("ScreenGui")
        pageNotifGui.Name = "CreatorPageNotification"
        pageNotifGui.ResetOnSpawn = false
        pageNotifGui.DisplayOrder = 1000000
        pageNotifGui.Parent = playerGui
        
        local pageNotifFrame = Instance.new("Frame")
        pageNotifFrame.Name = "PageNotificationFrame"
        pageNotifFrame.Size = UDim2.new(0, 300, 0, 110)
        pageNotifFrame.Position = UDim2.new(1, 320, 0, 20)
        pageNotifFrame.BackgroundColor3 = Color3.fromRGB(57, 59, 61)
        pageNotifFrame.BorderSizePixel = 0
        pageNotifFrame.Parent = pageNotifGui
        
        local pageCorner = Instance.new("UICorner")
        pageCorner.CornerRadius = UDim.new(0, 8)
        pageCorner.Parent = pageNotifFrame
        
        local pageAvatarImage = Instance.new("ImageLabel")
        pageAvatarImage.Size = UDim2.new(0, 50, 0, 50)
        pageAvatarImage.Position = UDim2.new(0, 10, 0, 10)
        pageAvatarImage.BackgroundTransparency = 1
        pageAvatarImage.Image = "rbxthumb://type=AvatarHeadShot&id=8088816856&w=150&h=150"
        pageAvatarImage.Parent = pageNotifFrame
        
        local pageAvatarCorner = Instance.new("UICorner")
        pageAvatarCorner.CornerRadius = UDim.new(1, 0)
        pageAvatarCorner.Parent = pageAvatarImage
        
        local pageCreatorText = Instance.new("TextLabel")
        pageCreatorText.Size = UDim2.new(0, 220, 0, 50)
        pageCreatorText.Position = UDim2.new(0, 70, 0, 10)
        pageCreatorText.BackgroundTransparency = 1
        pageCreatorText.Text = "Página del creador:"
        pageCreatorText.TextColor3 = Color3.fromRGB(255, 255, 255)
        pageCreatorText.TextSize = 16
        pageCreatorText.Font = Enum.Font.GothamMedium
        pageCreatorText.TextXAlignment = Enum.TextXAlignment.Left
        pageCreatorText.TextYAlignment = Enum.TextYAlignment.Center
        pageCreatorText.Parent = pageNotifFrame
        
        local pageButton = Instance.new("TextButton")
        pageButton.Name = "PageButton"
        pageButton.Size = UDim2.new(0, 280, 0, 35)
        pageButton.Position = UDim2.new(0, 10, 0, 65)
        pageButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
        pageButton.BorderSizePixel = 0
        pageButton.Text = "🔗 Visitar Página"
 pageButton.TextColor3 = Color3.fromRGB(255, 255, 255)255, 255, 255)
 pageButton.TextSize = 1515
 pageButton.Font = Enum.Font.GothamBold
 pageButton.AutoButtonColor = falsofalso
 pageButton.Parent = pageNotifFrame
        
 botón localEsquina = Instancia.new(„UICorner")local buttonCorner = Instancia.new("UICorner")
 botónCorner.CornerRadius = UDim.new(0, 6)0, 6)
 buttonCorner.Parent = pageButton
        
 pageButton.MouseEnter:Connect(función()función()
 pageButton.BackgroundColor3 = Color3.fromRGB(160, 60, 255)160, 60, 255)
 fin)fin)
        
 pageButton.MouseLeave:Connect(función()función()
 pageButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)138, 43, 226)
 fin)fin)
        
 pageButton.MouseButton1Click:Conectar(función()
 setclipboard("https://beacons.ai/krynexnoxis?utm_source=ig&utm_medium=social&utm_content=link_in_bio&fbclid=PAZnRzaAPBR_NleHRuA2FlbQIxMQBzcnRjBmFwcF9pZA8xMjQwMjQ1NzQyODc0MTQAAaeW1AsmccYRxH-1Mw177EDxsEUaqygMOMspN9Q8k2y9TCwOqT2j_bYtCd8ltw_aem_0fXtJoZDXUUmnYa2enJQQA")"https://beacons.ai/krynexnoxis?utm_source=ig&utm_medium=social&utm_content=link_in_bio&fbclid=PAZnRzaAPBR_NleHRuA2FlbQIxMQBzcnRjBmFwcF9pZA8xMjQwMjQ1NzQyODc0MTQAAaeW1AsmccYRxH-1Mw177EDxsEUaqygMOMspN9Q8k2y9TCwOqT2j_bYtCd8ltw_aem_0fXtJoZDXUUmnYa2enJQQA")
            
 botón de página.Texto = "✓ Enlace copiado""✓ Enlace copiado"
 pageButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)76, 175, 80)
 esperar(2)2)
 botón de página.Texto = "🔗 Visitar Página""🔗 Visitar Página"
 pageButton.BackgroundColor3 = Color3.fromRGB(138, 43, 226)138, 43, 226)
 fin)
        
 pageNotifFrame:TweenPosition(
 UDim2.nuevo(1, -320, 0, 20),1, -320, 0, 20),
 Enum.EasingDirection.Out,
 Enum.EasingStyle.Back,
 0,5,0,5,
 verdederadero
        )
        
 esperar(15)15)
        
 pageNotifFrame:TweenPosition(
 UDim2.nuevo(1, 320, 0, 20),1, 320, 0, 20),
 Enum.EasingDirection.In,
 Enum.EasingStyle.Back,
 0,4,0,4,
 verdederadero
        )
        
 esperar(0,5)0,5)
 pageNotifGui: Destruir()
 fin

 spawn(mostrarNotificación de página del creador)

 imprimir("Script cargado: Pantalla negra activada, calidad de texturas reducida y Anti-AFK activado")"Script cargado: Pantalla negra activada, calidad de texturas reducida y Anti-AFK activado")
fin

perder pantalla de bienvenida()
inicializarMainScript()
