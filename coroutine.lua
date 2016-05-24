--suspended running dead normal
co = coroutine.create(function() print("hi") end)
print(coroutine.resume(co))
print(coroutine.resume(co))--false	cannot resume dead coroutine

--yield

co = coroutine.create(function()
	for i=1,10 do
		print("co",i)
		coroutine.yield()
	end
end)

coroutine.resume(co)
print(coroutine.status(co)) -- suspended

for i = 1,9 do
	coroutine.resume(co)
	print(coroutine.status(co))
end
print(coroutine.status(co)) -- suspended
coroutine.resume(co)
print(coroutine.status(co)) --dead

---data flow , input ,output 
co = coroutine.create(function(a,b)
	print(coroutine.yield(a+b,a-b))
end)

print(coroutine.resume(co,20,10))--what resume return is yield input
print(coroutine.resume(co))
print(coroutine.resume(co))
print(coroutine.status(co))

co = coroutine.create(function()
	return 6,7,8,9
end)
print(coroutine.resume(co))

--consumer and producer
input = {1,2,3}

function receive ()
    local status, value = coroutine.resume(producer)
    return value
end
 
function send (x)
    coroutine.yield(x)
end

producer = coroutine.create(
	function ()
	    for i=1,3 do
	    	local x = input[i]
	    	send(x)   -- send to consumer
    	end
	end
)
	    

function consumer ()
    for i=1,3 do
       local x = receive()      -- receive from producer
       print(x)        -- consume new value
    end
end
consumer() --- so-called consumer-driven

--iterator
function permgen (a, n)
    if n == 0 
    	then coroutine.yield(a)
    else
       for i=1,n do
           -- put i-th element as the last one
           a[n], a[i] = a[i], a[n]
           -- generate all permutations of the other elements
           permgen(a, n - 1)
           -- restore i-th element
           a[n], a[i] = a[i], a[n]
       end
    end
end

function perm (a)
    local co = coroutine.create(function () permgen(a,#a) end)
    return function ()   -- iterator
       local code, res = coroutine.resume(co)
       return res
    end
end

function printResult (a)
    for i,v in ipairs(a) do
       print(v)
    end
    print("\n")
end

printResult(perm({1,2,3,4})())
