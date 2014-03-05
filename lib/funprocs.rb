
@easy145tree = Proc.new do |io_line|
  io_line ||= "13 # @\n"
  input = io_line.chomp!.split
  WIDTH = input[0].to_i
  TRUNK = input[1]
  LEAF = input[2]

  n = (WIDTH+1)/2

  n.times do |i|
    out = ''
    j = i+1
    (n-j).times { out << ' ' }
    (2*j-1).times { out << LEAF }
    puts out
  end

  out = ''
  (n-2).times { out << ' ' }
  (3).times { out << TRUNK }
  puts out
end

@easy145tree_alt = Proc.new do |input|
  input ||= "5 % ^"
  n, b, t = input.split()
  n = n.to_i

  for i in 0..n do
    puts ' '*((n-i)/2) + t*i unless i.even?
  end

  puts ' '*((n-3)/2) + b*3 + ' '*((n-3)/2)
end



@easy_141_door_game = Proc.new do |input|
  class Numeric
    def percent_of(n)
      self.to_f / n.to_f * 100.0
    end
  end

  class Game
    @@wins = 0
    @@losses = 0
    attr_reader :doors


    def initialize()
      @doors = %w{goat car goat}.shuffle
    end

    def play(switching)
      goat_doors = []
      @doors.each_index do |i|
        if @doors[i] == 'goat'
          goat_doors << i
        end
      end

      my_pick = (0..2).to_a.sample

      goat_doors.delete_if { |door_num| door_num == my_pick  }

      their_pick = goat_doors.sample

      if switching
        my_pick = ([0, 1, 2] - [my_pick, their_pick]).first
      end

      if @doors[my_pick] == 'car'
        return true
      else
        return false
      end
    end
  end


  input ||= '100000'
  n = input.to_i
  wins_from_switching = 0
  wins_from_staying = 0

  n.times do
    game = Game.new
    if game.play(true)
      wins_from_switching += 1
    end

    game = Game.new
    if game.play(false)
      wins_from_staying += 1
    end
  end

  puts "Games simulated with each strategy: #{n}"
  puts "Percent won by switching: #{wins_from_switching.percent_of(n)}"
  puts "Percent won by staying: #{wins_from_staying.percent_of(n)}"

end



@some_fft_algo = Proc.new do |vec|
  # Solve "vec = fft_matrix * beta" for beta (modulo a constant.)
  # (Divide result by Math::sqrt(vec.size) to preserve length.)
  # vec.size is assumed to be a power of 2.
  #
  # Example use:  puts fft([1,1,1,1])
  #
  def fft(vec)
      return vec if vec.size <= 1

      even = Array.new(vec.size / 2) { |i| vec[2 * i] }
      odd  = Array.new(vec.size / 2) { |i| vec[2 * i + 1] }

      fft_even = fft(even)
      fft_odd  = fft(odd)

      fft_even.concat(fft_even)
      fft_odd.concat(fft_odd)

      Array.new(vec.size) {|i| fft_even[i] + fft_odd [i] * omega(-i, vec.size)}
  end

  # calculate individual element of FFT matrix:  (e ^ (2 pi i k/n))
  # fft_matrix[i][j] = omega(i*j, n)
  #
  def omega(k, n)
      Math::E ** Complex(0, 2 * Math::PI * k / n)
  end
  
  fft(vec)
  
end




@lexicographical_conversion = Proc.new do |input|
  output = input.downcase.split(/\s+/).map do |w|
    w.chars.sort.join
  end
  puts output
end



@leetify = Proc.new do |input|
  leet = {
  'a' => ['4', '@', '/=\\'],
  'b' => ['b', '/3'],
  'c' => ['(', '<'],
  'd' => ['|)', 'd'],
  'e' => ['3'],
  'i' => ['1'],
  't' => ['7', '~|~'],
  'r' => ['/Z', '/2', 'R'],
  'k' => ['|<', '/<'],
  'l' => ['1', '|'],  
  'm' => ['|v|', '/\\/\\'],
  'n' => ['/\\/', '|\\|'],
  's' => ['5', '$'],
  'w' => ['\\/\\/', '\\v', '|/\\|'],
  'anthony' => ['D4rk s3ns3i'],
  'justin' => ['51/\\/1573/Z C0/\\/\\PU74710/\\/Z']
  }
  
  output = input.split(/\s+/).map do |w|
    if leet[w]
      leet[w].sample
    else
      w0rd = w.chars.map { |c| leet[c] ? leet[c].sample : c }
      w0rd.join
    end
  end
  
  puts output.join(' ')
end



