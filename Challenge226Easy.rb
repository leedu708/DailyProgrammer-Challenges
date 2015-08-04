class Challenge226Easy

  def gcf(num1, num2)
    # recursive, uses Euclidian algorithm for GCF
    frac = [num1, num2].sort
    if frac[0] == 0
      return frac[1]
    else
      return gcf(frac[0], frac[1] % frac[0])
    end
  end

  def lcm(input)
    # gives least common multiple
    lcm = 1
    input.each do |number|
      lcm = (lcm * number) / gcf(lcm, number)
    end
    lcm
  end

  def add_fracs(input)
    nums = []
    denoms = []
    result = []

    # split numerator and denominator into respective arrays
    input.each do |fraction|      
      nums.push(fraction.split("/")[0].to_i)
      denoms.push(fraction.split("/")[1].to_i)
    end

    # grab common multiple of denominators
    lcm = lcm(denoms)
    lcm_multi = []

    # create array that multiplies the numerator to scale with denominator
    denoms.each do |denom|
      lcm_multi.push(lcm / denom)
    end
    
    # multiply the proper scale
    nums.length.times do |index|
      nums[index] *= lcm_multi[index]
    end

    # sum the numerators
    sum = 0
    nums.each do |top|
      sum += top
    end

    # grab gcf of numerator and denominator
    gcf = gcf(sum, lcm)

    # set up result array
    result = [(sum / gcf), (lcm / gcf)]

    puts "\n" + result[0].to_s + " / " + result[1].to_s
  end
end

start_time = Time.now
input1 = ["2/9", "7/34", "4/35", "1/2", "16/33"]
input2 = ["1/7", "35/192", "61/124", "90/31", "5/168", "31/51", "69/179", "32/5", "15/188", "10/17"]
test = Challenge226Easy.new
test.add_fracs(input1)
test.add_fracs(input2)
puts "Total calculation time: #{Time.now - start_time}s"