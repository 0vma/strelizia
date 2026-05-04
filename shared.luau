local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,an,ao,ap,aq,ar,as,at={
function()local b,c,d=a(1)return(function(...)local e=d(c.Vinca)return e.new():
Extend{Modules=c.Modules,RBXUtil=c.RBXUtil,Functions=c.Functions}end)()end,
function()local b,c=a(2)return(function(...)return function(d)return d.new(d):
Extend(d.Extensions.Children(c))end end)()end,function()local b,c,d=a(3)return(
function(...)return function(e)local f=e.Services local g,h,i,j,k,l,m,n=f.
RunService,f.HttpService,d(c.Lock)(e),d(c.Task)(e),e:Get'Functions/CreateGUID',e
:Get'Functions/Time',3.333333333333333E-2,{Running=false,HeartbeatRunning=false,
Connection=nil,LastHeartbeatRun=0,Tasks={}}n.Task=j n.Lock=i n.Begin=function()
if n.Running then return end n.Running=true n.Connection=g.Heartbeat:Connect(
function(o)if(not n.Running)or(n.HeartbeatRunning)then return end local p=l.now(
)if(p-n.LastHeartbeatRun)<m then return end n.LastHeartbeatRun=p n.
HeartbeatRunning=true debug.profilebegin'TaskManager'for q,r in n.Tasks do if(
not r:CanRun())then continue end task.spawn(function()local s=r:Run()if(not s)or
(not r.Interval)then n.RemoveTask(q)end end)end debug.profileend()n.
HeartbeatRunning=false end)end n.Stop=function()if not n.Running then return end
n.Running=false n.Connection:Disconnect()n.Connection=nil for o in n.Tasks do n.
RemoveTask(o)end end n.AddTask=function(o)assert(o and j.is(o),
'Task must be a Task object!')local p=k()n.Tasks[p]=o:SetIdentifier(p)return p
end n.RemoveTask=function(o)local p=n.Tasks[o]if(not p)then return end n.Tasks[o
]=nil p:Destroy()end n.GetTasksFromIndex=function(o)local p={}for q,r in n.Tasks
do if r.Index~=o then continue end p[q]=r end return p end n.RemoveTasksByIndex=
function(o)for p in n.GetTasksFromIndex(o)do n.RemoveTask(p)end end return n end
end)()end,function()a(4)return(function(...)return function(b)local c={}c.
__index=c local d,e,f,g,h,i,j=b:Get'Functions/Time',b:Get
'Functions/OutputMessage',debug.setmemorycategory,debug.resetmemorycategory,
debug.profilebegin,debug.profileend,coroutine.running c.new=function(k,l,m,n)
assert(k~=nil and typeof(k)=='string','Index must be a string!')assert(l and
typeof(l)=='function','Callback must be a function!')assert(m==nil or typeof(m)
=='number','Interval must be a number!')return setmetatable({Index=k,Identifier=
nil,Callback=l,Thread=nil,Running=false,Destroyed=false,Interval=m,CurrentStep=
nil,Priority=1,Locks=n and{Groups={},Individual={}}or nil,ExecutionBegan=0,
LastFinishedExecution=0},c)end c.is=function(k)return typeof(k)=='table'and
getmetatable(k)==c end c.SetPriority=function(k,l)assert(typeof(l)=='number',
'Priority must be a number!')k.Priority=l return k end c.GetPriority=function(k)
return k.Priority end c.CanRun=function(k)if k.Running then return false end if
k.Destroyed then return false end if k.Interval~=nil and(k.Interval>(d.now()-k.
LastFinishedExecution))then return false end return true end c.SetStep=function(
k,l)local m=k.CurrentStep k.CurrentStep=l if m then i()end if l~=nil then h(l)
end return k end c.SetIdentifier=function(k,l)assert(l and typeof(l)=='string',
'Identifier must be a string!')k.Identifier=l return k end c.Run=function(k)f(k.
Index)h(k.Index)k.Running=true k.ExecutionBegan=d.now()k.Thread=j()local l,m=
pcall(k.Callback,k)if l then k.LastFinishedExecution=d.now()k.Running=false else
e('Error',string.format(
[[An error has occured during runtime of Thread '%s' on Step '%s': %s]],
tostring(k.Index),tostring(tostring(k.CurrentStep)),tostring(m)))end if k.
CurrentStep then k:SetStep(nil)end g()i()k.Thread=nil return l,m end c.Destroy=
function(k)k.Destroyed=true local l=k.Locks if l then for m in l.Groups do m:
Release()end for m in l.Individual do m:Release()end table.clear(l.Groups)table.
clear(l.Individual)end return k end return{new=c.new,is=c.is}end end)()end,
function()a(5)return(function(...)return function(b)local c,d=b:Get
'RBXUtil/Signal',b:Get'RBXUtil/TableUtil'local e,f,g,h=d.Dictionary,d.Filter,
function(e,f)local g,h=e:GetPriority(),f:GetPriority()if g~=h then return g>h
end return e.Identifier>f.Identifier end,{Cache={}}h.__index=h h.new=function(i)
assert(i and typeof(i)=='string','Index must be a string!')if h.Cache[i]then
return h.Cache[i]end local j=setmetatable({Index=i,User=nil,UserChanged=c.new(),
TakeoverRecipient=nil,TakeoverInitiated=c.new(),Aborted=false,Destroyed=false},h
)h.Cache[i]=j return j end h.is=function(i)return typeof(i)=='table'and
getmetatable(i)==h end h.CanTake=function(i,j)assert(j and typeof(j)=='table',
'Must provide a Task object for evaluation!')assert(j.Locks,
'Task must be Lock-utilizing!')local k=i.User if(not k)then return true end if(k
==j)then return true end local l=i.TakeoverRecipient if l then return g(j,l)end
return g(j,k)end h.TakeAsync=function(i,j)assert(j and typeof(j)=='table',
'Must provide a Task object for evaluation!')assert(j.Locks,
'Task must be Lock-utilizing!')if(not i.User)then i.User=j i.Aborted=false j.
Locks.Individual[i]=true i.UserChanged:Fire(j,nil)return true end if(i.User==j)
then return true end i.Aborted=true i.TakeoverRecipient=j i.TakeoverInitiated:
Fire(j,i.User)return i.UserChanged:Wait()==j end h.Release=function(i)if(not i.
User)then return i end local j,k=i.User,i.TakeoverRecipient i.User=k i.
TakeoverRecipient=nil i.Aborted=false j.Locks.Individual[i]=nil if k then k.
Locks.Individual[i]=true end i.UserChanged:Fire(k,j)return i end local i={}i.
__index=i i.new=function(j)assert(j and typeof(j)=='table',
'Must provide Locks for a Group')local k=setmetatable({User=nil,UserChanged=c.
new(),Locks=e(f(j,h.is)),TakeoverRecipient=nil,TakeoverInitiated=c.new(),Aborted
=false,Connections={},Destroyed=false},i)for l in k.Locks do table.insert(k.
Connections,l.TakeoverInitiated:Connect(function(m,n)if(not k.User)or(k.User~=n)
then return end k.Aborted=true end))end return k end i.CanTake=function(j,k)for
l in j.Locks do if l:CanTake(k)then continue end return false end return true
end i.TakeAsync=function(j,k)local l=j.User if(l==k)then return true end if l
then j.TakeoverRecipient=k j.TakeoverInitiated:Fire(k,l)return j.UserChanged:
Wait()==k end local m={}for n in j.Locks do if n:TakeAsync(k)then m[n]=true
continue end for o in m do o:Release()end return false end j.User=k j.Aborted=
false k.Locks.Groups[j]=true j.UserChanged:Fire(k,l)return true end i.Release=
function(j)if(not j.User)then return j end local k,l=j.User,j.TakeoverRecipient
for m in j.Locks do if(m.User~=k)then continue end if l then m.User=l m.Aborted=
false k.Locks.Individual[m]=nil l.Locks.Individual[m]=true else m:Release()end
end j.User=l j.TakeoverRecipient=nil j.Aborted=false k.Locks.Groups[j]=nil if l
then l.Locks.Groups[j]=true end j.UserChanged:Fire(l,k)return j end i.Destroy=
function(j)if(not j.Destroyed)then j.Destroyed=true for k,l in j.Connections do
l:Disconnect()end table.clear(j.Connections)end return j end return table.freeze
{new=h.new,Group=i}end end)()end,function()a(6)return(function(...)return
function(b)local c=b:Get'Modules/t'local d,e,f,g=c.tuple(c.ColorSequence,c.
numberConstrained(0,1)),c.tuple(c.string,c.union(c.Color3,c.ColorSequence)),c.
intersection(c.array(c.Color3),function(d)return#d>=2,
'Merge requires at least 2 colors'end),math.floor local h,i=function(h,i)return
string.format('<font color="rgb(%s,%s,%s)">%s</font>',tostring(g(i.R*255)),
tostring(g(i.G*255)),tostring(g(i.B*255)),tostring(h))end,{}i.
EvaluateColorSequence=function(j,k)assert(d(j,k))local l=j.Keypoints local m=l[1
]for n=2,#l do local o=l[n]if k<=o.Time then local p=(k-m.Time)/(o.Time-m.Time)
return m.Value:Lerp(o.Value,p)end m=o end return l[#l].Value end i.Paint=
function(j,k)assert(e(j,k))if typeof(k)=='Color3'then return h(j,k)elseif
typeof(k)=='ColorSequence'then local l,m={},#j for n=1,m do local o=(m==1)and 0
or((n-1)/(m-1))l[n]=i.Paint(j:sub(n,n),i.EvaluateColorSequence(k,o))end return
table.concat(l)end end i.Merge=function(...)local j={...}assert(f(j))local k,l={
},#j for m,n in j do table.insert(k,ColorSequenceKeypoint.new((m-1)/(l-1),n))end
return ColorSequence.new(k)end return i end end)()end,function()a(7)return(
function(...)return function(b)local c={}c.type=function(d)return function(e)
local f=type(e)if f==d then return true else return false,string.format(
'%s expected, got %s',d,f)end end end c.typeof=function(d)return function(e)
local f=typeof(e)if f==d then return true else return false,string.format(
'%s expected, got %s',d,f)end end end c.any=function(d)if d~=nil then return
true else return false,'any expected, got nil'end end c.boolean=c.typeof
'boolean'c.buffer=c.typeof'buffer'c.thread=c.typeof'thread'c.callback=c.typeof
'function'c['function']=c.callback c.none=c.typeof'nil'c['nil']=c.none c.string=
c.typeof'string'c.table=c.typeof'table'c.userdata=c.type'userdata'c.vector=c.
type'vector'c.number=function(d)local e=typeof(d)if e=='number'then if d==d then
return true else return false,'unexpected NaN value'end else return false,string
.format('number expected, got %s',e)end end c.nan=function(d)local e=typeof(d)if
e=='number'then if d~=d then return true else return false,
'unexpected non-NaN value'end else return false,string.format(
'number expected, got %s',e)end end c.Axes=c.typeof'Axes'c.BrickColor=c.typeof
'BrickColor'c.CatalogSearchParams=c.typeof'CatalogSearchParams'c.CFrame=c.typeof
'CFrame'c.Content=c.typeof'Content'c.Color3=c.typeof'Color3'c.ColorSequence=c.
typeof'ColorSequence'c.ColorSequenceKeypoint=c.typeof'ColorSequenceKeypoint'c.
DateTime=c.typeof'DateTime'c.DockWidgetPluginGuiInfo=c.typeof
'DockWidgetPluginGuiInfo'c.Enum=c.typeof'Enum'c.EnumItem=c.typeof'EnumItem'c.
Enums=c.typeof'Enums'c.Faces=c.typeof'Faces'c.FloatCurveKey=c.typeof
'FloatCurveKey'c.Font=c.typeof'Font'c.Instance=c.typeof'Instance'c.NumberRange=c
.typeof'NumberRange'c.NumberSequence=c.typeof'NumberSequence'c.
NumberSequenceKeypoint=c.typeof'NumberSequenceKeypoint'c.OverlapParams=c.typeof
'OverlapParams'c.PathWaypoint=c.typeof'PathWaypoint'c.PhysicalProperties=c.
typeof'PhysicalProperties'c.Random=c.typeof'Random'c.Ray=c.typeof'Ray'c.
RaycastParams=c.typeof'RaycastParams'c.RaycastResult=c.typeof'RaycastResult'c.
RBXScriptConnection=c.typeof'RBXScriptConnection'c.RBXScriptSignal=c.typeof
'RBXScriptSignal'c.Rect=c.typeof'Rect'c.Region3=c.typeof'Region3'c.Region3int16=
c.typeof'Region3int16'c.TweenInfo=c.typeof'TweenInfo'c.UDim=c.typeof'UDim'c.
UDim2=c.typeof'UDim2'c.Vector2=c.typeof'Vector2'c.Vector2int16=c.typeof
'Vector2int16'c.Vector3=c.typeof'Vector3'c.Vector3int16=c.typeof'Vector3int16'c.
literalList=function(d)local e={}for f,g in ipairs(d)do e[g]=true end return
function(f)if e[f]then return true end return false,'bad type for literal list'
end end c.literal=function(...)local d=select('#',...)if d==1 then local e=...
return function(f)if f~=e then return false,string.format('expected %s, got %s',
tostring(e),tostring(f))end return true end else local e={}for f=1,d do local g=
select(f,...)e[f]=c.literal(g)end return c.unionList(e)end end c.exactly=c.
literal c.keyOf=function(d)local e,f={},0 for g in pairs(d)do f=f+1 e[f]=g end
return c.literal(table.unpack(e,1,f))end c.valueOf=function(d)local e,f={},0 for
g,h in pairs(d)do f=f+1 e[f]=h end return c.literal(table.unpack(e,1,f))end c.
integer=function(d)local e,f=c.number(d)if not e then return false,f or''end if
d%1==0 then return true else return false,string.format(
'integer expected, got %s',d)end end c.numberMin=function(d)return function(e)
local f,g=c.number(e)if not f then return false,g or''end if e>=d then return
true else return false,string.format('number >= %s expected, got %s',d,e)end end
end c.numberMax=function(d)return function(e)local f,g=c.number(e)if not f then
return false,g end if e<=d then return true else return false,string.format(
'number <= %s expected, got %s',d,e)end end end c.numberMinExclusive=function(d)
return function(e)local f,g=c.number(e)if not f then return false,g or''end if d
<e then return true else return false,string.format(
'number > %s expected, got %s',d,e)end end end c.numberMaxExclusive=function(d)
return function(e)local f,g=c.number(e)if not f then return false,g or''end if e
<d then return true else return false,string.format(
'number < %s expected, got %s',d,e)end end end c.numberPositive=c.
numberMinExclusive(0)c.numberNegative=c.numberMaxExclusive(0)c.numberConstrained
=function(d,e)assert(c.number(d))assert(c.number(e))local f,g=c.numberMin(d),c.
numberMax(e)return function(h)local i,j=f(h)if not i then return false,j or''end
local k,l=g(h)if not k then return false,l or''end return true end end c.
numberConstrainedExclusive=function(d,e)assert(c.number(d))assert(c.number(e))
local f,g=c.numberMinExclusive(d),c.numberMaxExclusive(e)return function(h)local
i,j=f(h)if not i then return false,j or''end local k,l=g(h)if not k then return
false,l or''end return true end end c.match=function(d)assert(c.string(d))return
function(e)local f,g=c.string(e)if not f then return false,g end if string.
match(e,d)==nil then return false,string.format('%q failed to match pattern %q',
e,d)end return true end end c.optional=function(d)assert(c.callback(d))return
function(e)if e==nil then return true end local f,g=d(e)if f then return true
else return false,string.format('(optional) %s',g or'')end end end c.tuple=
function(...)local d={...}return function(...)local e={...}for f,g in ipairs(d)
do local h,i=g(e[f])if h==false then return false,string.format(
'Bad tuple index #%s:\n\t%s',f,i or'')end end return true end end c.keys=
function(d)assert(c.callback(d))return function(e)local f,g=c.table(e)if f==
false then return false,g or''end for h in pairs(e)do local i,j=d(h)if i==false
then return false,string.format('bad key %s:\n\t%s',tostring(h),j or'')end end
return true end end c.values=function(d)assert(c.callback(d))return function(e)
local f,g=c.table(e)if f==false then return false,g or''end for h,i in pairs(e)
do local j,k=d(i)if j==false then return false,string.format(
'bad value for key %s:\n\t%s',tostring(h),k or'')end end return true end end c.
map=function(d,e)assert(c.callback(d))assert(c.callback(e))local f,g=c.keys(d),c
.values(e)return function(h)local i,j=f(h)if not i then return false,j or''end
local k,l=g(h)if not k then return false,l or''end return true end end c.set=
function(d)return c.map(d,c.literal(true))end do local d=c.keys(c.integer)c.
array=function(e)assert(c.callback(e))local f=c.values(e)return function(g)local
h,i=d(g)if h==false then return false,string.format('[array] %s',i or'')end
local j=0 for k in ipairs(g)do j=j+1 end for k in pairs(g)do if k<1 or k>j then
return false,string.format('[array] key %s must be sequential',tostring(k))end
end local k,l=f(g)if not k then return false,string.format('[array] %s',l or'')
end return true end end c.strictArray=function(...)local e={...}assert(c.array(c
.callback)(e))return function(f)local g,h=d(f)if g==false then return false,
string.format('[strictArray] %s',h or'')end if#e<#f then return false,string.
format('[strictArray] Array size exceeds limit of %d',#e)end for i,j in pairs(e)
do local k,l=j(f[i])if not k then return false,string.format(
'[strictArray] Array index #%d - %s',i,l)end end return true end end end do
local d=c.array(c.callback)c.unionList=function(e)assert(d(e))return function(f)
for g,h in ipairs(e)do if h(f)then return true end end return false,
'bad type for union'end end c.union=function(...)return c.unionList{...}end c.
some=c.union c.intersectionList=function(e)assert(d(e))return function(f)for g,h
in ipairs(e)do local i,j=h(f)if not i then return false,j or''end end return
true end end c.intersection=function(...)return c.intersectionList{...}end c.
every=c.intersection end do local d=c.map(c.any,c.callback)c.interface=function(
e)assert(d(e))return function(f)local g,h=c.table(f)if g==false then return
false,h or''end for i,j in pairs(e)do local k,l=j(f[i])if k==false then return
false,string.format('[interface] bad value for %s:\n\t%s',tostring(i),l or'')end
end return true end end c.strictInterface=function(e)assert(d(e))return function
(f)local g,h=c.table(f)if g==false then return false,h or''end for i,j in pairs(
e)do local k,l=j(f[i])if k==false then return false,string.format(
'[interface] bad value for %s:\n\t%s',tostring(i),l or'')end end for i in pairs(
f)do if not e[i]then return false,string.format(
'[interface] unexpected field %q',tostring(i))end end return true end end end c.
instanceOf=function(d,e)assert(c.string(d))local f if e~=nil then f=c.children(e
)end return function(g)local h,i=c.Instance(g)if not h then return false,i or''
end if g.ClassName~=d then return false,string.format('%s expected, got %s',d,g.
ClassName)end if f then local j,k=f(g)if not j then return false,k end end
return true end end c.instance=c.instanceOf c.instanceIsA=function(d,e)assert(c.
string(d))local f if e~=nil then f=c.children(e)end return function(g)local h,i=
c.Instance(g)if not h then return false,i or''end if not g:IsA(d)then return
false,string.format('%s expected, got %s',d,g.ClassName)end if f then local j,k=
f(g)if not j then return false,k end end return true end end c.enum=function(d)
assert(c.Enum(d))return function(e)local f,g=c.EnumItem(e)if not f then return
false,g end if e.EnumType==d then return true else return false,string.format(
'enum of %s expected, got enum of %s',tostring(d),tostring(e.EnumType))end end
end do local d=c.tuple(c.callback,c.callback)c.wrap=function(e,f)assert(d(e,f))
return function(...)assert(f(...))return e(...)end end end c.strict=function(d)
return function(...)assert(d(...))end end do local d=c.map(c.string,c.callback)c
.children=function(e)assert(d(e))return function(f)local g,h=c.Instance(f)if not
g then return false,h or''end local i={}for j,k in ipairs(f:GetChildren())do
local l=k.Name if e[l]then if i[l]then return false,string.format(
'Cannot process multiple children with the same name %q',l)end i[l]=k end end
for j,k in pairs(e)do local l,m=k(i[j])if not l then return false,string.format(
'[%s.%s] %s',f:GetFullName(),j,m or'')end end return true end end end return c
end end)()end,function()local b,c,d=a(8)return(function(...)return function(e)
local f={Loaded={}}f.GetInterface=function(g)assert(typeof(g)=='string',
'Must provide Inteface Name')if f.Loaded[g]then return f.Loaded[g]end local h=c.
List:FindFirstChild(g)assert(h,string.format(
"Failed to find Interface Components for: '%s'",tostring(g)))local i={}for j,k
in h:GetChildren()do assert(k:IsA'ModuleScript',string.format(
[[Failed to load Interface Component '%s' of '%s': Instance is not a ModuleScript.]]
,tostring(k.Name),tostring(g)))i[k.Name]=d(k)(e)end f.Loaded[g]=i return i end
return f end end)()end,[11]=function()a(11)return(function(...)return function(b
)local c=(cloneref or clonereference or function(c)return c end)local d,e,f,g,h,
i,j,k,l,m,n,o=c(game:GetService'CoreGui'),c(game:GetService'Players'),c(game:
GetService'RunService'),c(game:GetService'SoundService'),c(game:GetService
'UserInputService'),c(game:GetService'TextService'),c(game:GetService'Teams'),c(
game:GetService'TweenService'),c(game:GetService'TextService'),getgenv or
function()return shared end,setclipboard or nil,protectgui or(syn and syn.
protect_gui)or function()end local p,q=gethui or function()return d end,e.
LocalPlayer or e.PlayerAdded:Wait()local r,s,t,u,v=c(q:GetMouse()),{},{},{},{}
local w,x={LocalPlayer=q,DevicePlatform=nil,IsMobile=false,IsRobloxFocused=true,
ScreenGui=nil,SearchText='',Searching=false,LastSearchTab=nil,ActiveTab=nil,Tabs
={},DependencyBoxes={},KeybindFrame=nil,KeybindContainer=nil,KeybindToggles={},
Notifications={},ToggleKeybind=Enum.KeyCode.RightControl,TweenInfo=TweenInfo.
new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),NotifyTweenInfo=
TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),Toggled=false
,Unloaded=false,Labels=s,Buttons=t,Toggles=u,Options=v,NotifySide='Right',
ShowCustomCursor=true,ForceCheckbox=false,ShowToggleFrameInKeybinds=true,
NotifyOnError=false,CantDragForced=false,Signals={},UnloadSignals={},MinSize=
Vector2.new(480,360),DPIScale=1,CornerRadius=4,IsLightTheme=false,Scheme={
BackgroundColor=Color3.fromRGB(15,15,15),MainColor=Color3.fromRGB(25,25,25),
AccentColor=Color3.fromRGB(125,85,255),OutlineColor=Color3.fromRGB(40,40,40),
FontColor=Color3.new(1,1,1),Font=Font.fromEnum(Enum.Font.Code),Red=Color3.
fromRGB(255,50,50),Dark=Color3.new(0,0,0),White=Color3.new(1,1,1)},Registry={},
DPIRegistry={}},{Assets={TransparencyTexture={RobloxId=139785960036434,Path=
'Obsidian/assets/TransparencyTexture.png',Id=nil},SaturationMap={RobloxId=
4155801252,Path='Obsidian/assets/SaturationMap.png',Id=nil}}}do local y,z=
[[https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/]],
function(y,z)if not isfolder or not makefolder then return end local A,B=y:split
'/',''if z then table.remove(A,#A)end for C,D in ipairs(A)do if not isfolder(B..
D)then makefolder(B..D)end B=B..D..'/'end return B end x.GetAsset=function(A)if
not x.Assets[A]then return nil end local B=x.Assets[A]if B.Id then return B.Id
end local C=string.format('rbxassetid://%s',B.RobloxId)if getcustomasset then
local D,E=pcall(getcustomasset,B.Path)if D and E then C=E end end B.Id=C return
C end x.DownloadAsset=function(A)if not getcustomasset or not writefile or not
isfile then return end z(A,true)if isfile(A)then return end local B=A:gsub(
'Obsidian/','')writefile(A,game:HttpGet(y..B))end for A,B in x.Assets do x.
DownloadAsset(B.Path)end end if f:IsStudio()then if h.TouchEnabled and not h.
MouseEnabled then w.IsMobile=true w.MinSize=Vector2.new(480,240)else w.IsMobile=
false w.MinSize=Vector2.new(480,360)end else pcall(function()w.DevicePlatform=h:
GetPlatform()end)w.IsMobile=(w.DevicePlatform==Enum.Platform.Android or w.
DevicePlatform==Enum.Platform.IOS)w.MinSize=w.IsMobile and Vector2.new(480,240)
or Vector2.new(480,360)end local y,z,A,B,C,D,E={Frame={BorderSizePixel=0},
ImageLabel={BackgroundTransparency=1,BorderSizePixel=0},ImageButton={
AutoButtonColor=false,BorderSizePixel=0},ScrollingFrame={BorderSizePixel=0},
TextLabel={BorderSizePixel=0,FontFace='Font',RichText=true,TextColor3=
'FontColor'},TextButton={AutoButtonColor=false,BorderSizePixel=0,FontFace='Font'
,RichText=true,TextColor3='FontColor'},TextBox={BorderSizePixel=0,FontFace=
'Font',PlaceholderColor3=function()local y,z,A=w.Scheme.FontColor:ToHSV()return
Color3.fromHSV(y,z,A/2)end,Text='',TextColor3='FontColor'},UIListLayout={
SortOrder=Enum.SortOrder.LayoutOrder},UIStroke={ApplyStrokeMode=Enum.
ApplyStrokeMode.Border},Window={Title='No Title',Footer='No Footer',Position=
UDim2.fromOffset(6,6),Size=UDim2.fromOffset(720,600),IconSize=UDim2.fromOffset(
30,30),AutoShow=true,Center=true,Resizable=true,SearchbarSize=UDim2.fromScale(1,
1),CornerRadius=4,NotifySide='Right',ShowCustomCursor=true,Font=Enum.Font.Code,
ToggleKeybind=Enum.KeyCode.RightControl,MobileButtonsSide='Left',
UnlockMouseWhileOpen=true,Compact=false,EnableSidebarResize=false,
SidebarMinWidth=180,SidebarCompactWidth=54,SidebarCollapseThreshold=0.5,
SidebarHighlightCallback=nil},Toggle={Text='Toggle',Default=false,Callback=
function()end,Changed=function()end,Risky=false,Disabled=false,Visible=true},
Input={Text='Input',Default='',Finished=false,Numeric=false,ClearTextOnFocus=
true,Placeholder='',AllowEmpty=true,EmptyReset='---',Callback=function()end,
Changed=function()end,Disabled=false,Visible=true},Slider={Text='Slider',Default
=0,Min=0,Max=100,Rounding=0,Prefix='',Suffix='',Callback=function()end,Changed=
function()end,Disabled=false,Visible=true},Dropdown={Values={},DisabledValues={}
,Multi=false,RichText=false,MaxVisibleDropdownItems=8,Callback=function()end,
Changed=function()end,Disabled=false,Visible=true},Viewport={Object=nil,Camera=
nil,Clone=true,AutoFocus=true,Interactive=false,Height=200,Visible=true},Image={
Image='',Transparency=0,Color=Color3.new(1,1,1),RectOffset=Vector2.zero,RectSize
=Vector2.zero,ScaleType=Enum.ScaleType.Fit,Height=200,Visible=true},Video={Video
='',Looped=false,Playing=false,Volume=1,Height=200,Visible=true},UIPassthrough={
Instance=nil,Height=24,Visible=true},KeyPicker={Text='KeyPicker',Default='None',
DefaultModifiers={},Mode='Toggle',Modes={'Always','Toggle','Hold'},
SyncToggleState=false,Callback=function()end,ChangedCallback=function()end,
Changed=function()end,Clicked=function()end},ColorPicker={Default=Color3.new(1,1
,1),Callback=function()end,Changed=function()end}},{Bottom={0,1},Right={1,0}},{
Left={0.5,1},Right={0.5,1}},function(y,z)if typeof(y)=='UDim'then return UDim.
new(y.Scale,y.Offset*w.DPIScale)end if z then return UDim2.new(y.X.Scale,(y.X.
Offset*w.DPIScale)+(z[1]*w.DPIScale),y.Y.Scale,(y.Y.Offset*w.DPIScale)+(z[2]*w.
DPIScale))end return UDim2.new(y.X.Scale,y.X.Offset*w.DPIScale,y.Y.Scale,y.Y.
Offset*w.DPIScale)end,function(y)return y*w.DPIScale end,function(y,z,A)local B=
Instance.new'BindableEvent'local C=y:Once(function(...)if not A or typeof(A)==
'function'and A(...)then B:Fire(true)else B:Fire(false)end end)task.delay(z,
function()C:Disconnect()B:Fire(false)end)local D=B.Event:Wait()B:Destroy()return
D end,function(y,z)return y.UserInputType==Enum.UserInputType.MouseButton1 or(z
==true and y.UserInputType==Enum.UserInputType.MouseButton2)or y.UserInputType==
Enum.UserInputType.Touch end local F,G,I,J,K,L,M,N,O,P,Q=function(F,G)return E(F
,G)and F.UserInputState==Enum.UserInputState.Begin and w.IsRobloxFocused end,
function(F)return(F.UserInputType==Enum.UserInputType.MouseMovement or F.
UserInputType==Enum.UserInputType.Touch)and F.UserInputState==Enum.
UserInputState.Change end,function(F,G)return E(F,G)and(F.UserInputState==Enum.
UserInputState.Begin or F.UserInputState==Enum.UserInputState.Change)and w.
IsRobloxFocused end,function(F)local G=0 for H,I in pairs(F)do G=G+1 end return
G end,function(F)if not(F and F.PlaybackState==Enum.PlaybackState.Playing)then
return end F:Cancel()end,function(F)return F:match'^%s*(.-)%s*$'end,function(F,G
)assert(G>=0,'Invalid rounding number.')if G==0 then return math.floor(F)end
return tonumber(string.format('%.'..G..'f',F))end,function(F)local G=e:
GetPlayers()if F then local I=table.find(G,q)if I then table.remove(G,I)end end
table.sort(G,function(I,J)return I.Name:lower()<J.Name:lower()end)return G end,
function()local F=j:GetTeams()table.sort(F,function(G,I)return G.Name:lower()<I.
Name:lower()end)return F end,function(F)F=F:gsub('<br%s*/>','\n')return(F:gsub(
'<[^<>]->',''))end,function(F)local G,I,J=F:ToHSV()return Color3.fromHSV(G,math.
max(0,I-0.1),math.min(1,J+0.1))end w.UpdateKeybindFrame=function(R)if not w.
KeybindFrame then return end local S=0 for T,U in pairs(w.KeybindToggles)do if
not U.Holder.Visible then continue end local V=U.Label.Size.X.Offset+U.Label.
Position.X.Offset if V>S then S=V end end w.KeybindFrame.Size=UDim2.fromOffset(S
+18*w.DPIScale,0)end w.UpdateDependencyBoxes=function(R)for S,T in pairs(w.
DependencyBoxes)do T:Update(true)end if w.Searching then w:UpdateSearch(w.
SearchText)end end local function CheckDepbox(R,S)local T=0 for U,V in pairs(R.
Elements)do if V.Type=='Divider'then V.Holder.Visible=false continue elseif V.
SubButton then local W=false if V.Text:lower():match(S)and V.Visible then W=true
else V.Base.Visible=false end if V.SubButton.Text:lower():match(S)and V.
SubButton.Visible then W=true else V.SubButton.Base.Visible=false end V.Holder.
Visible=W if W then T=T+1 end continue end if V.Text and V.Text:lower():match(S)
and V.Visible then V.Holder.Visible=true T=T+1 else V.Holder.Visible=false end
end for U,V in pairs(R.DependencyBoxes)do if not V.Visible then continue end T=T
+CheckDepbox(V,S)end return T end local function RestoreDepbox(R)for S,T in
pairs(R.Elements)do T.Holder.Visible=typeof(T.Visible)=='boolean'and T.Visible
or true if T.SubButton then T.Base.Visible=T.Visible T.SubButton.Base.Visible=T.
SubButton.Visible end end R:Resize()R.Holder.Visible=true for S,T in pairs(R.
DependencyBoxes)do if not T.Visible then continue end RestoreDepbox(T)end end w.
UpdateSearch=function(R,S)w.SearchText=S if w.LastSearchTab then for T,U in
pairs(w.LastSearchTab.Groupboxes)do for V,W in pairs(U.Elements)do W.Holder.
Visible=typeof(W.Visible)=='boolean'and W.Visible or true if W.SubButton then W.
Base.Visible=W.Visible W.SubButton.Base.Visible=W.SubButton.Visible end end for
V,W in pairs(U.DependencyBoxes)do if not W.Visible then continue end
RestoreDepbox(W)end U:Resize()U.Holder.Visible=true end for T,U in pairs(w.
LastSearchTab.Tabboxes)do for V,W in pairs(U.Tabs)do for X,Y in pairs(W.Elements
)do Y.Holder.Visible=typeof(Y.Visible)=='boolean'and Y.Visible or true if Y.
SubButton then Y.Base.Visible=Y.Visible Y.SubButton.Base.Visible=Y.SubButton.
Visible end end for X,Y in pairs(W.DependencyBoxes)do if not Y.Visible then
continue end RestoreDepbox(Y)end W.ButtonHolder.Visible=true end U.ActiveTab:
Resize()U.Holder.Visible=true end for T,U in pairs(w.LastSearchTab.
DependencyGroupboxes)do if not U.Visible then continue end for V,W in pairs(U.
Elements)do W.Holder.Visible=typeof(W.Visible)=='boolean'and W.Visible or true
if W.SubButton then W.Base.Visible=W.Visible W.SubButton.Base.Visible=W.
SubButton.Visible end end for V,W in pairs(U.DependencyBoxes)do if not W.Visible
then continue end RestoreDepbox(W)end U:Resize()U.Holder.Visible=true end end
local T=S:lower()if L(T)==''or w.ActiveTab.IsKeyTab then w.Searching=false w.
LastSearchTab=nil return end w.Searching=true for U,V in pairs(w.ActiveTab.
Groupboxes)do local W=0 for X,Y in pairs(V.Elements)do if Y.Type=='Divider'then
Y.Holder.Visible=false continue elseif Y.SubButton then local Z=false if Y.Text:
lower():match(T)and Y.Visible then Z=true else Y.Base.Visible=false end if Y.
SubButton.Text:lower():match(T)and Y.SubButton.Visible then Z=true else Y.
SubButton.Base.Visible=false end Y.Holder.Visible=Z if Z then W=W+1 end continue
end if Y.Text and Y.Text:lower():match(T)and Y.Visible then Y.Holder.Visible=
true W=W+1 else Y.Holder.Visible=false end end for X,Y in pairs(V.
DependencyBoxes)do if not Y.Visible then continue end W=W+CheckDepbox(Y,T)end if
W>0 then V:Resize()end V.Holder.Visible=W>0 end for U,V in pairs(w.ActiveTab.
Tabboxes)do local W,X=0,{}for Y,Z in pairs(V.Tabs)do X[Z]=0 for _,aa in pairs(Z.
Elements)do if aa.Type=='Divider'then aa.Holder.Visible=false continue elseif aa
.SubButton then local ab=false if aa.Text:lower():match(T)and aa.Visible then ab
=true else aa.Base.Visible=false end if aa.SubButton.Text:lower():match(T)and aa
.SubButton.Visible then ab=true else aa.SubButton.Base.Visible=false end aa.
Holder.Visible=ab if ab then X[Z]=X[Z]+1 end continue end if aa.Text and aa.Text
:lower():match(T)and aa.Visible then aa.Holder.Visible=true X[Z]=X[Z]+1 else aa.
Holder.Visible=false end end for aa,ab in pairs(Z.DependencyBoxes)do if not ab.
Visible then continue end X[Z]=X[Z]+CheckDepbox(ab,T)end end for aa,ab in pairs(
X)do aa.ButtonHolder.Visible=ab>0 if ab>0 then W=W+1 if V.ActiveTab==aa then aa:
Resize()elseif X[V.ActiveTab]==0 then aa:Show()end end end V.Holder.Visible=W>0
end for aa,ab in pairs(w.ActiveTab.DependencyGroupboxes)do if not ab.Visible
then continue end local U=0 for V,W in pairs(ab.Elements)do if W.Type=='Divider'
then W.Holder.Visible=false continue elseif W.SubButton then local X=false if W.
Text:lower():match(T)and W.Visible then X=true else W.Base.Visible=false end if
W.SubButton.Text:lower():match(T)and W.SubButton.Visible then X=true else W.
SubButton.Base.Visible=false end W.Holder.Visible=X if X then U=U+1 end continue
end if W.Text and W.Text:lower():match(T)and W.Visible then W.Holder.Visible=
true U=U+1 else W.Holder.Visible=false end end for V,W in pairs(ab.
DependencyBoxes)do if not W.Visible then continue end U=U+CheckDepbox(W,T)end if
U>0 then ab:Resize()end ab.Holder.Visible=U>0 end w.LastSearchTab=w.ActiveTab
end w.AddToRegistry=function(aa,ab,R)w.Registry[ab]=R end w.RemoveFromRegistry=
function(aa,ab)w.Registry[ab]=nil end w.UpdateColorsUsingRegistry=function(aa)
for ab,R in pairs(w.Registry)do for S,T in pairs(R)do if typeof(T)=='string'then
ab[S]=w.Scheme[T]elseif typeof(T)=='function'then ab[S]=T()end end end end w.
UpdateDPI=function(aa,ab,R)if not w.DPIRegistry[ab]then return end for S,T in
pairs(R)do w.DPIRegistry[ab][S]=T and T or nil end end w.SetDPIScale=function(aa
,ab)w.DPIScale=ab/100 w.MinSize=w.MinSize*w.DPIScale for R,S in pairs(w.
DPIRegistry)do for T,U in pairs(S)do if T=='DPIExclude'or T=='DPIOffset'then
continue elseif T=='TextSize'then R[T]=C(U)else R[T]=B(U,S.DPIOffset[T])end end
end for R,S in pairs(w.Tabs)do if S.IsKeyTab then continue end S:Resize(true)for
T,U in pairs(S.Groupboxes)do U:Resize()end for T,U in pairs(S.Tabboxes)do for V,
W in pairs(U.Tabs)do W:Resize()end end end for R,S in pairs(v)do if S.Type==
'Dropdown'then S:RecalculateListSize()elseif S.Type=='KeyPicker'then S:Update()
end end w:UpdateKeybindFrame()for R,S in pairs(w.Notifications)do S:Resize()end
end w.GiveSignal=function(aa,ab)table.insert(w.Signals,ab)return ab end
IsValidCustomIcon=function(aa)return typeof(aa)=='string'and(aa:match'rbxasset'
or aa:match'roblox%.com/asset/%?id='or aa:match'rbxthumb://type=')end local aa,
ab=pcall(function()return loadstring(game:HttpGet
[[https://raw.githubusercontent.com/deividcomsono/lucide-roblox-direct/refs/heads/main/source.lua]]
)()end)w.GetIcon=function(R,S)if not aa then return end local T,U=pcall(ab.
GetAsset,S)if not T then return end return U end w.GetCustomIcon=function(R,S)if
not IsValidCustomIcon(S)then return w:GetIcon(S)else return{Url=S,
ImageRectOffset=Vector2.zero,ImageRectSize=Vector2.zero,Custom=true}end end w.
Validate=function(R,S,T)if typeof(S)~='table'then return T end for U,V in pairs(
T)do if typeof(U)=='number'then continue end if typeof(V)=='table'then S[U]=w:
Validate(S[U],V)elseif S[U]==nil then S[U]=V end end return S end local R=
function(R,S)local T,U=w.Registry[S]or{},w.DPIRegistry[S]or{}local V,W=U.
DPIExclude or R.DPIExclude or{},U.DPIOffset or R.DPIOffset or{}for X,Y in pairs(
R)do if X=='DPIExclude'or X=='DPIOffset'then continue elseif T[X]then T[X]=nil
elseif X~='Text'and(w.Scheme[Y]or typeof(Y)=='function')then T[X]=Y S[X]=w.
Scheme[Y]or Y()continue end if not V[X]then if X=='Position'or X=='Size'or X:
match'Padding'then U[X]=Y Y=B(Y,W[X])elseif X=='TextSize'then U[X]=Y Y=C(Y)end
end S[X]=Y end if J(T)>0 then w.Registry[S]=T end if J(U)>0 then U.DPIExclude=V
U.DPIOffset=W w.DPIRegistry[S]=U end end local S,T=function(S,T)local U=Instance
.new(S)if y[S]then R(y[S],U)end R(T,U)if T.Parent and not T.ZIndex then pcall(
function()U.ZIndex=T.Parent.ZIndex end)end return U end,function(S,T)local U=
pcall(function()if not T then T=d end local U if typeof(T)=='function'then U=T()
else U=T end S.Parent=U end)if not(U and S.Parent)then S.Parent=w.LocalPlayer:
WaitForChild('PlayerGui',math.huge)end end local U,V=function(U,V)if V then T(U,
d)return end pcall(o,U)T(U,p)end,S('ScreenGui',{Name='Obsidian',DisplayOrder=999
,ResetOnSpawn=false})U(V)w.ScreenGui=V V.DescendantRemoving:Connect(function(W)w
:RemoveFromRegistry(W)w.DPIRegistry[W]=nil end)local W,X=(S('TextButton',{
BackgroundTransparency=1,Modal=false,Size=UDim2.fromScale(0,0),AnchorPoint=
Vector2.zero,Text='',ZIndex=-999,Parent=V}))do X=S('Frame',{AnchorPoint=Vector2.
new(0.5,0.5),BackgroundColor3='White',Size=UDim2.fromOffset(9,1),Visible=false,
ZIndex=999,Parent=V})S('Frame',{AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3='Dark',Position=UDim2.fromScale(0.5,0.5),Size=UDim2.new(1,2,1,2
),ZIndex=998,Parent=X})local Y=S('Frame',{AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3='White',Position=UDim2.fromScale(0.5,0.5),Size=UDim2.
fromOffset(1,9),Parent=X})S('Frame',{AnchorPoint=Vector2.new(0.5,0.5),
BackgroundColor3='Dark',Position=UDim2.fromScale(0.5,0.5),Size=UDim2.new(1,2,1,2
),ZIndex=998,Parent=Y})end local Y,Z do Y=S('Frame',{AnchorPoint=Vector2.new(1,0
),BackgroundTransparency=1,Position=UDim2.new(1,-6,0,6),Size=UDim2.new(0,300,1,-
6),Parent=V})Z=S('UIListLayout',{HorizontalAlignment=Enum.HorizontalAlignment.
Right,Padding=UDim.new(0,6),Parent=Y})end w.GetBetterColor=function(_,ac,ad)ad=
ad*(w.IsLightTheme and-4 or 2)return Color3.fromRGB(math.clamp(ac.R*255+ad,0,255
),math.clamp(ac.G*255+ad,0,255),math.clamp(ac.B*255+ad,0,255))end w.
GetDarkerColor=function(ac,ad)local _,ae,af=ad:ToHSV()return Color3.fromHSV(_,ae
,af/2)end w.GetKeyString=function(ac,ad)if ad.EnumType==Enum.KeyCode and ad.
Value>33 and ad.Value<127 then return string.char(ad.Value)end return ad.Name
end w.GetTextBounds=function(ac,ad,ae,af,_)local ag=Instance.new
'GetTextBoundsParams'ag.Text=ad ag.RichText=true ag.Font=ae ag.Size=af ag.Width=
_ or workspace.CurrentCamera.ViewportSize.X-32 local ah=l:GetTextBoundsAsync(ag)
return ah.X,ah.Y end w.MouseIsOverFrame=function(ac,ad,ae)local af,ag=ad.
AbsolutePosition,ad.AbsoluteSize return ae.X>=af.X and ae.X<=af.X+ag.X and ae.Y
>=af.Y and ae.Y<=af.Y+ag.Y end w.SafeCallback=function(ac,ad,...)if not(ad and
typeof(ad)=='function')then return end local ae=table.pack(xpcall(ad,function(ae
)task.defer(error,debug.traceback(ae,2))if w.NotifyOnError then w:Notify(ae)end
return ae end,...))if not ae[1]then return nil end return table.unpack(ae,2,ae.n
)end w.MakeDraggable=function(ac,ad,ae,af,ag)local ah,_,ai,aj=false ae.
InputBegan:Connect(function(ak)if not F(ak)or ag and w.CantDragForced then
return end _=ak.Position ai=ad.Position ah=true aj=ak.Changed:Connect(function()
if ak.UserInputState~=Enum.UserInputState.End then return end ah=false if aj and
aj.Connected then aj:Disconnect()aj=nil end end)end)w:GiveSignal(h.InputChanged:
Connect(function(ak)if(not af and not w.Toggled)or(ag and w.CantDragForced)or
not(V and V.Parent)then ah=false if aj and aj.Connected then aj:Disconnect()aj=
nil end return end if ah and G(ak)then local al=ak.Position-_ ad.Position=UDim2.
new(ai.X.Scale,ai.X.Offset+al.X,ai.Y.Scale,ai.Y.Offset+al.Y)end end))end w.
MakeResizable=function(ac,ad,ae,af)local ag,ah,ai,aj=false ae.InputBegan:
Connect(function(ak)if not F(ak)then return end ah=ak.Position ai=ad.Size ag=
true aj=ak.Changed:Connect(function()if ak.UserInputState~=Enum.UserInputState.
End then return end ag=false if aj and aj.Connected then aj:Disconnect()aj=nil
end end)end)w:GiveSignal(h.InputChanged:Connect(function(ak)if not ad.Visible or
not(V and V.Parent)then ag=false if aj and aj.Connected then aj:Disconnect()aj=
nil end return end if ag and G(ak)then local al=ak.Position-ah ad.Size=UDim2.
new(ai.X.Scale,math.clamp(ai.X.Offset+al.X,w.MinSize.X,math.huge),ai.Y.Scale,
math.clamp(ai.Y.Offset+al.Y,w.MinSize.Y,math.huge))if af then w:SafeCallback(af)
end end end))end w.MakeCover=function(ac,ad,ae)local af,ag=z[ae]or{0,0},A[ae]or{
1,0.5}local ah=S('Frame',{AnchorPoint=Vector2.new(af[1],af[2]),BackgroundColor3=
ad.BackgroundColor3,Position=UDim2.fromScale(af[1],af[2]),Size=UDim2.fromScale(
ag[1],ag[2]),Parent=ad})return ah end w.MakeLine=function(ac,ad,ae)local af=S(
'Frame',{AnchorPoint=ae.AnchorPoint or Vector2.zero,BackgroundColor3=
'OutlineColor',Position=ae.Position,Size=ae.Size,ZIndex=ae.ZIndex or 1,Parent=ad
})return af end w.MakeOutline=function(ac,ad,ae,af)local ag=S('Frame',{
BackgroundColor3='Dark',Position=UDim2.fromOffset(-2,-2),Size=UDim2.new(1,4,1,4)
,ZIndex=af,Parent=ad})local ah=S('Frame',{BackgroundColor3='OutlineColor',
Position=UDim2.fromOffset(1,1),Size=UDim2.new(1,-2,1,-2),ZIndex=af,Parent=ag})if
ae and ae>0 then S('UICorner',{CornerRadius=UDim.new(0,ae+1),Parent=ag})S(
'UICorner',{CornerRadius=UDim.new(0,ae),Parent=ah})end return ag end w.
AddDraggableButton=function(ac,ad,ae)local af,ag={},S('TextButton',{
BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(6,6),TextSize=16,
ZIndex=10,Parent=V,DPIExclude={Position=true}})S('UICorner',{CornerRadius=UDim.
new(0,w.CornerRadius-1),Parent=ag})w:MakeOutline(ag,w.CornerRadius,9)af.Button=
ag ag.MouseButton1Click:Connect(function()w:SafeCallback(ae,af)end)w:
MakeDraggable(ag,ag,true)af.SetText=function(ah,ai)local aj,ak=w:GetTextBounds(
ai,w.Scheme.Font,16)ag.Text=ai ag.Size=UDim2.fromOffset(aj*w.DPIScale*2,ak*w.
DPIScale*2)w:UpdateDPI(ag,{Size=UDim2.fromOffset(aj*2,ak*2)})end af:SetText(ad)
return af end w.AddDraggableMenu=function(ac,ad)local ae=w:MakeOutline(V,w.
CornerRadius,10)ae.AutomaticSize=Enum.AutomaticSize.Y ae.Position=UDim2.
fromOffset(6,6)ae.Size=UDim2.fromOffset(0,0)w:UpdateDPI(ae,{Position=false,Size=
false})local af=S('Frame',{BackgroundColor3='BackgroundColor',Position=UDim2.
fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=ae})S('UICorner',{CornerRadius=
UDim.new(0,w.CornerRadius-1),Parent=af})w:MakeLine(af,{Position=UDim2.
fromOffset(0,34),Size=UDim2.new(1,0,0,1)})local ag=S('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,34),Text=ad,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,Parent=af})S('UIPadding',{PaddingLeft=
UDim.new(0,12),PaddingRight=UDim.new(0,12),Parent=ag})local ah=S('Frame',{
BackgroundTransparency=1,Position=UDim2.fromOffset(0,35),Size=UDim2.new(1,0,1,-
35),Parent=af})S('UIListLayout',{Padding=UDim.new(0,7),Parent=ah})S('UIPadding',
{PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0,7),PaddingRight=UDim.new(0,7
),PaddingTop=UDim.new(0,7),Parent=ah})w:MakeDraggable(ae,ag,true)return ae,ah
end do local ac=w:MakeOutline(V,w.CornerRadius,10)ac.AutomaticSize=Enum.
AutomaticSize.Y ac.Position=UDim2.fromOffset(6,6)ac.Size=UDim2.fromOffset(0,0)ac
.Visible=false w:UpdateDPI(ac,{Position=false,Size=false})local ad=S('Frame',{
BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(2,2),Size=UDim2.
new(1,-4,1,-4),Parent=ac})S('UICorner',{CornerRadius=UDim.new(0,w.CornerRadius-1
),Parent=ad})local ae=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0
,0,32),Position=UDim2.fromOffset(0,-8*w.DPIScale+7),Text='',TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,Parent=ad})S('UIPadding',{PaddingLeft=
UDim.new(0,12),PaddingRight=UDim.new(0,12),Parent=ae})w:MakeDraggable(ac,ae,true
)local af=function()local af,ag=w:GetTextBounds(ae.Text,w.Scheme.Font,15)ac.Size
=UDim2.fromOffset((12+af+12+4)*w.DPIScale,ag*w.DPIScale*2+4)w:UpdateDPI(ac,{Size
=UDim2.fromOffset(12+af+12+4,ag*2+4)})end w.SetWatermarkVisibility=function(ag,
ah)ac.Visible=ah if ah then af()end end w.SetWatermark=function(ag,ah)ae.Text=ah
af()end end local ac w.AddContextMenu=function(ad,ae,af,ag,ah,ai)local aj if ah
then aj=S('ScrollingFrame',{AutomaticCanvasSize=ah==2 and Enum.AutomaticSize.Y
or Enum.AutomaticSize.None,AutomaticSize=ah==1 and Enum.AutomaticSize.Y or Enum.
AutomaticSize.None,BackgroundColor3='BackgroundColor',BorderColor3=
'OutlineColor',BorderSizePixel=1,BottomImage=
'rbxasset://textures/ui/Scroll/scroll-middle.png',CanvasSize=UDim2.fromOffset(0,
0),ScrollBarImageColor3='OutlineColor',ScrollBarThickness=ah==2 and 2 or 0,Size=
typeof(af)=='function'and af()or af,TopImage=
'rbxasset://textures/ui/Scroll/scroll-middle.png',Visible=false,ZIndex=10,Parent
=V,DPIExclude={Position=true}})else aj=S('Frame',{BackgroundColor3=
'BackgroundColor',BorderColor3='OutlineColor',BorderSizePixel=1,Size=typeof(af)
=='function'and af()or af,Visible=false,ZIndex=10,Parent=V,DPIExclude={Position=
true}})end local ak={Active=false,Holder=ae,Menu=aj,List=nil,Signal=nil,Size=af}
if ah then ak.List=S('UIListLayout',{Parent=aj})end ak.Open=function(al)if ac==
ak then return elseif ac then ac:Close()end ac=ak ak.Active=true if typeof(ag)==
'function'then aj.Position=UDim2.fromOffset(math.floor(ae.AbsolutePosition.X+ag(
)[1]),math.floor(ae.AbsolutePosition.Y+ag()[2]))else aj.Position=UDim2.
fromOffset(math.floor(ae.AbsolutePosition.X+ag[1]),math.floor(ae.
AbsolutePosition.Y+ag[2]))end if typeof(ak.Size)=='function'then aj.Size=ak.
Size()else aj.Size=B(ak.Size)end if typeof(ai)=='function'then w:SafeCallback(ai
,true)end aj.Visible=true ak.Signal=ae:GetPropertyChangedSignal
'AbsolutePosition':Connect(function()if typeof(ag)=='function'then aj.Position=
UDim2.fromOffset(math.floor(ae.AbsolutePosition.X+ag()[1]),math.floor(ae.
AbsolutePosition.Y+ag()[2]))else aj.Position=UDim2.fromOffset(math.floor(ae.
AbsolutePosition.X+ag[1]),math.floor(ae.AbsolutePosition.Y+ag[2]))end end)end ak
.Close=function(al)if ac~=ak then return end aj.Visible=false if ak.Signal then
ak.Signal:Disconnect()ak.Signal=nil end ak.Active=false ac=nil if typeof(ai)==
'function'then w:SafeCallback(ai,false)end end ak.Toggle=function(al)if ak.
Active then ak:Close()else ak:Open()end end ak.SetSize=function(al,_)ak.Size=_
aj.Size=typeof(_)=='function'and _()or _ end return ak end w:GiveSignal(h.
InputBegan:Connect(function(ad)if F(ad,true)then local ae=ad.Position if ac and
not(w:MouseIsOverFrame(ac.Menu,ae)or w:MouseIsOverFrame(ac.Holder,ae))then ac:
Close()end end end))local ad=S('TextLabel',{BackgroundColor3='BackgroundColor',
BorderColor3='OutlineColor',BorderSizePixel=1,TextSize=14,TextWrapped=true,
Visible=false,ZIndex=20,Parent=V})ad:GetPropertyChangedSignal'AbsolutePosition':
Connect(function()local ae,af=w:GetTextBounds(ad.Text,ad.FontFace,ad.TextSize,
workspace.CurrentCamera.ViewportSize.X-ad.AbsolutePosition.X-4)ad.Size=UDim2.
fromOffset(ae+8*w.DPIScale,af+4*w.DPIScale)w:UpdateDPI(ad,{Size=UDim2.
fromOffset(ae,af),DPIOffset={Size={8,4}}})end)local ae w.AddTooltip=function(af,
ag,ah,ai)local aj={Disabled=false,Hovering=false,Signals={}}local ak=function()
if ae==ai or(ac and w:MouseIsOverFrame(ac.Menu,r))or(aj.Disabled and typeof(ah)
~='string')or(not aj.Disabled and typeof(ag)~='string')then return end ae=ai ad.
Text=aj.Disabled and ah or ag ad.Visible=true while w.Toggled and w:
MouseIsOverFrame(ai,r)and not(ac and w:MouseIsOverFrame(ac.Menu,r))do ad.
Position=UDim2.fromOffset(r.X+(w.ShowCustomCursor and 8 or 14),r.Y+(w.
ShowCustomCursor and 8 or 12))f.RenderStepped:Wait()end ad.Visible=false ae=nil
end table.insert(aj.Signals,ai.MouseEnter:Connect(ak))table.insert(aj.Signals,ai
.MouseMoved:Connect(ak))table.insert(aj.Signals,ai.MouseLeave:Connect(function()
if ae~=ai then return end ad.Visible=false ae=nil end))aj.Destroy=function(al)
for _=#aj.Signals,1,-1 do local am=table.remove(aj.Signals,_)am:Disconnect()end
if ae==ai then ad.Visible=false ae=nil end end return aj end w.OnUnload=function
(af,ag)table.insert(w.UnloadSignals,ag)end w.Unload=function(af)for ag=#w.
Signals,1,-1 do local ah=table.remove(w.Signals,ag)ah:Disconnect()end for ag,ah
in pairs(w.UnloadSignals)do w:SafeCallback(ah)end w.Unloaded=true V:Destroy()m()
.Library=nil end local af,ag,ah,ai,aj=w:GetIcon'check',w:GetIcon'chevron-up',w:
GetIcon'move-diagonal-2',w:GetIcon'key',w:GetIcon'move'w.SetIconModule=function(
ak,al)aa=true ab=al af=w:GetIcon'check'ag=w:GetIcon'chevron-up'ah=w:GetIcon
'move-diagonal-2'ai=w:GetIcon'key'aj=w:GetIcon'move'end local ak={}do local al={
}al.AddKeyPicker=function(am,_,an)an=w:Validate(an,y.KeyPicker)local ao=am local
ap,aq=ao.TextLabel,{Text=an.Text,Value=an.Default,Modifiers=an.DefaultModifiers,
DisplayValue=an.Default,Toggled=false,Mode=an.Mode,SyncToggleState=an.
SyncToggleState,Callback=an.Callback,ChangedCallback=an.ChangedCallback,Changed=
an.Changed,Clicked=an.Clicked,Type='KeyPicker'}if aq.Mode=='Press'then assert(ao
.Type=='Label',
[[KeyPicker with the mode 'Press' can be only applied on Labels.]])aq.
SyncToggleState=false an.Modes={'Press'}an.Mode='Press'end if aq.SyncToggleState
then an.Modes={'Toggle'}an.Mode='Toggle'end local ar,as,at,au,av=false,{MB1=Enum
.UserInputType.MouseButton1,MB2=Enum.UserInputType.MouseButton2,MB3=Enum.
UserInputType.MouseButton3},{[Enum.UserInputType.MouseButton1]='MB1',[Enum.
UserInputType.MouseButton2]='MB2',[Enum.UserInputType.MouseButton3]='MB3'},{LAlt
=Enum.KeyCode.LeftAlt,RAlt=Enum.KeyCode.RightAlt,LCtrl=Enum.KeyCode.LeftControl,
RCtrl=Enum.KeyCode.RightControl,LShift=Enum.KeyCode.LeftShift,RShift=Enum.
KeyCode.RightShift,Tab=Enum.KeyCode.Tab,CapsLock=Enum.KeyCode.CapsLock},{[Enum.
KeyCode.LeftAlt]='LAlt',[Enum.KeyCode.RightAlt]='RAlt',[Enum.KeyCode.LeftControl
]='LCtrl',[Enum.KeyCode.RightControl]='RCtrl',[Enum.KeyCode.LeftShift]='LShift',
[Enum.KeyCode.RightShift]='RShift',[Enum.KeyCode.Tab]='Tab',[Enum.KeyCode.
CapsLock]='CapsLock'}local aw,ax=function(aw)return aw.UserInputType==Enum.
UserInputType.Keyboard and av[aw.KeyCode]~=nil end,function()local aw={}for ax,
ay in au do if table.find(aw,ax)then continue end if not h:IsKeyDown(ay)then
continue end table.insert(aw,ax)end return aw end local ay,az,aA,aB=function(ay)
if not(typeof(ay)=='table'and J(ay)>0)then return true end local az,aA=ax(),true
for aB,aC in ay do if table.find(az,aC)then continue end aA=false break end
return aA end,function(ay)if not ay then return false end if at[ay.UserInputType
]~=nil then return h:IsMouseButtonPressed(ay.UserInputType)and not h:
GetFocusedTextBox()elseif ay.UserInputType==Enum.UserInputType.Keyboard then
return h:IsKeyDown(ay.KeyCode)and not h:GetFocusedTextBox()else return false end
end,function(ay)local az={}for aA,aB in ay do table.insert(az,au[aB])end return
az end,function(ay)if typeof(ay)~='table'then return{}end local az={}for aA,aB
in ay do if not au[aB]then continue end table.insert(az,aB)end return az end aq.
Modifiers=aB(aq.Modifiers)local aC,aD=S('TextButton',{BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Size=UDim2.fromOffset(
18,18),Text=aq.Value,TextSize=14,Parent=ap}),{Normal=aq.Mode~='Toggle'}do local
aE=S('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,16),Text='',
Visible=not an.NoUI,Parent=w.KeybindContainer})local aF,aG=S('TextLabel',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextSize=14,
TextTransparency=0.5,Parent=aE,DPIExclude={Size=true}}),S('Frame',{
BackgroundColor3='MainColor',Size=UDim2.fromOffset(14,14),SizeConstraint=Enum.
SizeConstraint.RelativeYY,Parent=aE})S('UICorner',{CornerRadius=UDim.new(0,w.
CornerRadius/2),Parent=aG})S('UIStroke',{Color='OutlineColor',Parent=aG})local
aH=S('ImageLabel',{Image=af and af.Url or'',ImageColor3='FontColor',
ImageRectOffset=af and af.ImageRectOffset or Vector2.zero,ImageRectSize=af and
af.ImageRectSize or Vector2.zero,ImageTransparency=1,Position=UDim2.fromOffset(2
,2),Size=UDim2.new(1,-4,1,-4),Parent=aG})aD.Display=function(aI,aJ)aF.
TextTransparency=aJ and 0 or 0.5 aH.ImageTransparency=aJ and 0 or 1 end aD.
SetText=function(aI,aJ)local aK=w:GetTextBounds(aJ,aF.FontFace,aF.TextSize)aF.
Text=aJ aF.Size=UDim2.new(0,aK,1,0)end aD.SetVisibility=function(aI,aJ)aE.
Visible=aJ end aD.SetNormal=function(aI,aJ)aD.Normal=aJ aE.Active=not aJ aF.
Position=aJ and UDim2.fromOffset(0,0)or UDim2.fromOffset(22*w.DPIScale,0)aG.
Visible=not aJ end aE.MouseButton1Click:Connect(function()if aD.Normal then
return end aq.Toggled=not aq.Toggled aq:DoClick()end)aD.Holder=aE aD.Label=aF aD
.Checkbox=aG aD.Loaded=true table.insert(w.KeybindToggles,aD)end local aE=w:
AddContextMenu(aC,UDim2.fromOffset(62,0),function()return{aC.AbsoluteSize.X+1.5,
0.5}end,1)aq.Menu=aE local aF={}for aG,aH in pairs(an.Modes)do local aI,aJ={},S(
'TextButton',{BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.
new(1,0,0,21),Text=aH,TextSize=14,TextTransparency=0.5,Parent=aE.Menu})aI.Select
=function(aK)for aL,aM in pairs(aF)do aM:Deselect()end aq.Mode=aH aJ.
BackgroundTransparency=0 aJ.TextTransparency=0 aE:Close()end aI.Deselect=
function(aK)aq.Mode=nil aJ.BackgroundTransparency=1 aJ.TextTransparency=0.5 end
aJ.MouseButton1Click:Connect(function()aI:Select()end)if aq.Mode==aH then aI:
Select()end aF[aH]=aI end aq.Display=function(aG,aH)if w.Unloaded then return
end local aI,aJ=w:GetTextBounds(aH or aq.DisplayValue,aC.FontFace,aC.TextSize,ap
.AbsoluteSize.X)aC.Text=aH or aq.DisplayValue aC.Size=UDim2.fromOffset(aI+9*w.
DPIScale,aJ+4*w.DPIScale)end aq.Update=function(aG)aq:Display()if an.NoUI then
return end if aq.Mode=='Toggle'and ao.Type=='Toggle'and ao.Disabled then aD:
SetVisibility(false)return end local aH,aI=aq:GetState(),w.
ShowToggleFrameInKeybinds and aq.Mode=='Toggle'if aD.Loaded then if aI then aD:
SetNormal(false)else aD:SetNormal(true)end aD:SetText(('[%s] %s (%s)'):format(aq
.DisplayValue,aq.Text,aq.Mode))aD:SetVisibility(true)aD:Display(aH)end w:
UpdateKeybindFrame()end aq.GetState=function(aG)if aq.Mode=='Always'then return
true elseif aq.Mode=='Hold'then local aH=aq.Value if aH=='None'then return false
end if not ay(aq.Modifiers)then return false end if as[aH]~=nil then return h:
IsMouseButtonPressed(as[aH])and not h:GetFocusedTextBox()else return h:
IsKeyDown(Enum.KeyCode[aH])and not h:GetFocusedTextBox()end else return aq.
Toggled end end aq.OnChanged=function(aG,aH)aq.Changed=aH end aq.OnClick=
function(aG,aH)aq.Clicked=aH end aq.DoClick=function(aG)if aq.Mode=='Press'then
if aq.Toggled and an.WaitForCallback==true then return end aq.Toggled=true end
if ao.Type=='Toggle'and aq.SyncToggleState then ao:SetValue(aq.Toggled)end w:
SafeCallback(aq.Callback,aq.Toggled)w:SafeCallback(aq.Clicked,aq.Toggled)if aq.
Mode=='Press'then aq.Toggled=false end end aq.SetValue=function(aG,aH)local aI,
aJ,aK=aH[1],aH[2],aH[3]local aL,aM=pcall(function()if aI=='None'then aI=nil
return nil end if as[aI]==nil then return Enum.KeyCode[aI]end return as[aI]end)
if aI==nil then aq.Value='None'elseif aL then aq.Value=aI else aq.Value=
'Unknown'end aq.Modifiers=aB((typeof(aK)=='table'and{aK}or{(aq.Modifiers)})[1])
aq.DisplayValue=(J(aq.Modifiers)>0 and{(table.concat(aq.Modifiers,' + ')..' + '
..aq.Value)}or{(aq.Value)})[1]if aF[aJ]then aF[aJ]:Select()end local aN=aA(aq.
Modifiers)w:SafeCallback(aq.ChangedCallback,aM,aN)w:SafeCallback(aq.Changed,aM,
aN)aq:Update()end aq.SetText=function(aG,aH)aD:SetText(aH)aq:Update()end aC.
MouseButton1Click:Connect(function()if ar then return end ar=true aC.Text='...'
aC.Size=UDim2.fromOffset(29*w.DPIScale,18*w.DPIScale)local aG,aH={}local aI=
function()aH=h.InputBegan:Wait()if h:GetFocusedTextBox()then return true end end
repeat task.wait()aC.Text='...'aC.Size=UDim2.fromOffset(29*w.DPIScale,18*w.
DPIScale)if aI()then ar=false aq:Update()return end if aH.KeyCode==Enum.KeyCode.
Escape then break end if aw(aH)then local aJ=false repeat task.wait()if h:
IsKeyDown(aH.KeyCode)then task.wait(0.075)if h:IsKeyDown(aH.KeyCode)then if not
table.find(aG,av[aH.KeyCode])then aG[#aG+1]=av[aH.KeyCode]aq:Display(table.
concat(aG,' + ')..' + ...')end if aI()then aJ=true break end if aH.KeyCode==Enum
.KeyCode.Escape then break end if not aw(aH)then break end else if not table.
find(aG,av[aH.KeyCode])then break end end end until false if aJ then ar=false aq
:Update()return end end break until false local aJ='Unknown'if at[aH.
UserInputType]~=nil then aJ=at[aH.UserInputType]elseif aH.UserInputType==Enum.
UserInputType.Keyboard then aJ=aH.KeyCode==Enum.KeyCode.Escape and'None'or aH.
KeyCode.Name end aG=(aH.KeyCode==Enum.KeyCode.Escape or aJ=='Unknown')and{}or aG
aq.Toggled=false aq:SetValue{aJ,aq.Mode,aG}repeat task.wait()until not az(aH)or
h:GetFocusedTextBox()ar=false end)aC.MouseButton2Click:Connect(aE.Toggle)w:
GiveSignal(h.InputBegan:Connect(function(aG)if aq.Mode=='Always'or aq.Value==
'Unknown'or aq.Value=='None'or ar or h:GetFocusedTextBox()then return end local
aH,aI,aJ=aq.Value,ay(aq.Modifiers),false if aH and aI==true and(at[aG.
UserInputType]==aH or(aG.UserInputType==Enum.UserInputType.Keyboard and aG.
KeyCode.Name==aH))then aJ=true end if aq.Mode=='Toggle'then if aJ then aq.
Toggled=not aq.Toggled aq:DoClick()end elseif aq.Mode=='Press'then if aJ then aq
:DoClick()end end aq:Update()end))w:GiveSignal(h.InputEnded:Connect(function()if
aq.Value=='Unknown'or aq.Value=='None'or ar or h:GetFocusedTextBox()then return
end aq:Update()end))aq:Update()if ao.Addons then table.insert(ao.Addons,aq)end v
[_]=aq return am end local am={}for an=0,1,0.1 do table.insert(am,
ColorSequenceKeypoint.new(an,Color3.fromHSV(an,1,1)))end al.AddColorPicker=
function(an,ao,ap)ap=w:Validate(ap,y.ColorPicker)local aq=an local ar,as=aq.
TextLabel,{Value=ap.Default,Transparency=ap.Transparency or 0,Title=ap.Title,
Callback=ap.Callback,Changed=ap.Changed,Type='ColorPicker'}as.Hue,as.Sat,as.Vib=
as.Value:ToHSV()local at=S('TextButton',{BackgroundColor3=as.Value,BorderColor3=
w:GetDarkerColor(as.Value),BorderSizePixel=1,Size=UDim2.fromOffset(18,18),Text=
'',Parent=ar})local au,av=S('ImageLabel',{Image=x.GetAsset'TransparencyTexture',
ImageTransparency=(1-as.Transparency),ScaleType=Enum.ScaleType.Tile,Size=UDim2.
fromScale(1,1),TileSize=UDim2.fromOffset(9,9),Parent=at}),w:AddContextMenu(at,
UDim2.fromOffset(ap.Transparency and 256 or 234,0),function()return{0.5,at.
AbsoluteSize.Y+1.5}end,1)av.List.Padding=UDim.new(0,8)as.ColorMenu=av S(
'UIPadding',{PaddingBottom=UDim.new(0,6),PaddingLeft=UDim.new(0,6),PaddingRight=
UDim.new(0,6),PaddingTop=UDim.new(0,6),Parent=av.Menu})if typeof(as.Title)==
'string'then S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,8),
Text=as.Title,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=av.Menu
})end local aw=S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,200),
Parent=av.Menu})S('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
Padding=UDim.new(0,6),Parent=aw})local ax=S('ImageButton',{BackgroundColor3=as.
Value,Image=x.GetAsset'SaturationMap',Size=UDim2.fromOffset(200,200),Parent=aw})
local ay=S('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3='White',
Size=UDim2.fromOffset(6,6),Parent=ax})S('UICorner',{CornerRadius=UDim.new(1,0),
Parent=ay})S('UIStroke',{Color='Dark',Parent=ay})local az=S('TextButton',{Size=
UDim2.fromOffset(16,200),Text='',Parent=aw})S('UIGradient',{Color=ColorSequence.
new(am),Rotation=90,Parent=az})local aA,aB,aC,aD=(S('Frame',{AnchorPoint=Vector2
.new(0.5,0.5),BackgroundColor3='White',BorderColor3='Dark',BorderSizePixel=1,
Position=UDim2.fromScale(0.5,as.Hue),Size=UDim2.new(1,2,0,1),Parent=az}))if ap.
Transparency then aB=S('ImageButton',{Image=x.GetAsset'TransparencyTexture',
ScaleType=Enum.ScaleType.Tile,Size=UDim2.fromOffset(16,200),TileSize=UDim2.
fromOffset(8,8),Parent=aw})aC=S('Frame',{BackgroundColor3=as.Value,Size=UDim2.
fromScale(1,1),Parent=aB})S('UIGradient',{Rotation=90,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,
1)},Parent=aC})aD=S('Frame',{AnchorPoint=Vector2.new(0.5,0.5),BackgroundColor3=
'White',BorderColor3='Dark',BorderSizePixel=1,Position=UDim2.fromScale(0.5,as.
Transparency),Size=UDim2.new(1,2,0,1),Parent=aB})end local aE=S('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,20),Parent=av.Menu})S(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalFlex=Enum.
UIFlexAlignment.Fill,Padding=UDim.new(0,8),Parent=aE})local aF,aG,aH=S('TextBox'
,{BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
ClearTextOnFocus=false,Size=UDim2.fromScale(1,1),Text='#??????',TextSize=14,
Parent=aE}),S('TextBox',{BackgroundColor3='MainColor',BorderColor3=
'OutlineColor',BorderSizePixel=1,ClearTextOnFocus=false,Size=UDim2.fromScale(1,1
),Text='?, ?, ?',TextSize=14,Parent=aE}),w:AddContextMenu(at,UDim2.fromOffset(93
,0),function()return{at.AbsoluteSize.X+1.5,0.5}end,1)as.ContextMenu=aH do local
aI=function(aI,aJ)local aK=S('TextButton',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,21),Text=aI,TextSize=14,Parent=aH.Menu})aK.MouseButton1Click:Connect(
function()w:SafeCallback(aJ)aH:Close()end)end aI('Copy color',function()w.
CopiedColor={as.Value,as.Transparency}end)aI('Paste color',function()as:
SetValueRGB(w.CopiedColor[1],w.CopiedColor[2])end)if n then aI('Copy Hex',
function()n(tostring(as.Value:ToHex()))end)aI('Copy RGB',function()n(table.
concat({math.floor(as.Value.R*255),math.floor(as.Value.G*255),math.floor(as.
Value.B*255)},', '))end)end end as.SetHSVFromRGB=function(aI,aJ)as.Hue,as.Sat,as
.Vib=aJ:ToHSV()end as.Display=function(aI)if w.Unloaded then return end as.Value
=Color3.fromHSV(as.Hue,as.Sat,as.Vib)at.BackgroundColor3=as.Value at.
BorderColor3=w:GetDarkerColor(as.Value)au.ImageTransparency=(1-as.Transparency)
ax.BackgroundColor3=Color3.fromHSV(as.Hue,1,1)if aC then aC.BackgroundColor3=as.
Value end ay.Position=UDim2.fromScale(as.Sat,1-as.Vib)aA.Position=UDim2.
fromScale(0.5,as.Hue)if aD then aD.Position=UDim2.fromScale(0.5,as.Transparency)
end aF.Text='#'..as.Value:ToHex()aG.Text=table.concat({math.floor(as.Value.R*255
),math.floor(as.Value.G*255),math.floor(as.Value.B*255)},', ')end as.Update=
function(aI)as:Display()w:SafeCallback(as.Callback,as.Value)w:SafeCallback(as.
Changed,as.Value)end as.OnChanged=function(aI,aJ)as.Changed=aJ end as.SetValue=
function(aI,aJ,aK)local aL=Color3.fromHSV(aJ[1],aJ[2],aJ[3])as.Transparency=ap.
Transparency and aK or 0 as:SetHSVFromRGB(aL)as:Update()end as.SetValueRGB=
function(aI,aJ,aK)as.Transparency=ap.Transparency and aK or 0 as:SetHSVFromRGB(
aJ)as:Update()end at.MouseButton1Click:Connect(av.Toggle)at.MouseButton2Click:
Connect(aH.Toggle)ax.InputBegan:Connect(function(aI)while I(aI)do local aJ=ax.
AbsolutePosition.X local aK=aJ+ax.AbsoluteSize.X local aL,aM=math.clamp(r.X,aJ,
aK),ax.AbsolutePosition.Y local aN=aM+ax.AbsoluteSize.Y local _,aO,aP=math.
clamp(r.Y,aM,aN),as.Sat,as.Vib as.Sat=(aL-aJ)/(aK-aJ)as.Vib=1-((_-aM)/(aN-aM))if
as.Sat~=aO or as.Vib~=aP then as:Update()end f.RenderStepped:Wait()end end)az.
InputBegan:Connect(function(aI)while I(aI)do local aJ=az.AbsolutePosition.Y
local aK=aJ+az.AbsoluteSize.Y local aL,aM=math.clamp(r.Y,aJ,aK),as.Hue as.Hue=(
aL-aJ)/(aK-aJ)if as.Hue~=aM then as:Update()end f.RenderStepped:Wait()end end)if
aB then aB.InputBegan:Connect(function(aI)while I(aI)do local aJ,aK=aB.
AbsolutePosition.Y,aB.AbsolutePosition.Y+aB.AbsoluteSize.Y local aL,aM=math.
clamp(r.Y,aJ,aK),as.Transparency as.Transparency=(aL-aJ)/(aK-aJ)if as.
Transparency~=aM then as:Update()end f.RenderStepped:Wait()end end)end aF.
FocusLost:Connect(function(aI)if not aI then return end local aJ,aK=pcall(Color3
.fromHex,aF.Text)if aJ and typeof(aK)=='Color3'then as.Hue,as.Sat,as.Vib=aK:
ToHSV()end as:Update()end)aG.FocusLost:Connect(function(aI)if not aI then return
end local aJ,aK,aL=aG.Text:match'(%d+),%s*(%d+),%s*(%d+)'if aJ and aK and aL
then as:SetHSVFromRGB(Color3.fromRGB(aJ,aK,aL))end as:Update()end)as:Display()if
aq.Addons then table.insert(aq.Addons,as)end v[ao]=as return an end ak.__index=
al ak.__namecall=function(an,ao,...)return al[ao](...)end end local al={}do
local am={}am.AddDivider=function(an)local ao=an local ap=ao.Container local aq=
S('Frame',{BackgroundColor3='MainColor',BorderColor3='OutlineColor',
BorderSizePixel=1,Size=UDim2.new(1,0,0,2),Parent=ap})ao:Resize()table.insert(ao.
Elements,{Holder=aq,Type='Divider'})end am.AddLabel=function(an,...)local ao,ap,
aq,ar={},{},select(1,...),select(2,...)if typeof(aq)=='table'or typeof(ar)==
'table'then local as=typeof(aq)=='table'and aq or ar ao.Text=as.Text or''ao.
DoesWrap=as.DoesWrap or false ao.Size=as.Size or 14 ao.Alignment=as.Alignment or
Enum.TextXAlignment.Left ao.Visible=as.Visible or true ao.Idx=typeof(ar)==
'table'and aq or nil else ao.Text=aq or''ao.DoesWrap=ar or false ao.Size=14 ao.
Visible=true ao.Idx=select(3,...)or nil end local as=an local at,au=as.Container
,{Text=ao.Text,DoesWrap=ao.DoesWrap,Addons=ap,Visible=ao.Visible,Type='Label'}
local av=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text=
au.Text,TextSize=ao.Size,TextWrapped=au.DoesWrap,TextXAlignment=(as.IsKeyTab and
Enum.TextXAlignment.Center)or ao.Alignment or Enum.TextXAlignment.Left,Parent=at
})au.SetVisible=function(aw,ax)au.Visible=ax av.Visible=au.Visible as:Resize()
end au.SetText=function(aw,ax)au.Text=ax av.Text=ax if au.DoesWrap then local ay
,az=w:GetTextBounds(au.Text,av.FontFace,av.TextSize,av.AbsoluteSize.X)av.Size=
UDim2.new(1,0,0,az+4*w.DPIScale)end as:Resize()end if au.DoesWrap then local aw,
ax=w:GetTextBounds(au.Text,av.FontFace,av.TextSize,av.AbsoluteSize.X)av.Size=
UDim2.new(1,0,0,ax+4*w.DPIScale)else S('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),Parent=av})end if ao.DoesWrap then local aw=av.
AbsoluteSize av:GetPropertyChangedSignal'AbsoluteSize':Connect(function()if av.
AbsoluteSize==aw then return end local ax,ay=w:GetTextBounds(au.Text,av.FontFace
,av.TextSize,av.AbsoluteSize.X)av.Size=UDim2.new(1,0,0,ay+4*w.DPIScale)aw=av.
AbsoluteSize as:Resize()end)end as:Resize()au.TextLabel=av au.Container=at if
not ao.DoesWrap then setmetatable(au,ak)end au.Holder=av table.insert(as.
Elements,au)if ao.Idx then s[ao.Idx]=au else table.insert(s,au)end return au end
local an=function(an)local ao=S('TextButton',{Active=not an.Disabled,
BackgroundColor3=an.Disabled and'BackgroundColor'or'MainColor',Size=UDim2.
fromScale(1,1),Text=an.Text,TextSize=14,TextTransparency=0.4,Visible=an.Visible,
Parent=an.Holder})local ap=S('UIStroke',{Color='OutlineColor',Transparency=an.
Disabled and 0.5 or 0,Parent=ao})return ao,ap end am.AddButton=function(ao,...)
local ap=function(...)local ap,aq,ar={},select(1,...),select(2,...)if typeof(aq)
=='table'or typeof(ar)=='table'then local as=typeof(aq)=='table'and aq or ar ap.
Text=as.Text or''ap.Func=as.Func or function()end ap.DoubleClick=as.DoubleClick
ap.Tooltip=as.Tooltip ap.DisabledTooltip=as.DisabledTooltip ap.Risky=as.Risky or
false ap.Disabled=as.Disabled or false ap.Visible=as.Visible or true ap.Idx=
typeof(ar)=='table'and aq or nil else ap.Text=aq or''ap.Func=ar or function()end
ap.DoubleClick=false ap.Tooltip=nil ap.DisabledTooltip=nil ap.Risky=false ap.
Disabled=false ap.Visible=true ap.Idx=select(3,...)or nil end return ap end
local aq,ar=ap(...),ao local as,at=ar.Container,{Text=aq.Text,Func=aq.Func,
DoubleClick=aq.DoubleClick,Tooltip=aq.Tooltip,DisabledTooltip=aq.DisabledTooltip
,TooltipTable=nil,Risky=aq.Risky,Disabled=aq.Disabled,Visible=aq.Visible,Tween=
nil,Type='Button'}local au=S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,
0,0,21),Parent=as})at.Holder=au S('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalFlex=Enum.UIFlexAlignment.Fill,Padding=UDim.
new(0,9),Parent=au})local av=function(av)av.Base.MouseEnter:Connect(function()if
av.Disabled then return end av.Tween=k:Create(av.Base,w.TweenInfo,{
TextTransparency=0})av.Tween:Play()end)av.Base.MouseLeave:Connect(function()if
av.Disabled then return end av.Tween=k:Create(av.Base,w.TweenInfo,{
TextTransparency=0.4})av.Tween:Play()end)av.Base.MouseButton1Click:Connect(
function()if av.Disabled or av.Locked then return end if av.DoubleClick then av.
Locked=true av.Base.Text='Are you sure?'av.Base.TextColor3=w.Scheme.AccentColor
w.Registry[av.Base].TextColor3='AccentColor'local aw=D(av.Base.MouseButton1Click
,0.5)av.Base.Text=av.Text av.Base.TextColor3=av.Risky and w.Scheme.Red or w.
Scheme.FontColor w.Registry[av.Base].TextColor3=av.Risky and'Red'or'FontColor'if
aw then w:SafeCallback(av.Func)end f.RenderStepped:Wait()av.Locked=false return
end w:SafeCallback(av.Func)end)end at.Base,at.Stroke=an(at)av(at)at.AddButton=
function(aw,...)local ax=ap(...)local ay={Text=ax.Text,Func=ax.Func,DoubleClick=
ax.DoubleClick,Tooltip=ax.Tooltip,DisabledTooltip=ax.DisabledTooltip,
TooltipTable=nil,Risky=ax.Risky,Disabled=ax.Disabled,Visible=ax.Visible,Tween=
nil,Type='SubButton'}ay.Holder=au at.SubButton=ay ay.Base,ay.Stroke=an(ay)av(ay)
ay.UpdateColors=function(az)if w.Unloaded then return end K(ay.Tween)ay.Base.
BackgroundColor3=ay.Disabled and w.Scheme.BackgroundColor or w.Scheme.MainColor
ay.Base.TextTransparency=ay.Disabled and 0.8 or 0.4 ay.Stroke.Transparency=ay.
Disabled and 0.5 or 0 w.Registry[ay.Base].BackgroundColor3=ay.Disabled and
'BackgroundColor'or'MainColor'end ay.SetDisabled=function(az,aA)ay.Disabled=aA
if ay.TooltipTable then ay.TooltipTable.Disabled=ay.Disabled end ay.Base.Active=
not ay.Disabled ay:UpdateColors()end ay.SetVisible=function(az,aA)ay.Visible=aA
ay.Base.Visible=ay.Visible ar:Resize()end ay.SetText=function(az,aA)ay.Text=aA
ay.Base.Text=aA end if typeof(ay.Tooltip)=='string'or typeof(ay.DisabledTooltip)
=='string'then ay.TooltipTable=w:AddTooltip(ay.Tooltip,ay.DisabledTooltip,ay.
Base)ay.TooltipTable.Disabled=ay.Disabled end if ay.Risky then ay.Base.
TextColor3=w.Scheme.Red w.Registry[ay.Base].TextColor3='Red'end ay:UpdateColors(
)if ax.Idx then t[ax.Idx]=ay else table.insert(t,ay)end return ay end at.
UpdateColors=function(aw)if w.Unloaded then return end K(at.Tween)at.Base.
BackgroundColor3=at.Disabled and w.Scheme.BackgroundColor or w.Scheme.MainColor
at.Base.TextTransparency=at.Disabled and 0.8 or 0.4 at.Stroke.Transparency=at.
Disabled and 0.5 or 0 w.Registry[at.Base].BackgroundColor3=at.Disabled and
'BackgroundColor'or'MainColor'end at.SetDisabled=function(aw,ax)at.Disabled=ax
if at.TooltipTable then at.TooltipTable.Disabled=at.Disabled end at.Base.Active=
not at.Disabled at:UpdateColors()end at.SetVisible=function(aw,ax)at.Visible=ax
au.Visible=at.Visible ar:Resize()end at.SetText=function(aw,ax)at.Text=ax at.
Base.Text=ax end if typeof(at.Tooltip)=='string'or typeof(at.DisabledTooltip)==
'string'then at.TooltipTable=w:AddTooltip(at.Tooltip,at.DisabledTooltip,at.Base)
at.TooltipTable.Disabled=at.Disabled end if at.Risky then at.Base.TextColor3=w.
Scheme.Red w.Registry[at.Base].TextColor3='Red'end at:UpdateColors()ar:Resize()
at.Holder=au table.insert(ar.Elements,at)if aq.Idx then t[aq.Idx]=at else table.
insert(t,at)end return at end am.AddCheckbox=function(ao,ap,aq)aq=w:Validate(aq,
y.Toggle)local ar=ao local as,at=ar.Container,{Text=aq.Text,Value=aq.Default,
Tooltip=aq.Tooltip,DisabledTooltip=aq.DisabledTooltip,TooltipTable=nil,Callback=
aq.Callback,Changed=aq.Changed,Risky=aq.Risky,Disabled=aq.Disabled,Visible=aq.
Visible,Addons={},Type='Toggle'}local au=S('TextButton',{Active=not at.Disabled,
BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text='',Visible=at.Visible,
Parent=as})local av=S('TextLabel',{BackgroundTransparency=1,Position=UDim2.
fromOffset(26,0),Size=UDim2.new(1,-26,1,0),Text=at.Text,TextSize=14,
TextTransparency=0.4,TextXAlignment=Enum.TextXAlignment.Left,Parent=au})S(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Right,Padding=UDim.new(0,6),Parent=av})local aw=S(
'Frame',{BackgroundColor3='MainColor',Size=UDim2.fromScale(1,1),SizeConstraint=
Enum.SizeConstraint.RelativeYY,Parent=au})S('UICorner',{CornerRadius=UDim.new(0,
w.CornerRadius/2),Parent=aw})local ax,ay=S('UIStroke',{Color='OutlineColor',
Parent=aw}),S('ImageLabel',{Image=af and af.Url or'',ImageColor3='FontColor',
ImageRectOffset=af and af.ImageRectOffset or Vector2.zero,ImageRectSize=af and
af.ImageRectSize or Vector2.zero,ImageTransparency=1,Position=UDim2.fromOffset(2
,2),Size=UDim2.new(1,-4,1,-4),Parent=aw})at.UpdateColors=function(az)at:Display(
)end at.Display=function(az)if w.Unloaded then return end ax.Transparency=at.
Disabled and 0.5 or 0 if at.Disabled then av.TextTransparency=0.8 ay.
ImageTransparency=at.Value and 0.8 or 1 aw.BackgroundColor3=w.Scheme.
BackgroundColor w.Registry[aw].BackgroundColor3='BackgroundColor'return end k:
Create(av,w.TweenInfo,{TextTransparency=at.Value and 0 or 0.4}):Play()k:Create(
ay,w.TweenInfo,{ImageTransparency=at.Value and 0 or 1}):Play()aw.
BackgroundColor3=w.Scheme.MainColor w.Registry[aw].BackgroundColor3='MainColor'
end at.OnChanged=function(az,aA)at.Changed=aA end at.SetValue=function(az,aA)if
at.Disabled then return end at.Value=aA at:Display()for aB,aC in pairs(at.Addons
)do if aC.Type=='KeyPicker'and aC.SyncToggleState then aC.Toggled=at.Value aC:
Update()end end w:SafeCallback(at.Callback,at.Value)w:SafeCallback(at.Changed,at
.Value)w:UpdateDependencyBoxes()end at.SetDisabled=function(az,aA)at.Disabled=aA
if at.TooltipTable then at.TooltipTable.Disabled=at.Disabled end for aB,aC in
pairs(at.Addons)do if aC.Type=='KeyPicker'and aC.SyncToggleState then aC:Update(
)end end au.Active=not at.Disabled at:Display()end at.SetVisible=function(az,aA)
at.Visible=aA au.Visible=at.Visible ar:Resize()end at.SetText=function(az,aA)at.
Text=aA av.Text=aA end au.MouseButton1Click:Connect(function()if at.Disabled
then return end at:SetValue(not at.Value)end)if typeof(at.Tooltip)=='string'or
typeof(at.DisabledTooltip)=='string'then at.TooltipTable=w:AddTooltip(at.Tooltip
,at.DisabledTooltip,au)at.TooltipTable.Disabled=at.Disabled end if at.Risky then
av.TextColor3=w.Scheme.Red w.Registry[av].TextColor3='Red'end at:Display()ar:
Resize()at.TextLabel=av at.Container=as setmetatable(at,ak)at.Holder=au table.
insert(ar.Elements,at)u[ap]=at return at end am.AddToggle=function(ao,ap,aq)if w
.ForceCheckbox then return am.AddCheckbox(ao,ap,aq)end aq=w:Validate(aq,y.Toggle
)local ar=ao local as,at=ar.Container,{Text=aq.Text,Value=aq.Default,Tooltip=aq.
Tooltip,DisabledTooltip=aq.DisabledTooltip,TooltipTable=nil,Callback=aq.Callback
,Changed=aq.Changed,Risky=aq.Risky,Disabled=aq.Disabled,Visible=aq.Visible,
Addons={},Type='Toggle'}local au=S('TextButton',{Active=not at.Disabled,
BackgroundTransparency=1,Size=UDim2.new(1,0,0,18),Text='',Visible=at.Visible,
Parent=as})local av=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,-40
,1,0),Text=at.Text,TextSize=14,TextTransparency=0.4,TextXAlignment=Enum.
TextXAlignment.Left,Parent=au})S('UIListLayout',{FillDirection=Enum.
FillDirection.Horizontal,HorizontalAlignment=Enum.HorizontalAlignment.Right,
Padding=UDim.new(0,6),Parent=av})local aw=S('Frame',{AnchorPoint=Vector2.new(1,0
),BackgroundColor3='MainColor',Position=UDim2.fromScale(1,0),Size=UDim2.
fromOffset(32,18),Parent=au})S('UICorner',{CornerRadius=UDim.new(1,0),Parent=aw}
)S('UIPadding',{PaddingBottom=UDim.new(0,2),PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,2),PaddingTop=UDim.new(0,2),Parent=aw})local ax,ay=S(
'UIStroke',{Color='OutlineColor',Parent=aw}),S('Frame',{BackgroundColor3=
'FontColor',Size=UDim2.fromScale(1,1),SizeConstraint=Enum.SizeConstraint.
RelativeYY,Parent=aw})S('UICorner',{CornerRadius=UDim.new(1,0),Parent=ay})at.
UpdateColors=function(az)at:Display()end at.Display=function(az)if w.Unloaded
then return end local aA=at.Value and 1 or 0 aw.BackgroundTransparency=at.
Disabled and 0.75 or 0 ax.Transparency=at.Disabled and 0.75 or 0 aw.
BackgroundColor3=at.Value and w.Scheme.AccentColor or w.Scheme.MainColor ax.
Color=at.Value and w.Scheme.AccentColor or w.Scheme.OutlineColor w.Registry[aw].
BackgroundColor3=at.Value and'AccentColor'or'MainColor'w.Registry[ax].Color=at.
Value and'AccentColor'or'OutlineColor'if at.Disabled then av.TextTransparency=
0.8 ay.AnchorPoint=Vector2.new(aA,0)ay.Position=UDim2.fromScale(aA,0)ay.
BackgroundColor3=w:GetDarkerColor(w.Scheme.FontColor)w.Registry[ay].
BackgroundColor3=function()return w:GetDarkerColor(w.Scheme.FontColor)end return
end k:Create(av,w.TweenInfo,{TextTransparency=at.Value and 0 or 0.4}):Play()k:
Create(ay,w.TweenInfo,{AnchorPoint=Vector2.new(aA,0),Position=UDim2.fromScale(aA
,0)}):Play()ay.BackgroundColor3=w.Scheme.FontColor w.Registry[ay].
BackgroundColor3='FontColor'end at.OnChanged=function(az,aA)at.Changed=aA end at
.SetValue=function(az,aA)if at.Disabled then return end at.Value=aA at:Display()
for aB,aC in pairs(at.Addons)do if aC.Type=='KeyPicker'and aC.SyncToggleState
then aC.Toggled=at.Value aC:Update()end end w:SafeCallback(at.Callback,at.Value)
w:SafeCallback(at.Changed,at.Value)w:UpdateDependencyBoxes()end at.SetDisabled=
function(az,aA)at.Disabled=aA if at.TooltipTable then at.TooltipTable.Disabled=
at.Disabled end for aB,aC in pairs(at.Addons)do if aC.Type=='KeyPicker'and aC.
SyncToggleState then aC:Update()end end au.Active=not at.Disabled at:Display()
end at.SetVisible=function(az,aA)at.Visible=aA au.Visible=at.Visible ar:Resize()
end at.SetText=function(az,aA)at.Text=aA av.Text=aA end au.MouseButton1Click:
Connect(function()if at.Disabled then return end at:SetValue(not at.Value)end)if
typeof(at.Tooltip)=='string'or typeof(at.DisabledTooltip)=='string'then at.
TooltipTable=w:AddTooltip(at.Tooltip,at.DisabledTooltip,au)at.TooltipTable.
Disabled=at.Disabled end if at.Risky then av.TextColor3=w.Scheme.Red w.Registry[
av].TextColor3='Red'end at:Display()ar:Resize()at.TextLabel=av at.Container=as
setmetatable(at,ak)at.Holder=au table.insert(ar.Elements,at)u[ap]=at return at
end am.AddInput=function(ao,ap,aq)aq=w:Validate(aq,y.Input)local ar=ao local as,
at=ar.Container,{Text=aq.Text,Value=aq.Default,Finished=aq.Finished,Numeric=aq.
Numeric,ClearTextOnFocus=aq.ClearTextOnFocus,Placeholder=aq.Placeholder,
AllowEmpty=aq.AllowEmpty,EmptyReset=aq.EmptyReset,Tooltip=aq.Tooltip,
DisabledTooltip=aq.DisabledTooltip,TooltipTable=nil,Callback=aq.Callback,Changed
=aq.Changed,Disabled=aq.Disabled,Visible=aq.Visible,Type='Input'}local au=S(
'Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,39),Visible=at.Visible,
Parent=as})local av,aw=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,
0,0,14),Text=at.Text,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Parent=
au}),S('TextBox',{AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor',
BorderColor3='OutlineColor',BorderSizePixel=1,ClearTextOnFocus=not at.Disabled
and at.ClearTextOnFocus,PlaceholderText=at.Placeholder,Position=UDim2.fromScale(
0,1),Size=UDim2.new(1,0,0,21),Text=at.Value,TextEditable=not at.Disabled,
TextScaled=true,TextXAlignment=Enum.TextXAlignment.Left,Parent=au})S('UIPadding'
,{PaddingBottom=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,
8),PaddingTop=UDim.new(0,4),Parent=aw})at.UpdateColors=function(ax)if w.Unloaded
then return end av.TextTransparency=at.Disabled and 0.8 or 0 aw.TextTransparency
=at.Disabled and 0.8 or 0 end at.OnChanged=function(ax,ay)at.Changed=ay end at.
SetValue=function(ax,ay)if not at.AllowEmpty and L(ay)==''then ay=at.EmptyReset
end if aq.MaxLength and#ay>aq.MaxLength then ay=ay:sub(1,aq.MaxLength)end if at.
Numeric then if#ay>0 and not tonumber(ay)then ay=at.Value end end at.Value=ay aw
.Text=ay if not at.Disabled then w:SafeCallback(at.Callback,at.Value)w:
SafeCallback(at.Changed,at.Value)end end at.SetDisabled=function(ax,ay)at.
Disabled=ay if at.TooltipTable then at.TooltipTable.Disabled=at.Disabled end aw.
ClearTextOnFocus=not at.Disabled and at.ClearTextOnFocus aw.TextEditable=not at.
Disabled at:UpdateColors()end at.SetVisible=function(ax,ay)at.Visible=ay au.
Visible=at.Visible ar:Resize()end at.SetText=function(ax,ay)at.Text=ay av.Text=
ay end if at.Finished then aw.FocusLost:Connect(function(ax)if not ax then
return end at:SetValue(aw.Text)end)else aw:GetPropertyChangedSignal'Text':
Connect(function()at:SetValue(aw.Text)end)end if typeof(at.Tooltip)=='string'or
typeof(at.DisabledTooltip)=='string'then at.TooltipTable=w:AddTooltip(at.Tooltip
,at.DisabledTooltip,aw)at.TooltipTable.Disabled=at.Disabled end ar:Resize()at.
Holder=au table.insert(ar.Elements,at)v[ap]=at return at end am.AddSlider=
function(ao,ap,aq)aq=w:Validate(aq,y.Slider)local ar=ao local as,at=ar.Container
,{Text=aq.Text,Value=aq.Default,Min=aq.Min,Max=aq.Max,Prefix=aq.Prefix,Suffix=aq
.Suffix,Compact=aq.Compact,Rounding=aq.Rounding,Tooltip=aq.Tooltip,
DisabledTooltip=aq.DisabledTooltip,TooltipTable=nil,Callback=aq.Callback,Changed
=aq.Changed,Disabled=aq.Disabled,Visible=aq.Visible,Type='Slider'}local au,av=(
S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,aq.Compact and 13 or 31
),Visible=at.Visible,Parent=as}))if not aq.Compact then av=S('TextLabel',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=at.Text,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,Parent=au})end local aw=S('TextButton',{
Active=not at.Disabled,AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor'
,BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.fromScale(0,1),
Size=UDim2.new(1,0,0,13),Text='',Parent=au})local ax=S('TextLabel',{
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextSize=14,ZIndex=2,
Parent=aw})S('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Contextual,Color=
'Dark',LineJoinMode=Enum.LineJoinMode.Miter,Parent=ax})local ay=S('Frame',{
BackgroundColor3='AccentColor',Size=UDim2.fromScale(0.5,1),Parent=aw,DPIExclude=
{Size=true}})at.UpdateColors=function(az)if w.Unloaded then return end if av
then av.TextTransparency=at.Disabled and 0.8 or 0 end ax.TextTransparency=at.
Disabled and 0.8 or 0 ay.BackgroundColor3=at.Disabled and w.Scheme.OutlineColor
or w.Scheme.AccentColor w.Registry[ay].BackgroundColor3=at.Disabled and
'OutlineColor'or'AccentColor'end at.Display=function(az)if w.Unloaded then
return end local aA if aq.FormatDisplayValue then aA=aq.FormatDisplayValue(at,at
.Value)end if aA then ax.Text=tostring(aA)else if aq.Compact then ax.Text=string
.format('%s: %s%s%s',at.Text,at.Prefix,at.Value,at.Suffix)elseif aq.HideMax then
ax.Text=string.format('%s%s%s',at.Prefix,at.Value,at.Suffix)else ax.Text=string.
format('%s%s%s/%s%s%s',at.Prefix,at.Value,at.Suffix,at.Prefix,at.Max,at.Suffix)
end end local aB=(at.Value-at.Min)/(at.Max-at.Min)ay.Size=UDim2.fromScale(aB,1)
end at.OnChanged=function(az,aA)at.Changed=aA end at.SetMax=function(az,aA)
assert(aA>at.Min,'Max value cannot be less than the current min value.')at:
SetValue(math.clamp(at.Value,at.Min,aA))at.Max=aA at:Display()end at.SetMin=
function(az,aA)assert(aA<at.Max,
'Min value cannot be greater than the current max value.')at:SetValue(math.
clamp(at.Value,aA,at.Max))at.Min=aA at:Display()end at.SetValue=function(az,aA)
if at.Disabled then return end local aB=tonumber(aA)if not aB or aB==at.Value
then return end aB=math.clamp(aB,at.Min,at.Max)at.Value=aB at:Display()w:
SafeCallback(at.Callback,at.Value)w:SafeCallback(at.Changed,at.Value)end at.
SetDisabled=function(az,aA)at.Disabled=aA if at.TooltipTable then at.
TooltipTable.Disabled=at.Disabled end aw.Active=not at.Disabled at:UpdateColors(
)end at.SetVisible=function(az,aA)at.Visible=aA au.Visible=at.Visible ar:Resize(
)end at.SetText=function(az,aA)at.Text=aA if av then av.Text=aA return end at:
Display()end at.SetPrefix=function(az,aA)at.Prefix=aA at:Display()end at.
SetSuffix=function(az,aA)at.Suffix=aA at:Display()end aw.InputBegan:Connect(
function(az)if not F(az)or at.Disabled then return end for aA,aB in pairs(w.
ActiveTab.Sides)do aB.ScrollingEnabled=false end while I(az)do local aA=r.X
local aB,aC=math.clamp((aA-aw.AbsolutePosition.X)/aw.AbsoluteSize.X,0,1),at.
Value at.Value=M(at.Min+((at.Max-at.Min)*aB),at.Rounding)at:Display()if at.Value
~=aC then w:SafeCallback(at.Callback,at.Value)w:SafeCallback(at.Changed,at.Value
)end f.RenderStepped:Wait()end for aA,aB in pairs(w.ActiveTab.Sides)do aB.
ScrollingEnabled=true end end)if typeof(at.Tooltip)=='string'or typeof(at.
DisabledTooltip)=='string'then at.TooltipTable=w:AddTooltip(at.Tooltip,at.
DisabledTooltip,aw)at.TooltipTable.Disabled=at.Disabled end at:UpdateColors()at:
Display()ar:Resize()at.Holder=au table.insert(ar.Elements,at)v[ap]=at return at
end am.AddDropdown=function(ao,ap,aq)aq=w:Validate(aq,y.Dropdown)local ar=ao
local as,at=ar.Container,{}if aq.SpecialType=='Player'then aq.Values=N(aq.
ExcludeLocalPlayer)aq.AllowNull=true elseif aq.SpecialType=='Team'then aq.Values
=O()aq.AllowNull=true end local au={Text=typeof(aq.Text)=='string'and aq.Text or
nil,Value=aq.Multi and{}or nil,Values=aq.Values,DisabledValues=aq.DisabledValues
,Multi=aq.Multi,SpecialType=aq.SpecialType,ExcludeLocalPlayer=aq.
ExcludeLocalPlayer,Tooltip=aq.Tooltip,DisabledTooltip=aq.DisabledTooltip,
TooltipTable=nil,Callback=aq.Callback,Changed=aq.Changed,Disabled=aq.Disabled,
Visible=aq.Visible,Type='Dropdown'}local av=S('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,au.Text and 39 or 21),Visible=au.Visible,Parent=as})local
aw,ax=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,14),Text=au.
Text,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,Visible=not not aq.Text
,Parent=av}),S('TextButton',{Active=not au.Disabled,AnchorPoint=Vector2.new(0,1)
,BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
Position=UDim2.fromScale(0,1),Size=UDim2.new(1,0,0,21),Text='---',RichText=aq.
RichText,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.
TextTruncate.AtEnd,Parent=av})S('UIPadding',{PaddingLeft=UDim.new(0,8),
PaddingRight=UDim.new(0,4),Parent=ax})local ay,az=(S('ImageLabel',{AnchorPoint=
Vector2.new(1,0.5),Image=ag and ag.Url or'',ImageColor3='FontColor',
ImageRectOffset=ag and ag.ImageRectOffset or Vector2.zero,ImageRectSize=ag and
ag.ImageRectSize or Vector2.zero,ImageTransparency=0.5,Position=UDim2.fromScale(
1,0.5),Size=UDim2.fromOffset(16,16),Parent=ax}))if aq.Searchable then az=S(
'TextBox',{BackgroundTransparency=1,PlaceholderText='Search...',Position=UDim2.
fromOffset(-8,0),Size=UDim2.new(1,-12,1,0),TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,Visible=false,Parent=ax})S('UIPadding',{PaddingLeft=UDim.
new(0,8),Parent=az})end local aA=w:AddContextMenu(ax,function()return UDim2.
fromOffset(ax.AbsoluteSize.X,0)end,function()return{0.5,ax.AbsoluteSize.Y+1.5}
end,2,function(aA)ax.TextTransparency=(aA and az)and 1 or 0 ay.ImageTransparency
=aA and 0 or 0.5 ay.Rotation=aA and 180 or 0 if az then az.Text=''az.Visible=aA
end end)au.Menu=aA w:UpdateDPI(aA.Menu,{Position=false,Size=false})au.
RecalculateListSize=function(aB,aC)local aD,aE=math.clamp((aC or J(au.Values))*(
21*w.DPIScale),0,aq.MaxVisibleDropdownItems*(21*w.DPIScale)),0 for aF in at do
local aG=l:GetTextSize(aq.RichText and P(aF.Text)or aF.Text,aF.TextSize,aF.Font,
Vector2.new(math.huge,aF.AbsoluteSize.Y))if aG.X>aE then aE=aG.X end end aA:
SetSize(function()return UDim2.fromOffset(math.max(ax.AbsoluteSize.X,aE)+10,aD)
end)end au.UpdateColors=function(aB)if w.Unloaded then return end aw.
TextTransparency=au.Disabled and 0.8 or 0 ax.TextTransparency=au.Disabled and
0.8 or 0 ay.ImageTransparency=au.Disabled and 0.8 or aA.Active and 0 or 0.5 end
au.Display=function(aB)if w.Unloaded then return end local aC=''if aq.Multi then
for aD,aE in pairs(au.Values)do if au.Value[aE]then aC=aC..(aq.
FormatDisplayValue and tostring(aq.FormatDisplayValue(aE))or tostring(aE))..', '
end end aC=aC:sub(1,#aC-2)else aC=au.Value and tostring(au.Value)or''if aC~=''
and aq.FormatDisplayValue then aC=tostring(aq.FormatDisplayValue(aC))end end ax.
Text=(aC==''and'---'or aC)end au.OnChanged=function(aB,aC)au.Changed=aC end au.
GetActiveValues=function(aB)if aq.Multi then local aC={}for aD,aE in pairs(au.
Value)do table.insert(aC,aD)end return aC end return au.Value and 1 or 0 end au.
BuildDropdownList=function(aB)local aC,aD=au.Values,au.DisabledValues if au.
UtilityButtonsHolder then au.UtilityButtonsHolder:Destroy()au.
UtilityButtonsHolder=nil end for aE,aF in pairs(at)do aE:Destroy()end table.
clear(at)local aE=0 if au.Multi and next(au.Values)and(not az or az.Text:len()==
0)then aE=1 local aF=S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,21
),Parent=aA.Menu})au.UtilityButtonsHolder=aF S('UIListLayout',{Parent=aF,Padding
=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Center,VerticalAlignment=Enum.VerticalAlignment.Center}
)local aG=an{Holder=aF,Text='Select All'}aG.Size=UDim2.fromScale(0.45,0.7)local
aH=an{Holder=aF,Text='Unselect All'}aH.Size=UDim2.fromScale(0.45,0.7)aG.
MouseButton1Click:Connect(function()local aI={}for aJ,aK in au.Values do aI[aK]=
true end au:SetValue(aI)end)aH.MouseButton1Click:Connect(function()au:SetValue{}
end)end for aF,aG in pairs(aC)do local aH=aq.FormatDisplayValue and tostring(aq.
FormatDisplayValue(aG))or tostring(aG)local aI=aq.RichText and P(aH)or aH if az
and not tostring(aI):lower():match(az.Text:lower())then continue end aE=aE+1
local aJ,aK=table.find(aD,aG),{}local aL=S('TextButton',{BackgroundColor3=
'MainColor',BackgroundTransparency=1,LayoutOrder=aJ and 1 or 0,Size=UDim2.new(1,
0,0,21),Text=aH,TextSize=14,TextTransparency=0.5,TextXAlignment=Enum.
TextXAlignment.Left,Parent=aA.Menu})S('UIPadding',{PaddingLeft=UDim.new(0,7),
PaddingRight=UDim.new(0,7),Parent=aL})local aM if aq.Multi then aM=au.Value[aG]
else aM=au.Value==aG end aK.UpdateButton=function(aN)if aq.Multi then aM=au.
Value[aG]else aM=au.Value==aG end aL.BackgroundTransparency=aM and 0 or 1 aL.
TextTransparency=aJ and 0.8 or aM and 0 or 0.5 end if not aJ then aL.
MouseButton1Click:Connect(function()local aN=not aM if not(au:GetActiveValues()
==1 and not aN and not aq.AllowNull)then aM=aN if aq.Multi then au.Value[aG]=aM
and true or nil else au.Value=aM and aG or nil end for aO,aP in pairs(at)do aP:
UpdateButton()end end aK:UpdateButton()au:Display()w:SafeCallback(au.Callback,au
.Value)w:SafeCallback(au.Changed,au.Value)w:UpdateDependencyBoxes()end)end aK:
UpdateButton()au:Display()at[aL]=aK end au:RecalculateListSize(aE)end au.
SetValue=function(aB,aC)if aq.Multi then local aD={}for aE,aF in pairs(aC or{})
do if aF and table.find(au.Values,aE)then aD[aE]=true end end au.Value=aD else
if table.find(au.Values,aC)then au.Value=aC elseif not aC then au.Value=nil end
end au:Display()for aD,aE in pairs(at)do aE:UpdateButton()end if not au.Disabled
then w:SafeCallback(au.Callback,au.Value)w:SafeCallback(au.Changed,au.Value)w:
UpdateDependencyBoxes()end end au.SetValues=function(aB,aC)au.Values=aC au:
BuildDropdownList()end au.AddValues=function(aB,aC)if typeof(aC)=='table'then
for aD,aE in pairs(aC)do table.insert(au.Values,aE)end elseif typeof(aC)==
'string'then table.insert(au.Values,aC)else return end au:BuildDropdownList()end
au.SetDisabledValues=function(aB,aC)au.DisabledValues=aC au:BuildDropdownList()
end au.AddDisabledValues=function(aB,aC)if typeof(aC)=='table'then for aD,aE in
pairs(aC)do table.insert(au.DisabledValues,aE)end elseif typeof(aC)=='string'
then table.insert(au.DisabledValues,aC)else return end au:BuildDropdownList()end
au.SetDisabled=function(aB,aC)au.Disabled=aC if au.TooltipTable then au.
TooltipTable.Disabled=au.Disabled end aA:Close()ax.Active=not au.Disabled au:
UpdateColors()end au.SetVisible=function(aB,aC)au.Visible=aC av.Visible=au.
Visible ar:Resize()end au.SetText=function(aB,aC)au.Text=aC av.Size=UDim2.new(1,
0,0,(aC and 39 or 21)*w.DPIScale)aw.Text=aC and aC or''aw.Visible=not not aC end
ax.MouseButton1Click:Connect(function()if au.Disabled then return end aA:Toggle(
)end)if az then az:GetPropertyChangedSignal'Text':Connect(au.BuildDropdownList)
end local aB={}if typeof(aq.Default)=='string'then local aC=table.find(au.Values
,aq.Default)if aC then table.insert(aB,aC)end elseif typeof(aq.Default)=='table'
then for aC,aD in next,aq.Default do local aE=table.find(au.Values,aD)if aE then
table.insert(aB,aE)end end elseif au.Values[aq.Default]~=nil then table.insert(
aB,aq.Default)end if next(aB)then for aC=1,#aB do local aD=aB[aC]if aq.Multi
then au.Value[au.Values[aD] ]=true else au.Value=au.Values[aD]end if not aq.
Multi then break end end end if typeof(au.Tooltip)=='string'or typeof(au.
DisabledTooltip)=='string'then au.TooltipTable=w:AddTooltip(au.Tooltip,au.
DisabledTooltip,ax)au.TooltipTable.Disabled=au.Disabled end au:UpdateColors()au:
Display()au:BuildDropdownList()ar:Resize()au.Holder=av table.insert(ar.Elements,
au)v[ap]=au return au end am.AddViewport=function(ao,ap,aq)aq=w:Validate(aq,y.
Viewport)local ar=ao local as,at,au,av,aw,ax=ar.Container,false,false,0,(aq.
Object)if aq.Clone and typeof(aq.Object)=='Instance'then if aq.Object.Archivable
then aw=aw:Clone()else aq.Object.Archivable=true aw=aw:Clone()aq.Object.
Archivable=false end end local ay={Object=aw,Camera=(not aq.Camera and{(Instance
.new'Camera')}or{(aq.Camera)})[1],Interactive=aq.Interactive,AutoFocus=aq.
AutoFocus,Visible=aq.Visible,Type='Viewport'}assert(typeof(ay.Object)==
'Instance'and(ay.Object:IsA'BasePart'or ay.Object:IsA'Model'),
'Instance must be a BasePart or Model.')assert(typeof(ay.Camera)=='Instance'and
ay.Camera:IsA'Camera','Camera must be a valid Camera instance.')local az=
function(az)if az:IsA'BasePart'then return az.Size end return select(2,az:
GetBoundingBox())end local aA,aB=function()local aA=az(ay.Object)local aB=math.
max(aA.X,aA.Y,aA.Z)local aC,aD=aB*2,ay.Object:GetPivot().Position ay.Camera.
CFrame=CFrame.new(aD+Vector3.new(0,aB/2,aC),aD)end,S('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,aq.Height),Visible=ay.Visible,
Parent=as})local aC=S('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromScale(0,1),Size=UDim2.fromScale(1,1),Parent=aB})S('UIPadding',{PaddingBottom
=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=
UDim.new(0,4),Parent=aC})local aD=S('ViewportFrame',{BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),Parent=aC,CurrentCamera=ay.Camera,Active=ay.
Interactive})aD.MouseEnter:Connect(function()if not ay.Interactive then return
end for aE,aF in pairs(ar.Tab.Sides)do aF.ScrollingEnabled=false end end)aD.
MouseLeave:Connect(function()if not ay.Interactive then return end for aE,aF in
pairs(ar.Tab.Sides)do aF.ScrollingEnabled=true end end)aD.InputBegan:Connect(
function(aE)if not ay.Interactive then return end if aE.UserInputType==Enum.
UserInputType.MouseButton2 then at=true ax=aE.Position elseif aE.UserInputType==
Enum.UserInputType.Touch and not au then at=true ax=aE.Position end end)w:
GiveSignal(h.InputEnded:Connect(function(aE)if not ay.Interactive then return
end if aE.UserInputType==Enum.UserInputType.MouseButton2 then at=false elseif aE
.UserInputType==Enum.UserInputType.Touch then at=false end end))w:GiveSignal(h.
InputChanged:Connect(function(aE)if not ay.Interactive or not at or au then
return end if aE.UserInputType==Enum.UserInputType.MouseMovement or aE.
UserInputType==Enum.UserInputType.Touch then local aF=aE.Position-ax ax=aE.
Position local aG,aH,aI=ay.Object:GetPivot().Position,ay.Camera,CFrame.
fromAxisAngle(Vector3.new(0,1,0),-aF.X*0.01)aH.CFrame=CFrame.new(aG)*aI*CFrame.
new(-aG)*aH.CFrame local aJ=CFrame.fromAxisAngle(aH.CFrame.RightVector,-aF.Y*
0.01)local aK=CFrame.new(aG)*aJ*CFrame.new(-aG)*aH.CFrame if aK.UpVector.Y>0.1
then aH.CFrame=aK end end end))aD.InputChanged:Connect(function(aE)if not ay.
Interactive then return end if aE.UserInputType==Enum.UserInputType.MouseWheel
then local aF=aE.Position.Z*2 do local __DARKLUA_VAR=ay.Camera __DARKLUA_VAR.
CFrame=__DARKLUA_VAR.CFrame+ay.Camera.CFrame.LookVector*aF end end end)w:
GiveSignal(h.TouchPinch:Connect(function(aE,aF,aG,aH)if not ay.Interactive or
not w:MouseIsOverFrame(aD,aE[1])then return end if aH==Enum.UserInputState.Begin
then au=true at=false av=(aE[1]-aE[2]).Magnitude elseif aH==Enum.UserInputState.
Change then local aI=(aE[1]-aE[2]).Magnitude local aJ=(aI-av)*0.1 av=aI do local
__DARKLUA_VAR=ay.Camera __DARKLUA_VAR.CFrame=__DARKLUA_VAR.CFrame+ay.Camera.
CFrame.LookVector*aJ end elseif aH==Enum.UserInputState.End or aH==Enum.
UserInputState.Cancel then au=false end end))ay.Object.Parent=aD if ay.AutoFocus
then aA()end ay.SetObject=function(aE,aF,aG)assert(aF,'Object cannot be nil.')if
aG then aF=aF:Clone()end if ay.Object then ay.Object:Destroy()end ay.Object=aF
ay.Object.Parent=aD ar:Resize()end ay.SetHeight=function(aE,aF)assert(aF>0,
'Height must be greater than 0.')aB.Size=UDim2.new(1,0,0,aF)ar:Resize()end ay.
Focus=function(aE)if not ay.Object then return end aA()end ay.SetCamera=function
(aE,aF)assert(aF and typeof(aF)=='Instance'and aF:IsA'Camera',
'Camera must be a valid Camera instance.')ay.Camera=aF aD.CurrentCamera=aF end
ay.SetInteractive=function(aE,aF)ay.Interactive=aF aD.Active=aF end ay.
SetVisible=function(aE,aF)ay.Visible=aF aB.Visible=ay.Visible ar:Resize()end ar:
Resize()ay.Holder=aB table.insert(ar.Elements,ay)v[ap]=ay return ay end am.
AddImage=function(ao,ap,aq)aq=w:Validate(aq,y.Image)local ar=ao local as,at=ar.
Container,{Image=aq.Image,Color=aq.Color,RectOffset=aq.RectOffset,RectSize=aq.
RectSize,Height=aq.Height,ScaleType=aq.ScaleType,Transparency=aq.Transparency,
Visible=aq.Visible,Type='Image'}local au=S('Frame',{BackgroundTransparency=1,
Size=UDim2.new(1,0,0,aq.Height),Visible=at.Visible,Parent=as})local av=S('Frame'
,{AnchorPoint=Vector2.new(0,1),BackgroundColor3='MainColor',BorderColor3=
'OutlineColor',BorderSizePixel=1,Position=UDim2.fromScale(0,1),Size=UDim2.
fromScale(1,1),Parent=au})S('UIPadding',{PaddingBottom=UDim.new(0,3),PaddingLeft
=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,4),Parent=av})
local aw={BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Image=at.Image,
ImageTransparency=at.Transparency,ImageColor3=at.Color,ImageRectOffset=at.
RectOffset,ImageRectSize=at.RectSize,ScaleType=at.ScaleType,Parent=av}local ax=w
:GetCustomIcon(aw.Image)assert(ax,
[[Image must be a valid Roblox asset or a valid URL or a valid lucide icon.]])aw
.Image=ax.Url aw.ImageRectOffset=ax.ImageRectOffset aw.ImageRectSize=ax.
ImageRectSize local ay=S('ImageLabel',aw)at.SetHeight=function(az,aA)assert(aA>0
,'Height must be greater than 0.')at.Height=aA au.Size=UDim2.new(1,0,0,aA)ar:
Resize()end at.SetImage=function(az,aA)assert(typeof(aA)=='string',
'Image must be a string.')local aB=w:GetCustomIcon(aA)assert(aB,
[[Image must be a valid Roblox asset or a valid URL or a valid lucide icon.]])aA
=aB.Url at.RectOffset=aB.ImageRectOffset at.RectSize=aB.ImageRectSize ay.Image=
aA at.Image=aA end at.SetColor=function(az,aA)assert(typeof(aA)=='Color3',
'Color must be a Color3 value.')ay.ImageColor3=aA at.Color=aA end at.
SetRectOffset=function(az,aA)assert(typeof(aA)=='Vector2',
'RectOffset must be a Vector2 value.')ay.ImageRectOffset=aA at.RectOffset=aA end
at.SetRectSize=function(az,aA)assert(typeof(aA)=='Vector2',
'RectSize must be a Vector2 value.')ay.ImageRectSize=aA at.RectSize=aA end at.
SetScaleType=function(az,aA)assert(typeof(aA)=='EnumItem'and aA:IsA'ScaleType',
'ScaleType must be a valid Enum.ScaleType.')ay.ScaleType=aA at.ScaleType=aA end
at.SetTransparency=function(az,aA)assert(typeof(aA)=='number',
'Transparency must be a number between 0 and 1.')assert(aA>=0 and aA<=1,
'Transparency must be between 0 and 1.')ay.ImageTransparency=aA at.Transparency=
aA end at.SetVisible=function(az,aA)at.Visible=aA au.Visible=at.Visible ar:
Resize()end ar:Resize()at.Holder=au table.insert(ar.Elements,at)v[ap]=at return
at end am.AddVideo=function(ao,ap,aq)aq=w:Validate(aq,y.Video)local ar=ao local
as,at=ar.Container,{Video=aq.Video,Looped=aq.Looped,Playing=aq.Playing,Volume=aq
.Volume,Height=aq.Height,Visible=aq.Visible,Type='Video'}local au=S('Frame',{
BackgroundTransparency=1,Size=UDim2.new(1,0,0,aq.Height),Visible=at.Visible,
Parent=as})local av=S('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,Position=UDim2.
fromScale(0,1),Size=UDim2.fromScale(1,1),Parent=au})S('UIPadding',{PaddingBottom
=UDim.new(0,3),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=
UDim.new(0,4),Parent=av})local aw=S('VideoFrame',{BackgroundTransparency=1,Size=
UDim2.fromScale(1,1),Video=at.Video,Looped=at.Looped,Volume=at.Volume,Parent=av}
)aw.Playing=at.Playing at.SetHeight=function(ax,ay)assert(ay>0,
'Height must be greater than 0.')at.Height=ay au.Size=UDim2.new(1,0,0,ay)ar:
Resize()end at.SetVideo=function(ax,ay)assert(typeof(ay)=='string',
'Video must be a string.')aw.Video=ay at.Video=ay end at.SetLooped=function(ax,
ay)assert(typeof(ay)=='boolean','Looped must be a boolean.')aw.Looped=ay at.
Looped=ay end at.SetVolume=function(ax,ay)assert(typeof(ay)=='number',
'Volume must be a number between 0 and 10.')aw.Volume=ay at.Volume=ay end at.
SetPlaying=function(ax,ay)assert(typeof(ay)=='boolean',
'Playing must be a boolean.')aw.Playing=ay at.Playing=ay end at.Play=function(ax
)aw.Playing=true at.Playing=true end at.Pause=function(ax)aw.Playing=false at.
Playing=false end at.SetVisible=function(ax,ay)at.Visible=ay au.Visible=at.
Visible ar:Resize()end ar:Resize()at.Holder=au at.VideoFrame=aw table.insert(ar.
Elements,at)v[ap]=at return at end am.AddUIPassthrough=function(ao,ap,aq)aq=w:
Validate(aq,y.UIPassthrough)local ar=ao local as=ar.Container assert(aq.Instance
,'Instance must be provided.')assert(typeof(aq.Instance)=='Instance'and aq.
Instance:IsA'GuiBase2d','Instance must inherit from GuiBase2d.')assert(typeof(aq
.Height)=='number'and aq.Height>0,'Height must be a number greater than 0.')
local at={Instance=aq.Instance,Height=aq.Height,Visible=aq.Visible,Type=
'UIPassthrough'}local au=S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,
0,aq.Height),Visible=at.Visible,Parent=as})at.Instance.Parent=au ar:Resize()at.
SetHeight=function(av,aw)assert(typeof(aw)=='number'and aw>0,
'Height must be a number greater than 0.')at.Height=aw au.Size=UDim2.new(1,0,0,
aw)ar:Resize()end at.SetInstance=function(av,aw)assert(aw,
'Instance must be provided.')assert(typeof(aw)=='Instance'and aw:IsA'GuiBase2d',
'Instance must inherit from GuiBase2d.')if at.Instance then at.Instance.Parent=
nil end at.Instance=aw at.Instance.Parent=au end at.SetVisible=function(av,aw)at
.Visible=aw au.Visible=at.Visible ar:Resize()end at.Holder=au table.insert(ar.
Elements,at)v[ap]=at return at end am.AddDependencyBox=function(ao)local ap=ao
local aq,ar,as=(ap.Container)do ar=S('Frame',{BackgroundTransparency=1,Size=
UDim2.fromScale(1,1),Visible=false,Parent=aq})as=S('UIListLayout',{Padding=UDim.
new(0,8),Parent=ar})end local at={Visible=false,Dependencies={},Holder=ar,
Container=ar,Elements={},DependencyBoxes={}}at.Resize=function(au)ar.Size=UDim2.
new(1,0,0,as.AbsoluteContentSize.Y*w.DPIScale)ap:Resize()end at.Update=function(
au,av)for aw,ax in pairs(at.Dependencies)do local ay,az=ax[1],ax[2]if ay.Type==
'Toggle'and ay.Value~=az then ar.Visible=false at.Visible=false return elseif ay
.Type=='Dropdown'then if typeof(ay.Value)=='table'then if not ay.Value[az]then
ar.Visible=false at.Visible=false return end else if ay.Value~=az then ar.
Visible=false at.Visible=false return end end end end at.Visible=true ar.Visible
=true if not w.Searching then at:Resize()elseif not av then w:UpdateSearch(w.
SearchText)end end at.SetupDependencies=function(au,av)for aw,ax in pairs(av)do
assert(typeof(ax)=='table','Dependency should be a table.')assert(ax[1]~=nil,
'Dependency is missing element.')assert(ax[2]~=nil,
'Dependency is missing expected value.')end at.Dependencies=av at:Update()end ar
:GetPropertyChangedSignal'Visible':Connect(function()at:Resize()end)
setmetatable(at,al)table.insert(ap.DependencyBoxes,at)table.insert(w.
DependencyBoxes,at)return at end am.AddDependencyGroupbox=function(ao)local ap=
ao local aq,ar=ap.Tab,ap.BoxHolder local as=w:MakeOutline(ar,w.CornerRadius)as.
Size=UDim2.fromScale(1,0)as.Visible=false w:UpdateDPI(as,{Size=false})local at,
au do at=S('Frame',{BackgroundColor3='BackgroundColor',Position=UDim2.
fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=as})S('UICorner',{CornerRadius=
UDim.new(0,w.CornerRadius-1),Parent=at})au=S('UIListLayout',{Padding=UDim.new(0,
8),Parent=at})S('UIPadding',{PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0,
7),PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=at})end local av={
Visible=false,Dependencies={},BoxHolder=ar,Holder=as,Container=at,Tab=aq,
Elements={},DependencyBoxes={}}av.Resize=function(aw)as.Size=UDim2.new(1,0,0,au.
AbsoluteContentSize.Y+18*w.DPIScale)end av.Update=function(aw,ax)for ay,az in
pairs(av.Dependencies)do local aA,aB=az[1],az[2]if aA.Type=='Toggle'and aA.Value
~=aB then as.Visible=false av.Visible=false return elseif aA.Type=='Dropdown'
then if typeof(aA.Value)=='table'then if not aA.Value[aB]then as.Visible=false
av.Visible=false return end else if aA.Value~=aB then as.Visible=false av.
Visible=false return end end end end av.Visible=true if not w.Searching then as.
Visible=true av:Resize()elseif not ax then w:UpdateSearch(w.SearchText)end end
av.SetupDependencies=function(aw,ax)for ay,az in pairs(ax)do assert(typeof(az)==
'table','Dependency should be a table.')assert(az[1]~=nil,
'Dependency is missing element.')assert(az[2]~=nil,
'Dependency is missing expected value.')end av.Dependencies=ax av:Update()end
setmetatable(av,al)table.insert(aq.DependencyGroupboxes,av)table.insert(w.
DependencyBoxes,av)return av end al.__index=am al.__namecall=function(ao,ap,...)
return am[ap](...)end end w.SetFont=function(am,an)if typeof(an)=='EnumItem'then
an=Font.fromEnum(an)end w.Scheme.Font=an w:UpdateColorsUsingRegistry()end w.
SetNotifySide=function(am,an)w.NotifySide=an if an:lower()=='left'then Y.
AnchorPoint=Vector2.new(0,0)Y.Position=UDim2.fromOffset(6,6)Z.
HorizontalAlignment=Enum.HorizontalAlignment.Left else Y.AnchorPoint=Vector2.
new(1,0)Y.Position=UDim2.new(1,-6,0,6)Z.HorizontalAlignment=Enum.
HorizontalAlignment.Right end end w.Notify=function(am,...)local an,ao={},
select(1,...)if typeof(ao)=='table'then an.Title=tostring(ao.Title)an.
Description=tostring(ao.Description)an.Time=ao.Time or 5 an.SoundId=ao.SoundId
an.Steps=ao.Steps an.Persist=ao.Persist else an.Description=tostring(ao)an.Time=
select(2,...)or 5 an.SoundId=select(3,...)end an.Destroyed=false local ap,aq=
false if typeof(an.Time)=='Instance'then aq=an.Time.Destroying:Connect(function(
)ap=true aq:Disconnect()aq=nil end)end local ar=S('Frame',{AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.fromScale(1,0),Visible=false
,Parent=Y,DPIExclude={Size=true}})local as=w:MakeOutline(ar,w.CornerRadius,5)as.
AutomaticSize=Enum.AutomaticSize.Y as.Position=w.NotifySide:lower()=='left'and
UDim2.new(-1,-6,0,-2)or UDim2.new(1,6,0,-2)as.Size=UDim2.fromScale(1,0)w:
UpdateDPI(as,{Position=false,Size=false})local at=S('Frame',{BackgroundColor3=
'MainColor',Position=UDim2.fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=as})
S('UICorner',{CornerRadius=UDim.new(0,w.CornerRadius-1),Parent=at})S(
'UIListLayout',{Padding=UDim.new(0,4),Parent=at})S('UIPadding',{PaddingBottom=
UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=
UDim.new(0,8),Parent=at})local au,av,aw,ax,ay=0,0 if an.Title then aw=S(
'TextLabel',{BackgroundTransparency=1,Text=an.Title,TextSize=15,TextXAlignment=
Enum.TextXAlignment.Left,TextWrapped=true,Parent=at,DPIExclude={Size=true}})end
if an.Description then ax=S('TextLabel',{BackgroundTransparency=1,Text=an.
Description,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true
,Parent=at,DPIExclude={Size=true}})end an.Resize=function(az)if aw then local aA
,aB=w:GetTextBounds(aw.Text,aw.FontFace,aw.TextSize,Y.AbsoluteSize.X-(24*w.
DPIScale))aw.Size=UDim2.fromOffset(math.ceil(aA),aB)au=aA end if ax then local
aA,aB=w:GetTextBounds(ax.Text,ax.FontFace,ax.TextSize,Y.AbsoluteSize.X-(24*w.
DPIScale))ax.Size=UDim2.fromOffset(math.ceil(aA),aB)av=aA end ar.Size=UDim2.
fromOffset((au>av and au or av)+(24*w.DPIScale),0)end an.ChangeTitle=function(az
,aA)if aw then an.Title=tostring(aA)aw.Text=an.Title an:Resize()end end an.
ChangeDescription=function(az,aA)if ax then an.Description=tostring(aA)ax.Text=
an.Description an:Resize()end end an.ChangeStep=function(az,aA)if ay and an.
Steps then aA=math.clamp(aA or 0,0,an.Steps)ay.Size=UDim2.fromScale(aA/an.Steps,
1)end end an.Destroy=function(az)an.Destroyed=true if aq then aq:Disconnect()end
k:Create(as,w.NotifyTweenInfo,{Position=w.NotifySide:lower()=='left'and UDim2.
new(-1,-6,0,-2)or UDim2.new(1,6,0,-2)}):Play()task.delay(w.NotifyTweenInfo.Time,
function()w.Notifications[ar]=nil ar:Destroy()end)end an:Resize()local az=S(
'Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,7),Visible=(an.Persist~=
true and typeof(an.Time)~='Instance')or typeof(an.Steps)=='number',Parent=at})
local aA=S('Frame',{BackgroundColor3='BackgroundColor',BorderColor3=
'OutlineColor',BorderSizePixel=1,Position=UDim2.fromOffset(0,3),Size=UDim2.new(1
,0,0,2),Parent=az})ay=S('Frame',{BackgroundColor3='AccentColor',Size=UDim2.
fromScale(1,1),Parent=aA})if typeof(an.Time)=='Instance'then ay.Size=UDim2.
fromScale(0,1)end if an.SoundId then local aB=an.SoundId if typeof(aB)=='number'
then aB=string.format('rbxassetid://%d',aB)end S('Sound',{SoundId=aB,Volume=3,
PlayOnRemove=true,Parent=g}):Destroy()end w.Notifications[ar]=an ar.Visible=true
k:Create(as,w.NotifyTweenInfo,{Position=UDim2.fromOffset(-2,-2)}):Play()task.
delay(w.NotifyTweenInfo.Time,function()if an.Persist then return elseif typeof(
an.Time)=='Instance'then repeat task.wait()until ap or an.Destroyed else k:
Create(ay,TweenInfo.new(an.Time,Enum.EasingStyle.Linear,Enum.EasingDirection.
InOut),{Size=UDim2.fromScale(0,1)}):Play()task.wait(an.Time)end if not an.
Destroyed then an:Destroy()end end)return an end w.CreateWindow=function(am,an)
an=w:Validate(an,y.Window)local ao=workspace.CurrentCamera.ViewportSize if f:
IsStudio()and ao.X<=5 and ao.Y<=5 then repeat ao=workspace.CurrentCamera.
ViewportSize task.wait()until ao.X>5 and ao.Y>5 end local ap,aq=ao.X-64,ao.Y-64
w.MinSize=Vector2.new(math.min(w.MinSize.X,ap),math.min(w.MinSize.Y,aq))an.Size=
UDim2.fromOffset(math.clamp(an.Size.X.Offset,w.MinSize.X,ap),math.clamp(an.Size.
Y.Offset,w.MinSize.Y,aq))if typeof(an.Font)=='EnumItem'then an.Font=Font.
fromEnum(an.Font)end w.CornerRadius=an.CornerRadius w:SetNotifySide(an.
NotifySide)w.ShowCustomCursor=an.ShowCustomCursor w.Scheme.Font=an.Font w.
ToggleKeybind=an.ToggleKeybind local ar,as,at,au,av,aw,ax,ay,az,aA,aB,aC=an.
SearchbarSize==UDim2.fromScale(1,1),an.SidebarHighlightCallback,{IsCompact=an.
Compact,MinWidth=an.SidebarMinWidth,CompactWidth=an.SidebarCompactWidth,
MinContentWidth=an.MinContentWidth or 260,CollapseThreshold=an.
SidebarCollapseThreshold,CurrentWidth=nil,LastExpandedWidth=nil,MaxWidth=nil,
GrabberHighlighted=false}if at.MinWidth<=at.CompactWidth then at.MinWidth=at.
CompactWidth+32 end if at.CollapseThreshold<=0 then at.CollapseThreshold=0.5
elseif at.CollapseThreshold>=1 then at.CollapseThreshold=0.9 end local aD=math.
max(an.Size.X.Offset,at.MinWidth+at.MinContentWidth)local aE=an.
InitialSidebarWidth or math.floor(aD*(an.InitialSidebarScale or 0.3))at.
CurrentWidth=math.max(at.MinWidth,aE)at.LastExpandedWidth=at.CurrentWidth local
aF,aG,aH,aI,aJ={DividerLine=nil,TitleHolder=nil,WindowIcon=nil,WindowTitle=nil,
RightWrapper=nil,TabsFrame=nil,ContainerFrame=nil,SidebarGrabber=nil,TabPadding=
{},TabLabels={}},(aj and 38)or 0,{Active=false,StartWidth=0,StartX=0,TouchId=nil
},function()return at.IsCompact and at.CompactWidth or at.CurrentWidth end,
function()local aF=au and au.AbsoluteSize.X or an.Size.X.Offset if aF<=0 then
return end local aG=aF-at.MinContentWidth at.MaxWidth=math.max(at.MinWidth,aG)at
.CurrentWidth=math.clamp(at.CurrentWidth,at.MinWidth,at.MaxWidth)at.
LastExpandedWidth=math.clamp(at.LastExpandedWidth or at.CurrentWidth,at.MinWidth
,at.MaxWidth)end local aK=function(aK)local aL=aF.DividerLine if not aL then
return end at.GrabberHighlighted=aK==true if typeof(as)=='function'then w:
SafeCallback(as,aL,at.GrabberHighlighted)else local aM=at.GrabberHighlighted and
Q(w.Scheme.OutlineColor)or w.Scheme.OutlineColor k:Create(aL,w.TweenInfo,{
BackgroundColor3=aM}):Play()end end local aL=function()aJ()local aL,aM=aI(),at.
IsCompact if aF.DividerLine then aF.DividerLine.Position=UDim2.new(0,aL,0,0)end
if aF.TabsFrame then aF.TabsFrame.Size=UDim2.new(0,aL,1,-70)end if aF.
ContainerFrame then aF.ContainerFrame.Position=UDim2.fromOffset(aL,49)aF.
ContainerFrame.Size=UDim2.new(1,-aL,1,-70)end if aF.SidebarGrabber then aF.
SidebarGrabber.Position=UDim2.fromOffset(aL-aF.SidebarGrabber.Size.X.Offset/2,49
)end if aF.TitleHolder then aF.TitleHolder.Size=UDim2.new(0,math.max(at.
CompactWidth,aL),1,0)end if aF.WindowIcon then if an.Icon then aF.WindowIcon.
Visible=true else aF.WindowIcon.Visible=aM or not aF.WindowTitle end end if aF.
WindowTitle then aF.WindowTitle.Visible=not aM if not aM then local aN=math.max(
0,aL-(an.Icon and an.IconSize.X.Offset+12 or 12))local aO=w:GetTextBounds(aF.
WindowTitle.Text,w.Scheme.Font,20,aN)aF.WindowTitle.Size=UDim2.new(0,aO,1,0)else
aF.WindowTitle.Size=UDim2.new(0,0,1,0)end end if aF.RightWrapper then local aN=
aL+8 aF.RightWrapper.Position=UDim2.new(0,aN,0.5,0)aF.RightWrapper.Size=UDim2.
new(1,-aN-8-aG,1,-16)end for aN,aO in ipairs(aF.TabPadding)do aO.PaddingLeft=
UDim.new(0,aM and 14 or 12)aO.PaddingRight=UDim.new(0,aM and 14 or 12)aO.
PaddingTop=UDim.new(0,aM and 7 or 11)aO.PaddingBottom=UDim.new(0,aM and 7 or 11)
end for aN,aO in ipairs(aF.TabLabels)do aO.Visible=not aM end aK(at.
GrabberHighlighted)an.Compact=at.IsCompact for aN,aO in pairs(w.Tabs)do if aO.
RefreshSides then aO:RefreshSides()end end end local aM=function(aM)aJ()aM=aM or
at.CurrentWidth local aN,aO=at.MinWidth*at.CollapseThreshold,at.IsCompact if aM
<=aN then if not aO then at.LastExpandedWidth=at.CurrentWidth end at.IsCompact=
true else local aP=aM if aO then aP=math.max(aM,at.MinWidth)end at.CurrentWidth=
math.clamp(aP,at.MinWidth,at.MaxWidth)at.LastExpandedWidth=at.CurrentWidth at.
IsCompact=false end aL()end do w.KeybindFrame,w.KeybindContainer=w:
AddDraggableMenu'Keybinds'w.KeybindFrame.AnchorPoint=Vector2.new(0,0.5)w.
KeybindFrame.Position=UDim2.new(0,6,0.5,0)w.KeybindFrame.Visible=false w:
UpdateDPI(w.KeybindFrame,{Position=false,Size=false})au=S('TextButton',{
BackgroundColor3=function()return w:GetBetterColor(w.Scheme.BackgroundColor,-1)
end,Name='Main',Text='',Position=an.Position,Size=an.Size,Visible=false,Parent=V
,DPIExclude={Position=true}})S('UICorner',{CornerRadius=UDim.new(0,an.
CornerRadius-1),Parent=au})local aN=aI()aF.DividerLine=w:MakeLine(au,{Position=
UDim2.new(0,aN,0,0),Size=UDim2.new(0,1,1,-21),ZIndex=2})local aO={{Position=
UDim2.fromOffset(0,48),Size=UDim2.new(1,0,0,1)},{AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,-20),Size=UDim2.new(1,0,0,1)}}for aP,_ in pairs(aO)do w
:MakeLine(au,_)end w:MakeOutline(au,an.CornerRadius,0)if an.BackgroundImage then
S('ImageLabel',{Image=an.BackgroundImage,Position=UDim2.fromScale(0,0),Size=
UDim2.fromScale(1,1),ScaleType=Enum.ScaleType.Stretch,ZIndex=999,
BackgroundTransparency=1,ImageTransparency=0.75,Parent=au})end if an.Center then
au.Position=UDim2.new(0.5,-au.Size.X.Offset/2,0.5,-au.Size.Y.Offset/2)end local
aP=S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,48),Parent=au})w:
MakeDraggable(au,aP,false,true)local _=S('Frame',{BackgroundTransparency=1,Size=
UDim2.new(0,math.max(at.CompactWidth,aN),1,0),Parent=aP})S('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=Enum.
HorizontalAlignment.Center,VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,6),Parent=_})aF.TitleHolder=_ local aQ if an.Icon then aQ=S(
'ImageButton',{Image=(tonumber(an.Icon)and{(string.format('rbxassetid://%d',an.
Icon))}or{(an.Icon)})[1],Size=an.IconSize,BackgroundTransparency=1,Parent=_})
else aQ=S('TextButton',{Text=an.Title:sub(1,1),TextScaled=true,Size=an.IconSize,
BackgroundTransparency=1,Parent=_})end aQ.Visible=an.Icon~=nil or at.IsCompact
aF.WindowIcon=aQ local aR=S('TextButton',{BackgroundTransparency=1,Text=an.Title
,TextSize=20,Visible=not at.IsCompact,Parent=_})if not at.IsCompact then local
aS=math.max(0,aN-(an.Icon and an.IconSize.X.Offset+12 or 12))local aT=w:
GetTextBounds(aR.Text,w.Scheme.Font,20,aS)aR.Size=UDim2.new(0,aT,1,0)else aR.
Size=UDim2.new(0,0,1,0)end aF.WindowTitle=aR local aS=S('Frame',{
BackgroundTransparency=1,AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,aN+
8,0.5,0),Size=UDim2.new(1,-(aN+16+aG),1,-16),Parent=aP})aF.RightWrapper=aS S(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,
Padding=UDim.new(0,8),Parent=aS})aw=S('Frame',{Size=UDim2.fromScale(an.
DisableSearch and 1 or 0.5,1),Visible=false,BackgroundTransparency=1,Parent=aS})
S('UIFlexItem',{FlexMode=Enum.UIFlexMode.Grow,Parent=aw})S('UIListLayout',{
FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=
aw})S('UIPadding',{PaddingBottom=UDim.new(0,8),PaddingLeft=UDim.new(0,2),
PaddingRight=UDim.new(0,8),PaddingTop=UDim.new(0,8),Parent=aw})ax=S('TextLabel',
{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),AutomaticSize=Enum.
AutomaticSize.Y,Text='',TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
Parent=aw})ay=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.fromScale(1,0),
AutomaticSize=Enum.AutomaticSize.Y,Text='',TextWrapped=true,TextSize=14,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=0.5,Parent=aw})av=S(
'TextBox',{BackgroundColor3='MainColor',PlaceholderText='Search',Size=an.
SearchbarSize,TextScaled=true,Visible=not(an.DisableSearch or false),Parent=aS})
S('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=av})S('UICorner',{
CornerRadius=UDim.new(0,an.CornerRadius),Parent=av})S('UIPadding',{PaddingBottom
=UDim.new(0,8),PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),PaddingTop=
UDim.new(0,8),Parent=av})S('UIStroke',{Color='OutlineColor',Parent=av})local aT=
w:GetIcon'search'if aT then S('ImageLabel',{Image=aT.Url,ImageColor3='FontColor'
,ImageRectOffset=aT.ImageRectOffset,ImageRectSize=aT.ImageRectSize,
ImageTransparency=0.5,Size=UDim2.fromScale(1,1),SizeConstraint=Enum.
SizeConstraint.RelativeYY,Parent=av})end if aj then S('ImageLabel',{AnchorPoint=
Vector2.new(1,0.5),Image=aj.Url,ImageColor3='OutlineColor',ImageRectOffset=aj.
ImageRectOffset,ImageRectSize=aj.ImageRectSize,Position=UDim2.new(1,-10,0.5,0),
Size=UDim2.fromOffset(28,28),SizeConstraint=Enum.SizeConstraint.RelativeYY,
Parent=aP})end local aU=S('Frame',{AnchorPoint=Vector2.new(0,1),BackgroundColor3
=function()return w:GetBetterColor(w.Scheme.BackgroundColor,4)end,Position=UDim2
.fromScale(0,1),Size=UDim2.new(1,0,0,20),Parent=au})do local aV=w:MakeCover(aU,
'Top')w:AddToRegistry(aV,{BackgroundColor3=function()return w:GetBetterColor(w.
Scheme.BackgroundColor,4)end})end S('UICorner',{CornerRadius=UDim.new(0,an.
CornerRadius-1),Parent=aU})S('TextLabel',{BackgroundTransparency=1,Size=UDim2.
fromScale(1,1),Text=an.Footer,TextSize=14,TextTransparency=0.5,Parent=aU})if an.
Resizable then az=S('TextButton',{AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,Position=UDim2.fromScale(1,0),Size=UDim2.fromScale(1,1)
,SizeConstraint=Enum.SizeConstraint.RelativeYY,Text='',Parent=aU})w:
MakeResizable(au,az,function()aJ()aL()for aV,aW in pairs(w.Tabs)do aW:Resize(
true)end end)end S('ImageLabel',{Image=ah and ah.Url or'',ImageColor3=
'FontColor',ImageRectOffset=ah and ah.ImageRectOffset or Vector2.zero,
ImageRectSize=ah and ah.ImageRectSize or Vector2.zero,ImageTransparency=0.5,
Position=UDim2.fromOffset(2,2),Size=UDim2.new(1,-4,1,-4),Parent=az})w:
GiveSignal(au:GetPropertyChangedSignal'AbsoluteSize':Connect(function()aJ()aL()
end))aA=S('ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundColor3='BackgroundColor',CanvasSize=UDim2.fromScale(0,0),Position=
UDim2.fromOffset(0,49),ScrollBarThickness=0,Size=UDim2.new(0,aN,1,-70),Parent=au
})S('UIListLayout',{Parent=aA})aF.TabsFrame=aA aB=S('Frame',{AnchorPoint=Vector2
.new(0,0),BackgroundColor3=function()return w:GetBetterColor(w.Scheme.
BackgroundColor,1)end,Name='Container',Position=UDim2.fromOffset(aN,49),Size=
UDim2.new(1,-aN,1,-70),Parent=au})S('UIPadding',{PaddingBottom=UDim.new(0,0),
PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=UDim.new(0,0),
Parent=aB})aF.ContainerFrame=aB if an.EnableSidebarResize then local aV=S(
'TextButton',{AutoButtonColor=false,BackgroundTransparency=1,Text='',Size=UDim2.
new(0,12,1,-70),Position=UDim2.fromOffset(aN-6,49),ZIndex=5,Parent=au})aF.
SidebarGrabber=aV aV.MouseEnter:Connect(function()if w.Toggled then aK(true)end
end)aV.MouseLeave:Connect(function()if not aH.Active then aK(false)end end)w:
GiveSignal(aV.InputBegan:Connect(function(aW)if not w.Toggled then return end if
aW.UserInputType~=Enum.UserInputType.MouseButton1 and aW.UserInputType~=Enum.
UserInputType.Touch then return end aH.Active=true aH.StartWidth=aI()aH.StartX=
aW.Position.X aH.TouchId=aW.UserInputType==Enum.UserInputType.Touch and aW or
nil aK(true)local aX aX=w:GiveSignal(aW.Changed:Connect(function()if aW.
UserInputState==Enum.UserInputState.End then aH.Active=false aH.TouchId=nil
local aY=w:MouseIsOverFrame(aV,Vector2.new(r.X,r.Y))aK(aY and w.Toggled)if aX
then aX:Disconnect()end end end))end))w:GiveSignal(h.InputChanged:Connect(
function(aW)if not aH.Active then return end if not w.Toggled then aH.Active=
false aH.TouchId=nil aK(false)return end if aW.UserInputType==Enum.UserInputType
.MouseMovement or aW==aH.TouchId then local aX=aW.Position.X-aH.StartX aM(aH.
StartWidth+aX)end end))w:GiveSignal(h.InputEnded:Connect(function(aW)if not aH.
Active then return end if aW.UserInputType==Enum.UserInputType.MouseButton1 or
aW.UserInputType==Enum.UserInputType.Touch or aW==aH.TouchId then aH.Active=
false aH.TouchId=nil local aX=w:MouseIsOverFrame(aV,Vector2.new(r.X,r.Y))aK(aX
and w.Toggled)end end))aK(false)end task.defer(function()aJ()aL()end)end aC={}aC
.GetSidebarWidth=function(aN)return aI()end aC.IsSidebarCompacted=function(aN)
return at.IsCompact end aC.SetSidebarWidth=function(aN,aO)aM(aO)end aC.
SetCompact=function(aN,aO)assert(typeof(aO)=='boolean','State must be a boolean'
)local aP=at.MinWidth*at.CollapseThreshold if aO then aM(aP*0.5)else aM(at.
LastExpandedWidth or at.CurrentWidth or at.MinWidth)end end aC.ApplyLayout=
function(aN)aL()end aC.AddTab=function(aN,...)local aO,aP,aQ if select('#',...)
==1 and typeof(...)=='table'then local aR=select(1,...)aO=aR.Name or'Tab'aP=aR.
Icon aQ=aR.Description else aO=select(1,...)aP=select(2,...)aQ=select(3,...)end
local aR,aS,aT,aU,aV,aW,aX,aY,_,aZ,a_ aP=w:GetCustomIcon(aP)do aR=S('TextButton'
,{BackgroundColor3='MainColor',BackgroundTransparency=1,Size=UDim2.new(1,0,0,40)
,Text='',Parent=aA})local a0=S('UIPadding',{PaddingBottom=UDim.new(0,at.
IsCompact and 7 or 11),PaddingLeft=UDim.new(0,at.IsCompact and 14 or 12),
PaddingRight=UDim.new(0,at.IsCompact and 14 or 12),PaddingTop=UDim.new(0,at.
IsCompact and 7 or 11),Parent=aR})table.insert(aF.TabPadding,a0)aS=S('TextLabel'
,{BackgroundTransparency=1,Position=UDim2.fromOffset(30,0),Size=UDim2.new(1,-30,
1,0),Text=aO,TextSize=16,TextTransparency=0.5,TextXAlignment=Enum.TextXAlignment
.Left,Visible=not at.IsCompact,Parent=aR})table.insert(aF.TabLabels,aS)if aP
then aT=S('ImageLabel',{Image=aP.Url,ImageColor3=aP.Custom and'White'or
'AccentColor',ImageRectOffset=aP.ImageRectOffset,ImageRectSize=aP.ImageRectSize,
ImageTransparency=0.5,Size=UDim2.fromScale(1,1),SizeConstraint=Enum.
SizeConstraint.RelativeYY,Parent=aR})end aU=S('Frame',{BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),Visible=false,Parent=aB})aV=S('ScrollingFrame',{
AutomaticCanvasSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,CanvasSize=
UDim2.fromScale(0,0),ScrollBarThickness=0,Parent=aU})S('UIListLayout',{Padding=
UDim.new(0,6),Parent=aV})do S('Frame',{BackgroundTransparency=1,LayoutOrder=-1,
Parent=aV})S('Frame',{BackgroundTransparency=1,LayoutOrder=1,Parent=aV})aV.Size=
UDim2.new(0,math.floor(aU.AbsoluteSize.X/2)-3,1,0)w:UpdateDPI(aV,{Size=aV.Size})
end aW=S('ScrollingFrame',{AnchorPoint=Vector2.new(1,0),AutomaticCanvasSize=Enum
.AutomaticSize.Y,BackgroundTransparency=1,CanvasSize=UDim2.fromScale(0,0),
Position=UDim2.fromScale(1,0),ScrollBarThickness=0,Parent=aU})S('UIListLayout',{
Padding=UDim.new(0,6),Parent=aW})do S('Frame',{BackgroundTransparency=1,
LayoutOrder=-1,Parent=aW})S('Frame',{BackgroundTransparency=1,LayoutOrder=1,
Parent=aW})aW.Size=UDim2.new(0,math.floor(aU.AbsoluteSize.X/2)-3,1,0)w:
UpdateDPI(aW,{Size=aW.Size})end aX=S('Frame',{AutomaticSize=Enum.AutomaticSize.Y
,BackgroundColor3=Color3.fromRGB(127,0,0),BorderColor3=Color3.fromRGB(255,50,50)
,BorderMode=Enum.BorderMode.Inset,BorderSizePixel=1,Position=UDim2.fromOffset(0,
6),Size=UDim2.fromScale(1,0),Visible=false,Parent=aU})aY=S('ScrollingFrame',{
BackgroundTransparency=1,BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,-3),Size=UDim2.new(1,0,1,-3),CanvasSize=UDim2.new(0
,0,0,0),ScrollBarThickness=3,Parent=aX})S('UIPadding',{PaddingBottom=UDim.new(0,
4),PaddingLeft=UDim.new(0,6),PaddingRight=UDim.new(0,6),PaddingTop=UDim.new(0,4)
,Parent=aY})_=S('TextLabel',{BackgroundTransparency=1,Size=UDim2.new(1,-4,0,14),
Text='',TextColor3=Color3.fromRGB(255,50,50),TextSize=14,TextXAlignment=Enum.
TextXAlignment.Left,Parent=aY})a_=S('UIStroke',{ApplyStrokeMode=Enum.
ApplyStrokeMode.Contextual,Color=Color3.fromRGB(169,0,0),LineJoinMode=Enum.
LineJoinMode.Miter,Parent=_})aZ=S('TextLabel',{BackgroundTransparency=1,Position
=UDim2.fromOffset(0,16),Size=UDim2.new(1,-4,0,0),Text='',TextSize=14,TextWrapped
=true,Parent=aY,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.
TextYAlignment.Top})S('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.
Contextual,Color='Dark',LineJoinMode=Enum.LineJoinMode.Miter,Parent=aZ})end
local a0={Groupboxes={},Tabboxes={},DependencyGroupboxes={},Sides={aV,aW},
WarningBox={IsNormal=false,LockSize=false,Visible=false,Title='WARNING',Text=''}
}a0.UpdateWarningBox=function(a1,a2)if typeof(a2.IsNormal)=='boolean'then a0.
WarningBox.IsNormal=a2.IsNormal end if typeof(a2.LockSize)=='boolean'then a0.
WarningBox.LockSize=a2.LockSize end if typeof(a2.Visible)=='boolean'then a0.
WarningBox.Visible=a2.Visible end if typeof(a2.Title)=='string'then a0.
WarningBox.Title=a2.Title end if typeof(a2.Text)=='string'then a0.WarningBox.
Text=a2.Text end aX.Visible=a0.WarningBox.Visible _.Text=a0.WarningBox.Title aZ.
Text=a0.WarningBox.Text a0:Resize(true)aX.BackgroundColor3=a0.WarningBox.
IsNormal==true and w.Scheme.BackgroundColor or Color3.fromRGB(127,0,0)aX.
BorderColor3=a0.WarningBox.IsNormal==true and w.Scheme.OutlineColor or Color3.
fromRGB(255,50,50)_.TextColor3=a0.WarningBox.IsNormal==true and w.Scheme.
FontColor or Color3.fromRGB(255,50,50)a_.Color=a0.WarningBox.IsNormal==true and
w.Scheme.OutlineColor or Color3.fromRGB(169,0,0)if not w.Registry[aX]then w:
AddToRegistry(aX,{})end if not w.Registry[_]then w:AddToRegistry(_,{})end if not
w.Registry[a_]then w:AddToRegistry(a_,{})end w.Registry[aX].BackgroundColor3=
function()return a0.WarningBox.IsNormal==true and w.Scheme.BackgroundColor or
Color3.fromRGB(127,0,0)end w.Registry[aX].BorderColor3=function()return a0.
WarningBox.IsNormal==true and w.Scheme.OutlineColor or Color3.fromRGB(255,50,50)
end w.Registry[_].TextColor3=function()return a0.WarningBox.IsNormal==true and w
.Scheme.FontColor or Color3.fromRGB(255,50,50)end w.Registry[a_].Color=function(
)return a0.WarningBox.IsNormal==true and w.Scheme.OutlineColor or Color3.
fromRGB(169,0,0)end end a0.RefreshSides=function(a1)local a2=aX.Visible and aX.
AbsoluteSize.Y+6 or 0 for a3,a4 in pairs(a0.Sides)do a4.Position=UDim2.new(a4.
Position.X.Scale,0,0,a2)a4.Size=UDim2.new(0,math.floor(aU.AbsoluteSize.X/2)-3,1,
-a2)w:UpdateDPI(a4,{Position=a4.Position,Size=a4.Size})end end a0.Resize=
function(a1,a2)if a2 then local a3,a4,a5=math.floor(aU.AbsoluteSize.Y/3.25),w:
GetTextBounds(aZ.Text,w.Scheme.Font,aZ.TextSize,aZ.AbsoluteSize.X)local a6=24+a5
if a0.WarningBox.LockSize==true and a6>=a3 then aY.CanvasSize=UDim2.fromOffset(0
,a6)a6=a3 else aY.CanvasSize=UDim2.fromOffset(0,0)end aZ.Size=UDim2.new(1,-4,0,
a5)w:UpdateDPI(aZ,{Size=aZ.Size})aX.Size=UDim2.new(1,0,0,a6)w:UpdateDPI(aX,{Size
=aX.Size})end a0:RefreshSides()end a0.AddGroupbox=function(a1,a2)local a3=S(
'Frame',{AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.
fromScale(1,0),Parent=a2.Side==1 and aV or aW})S('UIListLayout',{Padding=UDim.
new(0,6),Parent=a3})local a4=w:MakeOutline(a3,an.CornerRadius)a4.Size=UDim2.
fromScale(1,0)w:UpdateDPI(a4,{Size=false})local a5,a6,a7,a8 do a5=S('Frame',{
BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(2,2),Size=UDim2.
new(1,-4,1,-4),Parent=a4})S('UICorner',{CornerRadius=UDim.new(0,an.CornerRadius-
1),Parent=a5})w:MakeLine(a5,{Position=UDim2.fromOffset(0,34),Size=UDim2.new(1,0,
0,1)})local a9=w:GetCustomIcon(a2.IconName)if a9 then S('ImageLabel',{Image=a9.
Url,ImageColor3=a9.Custom and'White'or'AccentColor',ImageRectOffset=a9.
ImageRectOffset,ImageRectSize=a9.ImageRectSize,Position=UDim2.fromOffset(6,6),
Size=UDim2.fromOffset(22,22),Parent=a5})end a6=S('TextLabel',{
BackgroundTransparency=1,Position=UDim2.fromOffset(a9 and 24 or 0,0),Size=UDim2.
new(1,0,0,34),Text=a2.Name,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,
Parent=a5})S('UIPadding',{PaddingLeft=UDim.new(0,12),PaddingRight=UDim.new(0,12)
,Parent=a6})a7=S('Frame',{BackgroundTransparency=1,Position=UDim2.fromOffset(0,
35),Size=UDim2.new(1,0,1,-35),Parent=a5})a8=S('UIListLayout',{Padding=UDim.new(0
,8),Parent=a7})S('UIPadding',{PaddingBottom=UDim.new(0,7),PaddingLeft=UDim.new(0
,7),PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=a7})end local a9=
{BoxHolder=a3,Holder=a4,Container=a7,Tab=a0,DependencyBoxes={},Elements={}}a9.
Resize=function(ba)a4.Size=UDim2.new(1,0,0,a8.AbsoluteContentSize.Y+53*w.
DPIScale)end setmetatable(a9,al)a9:Resize()a0.Groupboxes[a2.Name]=a9 return a9
end a0.AddLeftGroupbox=function(a1,a2,a3)return a0:AddGroupbox{Side=1,Name=a2,
IconName=a3}end a0.AddRightGroupbox=function(a1,a2,a3)return a0:AddGroupbox{Side
=2,Name=a2,IconName=a3}end a0.AddTabbox=function(a1,a2)local a3=S('Frame',{
AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,Size=UDim2.
fromScale(1,0),Parent=a2.Side==1 and aV or aW})S('UIListLayout',{Padding=UDim.
new(0,6),Parent=a3})local a4=w:MakeOutline(a3,an.CornerRadius)a4.Size=UDim2.
fromScale(1,0)w:UpdateDPI(a4,{Size=false})local a5,a6 do a5=S('Frame',{
BackgroundColor3='BackgroundColor',Position=UDim2.fromOffset(2,2),Size=UDim2.
new(1,-4,1,-4),Parent=a4})S('UICorner',{CornerRadius=UDim.new(0,an.CornerRadius-
1),Parent=a5})a6=S('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,34),
Parent=a5})S('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=a6})end local a7={ActiveTab=nil,
BoxHolder=a3,Holder=a4,Tabs={}}a7.AddTab=function(a8,a9)local ba=S('TextButton',
{BackgroundColor3='MainColor',BackgroundTransparency=0,Size=UDim2.fromOffset(0,
34),Text=a9,TextSize=15,TextTransparency=0.5,Parent=a6})local bb,bc=w:MakeLine(
ba,{AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,0,1,1),Size=UDim2.new(1,0,
0,1)}),S('Frame',{BackgroundTransparency=1,Position=UDim2.fromOffset(0,35),Size=
UDim2.new(1,0,1,-35),Visible=false,Parent=a5})local bd=S('UIListLayout',{Padding
=UDim.new(0,8),Parent=bc})S('UIPadding',{PaddingBottom=UDim.new(0,7),PaddingLeft
=UDim.new(0,7),PaddingRight=UDim.new(0,7),PaddingTop=UDim.new(0,7),Parent=bc})
local be={ButtonHolder=ba,Container=bc,Tab=a0,Elements={},DependencyBoxes={}}be.
Show=function(bf)if a7.ActiveTab then a7.ActiveTab:Hide()end ba.
BackgroundTransparency=1 ba.TextTransparency=0 bb.Visible=false bc.Visible=true
a7.ActiveTab=be be:Resize()end be.Hide=function(bf)ba.BackgroundTransparency=0
ba.TextTransparency=0.5 bb.Visible=true bc.Visible=false a7.ActiveTab=nil end be
.Resize=function(bf)if a7.ActiveTab~=be then return end a4.Size=UDim2.new(1,0,0,
bd.AbsoluteContentSize.Y+53*w.DPIScale)end if not a7.ActiveTab then be:Show()end
ba.MouseButton1Click:Connect(be.Show)setmetatable(be,al)a7.Tabs[a9]=be return be
end if a2.Name then a0.Tabboxes[a2.Name]=a7 else table.insert(a0.Tabboxes,a7)end
return a7 end a0.AddLeftTabbox=function(a1,a2)return a0:AddTabbox{Side=1,Name=a2
}end a0.AddRightTabbox=function(a1,a2)return a0:AddTabbox{Side=2,Name=a2}end a0.
Hover=function(a1,a2)if w.ActiveTab==a0 then return end k:Create(aS,w.TweenInfo,
{TextTransparency=a2 and 0.25 or 0.5}):Play()if aT then k:Create(aT,w.TweenInfo,
{ImageTransparency=a2 and 0.25 or 0.5}):Play()end end a0.Show=function(a1)if w.
ActiveTab then w.ActiveTab:Hide()end k:Create(aR,w.TweenInfo,{
BackgroundTransparency=0}):Play()k:Create(aS,w.TweenInfo,{TextTransparency=0}):
Play()if aT then k:Create(aT,w.TweenInfo,{ImageTransparency=0}):Play()end if aQ
then aw.Visible=true if ar then av.Size=UDim2.fromScale(0.5,1)end ax.Text=aO ay.
Text=aQ end aU.Visible=true a0:RefreshSides()w.ActiveTab=a0 if w.Searching then
w:UpdateSearch(w.SearchText)end end a0.Hide=function(a1)k:Create(aR,w.TweenInfo,
{BackgroundTransparency=1}):Play()k:Create(aS,w.TweenInfo,{TextTransparency=0.5}
):Play()if aT then k:Create(aT,w.TweenInfo,{ImageTransparency=0.5}):Play()end aU
.Visible=false if ar then av.Size=UDim2.fromScale(1,1)end aw.Visible=false w.
ActiveTab=nil end if not w.ActiveTab then a0:Show()end aR.MouseEnter:Connect(
function()a0:Hover(true)end)aR.MouseLeave:Connect(function()a0:Hover(false)end)
aR.MouseButton1Click:Connect(a0.Show)w.Tabs[aO]=a0 return a0 end aC.AddKeyTab=
function(aN,aO)local aP,aQ,aR,aS do aP=S('TextButton',{BackgroundColor3=
'MainColor',BackgroundTransparency=1,Size=UDim2.new(1,0,0,40),Text='',Parent=aA}
)local aT=S('UIPadding',{PaddingBottom=UDim.new(0,at.IsCompact and 7 or 11),
PaddingLeft=UDim.new(0,at.IsCompact and 14 or 12),PaddingRight=UDim.new(0,at.
IsCompact and 14 or 12),PaddingTop=UDim.new(0,at.IsCompact and 7 or 11),Parent=
aP})table.insert(aF.TabPadding,aT)aQ=S('TextLabel',{BackgroundTransparency=1,
Position=UDim2.fromOffset(30,0),Size=UDim2.new(1,-30,1,0),Text=aO,TextSize=16,
TextTransparency=0.5,TextXAlignment=Enum.TextXAlignment.Left,Visible=not at.
IsCompact,Parent=aP})table.insert(aF.TabLabels,aQ)if ai then aR=S('ImageLabel',{
Image=ai.Url,ImageColor3='AccentColor',ImageRectOffset=ai.ImageRectOffset,
ImageRectSize=ai.ImageRectSize,ImageTransparency=0.5,Size=UDim2.fromScale(1,1),
SizeConstraint=Enum.SizeConstraint.RelativeYY,Parent=aP})end aS=S(
'ScrollingFrame',{AutomaticCanvasSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,CanvasSize=UDim2.fromScale(0,0),ScrollBarThickness=0,
Size=UDim2.fromScale(1,1),Visible=false,Parent=aB})S('UIListLayout',{
HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,8),
VerticalAlignment=Enum.VerticalAlignment.Center,Parent=aS})S('UIPadding',{
PaddingLeft=UDim.new(0,1),PaddingRight=UDim.new(0,1),Parent=aS})end local aT={
Elements={},IsKeyTab=true}aT.AddKeyBox=function(aU,...)local aV,aW={},select(1,
...)if typeof(aW)=='function'then aV.Callback=aW else aV.ExpectedKey=aW aV.
Callback=select(2,...)end local aX=S('Frame',{BackgroundTransparency=1,Size=
UDim2.new(0.75,0,0,21),Parent=aS})local aY=S('TextBox',{BackgroundColor3=
'MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,PlaceholderText='Key',
Size=UDim2.new(1,-71,1,0),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
Parent=aX})S('UIPadding',{PaddingLeft=UDim.new(0,8),PaddingRight=UDim.new(0,8),
Parent=aY})local aZ=S('TextButton',{AnchorPoint=Vector2.new(1,0),
BackgroundColor3='MainColor',BorderColor3='OutlineColor',BorderSizePixel=1,
Position=UDim2.fromScale(1,0),Size=UDim2.new(0,63,1,0),Text='Execute',TextSize=
14,Parent=aX})aZ.MouseButton1Click:Connect(function()if aV.ExpectedKey and aY.
Text~=aV.ExpectedKey then aV.Callback(false,aY.Text)return end aV.Callback(true,
aY.Text)end)end aT.RefreshSides=function(aU)end aT.Resize=function(aU)end aT.
Hover=function(aU,aV)if w.ActiveTab==aT then return end k:Create(aQ,w.TweenInfo,
{TextTransparency=aV and 0.25 or 0.5}):Play()if aR then k:Create(aR,w.TweenInfo,
{ImageTransparency=aV and 0.25 or 0.5}):Play()end end aT.Show=function(aU)if w.
ActiveTab then w.ActiveTab:Hide()end k:Create(aP,w.TweenInfo,{
BackgroundTransparency=0}):Play()k:Create(aQ,w.TweenInfo,{TextTransparency=0}):
Play()if aR then k:Create(aR,w.TweenInfo,{ImageTransparency=0}):Play()end aS.
Visible=true w.ActiveTab=aT end aT.Hide=function(aU)k:Create(aP,w.TweenInfo,{
BackgroundTransparency=1}):Play()k:Create(aQ,w.TweenInfo,{TextTransparency=0.5})
:Play()if aR then k:Create(aR,w.TweenInfo,{ImageTransparency=0.5}):Play()end aS.
Visible=false w.ActiveTab=nil end if not w.ActiveTab then aT:Show()end aP.
MouseEnter:Connect(function()aT:Hover(true)end)aP.MouseLeave:Connect(function()
aT:Hover(false)end)aP.MouseButton1Click:Connect(aT.Show)aT.Container=aS
setmetatable(aT,al)w.Tabs[aO]=aT return aT end w.Toggle=function(aN,aO)if
typeof(aO)=='boolean'then w.Toggled=aO else w.Toggled=not w.Toggled end au.
Visible=w.Toggled if an.UnlockMouseWhileOpen then W.Modal=w.Toggled end if w.
Toggled and not w.IsMobile then local aP=h.MouseIconEnabled pcall(function()f:
UnbindFromRenderStep'ShowCursor'end)f:BindToRenderStep('ShowCursor',Enum.
RenderPriority.Last.Value,function()h.MouseIconEnabled=not w.ShowCustomCursor X.
Position=UDim2.fromOffset(r.X,r.Y)X.Visible=w.ShowCustomCursor if not(w.Toggled
and V and V.Parent)then h.MouseIconEnabled=aP X.Visible=false f:
UnbindFromRenderStep'ShowCursor'end end)elseif not w.Toggled then aK(false)ad.
Visible=false for aP,aQ in pairs(w.Options)do if aQ.Type=='ColorPicker'then aQ.
ColorMenu:Close()aQ.ContextMenu:Close()elseif aQ.Type=='Dropdown'or aQ.Type==
'KeyPicker'then aQ.Menu:Close()end end end end if an.AutoShow then task.spawn(w.
Toggle)end if w.IsMobile then local aN,aO=w:AddDraggableButton('Toggle',function
()w:Toggle()end),w:AddDraggableButton('Lock',function(aN)w.CantDragForced=not w.
CantDragForced aN:SetText(w.CantDragForced and'Unlock'or'Lock')end)if an.
MobileButtonsSide=='Right'then aN.Button.Position=UDim2.new(1,-6,0,6)aN.Button.
AnchorPoint=Vector2.new(1,0)aO.Button.Position=UDim2.new(1,-6,0,46)aO.Button.
AnchorPoint=Vector2.new(1,0)else aO.Button.Position=UDim2.fromOffset(6,46)end
end av:GetPropertyChangedSignal'Text':Connect(function()w:UpdateSearch(av.Text)
end)w:GiveSignal(h.InputBegan:Connect(function(aN)if h:GetFocusedTextBox()then
return end if(typeof(w.ToggleKeybind)=='table'and w.ToggleKeybind.Type==
'KeyPicker'and aN.KeyCode.Name==w.ToggleKeybind.Value)or aN.KeyCode==w.
ToggleKeybind then w.Toggle()end end))w:GiveSignal(h.WindowFocused:Connect(
function()w.IsRobloxFocused=true end))w:GiveSignal(h.WindowFocusReleased:
Connect(function()w.IsRobloxFocused=false end))return aC end local am,an=
function()local am,an=N(),N(true)for ao,ap in pairs(v)do if ap.Type=='Dropdown'
and ap.SpecialType=='Player'then ap:SetValues(ap.ExcludeLocalPlayer and an or am
)end end end,function()local am=O()for an,ao in pairs(v)do if ao.Type==
'Dropdown'and ao.SpecialType=='Team'then ao:SetValues(am)end end end w:
GiveSignal(e.PlayerAdded:Connect(am))w:GiveSignal(e.PlayerRemoving:Connect(am))w
:GiveSignal(j.ChildAdded:Connect(an))w:GiveSignal(j.ChildRemoved:Connect(an))m()
.Library=w return w end end)()end,[12]=function()a(12)return(function(...)return
function(aa)local ab=(cloneref or clonereference or function(ab)return ab end)
local ac,ad,ae,af=ab(game:GetService'HttpService'),isfolder,isfile,listfiles if
typeof(copyfunction)=='function'then local ag,ah,ai=copyfunction(ad),
copyfunction(ae),copyfunction(af)local aj,ak=pcall(function()return ag('test'..
tostring(math.random(1000000,9999999)))end)if aj==false or typeof(ak)~='boolean'
then ad=function(al)local am,an=pcall(ag,al)return((am and{an}or{false})[1])end
ae=function(al)local am,an=pcall(ah,al)return((am and{an}or{false})[1])end af=
function(al)local am,an=pcall(ai,al)return((am and{an}or{{}})[1])end end end
local ag={}do ag.Folder='ObsidianLibSettings'ag.SubFolder=''ag.Ignore={}ag.
Library=nil ag.Parser={Toggle={Save=function(ah,ai)return{type='Toggle',idx=ah,
value=ai.Value}end,Load=function(ah,ai)local aj=ag.Library.Toggles[ah]if aj and
aj.Value~=ai.value then aj:SetValue(ai.value)end end},Slider={Save=function(ah,
ai)return{type='Slider',idx=ah,value=tostring(ai.Value)}end,Load=function(ah,ai)
local aj=ag.Library.Options[ah]if aj and aj.Value~=ai.value then aj:SetValue(ai.
value)end end},Dropdown={Save=function(ah,ai)return{type='Dropdown',idx=ah,value
=ai.Value,mutli=ai.Multi}end,Load=function(ah,ai)local aj=ag.Library.Options[ah]
if aj and aj.Value~=ai.value then aj:SetValue(ai.value)end end},ColorPicker={
Save=function(ah,ai)return{type='ColorPicker',idx=ah,value=ai.Value:ToHex(),
transparency=ai.Transparency}end,Load=function(ah,ai)if ag.Library.Options[ah]
then ag.Library.Options[ah]:SetValueRGB(Color3.fromHex(ai.value),ai.transparency
)end end},KeyPicker={Save=function(ah,ai)return{type='KeyPicker',idx=ah,mode=ai.
Mode,key=ai.Value,modifiers=ai.Modifiers}end,Load=function(ah,ai)if ag.Library.
Options[ah]then ag.Library.Options[ah]:SetValue{ai.key,ai.mode,ai.modifiers}end
end},Input={Save=function(ah,ai)return{type='Input',idx=ah,text=ai.Value}end,
Load=function(ah,ai)local aj=ag.Library.Options[ah]if aj and aj.Value~=ai.text
and type(ai.text)=='string'then ag.Library.Options[ah]:SetValue(ai.text)end end}
}ag.SetLibrary=function(ah,ai)ah.Library=ai end ag.IgnoreThemeSettings=function(
ah)ah:SetIgnoreIndexes{'BackgroundColor','MainColor','AccentColor',
'OutlineColor','FontColor','FontFace','ThemeManager_ThemeList',
'ThemeManager_CustomThemeList','ThemeManager_CustomThemeName'}end ag.
CheckSubFolder=function(ah,ai)if typeof(ah.SubFolder)~='string'or ah.SubFolder==
''then return false end if ai==true then if not ad(ah.Folder..'/settings/'..ah.
SubFolder)then makefolder(ah.Folder..'/settings/'..ah.SubFolder)end end return
true end ag.GetPaths=function(ah)local ai,aj={},ah.Folder:split'/'for ak=1,#aj
do local al=table.concat(aj,'/',1,ak)if not table.find(ai,al)then ai[#ai+1]=al
end end ai[#ai+1]=ah.Folder..'/themes'ai[#ai+1]=ah.Folder..'/settings'if ah:
CheckSubFolder(false)then local ak=ah.Folder..'/settings/'..ah.SubFolder aj=ak:
split'/'for al=1,#aj do local am=table.concat(aj,'/',1,al)if not table.find(ai,
am)then ai[#ai+1]=am end end end return ai end ag.BuildFolderTree=function(ah)
local ai=ah:GetPaths()for aj=1,#ai do local ak=ai[aj]if ad(ak)then continue end
makefolder(ak)end end ag.CheckFolderTree=function(ah)if ad(ah.Folder)then return
end ag:BuildFolderTree()task.wait(0.1)end ag.SetIgnoreIndexes=function(ah,ai)for
aj,ak in pairs(ai)do ah.Ignore[ak]=true end end ag.SetFolder=function(ah,ai)ah.
Folder=ai ah:BuildFolderTree()end ag.SetSubFolder=function(ah,ai)ah.SubFolder=ai
ah:BuildFolderTree()end ag.Save=function(ah,ai)if(not ai)then return false,
'no config file is selected'end ag:CheckFolderTree()local aj=ah.Folder..
'/settings/'..ai..'.json'if ag:CheckSubFolder(true)then aj=ah.Folder..
'/settings/'..ah.SubFolder..'/'..ai..'.json'end local ak={objects={}}for al,am
in pairs(ah.Library.Toggles)do if not am.Type then continue end if not ah.Parser
[am.Type]then continue end if ah.Ignore[al]then continue end table.insert(ak.
objects,ah.Parser[am.Type].Save(al,am))end for al,am in pairs(ah.Library.Options
)do if not am.Type then continue end if not ah.Parser[am.Type]then continue end
if ah.Ignore[al]then continue end table.insert(ak.objects,ah.Parser[am.Type].
Save(al,am))end local al,am=pcall(ac.JSONEncode,ac,ak)if not al then return
false,'failed to encode data'end writefile(aj,am)return true end ag.Load=
function(ah,ai)if(not ai)then return false,'no config file is selected'end ag:
CheckFolderTree()local aj=ah.Folder..'/settings/'..ai..'.json'if ag:
CheckSubFolder(true)then aj=ah.Folder..'/settings/'..ah.SubFolder..'/'..ai..
'.json'end if not ae(aj)then return false,'invalid file'end local ak,al=pcall(ac
.JSONDecode,ac,readfile(aj))if not ak then return false,'decode error'end for am
,an in pairs(al.objects)do if not an.type then continue end if not ah.Parser[an.
type]then continue end task.spawn(ah.Parser[an.type].Load,an.idx,an)end return
true end ag.Delete=function(ah,ai)if(not ai)then return false,
'no config file is selected'end local aj=ah.Folder..'/settings/'..ai..'.json'if
ag:CheckSubFolder(true)then aj=ah.Folder..'/settings/'..ah.SubFolder..'/'..ai..
'.json'end if not ae(aj)then return false,'invalid file'end local ak=pcall(
delfile,aj)if not ak then return false,'delete file error'end return true end ag
.RefreshConfigList=function(ah)local ai,aj=pcall(function()ag:CheckFolderTree()
local ai,aj={},{}if ag:CheckSubFolder(true)then ai=af(ah.Folder..'/settings/'..
ah.SubFolder)else ai=af(ah.Folder..'/settings')end if typeof(ai)~='table'then ai
={}end for ak=1,#ai do local al=ai[ak]if al:sub(-5)=='.json'then local am=al:
find('.json',1,true)local an,ao=am,al:sub(am,am)while ao~='/'and ao~='\\'and ao
~=''do am=am-1 ao=al:sub(am,am)end if ao=='/'or ao=='\\'then table.insert(aj,al:
sub(am+1,an-1))end end end return aj end)if(not ai)then if ah.Library then ah.
Library:Notify('Failed to load config list: '..tostring(aj))else warn(
'Failed to load config list: '..tostring(aj))end return{}end return aj end ag.
GetAutoloadConfig=function(ah)ag:CheckFolderTree()local ai=ah.Folder..
'/settings/autoload.txt'if ag:CheckSubFolder(true)then ai=ah.Folder..
'/settings/'..ah.SubFolder..'/autoload.txt'end if ae(ai)then local aj,ak=pcall(
readfile,ai)if not aj then return'none'end ak=tostring(ak)return ak==''and'none'
or ak end return'none'end ag.LoadAutoloadConfig=function(ah)ag:CheckFolderTree()
local ai=ah.Folder..'/settings/autoload.txt'if ag:CheckSubFolder(true)then ai=ah
.Folder..'/settings/'..ah.SubFolder..'/autoload.txt'end if ae(ai)then local aj,
ak=pcall(readfile,ai)if not aj then return ah.Library:Notify
'Failed to load autoload config: write file error'end local al,am=ah:Load(ak)if
not al then return ah.Library:Notify('Failed to load autoload config: '..am)end
ah.Library:Notify(string.format('Auto loaded config %q',ak))end end ag.
SaveAutoloadConfig=function(ah,ai)ag:CheckFolderTree()local aj=ah.Folder..
'/settings/autoload.txt'if ag:CheckSubFolder(true)then aj=ah.Folder..
'/settings/'..ah.SubFolder..'/autoload.txt'end local ak=pcall(writefile,aj,ai)if
not ak then return false,'write file error'end return true,''end ag.
DeleteAutoLoadConfig=function(ah)ag:CheckFolderTree()local ai=ah.Folder..
'/settings/autoload.txt'if ag:CheckSubFolder(true)then ai=ah.Folder..
'/settings/'..ah.SubFolder..'/autoload.txt'end local aj=pcall(delfile,ai)if not
aj then return false,'delete file error'end return true,''end ag.
BuildConfigSection=function(ah,ai)assert(ah.Library,
'Must set SaveManager.Library')local aj=ai:AddRightGroupbox('Configuration',
'folder-cog')aj:AddInput('SaveManager_ConfigName',{Text='Config name'})aj:
AddButton('Create config',function()local ak=ah.Library.Options.
SaveManager_ConfigName.Value if ak:gsub(' ','')==''then return ah.Library:
Notify('Invalid config name (empty)',2)end local al,am=ah:Save(ak)if not al then
return ah.Library:Notify('Failed to create config: '..am)end ah.Library:Notify(
string.format('Created config %q',ak))ah.Library.Options.SaveManager_ConfigList:
SetValues(ah:RefreshConfigList())ah.Library.Options.SaveManager_ConfigList:
SetValue(nil)end)aj:AddDivider()aj:AddDropdown('SaveManager_ConfigList',{Text=
'Config list',Values=ah:RefreshConfigList(),AllowNull=true})aj:AddButton(
'Load config',function()local ak=ah.Library.Options.SaveManager_ConfigList.Value
local al,am=ah:Load(ak)if not al then return ah.Library:Notify(
'Failed to load config: '..am)end ah.Library:Notify(string.format(
'Loaded config %q',ak))end)aj:AddButton('Overwrite config',function()local ak=ah
.Library.Options.SaveManager_ConfigList.Value local al,am=ah:Save(ak)if not al
then return ah.Library:Notify('Failed to overwrite config: '..am)end ah.Library:
Notify(string.format('Overwrote config %q',ak))end)aj:AddButton('Delete config',
function()local ak=ah.Library.Options.SaveManager_ConfigList.Value local al,am=
ah:Delete(ak)if not al then return ah.Library:Notify('Failed to delete config: '
..am)end ah.Library:Notify(string.format('Deleted config %q',ak))ah.Library.
Options.SaveManager_ConfigList:SetValues(ah:RefreshConfigList())ah.Library.
Options.SaveManager_ConfigList:SetValue(nil)end)aj:AddButton('Refresh list',
function()ah.Library.Options.SaveManager_ConfigList:SetValues(ah:
RefreshConfigList())ah.Library.Options.SaveManager_ConfigList:SetValue(nil)end)
aj:AddButton('Set as autoload',function()local ak=ah.Library.Options.
SaveManager_ConfigList.Value local al,am=ah:SaveAutoloadConfig(ak)if not al then
return ah.Library:Notify('Failed to set autoload config: '..am)end ag.
AutoloadLabel:SetText('Current autoload config: '..ak)ah.Library:Notify(string.
format('Set %q to auto load',ak))end)aj:AddButton('Reset autoload',function()
local ak,al=ah:DeleteAutoLoadConfig()if not ak then return ah.Library:Notify(
'Failed to set autoload config: '..al)end ah.Library:Notify
'Set autoload to none'ag.AutoloadLabel:SetText'Current autoload config: none'end
)ah.AutoloadLabel=aj:AddLabel('Current autoload config: '..ah:GetAutoloadConfig(
),true)ah:SetIgnoreIndexes{'SaveManager_ConfigList','SaveManager_ConfigName'}end
ag:BuildFolderTree()end return ag end end)()end,[13]=function()local aa,ab=a(13)
return(function(...)return function(ac)return ac.new(ac):Extend(ac.Extensions.
Children(ab))end end)()end,[14]=function()a(14)return(function(...)return
function(aa)local ab=aa:Get'Constants'local ac,ad,ae,af,ag,ah=ab.Characters,aa:
Get'Modules/Places',aa:Get'Modules/Color',aa:Get'Functions/Time',aa:Get
'Functions/Numbers',aa:Get'Functions/PromptDiscord'return function(ai)local aj,
ak,al,am=aa:Get'Modules/Interface'.GetInterface'Obsidian',ad.GetPlaceFromId(game
.PlaceId),ab.LRM_Constants,ai:AddGroupbox{Side=1,Name='Information',IconName=
'info'}am:AddLabel('PlaytimeLabel',{Text='Playtime: nil',DoesWrap=true})am:
AddLabel('LuaHeapLabel',{Text='Lua Memory Heap: nil',DoesWrap=true})local an,ao,
ap=ai:AddGroupbox{Side=2,Name='User Information',IconName='circle-user-round'},(
al.SecondsLeft==-1)or(al.SecondsLeft==math.huge),af.now()+al.SecondsLeft an:
AddLabel('KeyExpiryLabel',{Text=string.format('Key Expiry: %s',tostring(ao and
'Never!'or af.FormatTime(ap,'MM/DD/YYYY HH:mm'))),DoesWrap=true})an:AddLabel(
'TotalExecutionsLabel',{Text=string.format('Total Executions: %s',tostring(ag.
Comma(al.TotalExecutions))),DoesWrap=true})an:AddLabel('UserNoteLabel',{Text=
string.format('User Note: %s',tostring(al.UserNote)),DoesWrap=true})local aq,ar=
ai:AddGroupbox{Side=2,Name='Credits',IconName='list'},{}for as,at in ak.Credits
or{}do table.insert(ar,string.format('%s %s - %s',tostring(ac.BulletPoint),
tostring(at.Name),tostring(at.Role)))end aq:AddLabel('CreditsLabel',{Text=table.
concat(ar,'\n'),DoesWrap=true})aq:AddDivider()aq:AddButton('JoinDiscordButton',{
Text='Join Discord Server',Func=function()ah(ab.DiscordInviteCode,true)aj.Main:
Notify{Title='strelizia.cc',Description=
'successfully copied/prompted discord join code!'}end})end end end)()end,[15]=
function()a(15)return(function(...)return function(aa)local ab=aa:Get
'Modules/Places'return function(ac)local ad,ae=aa:Get'Modules/Interface'.
GetInterface'Obsidian',ab.GetPlaceFromId(game.PlaceId)local af,ag,ah,ai=ad.Main,
ad.SaveManager,ad.ThemeManager,ac:AddGroupbox{Side=1,Name='Menu',IconName=
'wrench'}ai:AddToggle('KeybindMenuOpen',{Default=af.KeybindFrame.Visible,Text=
'Open Keybind Menu',Callback=function(aj)af.KeybindFrame.Visible=aj end})ai:
AddToggle('ShowCustomCursor',{Text='Custom Cursor',Default=true,Callback=
function(aj)af.ShowCustomCursor=aj end})ai:AddDropdown('NotificationSide',{
Values={'Left','Right'},Default='Right',Text='Notification Side',Callback=
function(aj)af:SetNotifySide(aj)end})ai:AddDropdown('DPIDropdown',{Values={'50%'
,'75%','100%','125%','150%','175%','200%'},Default='100%',Text='DPI Scale',
Callback=function(aj)aj=aj:gsub('%%','')local ak=tonumber(aj)af:SetDPIScale(ak)
end})ai:AddDivider()ai:AddLabel'Menu bind':AddKeyPicker('MenuKeybind',{Default=
'RightShift',NoUI=true,Text='Menu keybind'})ai:AddButton('Unload',function()af:
Unload()end)af.ToggleKeybind=af.Options.MenuKeybind ah:SetLibrary(af)ag:
SetLibrary(af)ag:IgnoreThemeSettings()ag:SetIgnoreIndexes{'MenuKeybind'}ah:
SetFolder'strelizia'ag:SetFolder(string.format('strelizia/%s',tostring(ae.Name))
)ag:BuildConfigSection(ac)ah:ApplyToTab(ac)ag:LoadAutoloadConfig()end end end)()
end,[16]=function()a(16)return(function(...)return function(aa)local ab=(
cloneref or clonereference or function(ab)return ab end)local ac,ad,ae,af,ag=ab(
game:GetService'HttpService'),(syn and syn.request)or request or http_request or
(http and http.request),isfolder,isfile,listfiles if typeof(copyfunction)==
'function'then local ah,ai,aj=copyfunction(ae),copyfunction(af),copyfunction(ag)
local ak,al=pcall(function()return ah('test'..tostring(math.random(1000000,
9999999)))end)if ak==false or typeof(al)~='boolean'then ae=function(am)local an,
ao=pcall(ah,am)return((an and{ao}or{false})[1])end af=function(am)local an,ao=
pcall(ai,am)return((an and{ao}or{false})[1])end ag=function(am)local an,ao=
pcall(aj,am)return((an and{ao}or{{}})[1])end end end local ah={}do ah.Folder=
'ObsidianLibSettings'ah.Library=nil ah.AppliedToTab=false ah.BuiltInThemes={
Default={1,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"191919","AccentColor":"7d55ff","BackgroundColor":"0f0f0f","OutlineColor":"282828"}]]
},BBot={2,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"1e1e1e","AccentColor":"7e48a3","BackgroundColor":"232323","OutlineColor":"141414"}]]
},Fatality={3,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"1e1842","AccentColor":"c50754","BackgroundColor":"191335","OutlineColor":"3c355d"}]]
},Jester={4,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"db4467","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
},Mint={5,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"242424","AccentColor":"3db488","BackgroundColor":"1c1c1c","OutlineColor":"373737"}]]
},['Tokyo Night']={6,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"191925","AccentColor":"6759b3","BackgroundColor":"16161f","OutlineColor":"323232"}]]
},Ubuntu={7,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"3e3e3e","AccentColor":"e2581e","BackgroundColor":"323232","OutlineColor":"191919"}]]
},Quartz={8,ac:JSONDecode
[[{"FontColor":"ffffff","MainColor":"232330","AccentColor":"426e87","BackgroundColor":"1d1b26","OutlineColor":"27232f"}]]
},Nord={9,ac:JSONDecode
[[{"FontColor":"eceff4","MainColor":"3b4252","AccentColor":"88c0d0","BackgroundColor":"2e3440","OutlineColor":"4c566a"}]]
},Dracula={10,ac:JSONDecode
[[{"FontColor":"f8f8f2","MainColor":"44475a","AccentColor":"ff79c6","BackgroundColor":"282a36","OutlineColor":"6272a4"}]]
},Monokai={11,ac:JSONDecode
[[{"FontColor":"f8f8f2","MainColor":"272822","AccentColor":"f92672","BackgroundColor":"1e1f1c","OutlineColor":"49483e"}]]
},Gruvbox={12,ac:JSONDecode
[[{"FontColor":"ebdbb2","MainColor":"3c3836","AccentColor":"fb4934","BackgroundColor":"282828","OutlineColor":"504945"}]]
},Solarized={13,ac:JSONDecode
[[{"FontColor":"839496","MainColor":"073642","AccentColor":"cb4b16","BackgroundColor":"002b36","OutlineColor":"586e75"}]]
},Catppuccin={14,ac:JSONDecode
[[{"FontColor":"d9e0ee","MainColor":"302d41","AccentColor":"f5c2e7","BackgroundColor":"1e1e2e","OutlineColor":"575268"}]]
},['One Dark']={15,ac:JSONDecode
[[{"FontColor":"abb2bf","MainColor":"282c34","AccentColor":"c678dd","BackgroundColor":"21252b","OutlineColor":"5c6370"}]]
},Cyberpunk={16,ac:JSONDecode
[[{"FontColor":"f9f9f9","MainColor":"262335","AccentColor":"00ff9f","BackgroundColor":"1a1a2e","OutlineColor":"413c5e"}]]
},['Oceanic Next']={17,ac:JSONDecode
[[{"FontColor":"d8dee9","MainColor":"1b2b34","AccentColor":"6699cc","BackgroundColor":"16232a","OutlineColor":"343d46"}]]
},Material={18,ac:JSONDecode
[[{"FontColor":"eeffff","MainColor":"212121","AccentColor":"82aaff","BackgroundColor":"151515","OutlineColor":"424242"}]]
}}ah.SetLibrary=function(ai,aj)ai.Library=aj end ah.GetPaths=function(ai)local
aj,ak={},ai.Folder:split'/'for al=1,#ak do aj[#aj+1]=table.concat(ak,'/',1,al)
end aj[#aj+1]=ai.Folder..'/themes'return aj end ah.BuildFolderTree=function(ai)
local aj=ai:GetPaths()for ak=1,#aj do local al=aj[ak]if ae(al)then continue end
makefolder(al)end end ah.CheckFolderTree=function(ai)if ae(ai.Folder)then return
end ai:BuildFolderTree()task.wait(0.1)end ah.SetFolder=function(ai,aj)ai.Folder=
aj ai:BuildFolderTree()end ah.ApplyTheme=function(ai,aj)local ak=ai:
GetCustomTheme(aj)local al=ak or ai.BuiltInThemes[aj]if not al then return end
local am=al[2]for an,ao in pairs(ak or am)do if an=='VideoLink'then continue
elseif an=='FontFace'then ai.Library:SetFont(Enum.Font[ao])if ai.Library.Options
[an]then ai.Library.Options[an]:SetValue(ao)end else ai.Library.Scheme[an]=
Color3.fromHex(ao)if ai.Library.Options[an]then ai.Library.Options[an]:
SetValueRGB(Color3.fromHex(ao))end end end ai:ThemeUpdate()end ah.ThemeUpdate=
function(ai)local aj={'FontColor','MainColor','AccentColor','BackgroundColor',
'OutlineColor'}for ak,al in pairs(aj)do if ai.Library.Options and ai.Library.
Options[al]then ai.Library.Scheme[al]=ai.Library.Options[al].Value end end ai.
Library:UpdateColorsUsingRegistry()end ah.GetCustomTheme=function(ai,aj)local ak
=ai.Folder..'/themes/'..aj..'.json'if not af(ak)then return nil end local al=
readfile(ak)local am,an=pcall(ac.JSONDecode,ac,al)if not am then return nil end
return an end ah.LoadDefault=function(ai)local aj,ak,al='Default',af(ai.Folder..
'/themes/default.txt')and readfile(ai.Folder..'/themes/default.txt'),true if ak
then if ai.BuiltInThemes[ak]then aj=ak elseif ai:GetCustomTheme(ak)then aj=ak al
=false end elseif ai.BuiltInThemes[ai.DefaultTheme]then aj=ai.DefaultTheme end
if al then ai.Library.Options.ThemeManager_ThemeList:SetValue(aj)else ai:
ApplyTheme(aj)end end ah.SaveDefault=function(ai,aj)writefile(ai.Folder..
'/themes/default.txt',aj)end ah.SetDefaultTheme=function(ai,aj)assert(ai.Library
,'Must set ThemeManager.Library first!')assert(not ai.AppliedToTab,
[[Cannot set default theme after applying ThemeManager to a tab!]])local ak,al,
am={},{},{'FontColor','MainColor','AccentColor','BackgroundColor','OutlineColor'
}for an,ao in pairs(am)do if typeof(aj[ao])=='Color3'then ak[ao]='#'..aj[ao]:
ToHex()al[ao]=aj[ao]elseif typeof(aj[ao])=='string'then ak[ao]=(aj[ao]:sub(1,1)
=='#'and{(aj[ao])}or{('#'..aj[ao])})[1]al[ao]=Color3.fromHex(aj[ao])else ak[ao]=
ah.BuiltInThemes.Default[2][ao]al[ao]=Color3.fromHex(ah.BuiltInThemes.Default[2]
[ao])end end if typeof(aj.FontFace)=='EnumItem'then ak.FontFace=aj.FontFace.Name
al.Font=Font.fromEnum(aj.FontFace)elseif typeof(aj.FontFace)=='string'then ak.
FontFace=aj.FontFace al.Font=Font.fromEnum(Enum.Font[aj.FontFace])else ak.
FontFace='Code'al.Font=Font.fromEnum(Enum.Font.Code)end for an,ao in pairs{'Red'
,'Dark','White'}do al[ao]=ai.Library.Scheme[ao]end ai.Library.Scheme=al ai.
BuiltInThemes.Default={1,ak}ai.Library:UpdateColorsUsingRegistry()end ah.
SaveCustomTheme=function(ai,aj)if aj:gsub(' ','')==''then return ai.Library:
Notify('Invalid file name for theme (empty)',3)end local ak,al={},{'FontColor',
'MainColor','AccentColor','BackgroundColor','OutlineColor'}for am,an in pairs(al
)do ak[an]=ai.Library.Options[an].Value:ToHex()end ak.FontFace=ai.Library.
Options.FontFace.Value writefile(ai.Folder..'/themes/'..aj..'.json',ac:
JSONEncode(ak))end ah.Delete=function(ai,aj)if not aj then return false,
'no config file is selected'end local ak=ai.Folder..'/themes/'..aj..'.json'if
not af(ak)then return false,'invalid file'end local al=pcall(delfile,ak)if not
al then return false,'delete file error'end return true end ah.
ReloadCustomThemes=function(ai)local aj,ak=ag(ai.Folder..'/themes'),{}for al=1,#
aj do local am=aj[al]if am:sub(-5)=='.json'then local an=am:find('.json',1,true)
local ao,ap=an,am:sub(an,an)while ap~='/'and ap~='\\'and ap~=''do an=an-1 ap=am:
sub(an,an)end if ap=='/'or ap=='\\'then table.insert(ak,am:sub(an+1,ao-1))end
end end return ak end ah.CreateThemeManager=function(ai,aj)aj:AddLabel
'Background color':AddColorPicker('BackgroundColor',{Default=ai.Library.Scheme.
BackgroundColor})aj:AddLabel'Main color':AddColorPicker('MainColor',{Default=ai.
Library.Scheme.MainColor})aj:AddLabel'Accent color':AddColorPicker('AccentColor'
,{Default=ai.Library.Scheme.AccentColor})aj:AddLabel'Outline color':
AddColorPicker('OutlineColor',{Default=ai.Library.Scheme.OutlineColor})aj:
AddLabel'Font color':AddColorPicker('FontColor',{Default=ai.Library.Scheme.
FontColor})aj:AddDropdown('FontFace',{Text='Font Face',Default='Code',Values={
'BuilderSans','Code','Fantasy','Gotham','Jura','Roboto','RobotoMono',
'SourceSans'}})local ak={}for al,am in pairs(ai.BuiltInThemes)do table.insert(ak
,al)end table.sort(ak,function(al,am)return ai.BuiltInThemes[al][1]<ai.
BuiltInThemes[am][1]end)aj:AddDivider()aj:AddDropdown('ThemeManager_ThemeList',{
Text='Theme list',Values=ak,Default=1})aj:AddButton('Set as default',function()
ai:SaveDefault(ai.Library.Options.ThemeManager_ThemeList.Value)ai.Library:
Notify(string.format('Set default theme to %q',ai.Library.Options.
ThemeManager_ThemeList.Value))end)ai.Library.Options.ThemeManager_ThemeList:
OnChanged(function()ai:ApplyTheme(ai.Library.Options.ThemeManager_ThemeList.
Value)end)aj:AddDivider()aj:AddInput('ThemeManager_CustomThemeName',{Text=
'Custom theme name'})aj:AddButton('Create theme',function()ai:SaveCustomTheme(ai
.Library.Options.ThemeManager_CustomThemeName.Value)ai.Library.Options.
ThemeManager_CustomThemeList:SetValues(ai:ReloadCustomThemes())ai.Library.
Options.ThemeManager_CustomThemeList:SetValue(nil)end)aj:AddDivider()aj:
AddDropdown('ThemeManager_CustomThemeList',{Text='Custom themes',Values=ai:
ReloadCustomThemes(),AllowNull=true,Default=1})aj:AddButton('Load theme',
function()local al=ai.Library.Options.ThemeManager_CustomThemeList.Value ai:
ApplyTheme(al)ai.Library:Notify(string.format('Loaded theme %q',al))end)aj:
AddButton('Overwrite theme',function()local al=ai.Library.Options.
ThemeManager_CustomThemeList.Value ai:SaveCustomTheme(al)ai.Library:Notify(
string.format('Overwrote config %q',al))end)aj:AddButton('Delete theme',function
()local al=ai.Library.Options.ThemeManager_CustomThemeList.Value local am,an=ai:
Delete(al)if not am then return ai.Library:Notify('Failed to delete theme: '..an
)end ai.Library:Notify(string.format('Deleted theme %q',al))ai.Library.Options.
ThemeManager_CustomThemeList:SetValues(ai:ReloadCustomThemes())ai.Library.
Options.ThemeManager_CustomThemeList:SetValue(nil)end)aj:AddButton(
'Refresh list',function()ai.Library.Options.ThemeManager_CustomThemeList:
SetValues(ai:ReloadCustomThemes())ai.Library.Options.
ThemeManager_CustomThemeList:SetValue(nil)end)aj:AddButton('Set as default',
function()if ai.Library.Options.ThemeManager_CustomThemeList.Value~=nil and ai.
Library.Options.ThemeManager_CustomThemeList.Value~=''then ai:SaveDefault(ai.
Library.Options.ThemeManager_CustomThemeList.Value)ai.Library:Notify(string.
format('Set default theme to %q',ai.Library.Options.ThemeManager_CustomThemeList
.Value))end end)aj:AddButton('Reset default',function()local al=pcall(delfile,ai
.Folder..'/themes/default.txt')if not al then return ai.Library:Notify
'Failed to reset default: delete file error'end ai.Library:Notify
'Set default theme to nothing'ai.Library.Options.ThemeManager_CustomThemeList:
SetValues(ai:ReloadCustomThemes())ai.Library.Options.
ThemeManager_CustomThemeList:SetValue(nil)end)ai:LoadDefault()ai.AppliedToTab=
true local al=function()ai:ThemeUpdate()end ai.Library.Options.BackgroundColor:
OnChanged(al)ai.Library.Options.MainColor:OnChanged(al)ai.Library.Options.
AccentColor:OnChanged(al)ai.Library.Options.OutlineColor:OnChanged(al)ai.Library
.Options.FontColor:OnChanged(al)ai.Library.Options.FontFace:OnChanged(function(
am)ai.Library:SetFont(Enum.Font[am])ai.Library:UpdateColorsUsingRegistry()end)
end ah.CreateGroupBox=function(ai,aj)assert(ai.Library,
'Must set ThemeManager.Library first!')return aj:AddLeftGroupbox('Themes',
'paintbrush')end ah.ApplyToTab=function(ai,aj)assert(ai.Library,
'Must set ThemeManager.Library first!')local ak=ai:CreateGroupBox(aj)ai:
CreateThemeManager(ak)end ah.ApplyToGroupbox=function(ai,aj)assert(ai.Library,
'Must set ThemeManager.Library first!')ai:CreateThemeManager(aj)end ah:
BuildFolderTree()end getgenv().ObsidianThemeManager=ah return ah end end)()end,[
17]=function()local aa,ab,ac=a(17)return(function(...)return function(ad)local
ae={List={}}for af,ag in ab:GetChildren()do table.insert(ae.List,ac(ag)(ad))end
ae.GetPlaceFromId=function(af)for ag,ah in ae.List do if not ah.Ids[tostring(af)
]then continue end return ah end return nil end ae.IsExecutorBlacklisted=
function(af)local ag=(getexecutorname or identifyexecutor)if not ag then return
true end local ah=ag()for ai,aj in af.BlacklistedExecutors or{}do if(aj:find(ah,
1,true)==nil)then continue end return true end return false end return ae end
end)()end,[18]=function()a(18)return(function(...)return function(aa)local ab,ac
,ad,ae=aa:Get'Modules/Color',Color3.new(0,1,0),Color3.new(1,0,0),Color3.new(0,0,
1)return{Name='Slime RNG',Ids={['92416421522960']=true},Keyless=false,Downtime={
Status=false,Message='Placeholder'},BlacklistedExecutors={'Solara','Xeno'},
Credits={{Name='vma',Role='lead developer'},{Name='felik',Role='lead developer'}
},Script='8db54cb776ef39fb18e50589c7cff5db',Update={Time=1763296128,Log={ac
'[+] Released'}}}end end)()end,[19]=function()local aa,ab=a(19)return(function(
...)return function(ac)return ac.new(ac):Extend(ac.Extensions.Children(ab))end
end)()end,[20]=function()a(20)return(function(...)return function(aa)local ab={}
ab.Dictionary=function(ac)local ad={}for ae,af in ac do ad[af]=true end return
ad end ab.Filter=function(ac,ad)local ae,af={},ac[1]==nil for ag,ah in ac do
local ai=ad(ah,ag)if(not ai)then continue end if af then ae[ag]=ah else table.
insert(ae,ah)end end return ae end ab.Reconcile=function(ac,ad)for ae,af in ad
do local ag,ah=ac[ae],typeof(af)if ag==nil or typeof(ag)~=ah then ac[ae]=af
elseif ah=='table'then ab.Reconcile(ag,af)end end return ac end return ab end
end)()end,[21]=function()a(21)return(function(...)return function(aa)local ab
local ac=function(ac,...)local ad=ab ab=nil ac(...)ab=ad end local ad,ae=
function()while true do ac(coroutine.yield())end end,{}ae.__index=ae ae.new=
function(af,ag)return setmetatable({_connected=true,_signal=af,_fn=ag,_next=
false},ae)end ae.Disconnect=function(af)af._connected=false if af._signal.
_handlerListHead==af then af._signal._handlerListHead=af._next else local ag=af.
_signal._handlerListHead while ag and ag._next~=af do ag=ag._next end if ag then
ag._next=af._next end end end setmetatable(ae,{__index=function(af,ag)error((
'Attempt to get Connection::%s (not a valid member)'):format(tostring(ag)),2)end
,__newindex=function(af,ag,ah)error((
'Attempt to set Connection::%s (not a valid member)'):format(tostring(ag)),2)end
})local af={}af.__index=af af.new=function()return setmetatable({
_handlerListHead=false},af)end af.Connect=function(ag,ah)local ai=ae.new(ag,ah)
if ag._handlerListHead then ai._next=ag._handlerListHead ag._handlerListHead=ai
else ag._handlerListHead=ai end return ai end af.DisconnectAll=function(ag)ag.
_handlerListHead=false end af.Fire=function(ag,...)local ah=ag._handlerListHead
while ah do if ah._connected then if not ab then ab=coroutine.create(ad)
coroutine.resume(ab)end task.spawn(ab,ah._fn,...)end ah=ah._next end end af.Wait
=function(ag)local ah,ai=(coroutine.running())ai=ag:Connect(function(...)ai:
Disconnect()task.spawn(ah,...)end)return coroutine.yield()end af.Once=function(
ag,ah)local ai ai=ag:Connect(function(...)if ai._connected then ai:Disconnect()
end ah(...)end)return ai end setmetatable(af,{__index=function(ag,ah)error((
'Attempt to get Signal::%s (not a valid member)'):format(tostring(ah)),2)end,
__newindex=function(ag,ah,ai)error((
'Attempt to set Signal::%s (not a valid member)'):format(tostring(ah)),2)end})
return af end end)()end,[22]=function()local aa,ab=a(22)return(function(...)
return function(ac)return ac.new(ac):Extend(ac.Extensions.Children(ab))end end)(
)end,[23]=function()a(23)return(function(...)return function(aa)local ab=aa.
Services local ac=ab.HttpService return function()return(ac:GenerateGUID(false):
gsub('-','')):lower()end end end)()end,[24]=function()a(24)return(function(...)
return function(aa)local ab=aa.Services local ac,ad,ae,af=ab.Workspace,aa:Get
'Modules/t',aa:Get'RBXUtil/TableUtil',aa:Get'Functions/Numbers'local ag,ah=ad.
numberMin(0),{}do ah.Constants={}ah.Second=1 ah.Minute=ah.Second ah.Hour=ah.
Minute*60 ah.Day=ah.Hour*24 ah.Month=ah.Day*31 ah.Year=ah.Day*365 end ah.now=
function()return ac:GetServerTimeNow()end ah.FormatTime=function(ai,aj)return
DateTime.fromUnixTimestamp(ai):FormatLocalTime(aj,'en-us')end ah.FormatDuration=
function(ai,aj)local ak,al,am,an=math.floor(ai/86400),math.floor((ai%86400)/3600
),math.floor((ai%3600)/60),math.floor(ai%60)local ao={['%%d']=tostring(ak),[
'%%h']=tostring(al),['%%m']=tostring(am),['%%s']=tostring(an)}return(aj:gsub(
'%%[dhms]',ao))end do local ai=ae.FullMap(ah.Constants,function(ai,aj)return{
Name=aj,Value=ai}end)table.sort(ai,function(aj,ak)return aj.Value>ak.Value end)
ah.CompressTime=function(aj)assert(ad.number(aj))assert(ag(aj))aj=math.floor(aj)
for ak,al in ipairs(ai)do local am,an=al.Name,al.Value local ao=math.max(0,math.
floor(aj/an))if ao==0 then continue end return string.format('%s %s',tostring(af
.CommaNumber(ao)),tostring(am..(ao>1 and's'or'')))end return'0 seconds'end end
return ah end end)()end,[25]=function()a(25)return(function(...)return function(
aa)local ab={Info='\u{1f535}',Warn='\u{1f7e0}',Success='\u{1f7e2}',Error=
'\u{1f534}'}local ac=function(ac,ad)local ae=os.date'*t'string.format('%s:%s:%s'
,ae.hour,ae.min,ae.sec)print(string.format('%s | [Library]: %s',ab[ac],ad))end
return ac end end)()end,[26]=function()a(26)return(function(...)return function(
aa)local ab=aa:Get'Modules/t'local ac,ad=ab.tuple(ab.number,ab.
numberConstrained(0,8)),{}ad.Comma=function(ae)assert(ab.number(ae))local af=
tostring(ae)local ag,ah,ai=af:match'^([^%d]*%d)(%d*)(.-)$'return ag..ah:reverse(
):gsub('(%d%d%d)','%1,'):reverse()..ai end ad.DecimalRound=function(ae,af)
assert(ac(ae,af))if ae%1==0 then return ae end return string.format(string.
format('%%.%sf',tostring(af)),ae)end return ad end end)()end,[27]=function()a(27
)return(function(...)return function(aa)local ab=aa:Get'Modules/t'local ac,ad=ab
.tuple(ab.string,ab.numberMin(0),ab.optional(ab.string)),{}ad.Truncate=function(
ae,af,ag)assert(ac(ae,af,ag))return ae:sub(1,af)..(ag or'')end return ad end end
)()end,[28]=function()a(28)return(function(...)return function(aa)local ab,ac=(
request or(http and http.request)or httprequest),aa.Services local ad=ac.
HttpService return function(ae,af)if af then setclipboard(
'https://www.discord.gg/'..ae)end if(not ab)then return false end ab{Url=
'http://127.0.0.1:6463/rpc?v=1',Method='POST',Headers={['Content-Type']=
'application/json',Origin='https://discord.com'},Body=ad:JSONEncode{cmd=
'INVITE_BROWSER',args={code=ae},nonce=ad:GenerateGUID(false)}}return true end
end end)()end,[29]=function()a(29)return(function(...)return function(aa)local
ab,ac,ad,ae=aa:Get'RBXUtil/TableUtil',aa:Get'Modules/t',utf8.char,{
DiscordInviteCode='',Characters={Invisible=10240,BulletPoint=8226},Emojis={
Unknown='<:letter_x:1305284794044776622>',Person='<:person:1305298114265219094>'
},LRM_Constants={Premium=LRM_IsUserPremium or false,DiscordUserId=
LRM_LinkedDiscordID or 0,ScriptName=LRM_ScriptName or'generic',TotalExecutions=
LRM_TotalExecutions or 1337,SecondsLeft=LRM_SecondsLeft or 60,UserNote=
LRM_UserNote or'user note',ScriptVersion=LRM_ScriptVersion or'0001'}}for af,ag
in ae.Characters do if typeof(ag)~='number'then continue end ae.Characters[af]=
ad(ag)end setmetatable(ae.Emojis,function(af,ag)local ah=rawget(af,'Unknown')
rawset(af,ag,ah)return ah end)return ae end end)()end,[30]=function()local aa,ab
,ac=a(30)return(function(...)local ad={}ad.__index=ad ad.Extensions={Children=
function(ae)local af={}for ag,ah in ae:GetChildren()do af[ah.Name]=ah end return
af end}local ae=cloneref or function(ae)return ae end ad.Services=setmetatable({
},{__index=function(af,ag)local ah,ai=pcall(game.GetService,game,ag)if ah and ai
then ai=ae(ai)rawset(af,ag,ai)return ai end return nil end})ad.new=function(af)
local ag=setmetatable({Loaded={},Loading={},Container={}},ad)ag.Root=af or ag
return ag end ad.is=function(af)return af and typeof(af)=='table'and
getmetatable(af)==ad end ad.Add=function(af,ag,ah)assert(not af.Container[ag],
'Index already exists')af.Container[ag]=ah return af end ad.Load=function(af,ag)
if af.Loaded[ag]~=nil then return af.Loaded[ag]end local ah=af.Container[ag]
assert(ah~=nil,string.format('Unknown dependency "%s"',tostring(ag)))assert(not
af.Loading[ag],string.format('Circular dependency at "%s"',tostring(ag)))af.
Loading[ag]=true if typeof(ah)=='table'and ah.ClassName=='ModuleScript'then ah=
ac(ah)elseif typeof(ah)=='Instance'and ah.ClassName=='ModuleScript'then ah=ac(ah
)end if typeof(ah)=='function'then ah=ah(af.Root)end af.Loading[ag]=nil af.
Loaded[ag]=ah return ah end ad.Extend=function(af,ag)for ah,ai in ag do af:Add(
ah,ai)end return af end ad.Get=function(af,ag)local ah=af for ai in string.
gmatch(ag,'[^/]+')do if ad.is(ah)then ah=ah:Load(ai)else ah=ah[ai]end assert(ah
~=nil,string.format('Invalid path "%s" at "%s"',tostring(ag),tostring(ai)))end
return ah end return ad end)()end},{{1,2,{'Shared'},{{29,2,{'Constants'}},{22,2,
{'Functions'},{{28,2,{'PromptDiscord'}},{23,2,{'CreateGUID'}},{27,2,{'Strings'}}
,{25,2,{'OutputMessage'}},{26,2,{'Numbers'}},{24,2,{'Time'}}}},{19,2,{'RBXUtil'}
,{{20,2,{'TableUtil'}},{21,2,{'Signal'}}}},{30,2,{'Vinca'}},{2,2,{'Modules'},{{8
,2,{'Interface'},{{9,1,{'List'},{{10,1,{'Obsidian'},{{11,2,{'Main'}},{12,2,{
'SaveManager'}},{16,2,{'ThemeManager'}},{13,2,{'Tabs'},{{15,2,{'Settings'}},{14,
2,{'Home'}}}}}}}}}},{3,2,{'TaskManager'},{{4,2,{'Task'}},{5,2,{'Lock'}}}},{6,2,{
'Color'}},{17,2,{'Places'},{{18,2,{'Slime RNG'}}}},{7,2,{'t'}}}}}}},'0.4.2',
'strelizia.cc',string,task,setmetatable,error,next,table,unpack,coroutine,script
,type,require,pcall,tostring,tonumber,_VERSION local au,av,aw,ax,ay,az,aA=aj.
insert,aj.remove,aj.freeze or function(au)return au end,al.wrap,ae.sub,ae.match,
ae.gmatch if as and ay(as,1,4)=='Lune'then local aB,aC=ap(ao,'@lune/task')if aB
and aC then af=aC end end local aB=af and af.defer local aC,aD,aE,aF,aG,aH,aI,aJ
,aK=aB or function(aC,...)ax(aC)(...)end,{[1]='Folder',[2]='ModuleScript',[3]=
'Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local aL,aM={
GetFullName={{},function(aL)local aM,aN=aL.Name,aL.Parent while aN do aM=aN.Name
..'.'..aM aN=aN.Parent end return aM end},GetChildren={{},function(aL)local aM={
}for aN in ai,aK[aL]do au(aM,aN)end return aM end},GetDescendants={{},function(
aL)local aM={}for aN in ai,aK[aL]do au(aM,aN)for aO,aP in ai,aN:GetDescendants()
do au(aM,aP)end end return aM end},FindFirstChild={{'string','boolean?'},
function(aL,aM,aN)local aO=aK[aL]for aP in ai,aO do if aP.Name==aM then return
aP end end if aN then for aP in ai,aO do return aP:FindFirstChild(aM,true)end
end end},FindFirstAncestor={{'string'},function(aL,aM)local aN=aL.Parent while
aN do if aN.Name==aM then return aN end aN=aN.Parent end end},WaitForChild={{
'string','number?'},function(aL,aM)return aL:FindFirstChild(aM)end}},{}for aN,aO
in ai,aL do local aP,aQ,aR=aO[1],aO[2],{}for aS,aT in ai,aP do local aU,aV=az(aT
,'^([^%?]+)(%??)')aR[aS]={aU,aV}end aM[aN]=function(aS,...)if not aK[aS]then ah(
"Expected ':' not '.' calling member function "..aN,2)end local aT={...}for aU,
aV in ai,aR do local aW=aT[aU]local aX,aY,aZ=an(aW),aV[1],aV[2]if aW==nil and
not aZ then ah('Argument '..aW..' missing or nil',3)end if aY~='any'and aX~=aY
and not(aX=='nil'and aZ)then ah('Argument '..aU..' expects type "'..aY..
'", got "'..aX..'"',2)end end return aQ(aS,...)end end local aN=function(aN,aO,
aP)local aQ,aR,aS,aT,aU,aV=ag({},{__mode='k'}),function(aQ)ah(aQ..
' is not a valid (virtual) member of '..aN..' "'..aO..'"',3)end,function(aQ)ah(
'Unable to assign (virtual) property '..aQ..'. Property is read only',3)end,{},{
}aU.__metatable=false aU.__index=function(aW,aX)if aX=='ClassName'then return aN
elseif aX=='Name'then return aO elseif aX=='Parent'then return aP elseif aN==
'StringValue'and aX=='Value'then return aV else local aY=aM[aX]if aY then return
aY end end for aY in ai,aQ do if aY.Name==aX then return aY end end aR(aX)end aU
.__newindex=function(aW,aX,aY)if aX=='ClassName'then aS(aX)elseif aX=='Name'then
aO=aY elseif aX=='Parent'then if aY==aT then return end if aP~=nil then aK[aP][
aT]=nil end aP=aY if aY~=nil then aK[aY][aT]=true end elseif aN=='StringValue'
and aX=='Value'then aV=aY else aR(aX)end end aU.__tostring=function()return aO
end ag(aT,aU)aK[aT]=aQ if aP~=nil then aK[aP][aT]=true end return aT end
local function CreateRefFromObject(aO,aP)local aQ,aR,aS,aT=aO[1],aO[2],aO[3],aO[
4]local aU=aD[aR]local aV=aS and av(aS,1)or aU local aW=aN(aU,aV,aP)aE[aQ]=aW if
aS then for aX,aY in ai,aS do aW[aX]=aY end end if aT then for aX,aY in ai,aT do
CreateRefFromObject(aY,aW)end end return aW end local aO=aN('Folder','['..ad..
']')for aP,aQ in ai,ab do CreateRefFromObject(aQ,aO)end for aP,aQ in ai,aa do
local aR=aE[aP]aF[aR]=aQ aG[aR]=aP local aS=aR.ClassName if aS=='LocalScript'or
aS=='Script'then au(aI,aR)end end local aP=function(aP)local aQ,aR=aP.ClassName,
aH[aP]if aR and aQ=='ModuleScript'then return ak(aR)end local aS,aT=aF[aP],
function(aS)aS=aq(aS)local aT,aU,aV=aP:GetFullName(),az(aS,'[^:]+:(%d+): (.+)')
if not aU or not at then return aT..':*: '..(aV or aS)end aU=ar(aU)local aW=aG[
aP]local aX=at[aW]local aY=aU-aX+1 if aY<0 then aY='?'end return aT..':'..aY..
': '..aV end if aQ=='LocalScript'or aQ=='Script'then local aU,aV=ap(aS)if not aU
then ah(aT(aV),0)end else local aU={ap(aS)}local aV=av(aU,1)if not aV then local
aW=av(aU,1)ah(aT(aW),0)end aH[aP]=aU return ak(aU)end end a=function(aQ)local aR
,aS,aT=aE[aQ],function(aR,...)local aS={ap(aR,...)}local aT=av(aS,1)if not aT
then ah(aS[1],3)end return ak(aS)end,aw(ag({},{__index=aJ,__newindex=function(aR
,aS,aT)aJ[aS]=aT end,__len=function()return#aJ end,__iter=function()return ai,aJ
end}))local aU,aV,aW=aw{version=ac,envname=ad,shared=aT,script=am,require=ao},aR
,function(aU,...)local aV,aW,aX=an(aU),
'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if aV=='table'and aK[aU]then if aU.
ClassName~='ModuleScript'then ah(aW,2)elseif aU==aR then ah(aX,2)end return aP(
aU)elseif aV=='string'and ay(aU,1,1)~='@'then if#aU==0 then ah(
'Attempted to call require with empty string',2)end local aY=aR if ay(aU,1,1)==
'/'then aY=aO elseif ay(aU,1,2)=='./'then aU=ay(aU,3)end local aZ for a_ in aA(
aU,'([^/]*)/?')do local a0=a_ if a_=='..'then a0='Parent'end if a0~=''then local
a1=aY:FindFirstChild(a0)if not a1 then local a2=aY.Parent if a2 then a1=a2:
FindFirstChild(a0)end end if a1 then aY=a1 elseif a_~=aZ and a_~='init'and a_~=
'init.server'and a_~='init.client'then ah('Virtual script path "'..aU..
'" not found',2)end end aZ=a_ end if aY.ClassName~='ModuleScript'then ah(aW,2)
elseif aY==aR then ah(aX,2)end return aP(aY)end return aS(ao,aU,...)end return
aU,aV,aW end for aQ,aR in ai,aI do aC(aP,aR)end return aP(aO:GetChildren()[1])
