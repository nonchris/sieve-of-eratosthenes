import times

proc eratosthenes(upper_limit: int): seq[int] = 
    var r: seq[int]
    var bool_array: seq[bool] = newSeq[bool](upper_limit)

    r.add(2)
    r.add(3)

    var cursor: int = 2
    var i = 5
    var adder = 0

    while i < upper_limit:
        if not bool_array[i]:
            r.add(i)
            cursor += 1
            var inc = i*2
            var multiples = i*3
            while multiples < upper_limit:
                bool_array[multiples] = true
                multiples += inc
        
        i += 2 + adder
        adder = (adder-2) * -1
    
    return r

let time = cpuTime()
var i = 0
var len = 1_000_000
var iterations = 1000
while i < iterations:
    discard eratosthenes(len)
    i += 1

echo "Time taken: ", cpuTime() - time
