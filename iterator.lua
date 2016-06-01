--section 1
function values(t)
	local i=0
	return function () i=i+1; return t[i] end
end

t = {1,2,3,4,5}
iter = values(t)
while true do
	local element = iter()
	if element==nil then break end
	print(element)
end
--section 2
function allwords()
	local line=io.read()
	local pos=1
	return function()
		while line do
			local s,e = string.find(line,"%w+",pos)
			if s then
				pos=e+1
				return string.sub(line,s,e)
			else
				line=io.read()
				pos=1
			end
		end
		return nil
	end
end

for word in allwords() do
	print(word)
end

local function iter(a,i)
	i=i+1
	local v=a[i]
	if v then
		return i,v
	end
end


function ipair(a)
	return iter,a,0
end

a = {"1","4","6"}
for i,v in ipair(a) do
	print(i,v)
end

local function getnext (list,node)
	if not node then
		return list
	else
		return node.next
	end
end

function traverse(list)
	return getnext,list,nil
end

--[[
list = nil
for line in io.lines() do
	list = {val=line,next=list}
end

for node in traverse(list) do
	print(node.val)
end]]


















