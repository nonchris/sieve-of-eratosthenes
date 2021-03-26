# frozen_string_literal: true

def println(obj, *args)
  print(obj)
  args.each do |line|
    print(line)
  end
  print("\n")
end

# @param [Integer] upper_bound
def eratosthenes_sieve(upper_bound)
  bool_array = [true] * upper_bound
  bool_array[0] = false

  primes = [2, 3]
  i = 5
  adder = 0
  while i < upper_bound
    if bool_array[i]
      primes.push(i)

      multiple = i * 3
      while multiple < upper_bound
        bool_array[multiple] = false
        multiple += i * 2
      end
    end
    i += (2 + adder)
    adder = (adder - 2) * -1
  end

  primes
end

time = Time.now
iterations = 1_000
len = 1_000_000
i = 0

while i < iterations
  array = eratosthenes_sieve(len)
  i += 1
end

time2 = Time.now
puts "Current Time [sek]: #{(time2 - time).inspect}"
