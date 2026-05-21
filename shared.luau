local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={
function()local b,c,d=a(1)return(function(...)if(not game:IsLoaded())then game.
Loaded:Wait()end local e=d(c.Library)if(not pcall(e.Get,e,'Shared'))then return
end local f=e.Services local g,h,i,j,k,l=f.Workspace,f.Players,f.
ReplicatedStorage,f.HttpService,f.TweenService,f.RunService local m,n,o,p,q,r,s,
t,u,v,w,x,y,z,A,B,C,D,E,F,G,H,I,J=h.LocalPlayer,g.CurrentCamera,e:Get
'Shared/Constants',e:Get'Shared/Modules/Color',e:Get'Shared/Modules/TaskManager'
,e:Get'Shared/RBXUtil/Promise',e:Get'Shared/RBXUtil/TableUtil',e:Get
'Shared/Functions/Time',e:Get'Shared/Functions/GetPing',e:Get
'Shared/Functions/Hooks',e:Get'Shared/Functions/OutputMessage',e:Get
'Shared/Functions/Numbers',e:Get'Shared/Functions/AntiAFK',e:Get
'Shared/Functions/BinarySearch',e:Get'Shared/Functions/Noclip',e:Get
'Modules/Interface':Init(),e:Get'Modules/Dependencies',e:Get'Functions/Cleaner':
Get(),e:Get'Functions/RollFeed',e:Get'Functions/ZoneUtil',e:Get
'Functions/UpgradeUtil',e:Get'Functions/Freeze',e:Get'Functions/GoopGun',e:Get
'Functions/SlimeUtil'local K=B.Components.Main local L,M,N,O,P,Q,R,S,T,U,V,W,X,Y
,Z,_,aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at,au=K.Toggles,K.
Options,K.Buttons,K.Labels,q.Task,q.Lock,p.Paint,o.Characters,C.Modules.
SettingsClient,C.Modules.RollClient,C.Modules.RollSlice,C.Modules.InventoryUtils
,C.Modules.GameplayClient,C.Modules.DataService.client,C.Modules.ZoneService,C.
Modules.LootClient,C.Modules.AutoRejoinClient,C.Modules.GoopGunClient,C.Modules.
GoopGunUtils,C.Modules.UpgradeClient,C.Modules.TutorialClient,C.Modules.
InventoryClient,C.Modules.XpTransferUtil,C.Modules.XpTransferClient,C.Modules.
XpTransferService,C.Modules.IndexClient,C.Modules.IndexUtil,C.Modules.
IndexReward,C.Modules.RebirthClient,C.Modules.RebirthUtil,C.Modules.BoostClient,
C.Modules.Abbreviate,C.Modules.Slimes,C.Modules.Mutations,C.Modules.Rarities,C.
Modules.Zones,C.Modules.Food local av,aw,ax,ay=Q.new'TeleportLock',Color3.new(1,
0,0),Color3.new(0,1,0),Y:get()do while(not ae:hasCompletedTutorial())do ae:
advanceStep(ae:getStep())task.wait(0.2)end end do aa:disable()y.Enable()D:Add(aa
.enable,aa)D:Add(y.Disable)end do local az,aA,aB,aC,aD,aE=0,0,0,{},M.
RollingPingAdjustment,L.RollFeedToggle getgenv().RollFeed=E L.AutoRollDice:
OnChanged(function(aF)q.RemoveTasksByIndex'AutoRollDice'if(not aF)then return
end q.AddTask(P.new('AutoRollDice',function(aG)local aH,aI,aJ,aK=U.networker:
fetch'requestRoll'if(not aH)then aG.Interval=0 aA=aA+1 return end aG.Interval=
math.max(0,(aI.rollTime or 0)-(u()*aD.Value))az=az+1 if aB~=0 then if#aC>=50
then table.remove(aC,1)end table.insert(aC,t.now()-aB)end aB=t.now()if aE.Value
then if aK and aK.reward then table.insert(aH,{aK.reward})end E.Push(aH)end end,
1.6666666666666665E-2))end)L.RollFeedToggle:OnChanged(E.SetVisible)N.
ClearRollFeed.Func=E.Clear local aF=function()setthreadidentity(8)O.
RollingHitMissLabel:SetText(string.format('%s Hit/Miss: <b>%s/%s</b>',tostring(S
.BulletPoint),tostring(R(tostring(az),ax)),tostring(R(tostring(aA),aw))))local
aF,aG=table.clone(aC),0 for aH,aI in aF do aG=aG+aI end O.AverageRollTimeLabel:
SetText(string.format('%s Average Roll: <b>%ss</b>',tostring(S.BulletPoint),
tostring(#aF==0 and 0 or x.DecimalRound(aG/#aF,3))))end D:Add(Y:getChangedSignal
{'stats','rolls'}:Connect(aF))aF()N.ClearRollingStats.Func=function()az,aA=0,0
table.clear(aC)aF()end end do local az,aA,aB,aC=M.EnemyFarmHoverOffset,M.
SelectedEnemyArea,X.gameplay.enemies,{Optimized=function(az)return az==at.
getMaxZone()and F.GetBestGoopZone()or az end,['Best Unlocked']=function(az)
return az end,['Best Goop Rate']=F.GetBestGoopZone}L.AutoFarmEnemies:OnChanged(
function(aD)q.RemoveTasksByIndex'AutoFarmEnemies'if(not aD)then return end q.
AddTask(P.new('AutoFarmEnemies',function(aE)local aF=m.Character if(not aF)then
return end local aG=aF.PrimaryPart if(not aG)then return end local aH=aF:
FindFirstChild'Humanoid'if(not aH)or(aH.Health==0)then return end if(not av:
CanTake(aE))or(not av:TakeAsync(aE))then return end local aI=aG.CFrame A.Noclip(
)H.Freeze()while(not aE.Destroyed)and(not av.Aborted)and task.wait(
0.16666666666666666)do if(not aH.Parent)or(aH.Health==0)then break end local aJ,
aK=ay.maxZone,aA.Value local aL=aC[aK]local aM,aN=aL and aL(aJ),I.IsUnlocked()if
(not aM)then break end if ay.zone~=aM then Z:teleportToZone(aM)end local aO={}
for aP,aQ in aB do if(aQ.enemyId~=aM)then continue end table.insert(aO,aQ)end if
(not next(aO))then continue end table.sort(aO,function(aP,aQ)return m:
DistanceFromCharacter(aP.pos)<m:DistanceFromCharacter(aQ.pos)end)for aP,aQ in aO
do if(ay.zone~=aM)or(ay.maxZone~=aJ)or(aA.Value~=aK)or(aE.Destroyed)or(av.
Aborted)then break end local aR=aQ.uniqueId while(not aE.Destroyed)and(aB[aR]~=
nil)and task.wait()do if(not aH.Parent)or(aH.Health==0)then break end if aN and
I.CanFire()then task.spawn(I.Fire,aR)end aG:PivotTo(CFrame.new(aQ.pos)*CFrame.
new(0,az.Value,0))end end end aG:PivotTo(aI)A.Clip()H.Unfreeze()av:Release()end,
0.3333333333333333,true))end)end L.AutoCollectLoot:OnChanged(function(az)v.
Release'AutoCollectLoot'if(not az)then return end v.Add('AutoCollectLoot',_.
lootAdded,function(aA,aB)local aC,aD=_.networker:fetch('requestCollect',aB.
uniqueId)if not aC then w('Warn',string.format('Failed to pickup loot: %s',
tostring(aD)))end end)for aA,aB in _.lootById do task.spawn(aB.requestCollect,aB
)end end)do local az,aA=M.IgnoredUpgrades,M.UpgradeSortingMethod L.
AutoPurchaseUpgrades:OnChanged(function(aB)q.RemoveTasksByIndex
'AutoPurchaseUpgrades'if(not aB)then return end q.AddTask(P.new(
'AutoPurchaseUpgrades',function(aC)local aD,aE,aF={},{},az.Value for aG,aH in G.
Upgrades do if aF[aG]then continue end if not aH.Cost then continue end if G.
IsOwned(aG)then continue end if not G.IsRequirementMet(aG)then continue end
table.insert(aE,aH)end if(not next(aE))then return end table.sort(aE,function(aG
,aH)local aI,aJ=aG.Cost.amount,aH.Cost.amount if aI~=aJ then return(aA.Value==
'Cheap'and{(aI<aJ)}or{(aI>aJ)})[1]end return aG.Index>aH.Index end)for aG,aH in
aE do local aI,aJ=aH.Cost.amount,aH.Cost.currency if aD[aJ]then continue end if
ay[aJ]<aI then aD[aJ]=true continue end local aK=ad.networker:fetch(
'requestUnlock',aH.Index)if aK then K:Notify{Title='strelizia.cc',Description=
string.format('Bought upgrade: %s',tostring(aH.Name)),Duration=2}end end end,1))
end)end do local az,aA=M.ExcludedFeedingFood,M.MaximumFeedingLevel L.
AutoFeedEquippedSlimes:OnChanged(function(aB)q.RemoveTasksByIndex
'AutoFeedEquippedSlimes'if(not aB)then return end q.AddTask(P.new(
'AutoFeedEquippedSlimes',function(aC)local aD=J.GetEquippedSlimes()if(not next(
aD))then return end local aE,aF=tonumber(aA.Value or aA.Default),az.Value local
aG,aH=J.GetAccumulatedXpForLevel(aE),{}for aI,aJ in aD do if aJ.level>=aE then
continue end table.insert(aH,{Identifier=aI,Slime=aJ})end if(not next(aH))then
return end table.sort(aH,function(aI,aJ)local aK,aL=J.GetBaseDps(aI.Slime),J.
GetBaseDps(aJ.Slime)if aK~=aL then return aK>aL end return aI.Identifier>aJ.
Identifier end)local aI={}for aJ,aK in au.getSortedFoods()do if aF[aK.id]then
continue end local aL=ay.items[aK.id]if(not aL)then continue end table.insert(aI
,{id=aK.id,xp=aK.xp,amount=aL})end if(not next(aI))then return end for aJ,aK in
aH do local aL=aG-W.getAccumulatedXp(aK.Slime)for aM,aN in aI do if aL<=0 then
break end local aO,aP,aQ=aN.id,aN.xp,aN.amount if(aQ<=0)then continue end local
aR=math.min(math.ceil(aL/aP),aQ)local aS,aT,aU=af.networker:fetch(
'requestUseFood',aO,aK.Identifier,aR)if(not aS)then continue end if aU then aK.
Identifier=aU end aL=aL-aR*aP aN.amount=aN.amount-aR end end end,2))end)end do
local az,aA=M.TargetTransferLevel,L.TransferIgnoreEquipped L.AutoTransferXP:
OnChanged(function(aB)q.RemoveTasksByIndex'AutoTransferXP'if(not aB)then return
end q.AddTask(P.new('AutoTransferXP',function(aC)local aD,aE=tonumber(az.Value
or az.Default),aA.Value if not ai:isMachineUnlocked()then if ay.coins<ag.
XP_TRANSFER_MACHINE_UNLOCK_PRICE then return end if(not ai:unlockMachine())then
return end end local aF,aG,aH=J.GetEquippedSlimes(),0 for aI,aJ in aF do if aJ.
level>=aD then continue end local aK=J.GetBaseDps(aJ)if aK>aG then aH,aG={
Identifier=aI,Slime=aJ,Individual=J.IsIndividual(aI)},aK end end if(not aH)then
aC.Interval=5 return end local aI={}for aJ,aK in J.GetIndividualSlimes()do if aE
and aF[aJ]then continue end local aL=ag.getTransferableXp(aK)if aL==0 then
continue end local aM=J.GetBaseDps(aK)if aM>=aG then continue end table.insert(
aI,{Identifier=aJ,Slime=aK,Transferable=aL})end if(not next(aI))then aC.Interval
=5 return end table.sort(aI,function(aJ,aK)return aJ.Transferable<aK.
Transferable end)local aJ=J.GetAccumulatedXpForLevel(aD)-W.getAccumulatedXp(aH.
Slime)while(not aC.Destroyed)and task.wait(0.1)do if aJ<=0 then aC.Interval=1
break end local aK,aL=z.Nearest(aI,aJ,function(aK)return aK.Transferable end)if(
not aL)then aC.Interval=5 break end local aM=ah.networker:fetch(
'requestTransferXp',aL.Identifier,aH.Identifier)if aM then if not aH.Individual
then aC.Interval=1 break end aJ=aJ-aL.Transferable table.remove(aI,aK)end end
end,1))end)end do local az=M.EquipSortingMode L.AutoEquipBestPets:OnChanged(
function(aA)q.RemoveTasksByIndex'AutoEquipBestPets'if(not aA)then return end q.
AddTask(P.new('AutoEquipBestPets',function(aB)local aC,aD=az.Value,{}for aE,aF
in ay.inventory do local aG=W.getSlimeData(aE,aF)table.insert(aD,{Identifier=aE,
Damage=(aC=='Highest Damage'and{(J.GetSlimeStats(aG).damage)}or{(J.GetBaseDps(aG
))})[1]})end if(not next(aD))then aB.Interval=1 return end table.sort(aD,
function(aE,aF)local aG,aH=aE.Damage,aF.Damage if aG~=aH then return aG>aH end
return aE.Identifier>aF.Identifier end)local aE,aF=J.GetMaxEquipSlots(),{}for aG
=1,aE do local aH=aD[aG]if(not aH)then break end aF[aH.Identifier]=true end
local aG={}for aH,aI in ay.equipped do aG[aI]=aH end for aH,aI in aG do if aF[aH
]then continue end local aJ=af.networker:fetch('requestUnequip',aI)if(not aJ)
then return end aG[aH]=nil end for aH in aF do if aG[aH]then continue end local
aI=af.networker:fetch('requestEquip',aH)if(not aI)then return end end end,1))end
)end do local az=debug.getupvalue(at.getZone,1)L.AutoPurchaseZones:OnChanged(
function(aA)q.RemoveTasksByIndex'AutoPurchaseZones'if(not aA)then return end q.
AddTask(P.new('AutoPurchaseZones',function(aB)local aC=az[ay.maxZone+1]if(not aC
)then aB.Interval=5 return end if ay.coins<aC.price then aB.Interval=3 return
end local aD=Z.networker:fetch'requestPurchaseZone'if aD then aB.Interval=0.3
return end aB.Interval=3 end,3))end)end do local az=ak.getCategoryIds()L.
AutoClaimIndex:OnChanged(function(aA)q.RemoveTasksByIndex'AutoClaimIndex'if(not
aA)then return end q.AddTask(P.new('AutoClaimIndex',function(aB)local aC=ak.
reconcileIndexData(ay.index)for aD,aE in az do if(not al.
isCategoryClaimableFromData(aC,aE))then continue end aj:requestClaimReward(aE)
end end,5))end)end do L.AutoRebirth:OnChanged(function(az)q.RemoveTasksByIndex
'AutoRebirth'if(not az)then return end q.AddTask(P.new('AutoRebirth',function(aA
)local aB,aC=ay.rebirths or 0,ay.goop or 0 if(not an.canAffordRebirth(aB,aC))
then return end am:attemptRebirth()end,5))end)end do local az=M.
SelectedAutoPotions L.AutoDrinkPotions:OnChanged(function(aA)q.
RemoveTasksByIndex'AutoDrinkPotions'if(not aA)then return end q.AddTask(P.new(
'AutoDrinkPotions',function(aB)local aC,aD,aE=ay.boosts or{},az.Value,t.now()for
aF,aG in aC do if(not aD[aF])then continue end if aG.amount<=0 then continue end
if aG.expirationTime>aE then continue end ao:requestUseBoost(aF)end end,5))end)
end q.Begin()B:SyncElements()end)()end,function()local aa,ab,ac=a(2)return(
function(...)local ad=ac(ab.Parent.Vinca)return ad.new():Extend(ad.Extensions.
Children(ab))end)()end,function()local aa,ab=a(3)return(function(...)return
function(ac)return ac.new(ac):Extend(ac.Extensions.Children(ab))end end)()end,
function()a(4)return(function(...)return function(aa)local ab,ac,ad,ae,af,ag,ah,
ai,aj,ak,al,am=getgenv(),aa:Get'Shared/Modules/Color',aa:Get
'Shared/Modules/Places',aa:Get'Shared/Modules/Interface',aa:Get
'Shared/RBXUtil/TableUtil',aa:Get'Shared/Constants',aa:Get'Modules/Dependencies'
,aa:Get'Functions/UpgradeUtil',aa:Get'Shared/Functions/Numbers',aa:Get
'Shared/Functions/Time',aa:Get'Shared/Functions/Strings',aa:Get
'Functions/Cleaner':Get()local an,ao,ap,aq,ar,as,at,au,av,aw=ag.Characters,ad.
GetPlaceFromId(game.PlaceId),ac.Paint,Color3.new(0,1,0),Color3.new(1,0,0),Color3
.new(0,1,1),ah.Modules.Abbreviate,ah.Assets.Images,ah.Modules.InventoryItemUtils
,{Values={},Formatted={}}for ax,ay in ah.Modules.Rarities.getTiers()do aw.
Formatted[ay.name]=string.format('<b>%s</b> | 1/%s',tostring(ap(ay.name,ay.
gradient)),tostring(at(ay.threshold)))table.insert(aw.Values,ay.name)end local
ax={Values={},Formatted={},Images={}}for ay,az in ai.Upgrades do ax.Formatted[ay
]=az.Name ax.Images[ay]=az.Icon table.insert(ax.Values,ay)end table.sort(ax.
Values,function(ay,az)return ay<az end)local ay={Values={},Formatted={},Images={
}}for az,aA in ah.Modules.Food.getSortedFoods()do ay.Formatted[aA.id]=string.
format('%s | %s XP',tostring(aA.name),tostring(aj.Comma(aA.xp)))ay.Images[aA.id]
=aA.icon table.insert(ay.Values,aA.id)end local az={Values={},Formatted={},
Images={}}for aA,aB in debug.getupvalue(av.getDefinition,1)do if aB.kind~=
'boost'then continue end az.Formatted[aA]=aB.name az.Images[aA]=aB.icon table.
insert(az.Values,aA)end local aA,aB=function(aA)return function(aB)return aA[aB]
end end,{}aB.Init=function(aC)if aB.Initiated then return aC end aB.Initiated=
true if ab.Library then ab.Library:Unload()end local aD=ae.GetInterface
'Obsidian'aB.Components=aD local aE,aF,aG=aD.Main,aD.SaveManager,aD.ThemeManager
aE.ForceCheckbox=true local aH=aD.Main:CreateWindow{Title='strelizia.cc',Footer=
string.format('strelizia.cc %s %s %s v%s',tostring(an.BulletPoint),tostring(ao.
Name),tostring(an.BulletPoint),tostring(ag.LRM_Constants.ScriptVersion)),Icon=
79981166576877,Size=UDim2.fromOffset(720,500),CornerRadius=6,EnableSidebarResize
=true}aH:SetSidebarWidth(180)local aI={Home=aH:AddTab{Name='Home',Icon='house',
Description='contains basic information'},Farming=aH:AddTab{Name='Farming',Icon=
'tractor',Description='everything related to farming'},Slimes=aH:AddTab{Name=
'Slimes',Icon='dog',Description='everything related to slimes (pets)'},Misc=aH:
AddTab{Name='Misc',Icon='sparkles',Description='contains other features'},
Settings=aH:AddTab{Name='Settings',Icon='cog',Description=
'contains user interface settings'}}aD.Tabs.Home(aI.Home,aH)local aJ=aI.Farming:
AddGroupbox{Side=1,Name='Rolling',IconName='dices'}aJ:AddSlider(
'RollingPingAdjustment',{Text='Ping Adjustment',Default=0.5,Min=0,Max=1,Rounding
=2,Tooltip=string.format(
[[attemptss to roll earlier based off of the selected value
<b>0 = %s, 0.5 = %s, 1 = %s</b>;
<i>note: this can result in failed rolls and it's advised not to go too high</i>]]
,tostring(ap('doesnt fire earlier',ar)),tostring(ap('half ping earlier',as)),
tostring(ap('full ping earlier',aq)))})aJ:AddToggle('AutoRollDice',{Text=
'Auto Roll',Tooltip=
[[automatically rolls the dice
<i>note: might break games autoroll</i>]]})aJ:
AddDivider{Text='roll feed'}local aK=aA(aw.Formatted)aJ:AddDropdown(
'RollFeedExcludedRarities',{Text='Excluded Rarities',Values=aw.Values,Multi=true
,RichText=true,FormatDisplayValue=aK,FormatListValue=aK,Tooltip=
'determines which rarities will be excluded from the feed'})aJ:AddInput(
'RollFeedMaximumSize',{Text='Maximum Columns',Numeric=true,Finished=true,
ClearTextOnFocus=true,Tooltip=
[[determines how many columns can show on the feed at the same time
<i>note: the higher the number, bigger the <b>performance impact</b>, have that in mind</i>]]
,Placeholder='number here',Default=20,MaxLength=3})aJ:AddButton('ClearRollFeed',
{Text='Clear Roll Feed',Tooltip='empties all pets from the rolling feed'})aJ:
AddToggle('RollFeedToggle',{Text='Enable Roll Feed',Tooltip=
[[enables a floating draggable label which displays all recent rolls]]})aJ:
AddDivider{Text='stats'}aJ:AddLabel('RollingHitMissLabel',{Text='',DoesWrap=true
,Alignment=Enum.TextXAlignment.Center})aJ:AddLabel('AverageRollTimeLabel',{Text=
'',DoesWrap=true,Alignment=Enum.TextXAlignment.Center})aJ:AddButton(
'ClearRollingStats',{Text='Reset Stats',Tooltip=
'resets roll stats, used for benchmarking'})local aL,aM=aI.Farming:AddGroupbox{
Side=2,Name='Enemies',IconName='swords'},aA{['Best Unlocked']=ap(
'<b>Best Unlocked</b>',Color3.fromRGB(189,255,242)),['Best Goop Rate']=ap(
'<b>Best Goop Rate</b>',Color3.fromRGB(85,0,255)),Optimized=ap(
'<b>Optimized</b>',Color3.fromRGB(85,255,0))}aL:AddDropdown('SelectedEnemyArea',
{Text='Selected Area Type',Values={'Best Unlocked','Best Goop Rate','Optimized'}
,Default=3,ValueImages={['Best Unlocked']=au.teleporter,['Best Goop Rate']=au.
goop,Optimized=au.luckIcons[1]},Tooltip=string.format(
[[determines which type of area will script farm enemies in
%s - <b>first farms best to max area, then goop area</b>]]
,tostring(aM'Optimized')),RichText=true,FormatDisplayValue=aM,FormatListValue=aM
})aL:AddSlider('EnemyFarmHoverOffset',{Text='Hover Offset',Default=3,Min=-10,Max
=10,Rounding=1,Tooltip=
[[determines if character will be above or below the enemy when teleporting]]})
aL:AddToggle('AutoFarmEnemies',{Text='Auto Farm Enemies',Tooltip=
[[automatically farms enemies based on the configuration above]]})aL:AddToggle(
'AutoCollectLoot',{Text='Auto Collect Loot',Tooltip=
'automatically collects loot from enemies'})local aN,aO=aI.Farming:AddGroupbox{
Side=2,Name='Upgrades',IconName='circle-fading-arrow-up'},aA(ax.Formatted)aN:
AddDropdown('IgnoredUpgrades',{Text='Ignored Upgrades',Values=ax.Values,Multi=
true,ValueImages=ax.Images,Tooltip=
[[determines which upgrades will be ignored
<i>tip: you can enable the first level of an upgrade to prevent purchase of future levels!</i>]]
,FormatDisplayValue=aO,Searchable=true,FormatListValue=aO})local aP=aA{Expensive
=string.format('<b>%s</b>',tostring(ap('Expensive',aq))),Cheap=string.format(
'<b>%s</b>',tostring(ap('Cheap',ar)))}aN:AddDropdown('UpgradeSortingMethod',{
Text='Sorting Method',Values={'Expensive','Cheap'},Default=2,RichText=true,
Tooltip=string.format(
[[determines which upgrades will be bought first
<b>%s = cost over quantity, %s = quantity over cost</b>
<i>note: having this on %s will always save for the most expensive upgrade!</i>]]
,tostring(ap('Expensive',aq)),tostring(ap('Cheap',ar)),tostring(ap('Expensive',
aq))),FormatDisplayValue=aP,FormatListValue=aP})aN:AddToggle(
'AutoPurchaseUpgrades',{Text='Auto Purchase Upgrades',Tooltip=
[[automatically purchases upgrades based off configuration above]]})local aQ,aR=
aI.Slimes:AddGroupbox{Side=1,Name='Feeding',IconName='hamburger'},aA(ay.
Formatted)aQ:AddDropdown('ExcludedFeedingFood',{Text='Excluded Food',Values=ay.
Values,Multi=true,Searchable=true,Tooltip=
"determines which food won't be used for slime feeding",ValueImages=ay.Images,
FormatDisplayValue=aR,FormatListValue=aR})aA{['Closer to Level']=string.format(
'<b>%s</b>',tostring(ap('Closer to Level',aq))),['Further from Level']=string.
format('<b>%s</b>',tostring(ap('Further from Level',ar))),['Higher Base DPS']=
string.format('<b>%s</b>',tostring(ap('Higher Base DPS',as)))}aQ:AddInput(
'MaximumFeedingLevel',{Text='Target Slime Level',Numeric=true,Finished=true,
ClearTextOnFocus=true,Tooltip=
'determines the level to which the slime will be fed',Placeholder='number here',
Default=30,MaxLength=3})aQ:AddToggle('AutoFeedEquippedSlimes',{Text=
'Auto Feed Slimes',Tooltip=
[[automatically feeds equipped slimes based off the configuration above]]})local
aS=aI.Slimes:AddGroupbox{Side=2,Name='XP Transfer',IconName='test-tubes'}aS:
AddInput('TargetTransferLevel',{Text='Target Slime Level',Numeric=true,Finished=
true,ClearTextOnFocus=true,Tooltip=
[[determines the maximum level of the slime
<i>note: this also determines the algorithm for picking the best donor slime</i>]]
,Placeholder='number here',Default=30,MaxLength=3})aS:AddToggle(
'TransferIgnoreEquipped',{Text='Ignore Equipped Pets',Tooltip=
[[equipped pets will be ignored and won't be used as xp donors]],Default=true})
aS:AddToggle('AutoTransferXP',{Text='Auto Transfer XP',Tooltip=
[[automatically transfers experience from weaker pets to the
best base-dps pet that hasn't reached the target level yet
<i>note: this will unlock the xp transfer machine in case you haven't unlocked it already</i>]]
})local aT,aU=aI.Slimes:AddGroupbox{Side=1,Name='Equipping',IconName='box'},aA{[
'Highest Damage']=string.format('<b>%s</b>',tostring(ap('Highest Damage',aq))),[
'Highest Base DPS']=string.format('<b>%s</b>',tostring(ap('Highest Base DPS',as)
))}aT:AddDropdown('EquipSortingMode',{Text='Sorting Mode',Values={
'Highest Damage','Highest Base DPS'},Default=2,Tooltip=string.format(
[[determines how will the pets be sorted
<b>%s = games normal auto equip, %s = slime which is better on equal level</b>]]
,tostring(ap('Highest Damage',aq)),tostring(ap('Highest Base DPS',as))),
FormatDisplayValue=aU,RichText=true,FormatListValue=aU})aT:AddToggle(
'AutoEquipBestPets',{Text='Auto Equip Best Pets',Tooltip=
[[automatically equips best slimes based of the configuration above]]})local b=
aI.Misc:AddGroupbox{Side=1,Name='Others',IconName='grip'}b:AddToggle(
'AutoPurchaseZones',{Text='Auto Purchase Zones',Tooltip=
'automatically purchases new zones when affordable'})b:AddToggle(
'AutoClaimIndex',{Text='Auto Claim Index',Tooltip=
'automatically claims available index rewards'})b:AddToggle('AutoRebirth',{Text=
'Auto Rebirth',Tooltip=
'automatically rebirths when enough goop has been collected'})local c,d=aI.Misc:
AddGroupbox{Side=2,Name='Potions',IconName='flask-conical'},aA(az.Formatted)c:
AddDropdown('SelectedAutoPotions',{Text='Selected Potions',Values=az.Values,
Tooltip='determines which potions will be used',FormatDisplayValue=d,Multi=true,
ValueImages=az.Images,FormatListValue=d})c:AddToggle('AutoDrinkPotions',{Text=
'Auto Drink Potions',Tooltip='automatically drinks potions when they run out'})
aD.Tabs.Settings(aI.Settings)aD.Main:OnUnload(function()am:Destroy()end)return
aC end aB.SyncElements=function(aC)if(not aB.Initiated)or(ab.Library==nil)then
return aC end local aD=ab.Library for aE,aF in af.JoinArrays(aD.Toggles,aD.
Options)do if not aF.Changed then continue end aF.Changed(aF.Value)end return aC
end return aB end end)()end,function()local aa,ab,ac=a(5)return(function(...)
return function(ad)local ae=ad.Services local af,ag,ah,ai=ae.ReplicatedStorage,
ae.Players,ad:Get'Shared/RBXUtil/Tree',ad:Get'Shared/Functions/OutputMessage'
local aj,ak,al,am,an,ao=ag.LocalPlayer,af.Source.Features,af.Source.Game.Items,
af.Source.Core,af.Source.Game.AssetIds,af.Packages local ap,aq={Modules={
SettingsClient={ak,'Settings/SettingsServiceClient'},RollClient={ak,
'Roll/RollServiceClient'},RollSlice={ak,'Roll/RollSlice'},Mutations={ak,
'Mutations/Mutations'},InventoryUtils={ak,'Inventory/InventoryServiceUtils'},
InventoryClient={ak,'Inventory/InventoryServiceClient'},InventoryItemUtils={ak,
'Inventory/InventoryItemUtils'},GameplayClient={ak,
'Gameplay/GameplayServiceClient'},ZoneService={ak,'Zones/ZonesServiceClient'},
GoopRewardUtils={ak,'Currency/GoopRewardUtils'},LootClient={ak,
'Loot/LootServiceClient'},AutoRejoinClient={ak,
'AutoRejoin/AutoRejoinServiceClient'},UpgradeTree={ak,'Upgrades/UpgradeTree'},
GoopGunClient={ak,'GoopGun/GoopGunServiceClient'},GoopGunUtils={ak,
'GoopGun/GoopGunServiceUtils'},UpgradeClient={ak,'Upgrades/UpgradeServiceClient'
},UpgradeUtils={ak,'Upgrades/UpgradeServiceUtils'},TutorialClient={ak,
'Tutorial/TutorialServiceClient'},XpTransferUtil={ak,
'XpTransfer/XpTransferServiceUtils'},XpTransferClient={ak,
'XpTransfer/XpTransferServiceClient'},XpTransferService={ak,
'XpTransfer/XpTransferMachineServiceClient'},IndexClient={ak,
'Index/IndexServiceClient'},IndexUtil={ak,'Index/IndexServiceUtils'},IndexReward
={ak,'Index/IndexRewardUtils'},RebirthClient={ak,'Rebirth/RebirthServiceClient'}
,RebirthUtil={ak,'Rebirth/RebirthServiceUtils'},BoostClient={ak,
'Boosts/BoostServiceClient'},Slimes={al,'Slimes'},Rarities={al,'RarityTiers'},
Enemies={al,'Enemies'},Zones={al,'Zones'},Food={al,'Food'},Abbreviate={am,
'UI/Abbreviate'},DataService={ao,'DataService'}},Assets={Images={an,'ImageIds'}}
},{}setthreadidentity(2)for ar,as in ap do aq[ar]={}for at,au in as do local av,
aw=au[1],au[2]local ax=ah.Await(av,aw,2)if(not ax)then ai('Warn',string.format(
'failed to load dependency "%s" at "%s": doesn\'t exist',tostring(aw),tostring(
av:GetFullName())))continue end if ax:IsA'ModuleScript'then ax=ac(ax)end aq[ar][
at]=ax end end setthreadidentity(8)return aq end end)()end,function()local aa,ab
=a(6)return(function(...)return function(ac)return ac.new(ac):Extend(ac.
Extensions.Children(ab))end end)()end,function()a(7)return(function(...)return
function(aa)local ab,ac,ad,ae,af,ag=aa:Get'Modules/Dependencies',aa:Get
'Modules/Interface',aa:Get'Shared/Modules/t',aa:Get'Shared/Constants',aa:Get
'Shared/Functions/Time',aa:Get'Shared/Modules/Color'local ah,ai,aj,ak,al,am,an=
ag.Paint,ab.Modules.InventoryUtils,ab.Modules.Rarities,ab.Modules.Slimes,ab.
Modules.Mutations,ab.Modules.Abbreviate,ac.Components.Main local ao=an.Options
local ap,aq,ar,as,at,au=ao.RollFeedMaximumSize,ao.RollFeedExcludedRarities,ae.
Characters.BulletPoint,{},an:AddDraggableLabel(),{}au.GetProcessedRolls=function
(av)local aw,ax,ay={},aq.Value,0 for az,aA in av do local aB=aA[#aA]if(not aB.id
)then continue end local aC=ai.getVisualOdds(aB)local aD=aj.getTier(aC)if ay>aC
or ax[aD.name]then continue end table.insert(aw,{RollTime=af.now(),Slime=ak.
getSlime(aB.id),Mutations=aB.mutations,Chance=aC})end return aw end au.AddRolls=
function(av)if#av==0 then return end assert(ad.number(av[1].RollTime))local aw=
tonumber(ap.Value or ap.Default)for ax,ay in av do table.insert(as,ay)end while#
as>aw do table.remove(as,1)end end au.Push=function(av)local aw=au.
GetProcessedRolls(av)if#aw==0 then return end au.AddRolls(aw)au.Render()end au.
Render=function()local av={'<b>Roll Feed</b>'}for aw=#as,1,-1 do local ax=as[aw]
local ay=aj.getTier(ax.Chance)table.insert(av,string.format(
'[%s] %s | %s | 1/%s',tostring(af.FormatTime(ax.RollTime,'HH:mm:ss')),tostring(
ah(ay.name,ay.gradient)),tostring(al.getDisplayName(ax.Slime.name,ax.Mutations))
,tostring(am(1/ax.Chance))))end at:SetText(table.concat(av,'\n'))end au.Clear=
function()table.clear(as)au.Render()end au.SetVisible=function(av)assert(ad.
boolean(av))at:SetVisible(av)end au.SetVisible(false)au.Render()return au end
end)()end,function()a(8)return(function(...)return function(aa)local ab=aa:Get
'Modules/Dependencies'local ac,ad,ae,af=ab.Modules.DataService.client:get(),ab.
Modules.InventoryUtils,ab.Modules.Slimes,{}af.GetSlimeStats=ad.
getSlimeStatsFromData af.GetSlimeDps=ad.getDpsFromData af.GetEquippedSlimes=
function()local ag={}for ah,ai in ac.equipped do ag[ai]=ad.getSlimeData(ai,ac.
inventory[ai])end return ag end af.GetIndividualSlimes=function()local ag={}for
ah,ai in ac.inventory do if not af.IsIndividual(ah)then continue end ag[ah]=ai
end return ag end af.IsIndividual=function(ag)return ag:sub(1,1)=='.'end af.
GetTeamDps=function()local ag=0 for ah,ai in af.GetEquippedSlimes()do ag=ag+af.
GetSlimeDps(ai)end return ag end af.GetBaseDps=function(ag)local ah=table.clone(
ag)ah.level=1 return af.GetSlimeStats(ah).damage end af.GetAccumulatedXpForLevel
=function(ag)return 100*(ag-1)*ag/2 end af.GetMaxEquipSlots=function()local ag=
ac.__gamepasses['1787010888']~=nil return ad.getOwnedSlotCount(ac.upgrades,ag
and 1 or 0)end return af end end)()end,function()a(9)return(function(...)return
function(aa)local ab,ac,ad,ae=aa:Get'Modules/Dependencies',aa:Get
'Functions/SlimeUtil',aa:Get'Shared/Modules/t',aa:Get'Shared/Functions/Hooks'
local af,ag,ah,ai,aj=ab.Modules.DataService.client:get(),ab.Modules.
InventoryUtils,ab.Modules.GoopRewardUtils,ab.Modules.Zones,ab.Modules.Enemies
local ak=debug.getupvalue(ai.getZone,1)local al,am,an=#ak,3.5,{}an.
GetBestGoopZone=function()local ao,ap,aq=-math.huge,(ac.GetTeamDps())for ar=1,af
.maxZone do local as=ak[ar]local at=as.enemies[1]if(not at)then continue end
local au,av=ah.getBaseEnemyGoopReward(at),aj.getEnemyInfo(at)local aw=au/((av.
health/ap)+am)if aw>ao then aq,ao=ar,aw end end return aq end ae.Add(
'ZoneModulePatch',ai.getMaxZone,function()return al end)return an end end)()end,
function()a(10)return(function(...)return function(aa)local ab,ac,ad=aa:Get
'Shared/Modules/TaskManager',aa:Get'Shared/Functions/Hooks',{}ad.Get=function(ae
)if ae.Trove then return ae.Trove end local af=aa:Get'Shared/RBXUtil/Trove'.new(
)af:Add(ab.Stop)af:Add(ac.Cleanup)ae.Trove=af return af end return ad end end)()
end,function()a(11)return(function(...)return function(aa)local ab,ac,ad,ae=(aa.
Services.Players)local af=function(af)if ac and ac.Parent==af then return end if
ac then ac:Destroy()end local ag=Instance.new'Attachment'ag.Name=
'FreezeAttachment'ag.Parent=af local ah=Instance.new'LinearVelocity'ah.Name=
'LinearFreeze'ah.MaxForce=math.huge ah.VectorVelocity=Vector3.zero ah.
Attachment0=ag ah.Enabled=false ah.Parent=af local ai=Instance.new
'AngularVelocity'ai.Name='AngularFreeze'ai.MaxTorque=math.huge ai.
AngularVelocity=Vector3.zero ai.RelativeTo=Enum.ActuatorRelativeTo.World ai.
Attachment0=ag ai.Enabled=false ai.Parent=af ac=ag ad=ah ae=ai end local ag,ah=
function()local ag=ab.LocalPlayer.Character local ah=ag and ag.PrimaryPart if
not ah then return end af(ah)ah.AssemblyLinearVelocity=Vector3.zero ah.
AssemblyAngularVelocity=Vector3.zero ad.Enabled=true ae.Enabled=true end,
function()if ad then ad.Enabled=false end if ae then ae.Enabled=false end end
return{Freeze=ag,Unfreeze=ah}end end)()end,function()a(12)return(function(...)
return function(aa)local ab,ac=aa:Get'Modules/Dependencies',aa:Get
'Shared/Constants'local ad,ae=ab.Modules.UpgradeTree,ab.Modules.DataService
local af,ag=ae.client:get(),{Upgrades={}}ag.CanPurchase=function(ah)local ai=ag.
Upgrades[ah]if ag.IsOwned(ah)then return false end if(not ag.IsRequirementMet(ah
))then return true end return ag.CanAfford(ah)end ag.IsRequirementMet=function(
ah)local ai=ag.Upgrades[ah]if(not ai.Requirement)then return true end if(ai.
Requirement=='origin')then return true end return ag.IsOwned(ai.Requirement)end
ag.CanAfford=function(ah)local ai=ag.Upgrades[ah]if(not ai.Cost)then return
false end return(af[ai.Cost.currency]or 0)>=ai.Cost.amount end ag.IsOwned=
function(ah)return af.upgrades[ah]~=nil end for ah,ai in ad do for aj,ak in ai
do if aj==ah then continue end local al={Cost=ak.cost,Index=ak.id,Name=ak.name,
Parent=ak.parentTree,Requirement=ak.dependency,Tree=ak.tree}if ak.icon then
local am,an=pcall(debug.getupvalue,ak.icon,2)if am then al.Icon=an end end ag.
Upgrades[aj]=al end end return ag end end)()end,function()a(13)return(function(
...)return function(aa)local ab,ac=aa:Get'Modules/Dependencies',aa:Get
'Shared/Functions/Time'local ad,ae,af,ag,ah,ai,aj=ab.Modules.DataService.client:
get(),ab.Modules.GoopGunClient,ab.Modules.GoopGunUtils,ab.Modules.UpgradeUtils,0
,false,{}aj.CanFire=function()local ak=af.getFireRate(ad)if ai then return false
end return ac.now()>ah+ak end aj.Fire=function(ak)ai=true local al=ae.networker:
fetch('tryFireSlimeGun',ak)ah=ac.now()ai=false return al end aj.IsUnlocked=
function()return ad.upgrades.slimeGun~=nil end return aj end end)()end,function(
)a(14)return(function(...)return function(aa)local ab,ac,ad='0vma','strelizia',
'shared.luau'print'\u{2139}\u{fe0f} | fetching shared lib from cdn'local ae,af=
os.clock(),request{Url=string.format('https://cdn.jsdelivr.net/gh/%s/%s@main/%s'
,tostring(ab),tostring(ac),tostring(ad)),Method='GET'}if(af.StatusMessage~='OK')
then print(string.format(
'\u{274c} | failed to fetch shared lib from cdn: %s | %s',tostring(af.StatusCode
),tostring(af.StatusMessage)))return nil end local ag=tonumber(af.Headers.Age or
0)>0 and'hit'or'miss'print(string.format(
'\u{2705} | successfully fetched shared lib in %sms (cache %s)',tostring(math.
floor((os.clock()-ae)*1000)),tostring(ag)))local ah,ai=pcall(function()return
loadstring(af.Body)()end)if(not ah)then print(string.format(
'\u{274c} | failed to exec shared lib: %s',tostring(ai)))return nil end return
ai end end)()end,function()local aa,ab,ac=a(15)return(function(...)local ad={}ad
.__index=ad ad.Extensions={Children=function(ae)local af={}for ag,ah in ae:
GetChildren()do af[ah.Name]=ah end return af end}local ae=cloneref or function(
ae)return ae end ad.Services=setmetatable({},{__index=function(af,ag)local ah,ai
=pcall(game.GetService,game,ag)if ah and ai then ai=ae(ai)rawset(af,ag,ai)return
ai end return nil end})ad.new=function(af)local ag=setmetatable({__vinca=true,
Loaded={},Loading={},Container={}},ad)ag.Root=af or ag return ag end ad.is=
function(af)return af and typeof(af)=='table'and rawget(af,'__vinca')end ad.Add=
function(af,ag,ah)assert(not af.Container[ag],'Index already exists')af.
Container[ag]=ah return af end ad.Load=function(af,ag)if af.Loaded[ag]~=nil then
return af.Loaded[ag]end local ah=af.Container[ag]assert(ah~=nil,string.format(
'Unknown dependency "%s"',tostring(ag)))assert(not af.Loading[ag],string.format(
'Circular dependency at "%s"',tostring(ag)))af.Loading[ag]=true if typeof(ah)==
'table'and ah.ClassName=='ModuleScript'then ah=ac(ah)elseif typeof(ah)==
'Instance'and ah.ClassName=='ModuleScript'then ah=ac(ah)end if typeof(ah)==
'function'then ah=ah(af.Root)end af.Loading[ag]=nil af.Loaded[ag]=ah return ah
end ad.Extend=function(af,ag)for ah,ai in ag do af:Add(ah,ai)end return af end
ad.Get=function(af,ag)local ah=af for ai in string.gmatch(ag,'[^/]+')do if ad.
is(ah)then ah=ah:Load(ai)else ah=ah[ai]end assert(ah~=nil,string.format(
'Invalid path "%s" at "%s"',tostring(ag),tostring(ai)))end return ah end return
ad end)()end},{{1,4,{'Init'},{{2,2,{'Library'},{{6,2,{'Functions'},{{13,2,{
'GoopGun'}},{12,2,{'UpgradeUtil'}},{10,2,{'Cleaner'}},{11,2,{'Freeze'}},{9,2,{
'ZoneUtil'}},{7,2,{'RollFeed'}},{8,2,{'SlimeUtil'}}}},{14,2,{'Shared'}},{3,2,{
'Modules'},{{4,2,{'Interface'}},{5,2,{'Dependencies'}}}}}},{15,2,{'Vinca'}}}}},
'0.4.2','strelizia.cc',string,task,setmetatable,error,next,table,unpack,
coroutine,script,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax
,ay,az,aA=aj.insert,aj.remove,aj.freeze or function(au)return au end,al.wrap,ae.
sub,ae.match,ae.gmatch if as and ay(as,1,4)=='Lune'then local aB,aC=ap(ao,
'@lune/task')if aB and aC then af=aC end end local aB=af and af.defer local aC,
aD,aE,aF,aG,aH,aI,aJ,aL=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]=
'ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},
{},{}local aN,aQ={GetFullName={{},function(aN)local aQ,aS=aN.Name,aN.Parent
while aS do aQ=aS.Name..'.'..aQ aS=aS.Parent end return aQ end},GetChildren={{},
function(aN)local aQ={}for aS in ai,aL[aN]do au(aQ,aS)end return aQ end},
GetDescendants={{},function(aN)local aQ={}for aS in ai,aL[aN]do au(aQ,aS)for aT,
b in ai,aS:GetDescendants()do au(aQ,b)end end return aQ end},FindFirstChild={{
'string','boolean?'},function(aN,aQ,aS)local aT=aL[aN]for b in ai,aT do if b.
Name==aQ then return b end end if aS then for b in ai,aT do return b:
FindFirstChild(aQ,true)end end end},FindFirstAncestor={{'string'},function(aN,aQ
)local aS=aN.Parent while aS do if aS.Name==aQ then return aS end aS=aS.Parent
end end},WaitForChild={{'string','number?'},function(aN,aQ)return aN:
FindFirstChild(aQ)end}},{}for aS,aT in ai,aN do local b,c,d=aT[1],aT[2],{}for e,
f in ai,b do local g,h=az(f,'^([^%?]+)(%??)')d[e]={g,h}end aQ[aS]=function(e,...
)if not aL[e]then ah("Expected ':' not '.' calling member function "..aS,2)end
local f={...}for g,h in ai,d do local i=f[g]local j,k,l=an(i),h[1],h[2]if i==nil
and not l then ah('Argument '..i..' missing or nil',3)end if k~='any'and j~=k
and not(j=='nil'and l)then ah('Argument '..g..' expects type "'..k..'", got "'..
j..'"',2)end end return c(e,...)end end local aS=function(aS,aT,b)local c,d,e,f,
g,h=ag({},{__mode='k'}),function(c)ah(c..' is not a valid (virtual) member of '
..aS..' "'..aT..'"',3)end,function(c)ah('Unable to assign (virtual) property '..
c..'. Property is read only',3)end,{},{}g.__metatable=false g.__index=function(i
,j)if j=='ClassName'then return aS elseif j=='Name'then return aT elseif j==
'Parent'then return b elseif aS=='StringValue'and j=='Value'then return h else
local k=aQ[j]if k then return k end end for k in ai,c do if k.Name==j then
return k end end d(j)end g.__newindex=function(i,j,k)if j=='ClassName'then e(j)
elseif j=='Name'then aT=k elseif j=='Parent'then if k==f then return end if b~=
nil then aL[b][f]=nil end b=k if k~=nil then aL[k][f]=true end elseif aS==
'StringValue'and j=='Value'then h=k else d(j)end end g.__tostring=function()
return aT end ag(f,g)aL[f]=c if b~=nil then aL[b][f]=true end return f end
local function CreateRefFromObject(aT,b)local c,d,e,f=aT[1],aT[2],aT[3],aT[4]
local g=aD[d]local h=e and av(e,1)or g local i=aS(g,h,b)aE[c]=i if e then for j,
k in ai,e do i[j]=k end end if f then for j,k in ai,f do CreateRefFromObject(k,i
)end end return i end local aT=aS('Folder','['..ad..']')for b,c in ai,ab do
CreateRefFromObject(c,aT)end for b,c in ai,aa do local d=aE[b]aF[d]=c aG[d]=b
local e=d.ClassName if e=='LocalScript'or e=='Script'then au(aI,d)end end local
b=function(b)local c,d=b.ClassName,aH[b]if d and c=='ModuleScript'then return
ak(d)end local e,f=aF[b],function(e)e=aq(e)local f,g,h=b:GetFullName(),az(e,
'[^:]+:(%d+): (.+)')if not g or not at then return f..':*: '..(h or e)end g=ar(g
)local i=aG[b]local j=at[i]local k=g-j+1 if k<0 then k='?'end return f..':'..k..
': '..h end if c=='LocalScript'or c=='Script'then local g,h=ap(e)if not g then
ah(f(h),0)end else local g={ap(e)}local h=av(g,1)if not h then local i=av(g,1)
ah(f(i),0)end aH[b]=g return ak(g)end end a=function(c)local d,e,f=aE[c],
function(d,...)local e={ap(d,...)}local f=av(e,1)if not f then ah(e[1],3)end
return ak(e)end,aw(ag({},{__index=aJ,__newindex=function(d,e,f)aJ[e]=f end,__len
=function()return#aJ end,__iter=function()return ai,aJ end}))local g,h,i=aw{
version=ac,envname=ad,shared=f,script=am,require=ao},d,function(g,...)local h,i,
j=an(g),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if h=='table'and aL[g]then if g.ClassName~=
'ModuleScript'then ah(i,2)elseif g==d then ah(j,2)end return b(g)elseif h==
'string'and ay(g,1,1)~='@'then if#g==0 then ah(
'Attempted to call require with empty string',2)end local k=d if ay(g,1,1)=='/'
then k=aT elseif ay(g,1,2)=='./'then g=ay(g,3)end local l for m in aA(g,
'([^/]*)/?')do local n=m if m=='..'then n='Parent'end if n~=''then local o=k:
FindFirstChild(n)if not o then local p=k.Parent if p then o=p:FindFirstChild(n)
end end if o then k=o elseif m~=l and m~='init'and m~='init.server'and m~=
'init.client'then ah('Virtual script path "'..g..'" not found',2)end end l=m end
if k.ClassName~='ModuleScript'then ah(i,2)elseif k==d then ah(j,2)end return b(k
)end return e(ao,g,...)end return g,h,i end for c,d in ai,aI do aC(b,d)end
