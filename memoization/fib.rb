def bad_fib(n)
  return 1 if n <= 2

  bad_fib(n - 1) + bad_fib(n - 2)
end

def fib(n, memo = {})
  return 1 if n <= 2
  return memo[n] if memo[n]

  memo[n] = fib(n-1, memo) + fib(n - 2, memo)
end