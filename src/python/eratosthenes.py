import time
# from functools import cache
# from numba import njit

# the performance bootst using this external lib is impressive
# @njit
# @cache
def erasthenos(upper_bound):
    bool_array = [True] * upper_bound
    bool_array[0] = False

    primes = [2, 3]

    i = 4
    adder = 0
    while i < upper_bound:
        if bool_array[i]:
            prime = i + 1
            primes.append(prime)
            multiples = prime * 3

            while multiples < upper_bound:
                bool_array[multiples-1] = False
                multiples += 2 * prime

        i += 2 + adder
        adder = abs(adder - 2)

    return primes


if __name__ == '__main__':
    start_time = time.time()
    iterations = 1000
    length = 1000000
    for i in range(iterations):
        erasthenos(length)
    time_passed = time.time() - start_time
    print(f"finished in {time_passed / iterations * 1000} in milliseconds")