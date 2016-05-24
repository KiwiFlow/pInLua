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

---







