# To change this template, choose Tools | Templates
# and open the template in the editor.

@problem1 = Proc.new do |limit| #sum multiples of 3 or 5 below X
  limit ||= 1000
  list = []
  i = 1
  while i*3 < limit do
    list << i*3 unless list.include?(i*3)
    list << i*5 unless list.include?(i*5) || (i*5 >= limit)
    i += 1
  end
  sum = 0
  #list.sort!
  list.each do |num|
    #puts num
    sum += num
  end
  
  puts sum
end

@problem2 = Proc.new do |limit|
  limit ||= 4000000 #4 million
  fibs = [1, 2]
  #yes i'm about to brute-force it :-/
  succ = 3
  while succ < limit do
    fibs << succ
    i = fibs.length
    succ = fibs[i-2] + fibs[i-1]
  end

  sum = 0
  fibs.each do |term|
    sum += term if term.even?
  end
  
  puts sum
end

@problem3 = Proc.new do |number|
  require 'prime'
  number ||= 600851475143
  class Bignum
    def divided_evenly_by(factor)
      k = self / factor
      if k * factor == self
        k
      else
        nil
      end
    end
  end
  
  class Fixnum
    def divided_evenly_by(factor)
      k = self / factor
      if k * factor == self
        k
      else
        nil
      end
    end
  end
  
  factors = []
  result = nil
  
  Prime.each do |prime|
    loop do
      result = number.divided_evenly_by prime
      break if result.nil?
      factors << prime
      number = result
    end
    break if number == 1 || prime > number
  end
  
  puts factors.join(", ")
end

@problem4 = Proc.new do
  
end