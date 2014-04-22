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

@problem8 = Proc.new do |input|
  input ||=  '73167176531330624919225119674426574742355349194934
              96983520312774506326239578318016984801869478851843
              85861560789112949495459501737958331952853208805511
              12540698747158523863050715693290963295227443043557
              66896648950445244523161731856403098711121722383113
              62229893423380308135336276614282806444486645238749
              30358907296290491560440772390713810515859307960866
              70172427121883998797908792274921901699720888093776
              65727333001053367881220235421809751254540594752243
              52584907711670556013604839586446706324415722155397
              53697817977846174064955149290862569321978468622482
              83972241375657056057490261407972968652414535100474
              82166370484403199890008895243450658541227588666881
              16427171479924442928230863465674813919123162824586
              17866458359124566529476545682848912883142607690042
              24219022671055626321111109370544217506941658960408
              07198403850962455444362981230987879927244284909188
              84580156166097919133875499200524063689912560717606
              05886116467109405077541002256983155200055935729725
              71636269561882670428252483600823257530420752963450'
  input.gsub!(/\D+/, '')
  set = input.chars.map { |c| c.to_i }
  
  # method 1:
  # count down from 99999 to 11111, avoiding 0s
  # find 'xxxxx' in the set
  # first valid result is guaranteed to be the max product
  digits = nil
  iterations = 0
  counter = 99999

  begin
    number = counter.to_s.chars.map(&:to_i)
    counter -= 1
    next if number.include? 0
    number.permutation.to_a.uniq.each do |perm|
      iterations +=1
      if input.include? perm.join('')
        digits = perm
      end
    end
  end until digits
  puts "maximum product found: #{digits.join(' x ')} = #{digits.inject(:*)}\n"
  puts "took #{iterations} iterations"
  
  
  
  # method 2: considered dropping all positions which 
  # have the possibility of containing a zero (i.e., min result)
  # But I suspect the previous method is faster with large inputs

#  zero_indices = []
#  set.each.with_index do |c, i|
#    zero_indices << i if c == 0
#  end
#  
#  puts zero_indices.join(', ')
#  
#  zero_indices.each do |zero|
#    set[zero] = nil
#    (1..4).each do |i| 
#      set[zero-i] = nil
#      set[zero+i] = nil
#    end
#  end
end



@problem9 = Proc.new do |input|
  input ||= 1000
  a, b, c = 1, 2, 3
  solved = false
  
  #brute force... and kinda nasty
  squares = (1..500).map { |x| x*x }
    
  200.times do |x|
    a = x+1
    200.times do |y|
      b = a+y+1
      cc = a*a + b*b
      if squares.include? cc
        c = Math.sqrt(cc).to_i
        # solved = ((a + b + c) == input)
        if (a+b+c == 1000)
          puts "#{a} + #{b} + #{c} = #{a+b+c}" 
          puts a*b*c
        end
      end
    end
  end
#  begin
#
#
#    solved = ((a + b + c) == input)
#  end until solved
#  puts a*b*c
end



