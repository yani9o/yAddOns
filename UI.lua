local _, addon = ...
local UI = {}
addon.UI = UI
if _G.yTools and _G.yTools.name == (...) then _G.yTools.UI = UI end

function UI.Check(button)
    button:SetSize(18,18)
    button:SetNormalAtlas("questlog-icon-ticksquare")
    button:GetCheckedTexture():SetAtlas("questlog-icon-checkmark-yellow")
    button:GetNormalTexture():SetAllPoints(button)
    button:GetCheckedTexture():SetAllPoints(button)
    local pushed = button:GetPushedTexture()
    if pushed then pushed:SetAlpha(0) end
    local highlight = button:CreateTexture(nil, "HIGHLIGHT")
    highlight:SetAllPoints(); highlight:SetAtlas("questlog-icon-ticksquare")
    highlight:SetBlendMode("ADD"); highlight:SetAlpha(0.3)
    button:SetHighlightTexture(highlight)
end

function UI.Scrollbar(parent)
    local bar = CreateFrame("EventFrame", nil, parent, "MinimalScrollBar")
    bar:Init(1,1)
    bar.minimum, bar.maximum, bar.value = 0,0,0
    local originalSetScript = bar.SetScript
    function bar:SetScript(event, fn)
        if event == "OnValueChanged" then self.valueCallback = fn
        else originalSetScript(self,event,fn) end
    end
    function bar:SetMinMaxValues(minimum,maximum)
        self.minimum,self.maximum=minimum,math.max(minimum,maximum)
        self:SetPanExtentPercentage(self.maximum>minimum and math.min(1,42/(self.maximum-minimum)) or 1)
        self:SetValue(self.value)
    end
    function bar:GetMinMaxValues() return self.minimum,self.maximum end
    function bar:GetValue() return self.value end
    function bar:SetValue(value)
        local offset=math.max(self.minimum,math.min(self.maximum,value or 0))
        if self.settingValue or math.abs(self.value-offset)<.001 then return end
        self.value=offset
        self.settingValue=true
        self:SetScrollPercentage(self.maximum>self.minimum and (offset-self.minimum)/(self.maximum-self.minimum) or 0,true)
        if self.valueCallback then self.valueCallback(self,offset) end
        self.settingValue=false
    end
    function bar:SetOrientation() end
    function bar:SetValueStep() end
    function bar:SetThumbTexture() end
    bar:RegisterCallback("OnScroll",function(_,percentage)
        if bar.settingValue then return end
        bar:SetValue(bar.minimum+percentage*(bar.maximum-bar.minimum))
    end,bar)
    return bar
end

function UI.ScrollFrame(frame,parent)
    local bar=UI.Scrollbar(parent)
    frame.ScrollBar=bar
    bar:SetPoint("TOPLEFT",frame,"TOPRIGHT",4,0)
    bar:SetPoint("BOTTOMLEFT",frame,"BOTTOMRIGHT",4,0)
    bar:SetScript("OnValueChanged",function(_,value)frame:SetVerticalScroll(value)end)
    local function update()
        local maximum=math.max(0,frame:GetVerticalScrollRange())
        bar:SetMinMaxValues(0,maximum)
        bar:SetVisibleExtentPercentage(frame:GetHeight()/math.max(1,frame:GetHeight()+maximum))
        bar:SetValue(frame:GetVerticalScroll())
    end
    frame:SetScript("OnScrollRangeChanged",update)
    frame:HookScript("OnSizeChanged",update)
    frame:HookScript("OnVerticalScroll",function(_,value)bar:SetValue(value)end)
    frame:EnableMouseWheel(true)
    frame:SetScript("OnMouseWheel",function(_,delta)bar:SetValue(frame:GetVerticalScroll()-delta*42)end)
end

local function HideButtonTextures(button)
    for _, getter in ipairs({"GetNormalTexture","GetPushedTexture","GetHighlightTexture","GetDisabledTexture"}) do
        local texture = button[getter] and button[getter](button)
        if texture then texture:SetAlpha(0) end
    end
end

function UI.IconButton(button,texture)
    HideButtonTextures(button)
    for _, key in ipairs({"Left","Middle","Right"}) do
        if button[key] and button[key].Hide then button[key]:Hide() end
    end
    button:SetSize(26,26)
    local border=CreateFrame("EditBox",nil,button,"InputBoxVisualTemplate")
    border:SetAllPoints();border:SetAutoFocus(false);border:EnableMouse(false);border:EnableKeyboard(false)
    border:SetFrameLevel(button:GetFrameLevel()+1)
    for _,piece in ipairs({border.Left,border.Middle,border.Right}) do piece:SetVertexColor(1,.95,.35) end
    border.Left:ClearAllPoints();border.Left:SetPoint("TOPLEFT");border.Left:SetPoint("BOTTOMLEFT");border.Left:SetWidth(8)
    border.Right:ClearAllPoints();border.Right:SetPoint("TOPRIGHT");border.Right:SetPoint("BOTTOMRIGHT");border.Right:SetWidth(8)
    border.Middle:ClearAllPoints();border.Middle:SetPoint("TOPLEFT",border.Left,"TOPRIGHT");border.Middle:SetPoint("BOTTOMRIGHT",border.Right,"BOTTOMLEFT")
    local icon=border:CreateTexture(nil,"ARTWORK")
    icon:SetPoint("TOPLEFT",4,-4);icon:SetPoint("BOTTOMRIGHT",-4,4);icon:SetTexture(texture)
    local glow=border:CreateTexture(nil,"HIGHLIGHT");glow:SetAllPoints(icon);glow:SetTexture(texture);glow:SetBlendMode("ADD");glow:SetAlpha(.35)
    button:SetHighlightTexture(glow)
    if button.text then button.text:Hide() end
    return border
end

function UI.Arrow(button,up)
    HideButtonTextures(button)
    button:SetSize(18,18)
    local art=button.arrowArt or button:CreateTexture(nil,"ARTWORK")
    button.arrowArt=art
    art:ClearAllPoints();art:SetPoint("CENTER",button,"CENTER",0,up and 2.5 or -2.5)
    local normalAtlas="common-dropdown-a-button-open-shadowless"
    local hoverAtlas=normalAtlas
    local function setArt(atlas,hovered)
        local info=C_Texture and C_Texture.GetAtlasInfo and C_Texture.GetAtlasInfo(atlas)
        local asset=info and (info.file or info.filename)
        if asset then
            -- Use the same fixed atlas rectangle for both buttons. Flip UVs,
            -- not the rendered rectangle, so the border keeps identical dimensions.
            art:SetTexture(asset)
            if up then
                art:SetTexCoord(info.rightTexCoord,info.leftTexCoord,info.bottomTexCoord,info.topTexCoord)
            else
                art:SetTexCoord(info.leftTexCoord,info.rightTexCoord,info.topTexCoord,info.bottomTexCoord)
            end
            art:SetRotation(0)
        else
            art:SetAtlas(atlas,false)
            art:SetRotation(up and math.pi or 0)
        end
        art:SetSize(18,18)
        art:SetSnapToPixelGrid(true)
        art:SetTexelSnappingBias(0)
        art:SetBlendMode(hovered and "ADD" or "BLEND")
    end
    setArt(normalAtlas,false)
    button:SetScript("OnEnter",function()setArt(hoverAtlas,true)end)
    button:SetScript("OnLeave",function()setArt(normalAtlas,false)end)
    if button.text then button.text:SetText("");button.text:Hide() end
end

function UI.Tooltip(button,text)
    button:HookScript("OnEnter",function(self)
        GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
        GameTooltip:SetText(text);GameTooltip:Show()
    end)
    button:HookScript("OnLeave",function()GameTooltip:Hide()end)
end

-- Native inset uses a nine-slice border: corners keep their size on tall fields.
function UI.InputBorder(host)
    -- The same native backdrop used by MacroFrameTextBackground.
    local border=CreateFrame("Frame",nil,host,"TooltipBackdropTemplate")
    border:SetAllPoints(host);border:EnableMouse(false)
    border:SetFrameLevel(host:GetFrameLevel())
    return border
end

function UI.DropdownLabel(button,text)
    button:SetDefaultText(text)
    -- Override stale selection text only for this refresh, keeping native menus intact.
    button.text=text
    button:UpdateText()
end

function UI.DropdownLayout(button)
    button:SetHeight(25)
    button.Text:ClearAllPoints()
    button.Text:SetPoint("LEFT",button,"LEFT",8,-1)
    button.Text:SetPoint("RIGHT",button,"RIGHT",-24,-1)
    button.Text:SetJustifyV("MIDDLE")
    button.Arrow:ClearAllPoints();button.Arrow:SetPoint("RIGHT",button,"RIGHT",1,-3)
end
