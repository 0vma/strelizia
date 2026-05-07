


local a


local b,











































































































































































































































































































































































































































































































c,





d,
e,




f,g,i,j,l,m,n,o,p,q,r,s,t,u,v,w={function()local b, c, d=a(1)return(function(...)if(not game:IsLoaded())then game.Loaded:Wait()end local e,f=d(c.Library),getgenv()if f.Library then f.Library:Unload()end local g,h,i,j,k,l=e:Get'Shared/Modules/Places',e:Get'Shared/Constants',e:Get'Shared/Modules/Interface'.GetInterface'Obsidian',e:Get'Shared/Functions/Strings',e:Get'Shared/Functions/Time',e:Get'Shared/Functions/PromptDiscord'local m,n=h.Characters.BulletPoint,g.GetPlaceFromId(game.PlaceId)if not n then return i.Main:Notify{Title='strelizia.cc',Description=[[this game is currently not supported by strelizia! if you think that this is a mistake then join our discord server and report this issue!]],Time=5}end if g.IsExecutorBlacklisted(n.BlacklistedExecutors)then return i.Main:Notify{Title='strelizia.cc',Description='this script is not compatible with your executor!',Time=3}end local o=(n.Downtime.Status and n.Downtime.Message)if o then return i.Main:Notify{Title='strelizia.cc',Description=string.format([[unable to load %s script because it's currently experiencing a downtime! specificed downtime reason: %s]], tostring(n.Name), tostring(o))}end local p,q=e:Get'Modules/KeyFile',e:Get'Modules/Luarmor':Init"8db54cb776ef39fb18e50589c7cff5db"if n.Keyless then i.Main:Notify{Title='strelizia.cc',Description=[[script for this game is currently keyless, no key required! loading script...]],Time=3}return q:LoadScript()end local r=p:Read()if r then local s=q:Check(r)if s.code=='KEY_VALID'then i.Main:Notify{Title='strelizia.cc',Description='saved key is valid! loading script!',Time=3}return q:LoadScript(r)end i.Main:Notify{Title='strelizia.cc',Description='saved key is invalid! please enter a new key!',Time=4}p:Erase()end local s=e:Get'Interface':Create()local t=s.Library.Buttons local u,v=t.CheckKeyButton,t.GetKeyButton local w=function(w)if w:len()~=32 then s.Library:Notify{Title='strelizia.cc',Description='invalid key length!',Time=2}return end u:SetDisabled(true)s.Library:Notify{Title='strelizia.cc',Description='checking your key, please wait...',Time=2}local x=q:Check(w)s.Library:Notify{Title='strelizia.cc',Description=x.message,Time=2}if x.code=='KEY_VALID'then p:Write(w)s.Library:Unload()return q:LoadScript(w)else u:SetDisabled(false)end end u.Func=function()return w(s.Library.Options.ScriptKeyInput.Value)end v.Func=function()local x,y,z={},0,''for A,B in h.KeySystemAdProviders do y=y+1 x[A]={Title=A,Order=y,Variant="Primary",Callback=function()setclipboard(string.format('https://ads.luarmor.net/get_key?for=%s', tostring(B.Identifier)))end,}z=z..string.format('%s %s: \n%s%s Key Length: %s\n%s%s Completion Time: %s\n\n', tostring(m), tostring(A), tostring(j.LeadingSpace(5)), tostring(m), tostring(k.CompressTime(B.KeyLength)), tostring(j.LeadingSpace(5)), tostring(m), tostring(k.CompressTime(B.CompletionTime)))end local A=s.Library.Window:AddDialog("AdProviderSelection",{Title="Ad Provider Selection",Description="select your ad provider based on the information below",Icon="key",FooterButtons=x})A:AddLabel("AdProviderLabel",{Text=z,DoesWrap=true,Alignment=Enum.TextXAlignment.Center})end t.JoinDiscordButton.Func=function()l(h.DiscordInviteCode,true)s.Library:Notify{Title='strelizia.cc',Description='successfully copied/prompted discord join code!'}end t.UnloadScript.Func=function()return s.Library:Unload()end end)()end,function()local b, c, d=a(2)return(function(...)local e=d(c.Parent.Vinca)return e.new():Extend(e.Extensions.Children(c))end)()end,function()local b, c=a(3)return(function(...)return function(d)return d.new(d):Extend(d.Extensions.Children(c))end end)()end,function()a(4)return(function(...)return function(b)local c=b.Services local d,e,f=c.EncodingService,{},'strelizia/key.bin'e.Erase=function(g)return delfile(f)end e.Read=function(g)if(not isfile(f))then return nil end local h,i=pcall(d.Base64Decode,d,buffer.fromstring(readfile(f)))if(not h)then return i:Erase()end i=i:reverse()return i end e.Write=function(g, h)writefile(f,buffer.tostring(d:Base64Encode(buffer.fromstring(h:reverse()))))return true end return e end end)()end,function()a(5)return(function(...)return function(b)local c,d,e,f=b:Get'Shared/Modules/t',"Cannot run any Luarmor module methods without calling :Init() first!",getgenv(),{}f.Init=function(g, h)assert(c.string(h))if(not g.Cached)then g.Cached=loadstring(game:HttpGet"https://sdkapi-public.luarmor.net/library.lua")()g.Cached.script_id=h end return g end f.Get=function(g)assert(c.table(g.Cached),d)return g.Cached end f.Check=function(g, h)return g:Get().check_key(h)end f.LoadScript=function(g, h)e.script_key=h return g:Get().load_script()end f.Purge=function(g)g:Get().purge_cache()return g end return f end end)()end,function()a(6)return(function(...)return function(b)local c, d, e, f, g, h=b:Get'Shared/Constants', b:Get'Shared/Modules/Places', b:Get'Shared/Functions/Time', b:Get'Shared/RBXUtil/TableUtil', b:Get'Shared/Modules/Interface', b:Get'Shared/Modules/Color'local i, j, k, l=c.Characters, Color3.fromRGB(255,170,255), h.Paint, {}l.Create=function(m)local n=g.GetInterface'Obsidian'local o=n.Main l.Library=o local p,q=d.GetPlaceFromId(game.PlaceId),o:CreateWindow{Title='key system',Footer='strelizia.cc',Size=UDim2.fromOffset(600,500),Icon=79981166576877,CornerRadius=6,EnableSidebarResize=true,}q:SetSidebarWidth(180)local r={Home=q:AddTab{Name='Home',Icon='house',Description='contains every needed button and information in order to get your script key'}}local s=r.Home:AddGroupbox{Side=1,Name='Key System',IconName='key'}s:AddInput('ScriptKeyInput',{Placeholder='key goes here!',ClearTextOnFocus=true,Text='Script Key',Tooltip='paste your script key in here to access the script, press get key down below in order to get the key',})s:AddButton('CheckKeyButton',{Text='Check Key',Tooltip='checks if the key in the input above is valid and loads the script',}):AddButton('GetKeyButton',{Text='Get Key',Tooltip='prompts ad provider links which lead to the script key'})local t,u,v=r.Home:AddGroupbox{Side=1,Name='Information',IconName='info'},{string.format([[If you don't have a key yet, press %s, choose an %s and finish the ad flow after which you will receive %s.]], tostring(h.Paint('Get Key',j)), tostring(h.Paint('ad provider',j)), tostring(h.Paint('your key',j))),string.format([[Paste your %s into the %s above and press validate in order to load the script.]], tostring(h.Paint('key',j)), tostring(h.Paint('input box',j))),string.format([[In case you run into issues or have questions make sure to join our %s by clicking the button below!]], tostring(h.Paint('discord server',j)))},''for w,x in u do v=v..string.format('%s %s \n \n', tostring(i.BulletPoint), tostring(x))end t:AddLabel('TutorialLabel',{Text=v:sub(1,-4),DoesWrap=true})t:AddDivider{Text="misc"}t:AddButton('JoinDiscordButton',{Text='Join Discord Server',Tooltip='pressing this will either prompt our discord server directly in the app or copy the link to your clipboard'})t:AddButton('UnloadScript',{Text='Unload',Tooltip='pressing this will unload the script loader'})local w=r.Home:AddGroupbox{Side=2,Name='Script Update Log',IconName='clipboard-clock'}w:AddLabel('ScriptUpdateDate',{Text=string.format('Last Updated at: %s', tostring(e.FormatTime(p.Update.Time,'MM/DD/YYYY HH:mm'))),DoesWrap=true,Alignment=Enum.TextXAlignment.Center})w:AddDivider{Text="update log"}w:AddLabel('ScriptUpdateLog',{Text=table.concat(p.Update.Log,'\n'),DoesWrap=true,Alignment=Enum.TextXAlignment.Center})return l end return l end end)()end,function()a(7)return(function(...)return function(b)local c=b.Services local d, e, f=c.HttpService, c.EncodingService, "3cd3e64a93abb456706a6ff3b2b528b8d73a76c8"local g,i=string.format('strelizia/cache/shared/%s.b64', tostring(f)),function(g)local h,i=pcall(loadstring,g,'Shared')if(not h)then return false,string.format('failed to load shared code: %s', tostring(tostring(i)))end local j,k=pcall(i)if(not j)then return false,string.format('failed to load shared code: %s', tostring(tostring(k)))end return true,k end if isfile(g)then local j,k=pcall(e.Base64Decode,e,buffer.fromstring(readfile(g)))if j then local l,m=i(buffer.tostring(k))if l then print'grabbed from cache'return m end delfile(g)end end local j,k,l=os.clock(),pcall(request,{Url=string.format('https://cdn.jsdelivr.net/gh/0vma/strelizia@%s/shared.luau', tostring(f)),Method="GET"})assert(k and l.Success,string.format('failed to load shared bin: %s', tostring(l.Success and tostring(l)or l.StatusMessage)))local m,n=i(l.Body)assert(m,n)pcall(writefile,g,buffer.tostring(e:Base64Encode(buffer.fromstring(l.Body))))print(string.format('finished loading in: %s', tostring(os.clock()-j)))return n end end)()end,function()local b, c, d=a(8)return(function(...)local e={}e.__index=e e.Extensions={Children=function(f)local g={}for i,j in f:GetChildren()do g[j.Name]=j end return g end,}local f=cloneref or function(f)return f end e.Services=setmetatable({},{__index=function(g,i)local j,l=pcall(game.GetService,game,i)if j and l then l=f(l)rawset(g,i,l)return l end return nil end,})e.new=function(g)local i=setmetatable({__vinca=true,Loaded={},Loading={},Container={},},e)i.Root=g or i return i end e.is=function(g)return g and typeof(g)=="table"and rawget(g,'__vinca')end e.Add=function(g, i, j)assert(not g.Container[i],'Index already exists')g.Container[i]=j return g end e.Load=function(g, i)if g.Loaded[i]~=nil then return g.Loaded[i]end local j=g.Container[i]assert(j~=nil,string.format('Unknown dependency "%s"', tostring(i)))assert(not g.Loading[i],string.format('Circular dependency at "%s"', tostring(i)))g.Loading[i]=true if typeof(j)=='table'and j.ClassName=='ModuleScript'then j=d(j)elseif typeof(j)=='Instance'and j.ClassName=='ModuleScript'then j=d(j)end if typeof(j)=='function'then j=j(g.Root)end g.Loading[i]=nil g.Loaded[i]=j return j end e.Extend=function(g, i)for j,l in i do g:Add(j,l)end return g end e.Get=function(g, i)local j=g for l in string.gmatch(i,'[^/]+')do if e.is(j)then j=j:Load(l)else j=j[l]end assert(j~=nil,string.format('Invalid path "%s" at "%s"', tostring(i), tostring(l)))end return j end return e end)()end},{{1,4,{"Loader"},{{8,2,{"Vinca"}},{2,2,{"Library"},{{6,2,{"Interface"}},{3,2,{"Modules"},{{5,2,{"Luarmor"}},{4,2,{"KeyFile"}}}},{7,2,{"Shared"}}}}}}},"0.4.2","strelizia.cc",
string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,tostring,tonumber,_VERSION

local x,
y,
z,

A,

B,
C,
D=m.insert,m.remove,m.freeze or function(x)return x end,o.wrap,f.sub,f.match,f.gmatch



if v and B(v,1,4)=="Lune"then
local E,F=s(r,"@lune/task")
if E and F then
g=F
end
end

local E=g and g.defer


local F,




G,







H,

I,
J,
K,
L,


M,



N=E or function(F,...)A(F)(...)end,{[1]="Folder",[2]="ModuleScript",[3]="Script",[4]="LocalScript",[5]="StringValue",},{},{},{},{},{},{},{}


local O,










































































P={GetFullName={{},function(O)local P,Q=O.Name,O.Parent while Q do P=Q.Name.."."..P Q=Q.Parent end return P end},GetChildren={{},function(O)local P={}for Q in l,N[O]do x(P,Q)end return P end},GetDescendants={{},function(O)local P={}for Q in l,N[O]do x(P,Q)for R,S in l,Q:GetDescendants()do x(P,S)end end return P end},FindFirstChild={{"string","boolean?"},function(O,P,Q)local R=N[O]for S in l,R do if S.Name==P then return S end end if Q then for S in l,R do return S:FindFirstChild(P,true)end end end},FindFirstAncestor={{"string"},function(O,P)local Q=O.Parent while Q do if Q.Name==P then return Q end Q=Q.Parent end end},WaitForChild={{"string","number?"},function(O,P)return O:FindFirstChild(P)end},},{}
for Q,R in l,O do
local S,
T,

U=R[1],R[2],{}
for V,W in l,S do
local X,Y=C(W,"^([^%?]+)(%??)")
U[V]={X,Y}
end

P[Q]=function(V,...)
if not N[V]then
j("Expected ':' not '.' calling member function "..Q,2)
end

local W={...}
for X,Y in l,U do
local Z=W[X]
local _,
aa,ab=q(Z),Y[1],Y[2]

if Z==nil and not ab then
j("Argument "..Z.." missing or nil",3)
end

if aa~="any"and _~=aa and not(_=="nil"and ab)then
j("Argument "..X.." expects type \""..aa.."\", got \"".._.."\"",2)
end
end

return T(V,...)
end
end local aa=function(

aa, ab, Q)



local


R,S,T,









U,
V,W=i({},{__mode="k"}),function(R)j(R.." is not a valid (virtual) member of "..aa.." \""..ab.."\"",3)end,function(R)j("Unable to assign (virtual) property "..R..". Property is read only",3)end,{},{}

V.__metatable=false

V.__index=function(X,Y)
if Y=="ClassName"then
return aa
elseif Y=="Name"then
return ab
elseif Y=="Parent"then
return Q
elseif aa=="StringValue"and Y=="Value"then

return W
else
local Z=P[Y]

if Z then
return Z
end
end


for Z in l,R do
if Z.Name==Y then
return Z
end
end


S(Y)
end

V.__newindex=function(X,Y,Z)

if Y=="ClassName"then
T(Y)
elseif Y=="Name"then
ab=Z
elseif Y=="Parent"then

if Z==U then
return
end

if Q~=nil then

N[Q][U]=nil
end

Q=Z

if Z~=nil then

N[Z][U]=true
end
elseif aa=="StringValue"and Y=="Value"then

W=Z
else

S(Y)
end
end

V.__tostring=function()
return ab
end

i(U,V)

N[U]=R

if Q~=nil then
N[Q][U]=true
end

return U end



local function CreateRefFromObject(ab,Q)
local R,
S,
T,
U=ab[1],ab[2],ab[3],ab[4]

local V=G[S]

local W=T and y(T,1)or V

local X=aa(V,W,Q)
H[R]=X

if T then
for Y,Z in l,T do
X[Y]=Z
end
end

if U then
for Y,Z in l,U do
CreateRefFromObject(Z,X)
end
end

return X
end

local ab=aa("Folder","["..e.."]")
for Q,R in l,c do
CreateRefFromObject(R,ab)
end


for Q,R in l,b do
local S=H[Q]

I[S]=R
J[S]=Q

local T=S.ClassName
if T=="LocalScript"or T=="Script"then
x(L,S)
end
end local Q=function(

Q)
local R,


S=Q.ClassName,K[Q]
if S and R=="ModuleScript"then
return n(S)
end

local T,U=I[Q],function(

T)
T=t(T)

local U,


V,W=Q:GetFullName(),C(T,"[^:]+:(%d+): (.+)")

if not V or not w then
return U..":*: "..(W or T)
end

V=u(V)

local X=J[Q]
local Y=w[X]

local Z=V-Y+1
if Z<0 then
Z="?"
end

return U..":"..Z..": "..W end



if R=="LocalScript"or R=="Script"then
local V,W=s(T)
if not V then
j(U(W),0)
end
else
local V={s(T)}

local W=y(V,1)
if not W then
local X=y(V,1)
j(U(X),0)
end

K[Q]=V
return n(V)
end end




a=function(R)
local S,T,













U=H[R],function(S, ...)local T={s(S,...)}local U=y(T,1)if not U then j(T[1],3)end return n(T)end,z(i({},{
__index=M,
__newindex=function(S,T,U)
M[T]=U
end,
__len=function()
return#M
end,
__iter=function()
return l,M
end,
}))

local ac,











ad,ae=z{version=d,envname=e,shared=U,script=p,require=r,},S,function(

V, ...)
local W,

X,
Y=q(V),"Attempted to call require with a non-ModuleScript","Attempted to call require with self"

if W=="table"and N[V]then
if V.ClassName~="ModuleScript"then
j(X,2)
elseif V==S then
j(Y,2)
end

return Q(V)
elseif W=="string"and B(V,1,1)~="@"then


if#V==0 then
j("Attempted to call require with empty string",2)
end

local Z=S

if B(V,1,1)=="/"then
Z=ab
elseif B(V,1,2)=="./"then
V=B(V,3)
end

local _
for ac in D(V,"([^/]*)/?")do
local ad=ac
if ac==".."then
ad="Parent"
end


if ad~=""then
local ae=Z:FindFirstChild(ad)
if not ae then
local af=Z.Parent
if af then
ae=af:FindFirstChild(ad)
end
end

if ae then
Z=ae
elseif ac~=_ and ac~="init"and ac~="init.server"and ac~="init.client"then
j("Virtual script path \""..V.."\" not found",2)
end
end


_=ac
end

if Z.ClassName~="ModuleScript"then
j(X,2)
elseif Z==S then
j(Y,2)
end

return Q(Z)
end

return T(r,V,...)end



return ac,ad,ae end


for ac,ad in l,L do
F(Q,ad)
end
