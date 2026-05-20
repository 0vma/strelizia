local a local b,c,d,e,f,g,h,i,j,k,n,q,s,t,u,v,w,x,y,z={function()local b,c,d=a(1
)return(function(...)if(not game:IsLoaded())then game.Loaded:Wait()end local e,f
=d(c.Library),getgenv()if f.Library then f.Library:Unload()end if(not pcall(e.
Get,e,'Shared'))then return end local g,h,i,j,k,l,m=e:Get'Shared/Modules/Places'
,e:Get'Shared/Modules/Interface'.GetInterface'Obsidian',e:Get
'Shared/Modules/Preference',e:Get'Shared/Constants',e:Get
'Shared/Functions/Strings',e:Get'Shared/Functions/Time',e:Get
'Shared/Functions/PromptDiscord'local n,o,p=j.Characters.BulletPoint,i.new(),g.
GetPlaceFromId(game.PlaceId)if not p then return h.Main:Notify{Title=
'strelizia.cc',Description=
[[this game is currently not supported by strelizia! if you think that this is a mistake then join our discord server and report this issue!]]
,Time=5}end if g.IsExecutorBlacklisted(p.BlacklistedExecutors)then return h.Main
:Notify{Title='strelizia.cc',Description=
'this script is not compatible with your executor!',Time=3}end local q=(p.
Downtime.Status and p.Downtime.Message)if q then return h.Main:Notify{Title=
'strelizia.cc',Description=string.format(
[[unable to load %s script because it's currently experiencing a downtime! specificed downtime reason: %s]]
,tostring(p.Name),tostring(q))}end local r,s=e:Get'Modules/KeyFile',e:Get
'Modules/Luarmor':Init'15da501a7e3c5c8be15ae68adb8f1b13'local t=f.script_key or
r:Read()if t then local u=s:Check(t)if u.code=='KEY_VALID'then h.Main:Notify{
Title='strelizia.cc',Description='saved key is valid! loading script!',Time=3}
return s:LoadScript(t)end h.Main:Notify{Title='strelizia.cc',Description=
'saved key is invalid! please enter a new key!',Time=4}r:Erase()end if p.Keyless
then h.Main:Notify{Title='strelizia.cc',Description=
[[script for this game is currently keyless, no key required! loading script...]]
,Time=3}return s:LoadScript()end local u=e:Get'Interface':Create()local v=u.
Library.Buttons local w,x=v.CheckKeyButton,v.GetKeyButton local y=function(y)if
y:len()~=32 then u.Library:Notify{Title='strelizia.cc',Description=
'invalid key length!',Time=2}return end w:SetDisabled(true)u.Library:Notify{
Title='strelizia.cc',Description='checking your key, please wait...',Time=2}
local z=s:Check(y)u.Library:Notify{Title='strelizia.cc',Description=z.message,
Time=2}if z.code=='KEY_VALID'then r:Write(y)u.Library:Unload()return s:
LoadScript(y)else w:SetDisabled(false)end end w.Func=function()return y(u.
Library.Options.ScriptKeyInput.Value)end x.Func=function()local z,A,B={},{}for C
,D in j.KeySystemAdProviders do z[D.Name]={Title=D.Name,Order=C,Variant=
'Primary',Callback=function()setclipboard(string.format(
'https://ads.luarmor.net/get_key?for=%s',tostring(D.Identifier)))u.Library:
Notify{Title='strelizia.cc',Description=string.format(
[[you have selected the following provider: %s
link to the ad provider has been copied to your clipboard!]]
,tostring(D.Name))}if B then print'ha yes i am the sigma one.'o:Write(
'SELECTED_AD_PROVIDER',D.Name)end end}table.insert(A,string.format(
'%s %s: \n%s%s Key Length: %s\n%s%s Completion Time: %s',tostring(n),tostring(D.
Name),tostring(k.LeadingSpace(5)),tostring(n),tostring(l.CompressTime(D.
KeyLength)),tostring(k.LeadingSpace(5)),tostring(n),tostring(l.CompressTime(D.
CompletionTime))))end local C=o:Read'SELECTED_AD_PROVIDER'if C then local D=z[C]
if(D)then return D.Callback()end print'nope, not the sigma one'o:Write(
'SELECTED_AD_PROVIDER',nil)end local D=u.Window:AddDialog('AdProviderSelection',
{Title='Ad Provider Selection',Description=
'select your ad provider based on the information below',Icon='key',
FooterButtons=z})D:AddLabel('AdProviderLabel',{Text=table.concat(A,'\n\n'),
DoesWrap=true})D:AddToggle('RememberMyChoiceProvider',{Text='remember my choice'
,Tooltip='wont ask you to pick providers again',Callback=function(E)print
'oh yes we are save'B=E end})end v.JoinDiscordButton.Func=function()m(j.
DiscordInviteCode,true)u.Library:Notify{Title='strelizia.cc',Description=
'successfully copied/prompted discord join code!'}end v.UnloadScript.Func=
function()return u.Library:Unload()end end)()end,function()local b,c,d=a(2)
return(function(...)local e=d(c.Parent.Vinca)return e.new():Extend(e.Extensions.
Children(c))end)()end,function()local b,c=a(3)return(function(...)return
function(d)return d.new(d):Extend(d.Extensions.Children(c))end end)()end,
function()a(4)return(function(...)return function(b)local c=b.Services local d,e
,f,g=c.EncodingService,b:Get'Shared/Modules/t',{},'strelizia/key.bin'f.Erase=
function(h)return delfile(g)end f.Read=function(h)if(not isfile(g))then return
nil end local i,j=pcall(d.Base64Decode,d,buffer.fromstring(readfile(g)))if(not i
)then return f:Erase()end return buffer.tostring(j):reverse()end f.Write=
function(h,i)assert(e.string(i))writefile(g,buffer.tostring(d:Base64Encode(
buffer.fromstring(i:reverse()))))return true end return f end end)()end,function
()a(5)return(function(...)return function(b)local c,d,e,f=b:Get
'Shared/Modules/t',
[[Cannot run any Luarmor module methods without calling :Init() first!]],
getgenv(),{}f.Init=function(g,h)assert(c.string(h))if(not g.Cached)then g.Cached
=loadstring(game:HttpGet'https://sdkapi-public.luarmor.net/library.lua')()g.
Cached.script_id=h end return g end f.Get=function(g)assert(c.table(g.Cached),d)
return g.Cached end f.Check=function(g,h)return g:Get().check_key(h)end f.
LoadScript=function(g,h)e.script_key=h return g:Get().load_script()end f.Purge=
function(g)g:Get().purge_cache()return g end return f end end)()end,function()a(
6)return(function(...)return function(b)local c,d,e,f,g,h=b:Get
'Shared/Constants',b:Get'Shared/Modules/Places',b:Get'Shared/Functions/Time',b:
Get'Shared/RBXUtil/TableUtil',b:Get'Shared/Modules/Interface',b:Get
'Shared/Modules/Color'local i,j,k,l=c.Characters,Color3.fromRGB(255,170,255),h.
Paint,{}l.Create=function(m)local n=g.GetInterface'Obsidian'local o=n.Main l.
Library=o local p,q=d.GetPlaceFromId(game.PlaceId),o:CreateWindow{Title=
'key system',Footer='strelizia.cc',Size=UDim2.fromOffset(600,540),Icon=
79981166576877,CornerRadius=6,SidebarCompacted=true}l.Window=q local r={Home=q:
AddTab{Name='Home',Icon='house',Description=
'everything related to the key system'},Settings=q:AddTab{Name='Settings',Icon=
'cog',Description='loader/ui configuration'}}local s=r.Home:AddGroupbox{Side=1,
Name='Key System',IconName='key'}s:AddInput('ScriptKeyInput',{Placeholder=
'key goes here!',ClearTextOnFocus=true,Text='Script Key',Tooltip=
[[paste your script key in here to access the script, press get key down below in order to get the key]]
})s:AddButton('CheckKeyButton',{Text='Check Key',Tooltip=
[[checks if the key in the input above is valid and loads the script]]}):
AddButton('GetKeyButton',{Text='Get Key',Tooltip=
'prompts ad provider links which lead to the script key'})local t,u,v=r.Home:
AddGroupbox{Side=1,Name='Information',IconName='info'},{string.format(
[[If you don't have a key yet, press %s, choose an %s and finish the ad flow after which you will receive %s.]]
,tostring(h.Paint('Get Key',j)),tostring(h.Paint('ad provider',j)),tostring(h.
Paint('your key',j))),string.format(
[[Paste your %s into the %s above and press validate in order to load the script.]]
,tostring(h.Paint('key',j)),tostring(h.Paint('input box',j))),string.format(
[[In case you run into issues or have questions make sure to join our %s by clicking the button below!]]
,tostring(h.Paint('discord server',j)))},''for w,x in u do v=v..string.format(
'%s %s \n \n',tostring(i.BulletPoint),tostring(x))end t:AddLabel('TutorialLabel'
,{Text=v:sub(1,-4),DoesWrap=true})t:AddDivider{Text='misc'}t:AddButton(
'JoinDiscordButton',{Text='Join Discord Server',Tooltip=
[[pressing this will either prompt our discord server directly in the app or copy the link to your clipboard]]
})t:AddButton('UnloadScript',{Text='Unload',Tooltip=
'pressing this will unload the script loader'})local w=r.Home:AddGroupbox{Side=2
,Name='Script Update Log',IconName='clipboard-clock'}w:AddLabel(
'ScriptUpdateDate',{Text=string.format('Last Updated at: %s',tostring(e.
FormatTime(p.Update.Time,'MM/DD/YYYY HH:mm'))),DoesWrap=true,Alignment=Enum.
TextXAlignment.Center})w:AddDivider{Text='update log'}w:AddLabel(
'ScriptUpdateLog',{Text=table.concat(p.Update.Log,'\n'),DoesWrap=true,Alignment=
Enum.TextXAlignment.Center})n.Tabs.Settings(r.Settings)return l end return l end
end)()end,function()local b,c,d=a(7)return(function(...)return function(e)local
f=e.Services local g,h,i,j,k=f.HttpService,f.EncodingService,d(c.Cache)(e),
'424e003e2f56556da9a2032426c948112d6f34b3','strelizia/cache/shared'local l,n=
string.format('%s/%s.json',tostring(k),tostring(j)),function(l)local m,n=pcall(
loadstring,l,'Shared')if(not m)then return false,string.format(
'failed to load shared code: %s',tostring(tostring(n)))end local o,p=pcall(n)if(
not o)then return false,string.format('failed to load shared code: %s',tostring(
tostring(p)))end return true,p end print
'\u{2139}\u{fe0f} | finding shared cache'local o,p=i:Read(l)if(o)then print
'\u{2705} | valid shared cache has been found'local q,r=n(p.Content)if(not q)
then print'\u{274c} | failed to exec cached code, deleting cache'i:Erase(l)else
print'\u{2705} | shared code loaded successfully'return r end end print
'\u{2139}\u{fe0f} | no cache found, downloading from cdn'local q,r,s=os.clock(),
pcall(request,{Url=string.format(
'https://cdn.jsdelivr.net/gh/0vma/strelizia@%s/shared.luau',tostring(j)),Method=
'GET'})if(not r)or(not s.Success)then print'\u{274c} | failed to fetch from cdn'
return nil end print(string.format(
'\u{2705} | shared cache has been downloaded, loading! (%sms)',tostring(math.
floor((os.clock()-q)*1000))))local t,u=n(s.Body)if(not t)then print
'\u{274c} | failed to exec shared code'return nil end print
'\u{2705} | shared code loaded successfully'i:Write(l,s.Body)print
'\u{2139}\u{fe0f} | shared code has been cached'local v=i:Cleanup(k)if#v>0 then
print(string.format('\u{2139}\u{fe0f} | removed %s unused/outdated cache files',
tostring(#v)))end return u end end)()end,function()a(8)return(function(...)
return function(b)local c=b.Services local d,e,f,g=c.EncodingService,c.
HttpService,7,(12096E2)local h,i=function(h)assert(typeof(h)=='string',
'Path must be a string!')local i,j=pcall(e.JSONDecode,e,readfile(h))if(not i)
then return false,'failed to parse json'end if typeof(j.LastVisit)~='number'or
typeof(j.Content)~='string'then return false,'invalid data format'end return
true,j end,{}i.Read=function(j,k)assert(typeof(k)=='string',
'Path must be a string!')if(not isfile(k))then return false,"file doesn't exist"
end local l,n=h(k)if(not l)then return false,n end local p,q=pcall(d.
Base64Decode,d,buffer.fromstring(n.Content))if(not p)then return false,
'failed to decode file content'end local s,t=pcall(d.DecompressBuffer,d,q,Enum.
CompressionAlgorithm.Zstd)if(not s)then return false,
'failed to decompress buffer'end local u=n.LastVisit n.LastVisit=DateTime.now().
UnixTimestamp writefile(k,e:JSONEncode(n))return true,{LastVisit=u,Content=
buffer.tostring(t)}end i.Erase=function(j,k)assert(typeof(k)=='string',
'Path must be a string!')delfile(k)return j end i.Write=function(j,k,n)assert(
typeof(k)=='string'and typeof(n)=='string','Path and Source must be strings')
local q=d:CompressBuffer(buffer.fromstring(n),Enum.CompressionAlgorithm.Zstd,f)
local s=d:Base64Encode(q)writefile(k,e:JSONEncode{Content=buffer.tostring(s),
LastVisit=DateTime.now().UnixTimestamp})return true end i.Cleanup=function(j,k)
assert(typeof(k)=='string','Path must be a string!')local n={}for q,s in
listfiles(k)do local t,u=h(s)if(not t)or u.LastVisit<(DateTime.now().
UnixTimestamp-g)then i:Erase(s)table.insert(n,s)end end return n end return i
end end)()end,function()local b,c,d=a(9)return(function(...)local e={}e.__index=
e e.Extensions={Children=function(f)local g={}for h,i in f:GetChildren()do g[i.
Name]=i end return g end}local f=cloneref or function(f)return f end e.Services=
setmetatable({},{__index=function(g,h)local i,j=pcall(game.GetService,game,h)if
i and j then j=f(j)rawset(g,h,j)return j end return nil end})e.new=function(g)
local h=setmetatable({__vinca=true,Loaded={},Loading={},Container={}},e)h.Root=g
or h return h end e.is=function(g)return g and typeof(g)=='table'and rawget(g,
'__vinca')end e.Add=function(g,h,i)assert(not g.Container[h],
'Index already exists')g.Container[h]=i return g end e.Load=function(g,h)if g.
Loaded[h]~=nil then return g.Loaded[h]end local i=g.Container[h]assert(i~=nil,
string.format('Unknown dependency "%s"',tostring(h)))assert(not g.Loading[h],
string.format('Circular dependency at "%s"',tostring(h)))g.Loading[h]=true if
typeof(i)=='table'and i.ClassName=='ModuleScript'then i=d(i)elseif typeof(i)==
'Instance'and i.ClassName=='ModuleScript'then i=d(i)end if typeof(i)=='function'
then i=i(g.Root)end g.Loading[h]=nil g.Loaded[h]=i return i end e.Extend=
function(g,h)for i,j in h do g:Add(i,j)end return g end e.Get=function(g,h)local
i=g for j in string.gmatch(h,'[^/]+')do if e.is(i)then i=i:Load(j)else i=i[j]end
assert(i~=nil,string.format('Invalid path "%s" at "%s"',tostring(h),tostring(j))
)end return i end return e end)()end},{{1,4,{'Loader'},{{9,2,{'Vinca'}},{2,2,{
'Library'},{{6,2,{'Interface'}},{7,2,{'Shared'},{{8,2,{'Cache'}}}},{3,2,{
'Modules'},{{5,2,{'Luarmor'}},{4,2,{'KeyFile'}}}}}}}}},'0.4.2','strelizia.cc',
string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,
pcall,tostring,tonumber,_VERSION local A,B,C,D,E,F,G=k.insert,k.remove,k.freeze
or function(A)return A end,q.wrap,f.sub,f.match,f.gmatch if y and E(y,1,4)==
'Lune'then local H,I=v(u,'@lune/task')if H and I then g=I end end local H=g and
g.defer local I,J,K,L,M,N,O,P,Q=H or function(I,...)D(I)(...)end,{[1]='Folder',[
2]='ModuleScript',[3]='Script',[4]='LocalScript',[5]='StringValue'},{},{},{},{},
{},{},{}local R,S={GetFullName={{},function(R)local S,T=R.Name,R.Parent while T
do S=T.Name..'.'..S T=T.Parent end return S end},GetChildren={{},function(R)
local S={}for T in j,Q[R]do A(S,T)end return S end},GetDescendants={{},function(
R)local S={}for T in j,Q[R]do A(S,T)for U,V in j,T:GetDescendants()do A(S,V)end
end return S end},FindFirstChild={{'string','boolean?'},function(R,S,T)local U=Q
[R]for V in j,U do if V.Name==S then return V end end if T then for V in j,U do
return V:FindFirstChild(S,true)end end end},FindFirstAncestor={{'string'},
function(R,S)local T=R.Parent while T do if T.Name==S then return T end T=T.
Parent end end},WaitForChild={{'string','number?'},function(R,S)return R:
FindFirstChild(S)end}},{}for T,U in j,R do local V,W,X=U[1],U[2],{}for Y,Z in j,
V do local _,aa=F(Z,'^([^%?]+)(%??)')X[Y]={_,aa}end S[T]=function(aa,...)if not
Q[aa]then i("Expected ':' not '.' calling member function "..T,2)end local Y={
...}for Z,_ in j,X do local ab=Y[Z]local ac,ad,ae=t(ab),_[1],_[2]if ab==nil and
not ae then i('Argument '..ab..' missing or nil',3)end if ad~='any'and ac~=ad
and not(ac=='nil'and ae)then i('Argument '..Z..' expects type "'..ad..'", got "'
..ac..'"',2)end end return W(aa,...)end end local aa=function(aa,ab,ac)local ad,
ae,T,U,V,W=h({},{__mode='k'}),function(ad)i(ad..
' is not a valid (virtual) member of '..aa..' "'..ab..'"',3)end,function(ad)i(
'Unable to assign (virtual) property '..ad..'. Property is read only',3)end,{},{
}V.__metatable=false V.__index=function(X,Y)if Y=='ClassName'then return aa
elseif Y=='Name'then return ab elseif Y=='Parent'then return ac elseif aa==
'StringValue'and Y=='Value'then return W else local Z=S[Y]if Z then return Z end
end for Z in j,ad do if Z.Name==Y then return Z end end ae(Y)end V.__newindex=
function(X,Y,Z)if Y=='ClassName'then T(Y)elseif Y=='Name'then ab=Z elseif Y==
'Parent'then if Z==U then return end if ac~=nil then Q[ac][U]=nil end ac=Z if Z
~=nil then Q[Z][U]=true end elseif aa=='StringValue'and Y=='Value'then W=Z else
ae(Y)end end V.__tostring=function()return ab end h(U,V)Q[U]=ad if ac~=nil then
Q[ac][U]=true end return U end local function CreateRefFromObject(ab,ac)local ad
,ae,T,U=ab[1],ab[2],ab[3],ab[4]local V=J[ae]local W=T and B(T,1)or V local X=aa(
V,W,ac)K[ad]=X if T then for Y,Z in j,T do X[Y]=Z end end if U then for Y,Z in j
,U do CreateRefFromObject(Z,X)end end return X end local ab=aa('Folder','['..e..
']')for ac,ad in j,c do CreateRefFromObject(ad,ab)end for ac,ad in j,b do local
ae=K[ac]L[ae]=ad M[ae]=ac local T=ae.ClassName if T=='LocalScript'or T=='Script'
then A(O,ae)end end local ac=function(ac)local ad,ae=ac.ClassName,N[ac]if ae and
ad=='ModuleScript'then return n(ae)end local T,U=L[ac],function(T)T=w(T)local U,
V,W=ac:GetFullName(),F(T,'[^:]+:(%d+): (.+)')if not V or not z then return U..
':*: '..(W or T)end V=x(V)local X=M[ac]local Y=z[X]local Z=V-Y+1 if Z<0 then Z=
'?'end return U..':'..Z..': '..W end if ad=='LocalScript'or ad=='Script'then
local V,W=v(T)if not V then i(U(W),0)end else local V={v(T)}local W=B(V,1)if not
W then local X=B(V,1)i(U(X),0)end N[ac]=V return n(V)end end a=function(ad)local
ae,T,U=K[ad],function(ae,...)local T={v(ae,...)}local U=B(T,1)if not U then i(T[
1],3)end return n(T)end,C(h({},{__index=P,__newindex=function(ae,T,U)P[T]=U end,
__len=function()return#P end,__iter=function()return j,P end}))local af,ag,ah=C{
version=d,envname=e,shared=U,script=s,require=u},ae,function(V,...)local W,X,Y=
t(V),'Attempted to call require with a non-ModuleScript',
'Attempted to call require with self'if W=='table'and Q[V]then if V.ClassName~=
'ModuleScript'then i(X,2)elseif V==ae then i(Y,2)end return ac(V)elseif W==
'string'and E(V,1,1)~='@'then if#V==0 then i(
'Attempted to call require with empty string',2)end local Z=ae if E(V,1,1)=='/'
then Z=ab elseif E(V,1,2)=='./'then V=E(V,3)end local _ for af in G(V,
'([^/]*)/?')do local ag=af if af=='..'then ag='Parent'end if ag~=''then local ah
=Z:FindFirstChild(ag)if not ah then local ai=Z.Parent if ai then ah=ai:
FindFirstChild(ag)end end if ah then Z=ah elseif af~=_ and af~='init'and af~=
'init.server'and af~='init.client'then i('Virtual script path "'..V..
'" not found',2)end end _=af end if Z.ClassName~='ModuleScript'then i(X,2)elseif
Z==ae then i(Y,2)end return ac(Z)end return T(u,V,...)end return af,ag,ah end
for ad,ae in j,O do I(ac,ae)end
