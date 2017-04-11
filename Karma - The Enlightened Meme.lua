--[[

+++++++++++++++++++++++++++++++++++++++++++
+																					+
+				 Karma The Enlightened Meme		  	+
+							Made by Navimus							+
+																					+
+++++++++++++++++++++++++++++++++++++++++++


Add R-W during combo

]]--
if GetObjectName(myHero) ~= "Karma" then return end

local VERSION = "0.02"
local SCRIPT_NAME = "Karma - The Enlightened Meme"
local SCRIPT_PATCH = "7.7"
local SCRIPT_AUTHOR = "Navimus"
local FULLADRESS = "https://raw.githubusercontent.com/Lunafont/LuaScripts/master/Karma%20-%20The%20Enlightened%20Meme.lua"
local Target
local Dev

function AutoUpdate(data)
    if tonumber(data) > tonumber(ver) then
        PrintChat("New version found! " .. data)
        PrintChat("Downloading update, please wait...")
        DownloadFileAsync("https://raw.githubusercontent.com/Auschwitzer/GoS/master/ElRayz.lua", SCRIPT_PATH .. "ElRayz.lua", function() PrintChat("Update Complete, please 2x F6!") return end)
    else
        PrintChat("No updates found!")
    end
end

function CheckUpdate(data)
  if tonumber(data) > tonumber(VERSION) then
    PrintChat("<font color=\"#9614ff\">-----------------------------------------------------------------</font>")
    PrintChat("<font color=\"#9614ff\">UPDATING: Dont press F9!</font>")
    PrintChat("<font color=\"#9614ff\">-----------------------------------------------------------------</font>")
    DownloadFileAsync(FULLADRESS, SCRIPT_PATH..SCRIPTNAME..".lua", function () PrintChat("<font color=\"#9614ff\">UPDATED: "..SCRIPT_NAME.." up to date - Please reload (2xF6)</font>") end)
  else
    PrintChat("<font color=\"#9614ff\">-----------------------------------------------------------------</font>")
    PrintChat("")
    PrintChat("<font color=\"#9614ff\">"..SCRIPT_NAME.."</font> "..VERSION.." <font color=\"#ffffff\"> by </font><font color=\"#007FFF\">"..SCRIPT_AUTHOR.."</font>")
    PrintChat("")
    PrintChat("<font color=\"#9614ff\">-----------------------------------------------------------------</font>")
  end
end

GetWebResultAsync("https://raw.githubusercontent.com/Lunafont/LuaScripts/master/Karma%20-%20The%20Enlightened%20Meme.version" , CheckUpdate)

function Skills()
  Passiv = {name="Gathering Fire"}
  SpellQ = {name="Inner Flame", range=GetCastRange(myHero,_Q), delay=0.25, width=120, speed=2400}
  SpellW = {name="Focused Resolve", range=GetCastRange(myHero,_W), delay=0.25}
  SpellE = {name="Inspire", range=GetCastRange(myHero,_E), delay=0.25}
  SpellR = {name="Mantra", delay=0.25}
end

function DrawMenu()
  Menu = MenuConfig("Karma", SCRIPT_NAME)
  Menu:Menu("Combo", "Karma Combo Settings")
    Menu.Combo:KeyBinding("ComboButton", "Combo Button:", 32)
    Menu.Combo:Boolean("ComboQ", "Use Q in Combo?", true)
    Menu.Combo:Slider("QPredictionValue", "Q Hit Chance Adjustments:", 3,0,10,1)
    Menu.Combo:Boolean("ComboW", "Use W in Combo?", true)
    Menu.Combo:Boolean("ComboE", "Use E in Combo?", true)
    Menu.Combo:Boolean("ComboR", "Use R in Combo?", true)
  Menu:Menu("Harass", "Karma Harass Settings")
    Menu.Harass:KeyBinding("HarassButton", "Harass Button:", string.byte("A"))
    Menu.Harass:Slider("QPredictionValue", "Q Hit Chance Adjustments:", 5,0,10,1)
    Menu.Harass:Boolean("HarassQ", "Use Q in Harass?", true)
    Menu.Harass:Boolean("HarassW", "Use W in Harass?", true)
    Menu.Harass:Boolean("HarassE", "Use E in Harass?", false)
    Menu.Harass:Boolean("HarassCombo", "Use W-Q Combo in Harass?", true)
    --[[      SCRIPT CURRENTLY DOESNT SUPPORT CLEAR OPTIONS!
  Menu:Menu("Clear", "Karma Clear Settings")
    Menu.Clear:KeyBinding("ClearButton", "Clear Button:", string.byte("V"))
    Menu.Clear:Boolean("LaneClearQ", "Use Q in Lane Clear?", false)
    Menu.Clear:Boolean("LaneClearW", "Use W in Lane Clear?", false)
    Menu.Clear:Boolean("LaneClearE", "Use E in Lane Clear?", false)
    Menu.Clear:Boolean("JungleClearQ", "Use Q in Jungle Clear?", false)
    Menu.Clear:Boolean("JungleClearW", "Use W in Jungle Clear?", false)
    Menu.Clear:Boolean("JungleClearE", "Use E in Jungle Clear?", false) ]]
  Menu:Menu("Drawing", "Karma Draw Settings")
    Menu.Drawing:Boolean("DrawQ", "Draw Q Range?", true)
    Menu.Drawing:Boolean("DrawW", "Draw W Range?", true)
    Menu.Drawing:Boolean("DrawE", "Draw E Range?", false)
    Menu.Drawing:Boolean("DrawDisable", "Disable all Drawings?", false)
  Menu:Menu("Settings", "Karma Settings")
    Menu.Settings:KeyBinding("FleeKey", "Flee Button:", string.byte("Y"))
    Menu.Settings:Boolean("FleeQ", "Use Q while fleeing?", true)
    Menu.Settings:Boolean("FleeW", "Use W while fleeing?", false)
    Menu.Settings:Boolean("FleeE", "Use E while fleeing?", true)
    Menu.Settings:Boolean("FleeR", "Use R while fleeing?", false)
    Menu.Settings:Boolean("AutoPotions", "Use Health Potions automatically?", true)
    Menu.Settings:Boolean("DevNotes", "Show Developers Notes", false)
end

function healthPotions()
  if Menu.Settings.AutoPotions:Value()==true and IsObjectAlive(GetOrigin(myHero)) then
    HealthPercent=GetCurrentHP(myHero)*100/GetMaxHP(myHero)
    HealthPercent=math.floor(HealthPercent)
    if HealthPercent<50 then
      if GetItemID(myHero, 6)==2003 then CastSpell(6) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
      if GetItemID(myHero, 7)==2003 then CastSpell(7) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
      if GetItemID(myHero, 8)==2003 then CastSpell(8) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
      if GetItemID(myHero, 9)==2003 then CastSpell(9) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
      if GetItemID(myHero, 10)==2003 then CastSpell(10) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
      if GetItemID(myHero, 11)==2003 then CastSpell(11) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
      if GetItemID(myHero, 12)==2003 then CastSpell(12) PrintChat("<font color=\"#9614ff\">Using Health Potion!") end
    end
  end
end

function Combo()
  if Menu.Combo.ComboButton:Value()==true and ValidTarget(Target, 1000) then
    local QPrediction = GetPrediction(Target, SpellQ, myHero)
    if CanUseSpell(myHero,_Q)==0 and Menu.Combo.ComboQ:Value()==true and QPrediction.hitChance > (Menu.Combo.QPredictionValue:Value() * 0.1) and not QPrediction:mCollision(1) then
      if CanUseSpell(myHero,_R)==0 and Menu.Combo.ComboR:Value()==true then
        CastSpell(_R)
        CastSkillShot(_Q, QPrediction.castPos)
      else
        CastSkillShot(_Q, QPrediction.castPos)
      end
    end
    if CanUseSpell(myHero,_W)==0 and Menu.Combo.ComboW:Value()==true and ValidTarget(Target, SpellW.range) then
      CastTargetSpell(Target, _W)
    end
    if CanUseSpell(myHero,_E)==0 and Menu.Combo.ComboE:Value()==true and ValidTarget(Target, 600) then
      CastSpell(_E)
    end
  end
end

function Harass()
  if Menu.Harass.HarassButton:Value()==true and ValidTarget(Target, 1000) then
    local QPrediction = GetPrediction(Target, SpellQ, myHero)
    if CanUseSpell(myHero,_Q)==0 and Menu.Harass.HarassQ:Value()==true and QPrediction.hitChance > (Menu.Harass.QPredictionValue:Value() * 0.1) and not QPrediction:mCollision(1) then
      CastSkillShot(_Q, QPrediction.castPos)
    end
    if CanUseSpell(myHero,_W)==0 and Menu.Harass.HarassW:Value()==true and ValidTarget(Target, SpellW.range) then
      CastTargetSpell(Target, _W)
    end
    if CanUseSpell(myHero,_E)==0 and Menu.Harass.HarassE:Value()==true and ValidTarget(Target, 600) then
      CastSpell(_E)
    end
  end
end

function Clear()

end

function DevStuff()
    PrintChat("<font color=\"#9614ff\">-----------------------------------------------------------------</font>")
end

OnLoad( function()
  Skills()
  DrawMenu()
  HeroSkinChanger(myHero, 1)
end)

OnTick( function()
	Target = GetCurrentTarget()
  if IsObjectAlive(GetOrigin(myHero))==false then
    healthPotions()
    Combo()
    Harass()
    Clear()
  end
  if Menu.Settings.DevNotes:Value()==true then DevStuff() end
end)

OnDraw( function(myHero)
  if IsObjectAlive(GetOrigin(myHero))==false and Menu.Drawing.DrawDisable:Value()==false then
    --Draw Spell ranges
    if CanUseSpell(myHero,_Q)==0 and Menu.Drawing.DrawQ:Value()==true then
      DrawCircle(GetOrigin(myHero), SpellQ.range, 1,200,ARGB(255,255,0,0))
    end
    if CanUseSpell(myHero,_W)==0 and Menu.Drawing.DrawW:Value()==true then
      DrawCircle(GetOrigin(myHero), SpellW.range, 1, 200, ARGB(255,255,0,0))
    end
    if CanUseSpell(myHero,_E)==0 and Menu.Drawing.DrawE:Value()==true then
      DrawCircle(GetOrigin(myHero), SpellE.range, 1, 200, ARGB(255,255,0,0))
    end
    if Menu.Combo.ComboButton:Value()==true then
      DrawText("Combo Active!",30,WorldToScreen(1,GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z).x-85,WorldToScreen(1,GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z).y-165,ARGB(255,150,20,255));
    end
    if Menu.Harass.HarassButton:Value()==true then
      DrawText("Harass Active!",30,WorldToScreen(1,GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z).x-85,WorldToScreen(1,GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z).y-165,ARGB(255,150,20,255));
    end
    --[[      SCRIPT CURRENTLY DOESNT SUPPORT CLEAR OPTIONS!
    if Menu.Clear.ClearButton:Value()==true then
      DrawText("Clear Active!",30,WorldToScreen(1,GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z).x-85,WorldToScreen(1,GetOrigin(myHero).x,GetOrigin(myHero).y,GetOrigin(myHero).z).y-165,ARGB(255,150,20,255));
    end ]]
  end
end)
