function derivative(f,delta)
    delta = delta or 1e-4
    return function(x)
                return (f(x+delta)-f(x))/delta
            end
    end
    
a=derivative(function(x) return x*x end)-- (x*x)' = 2*x
print(a(5))


function newCounter()
   local i = 0
   return function() i=i+1 return i end
   end
   
c1 = newCounter()
print(c1())
print(c1())
c2 = newCounter()
print(c2())
print(c2())

do
local oldSin = math.sin
local k = math.pi/180
math.sin = function(x)
                return oldSin(x*k)
            end
end

print(math.sin(0))
print(oldSin(0)) -- meta-mechanism







