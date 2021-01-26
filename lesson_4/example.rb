def fizz_buzz(arr)
  arr.each { |n|
    words = ["FizzBuzz", "Buzz", "Fizz"]
    num = [n % 3, 1].min + [n % 5, 1].min * 2
    if num < words.size then puts words[num]
    else puts n
    end
  }
end
fizz_buzz (1..100)