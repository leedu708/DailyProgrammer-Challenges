class Challenge226Easy

  def gcf(num, denom)
    # check if numerater and denominator are the same
    if num == denom
      return num
    end

    frac = [num, denom].sort

    gcf = 1
    1.upto(frac[1] / 2) do |factor|
      if (num % (factor) == 0) and (denom % (factor) == 0)
        gcf = factor
      end
    end

    gcf
  end

  def lcm(input)
    lcm = 1
    input.each do |number|
      lcm *= number.to_i
    end
    lcm
  end

  def add_fracs(input)
    nums = []
    denoms = []
    result = []

    input.each do |fraction|
      fraction.split("/")
      nums.push(fraction[0].to_i)
      denoms.push(fraction[1].to_i)
    end

    lcm = lcm(denoms)
    lcm_multi = []

    denoms.each do |denom|
      lcm_multi.push(lcm / denom)
    end
    
    nums = nums.map {|num| num * lcm}

    sum = 0
    nums.each do |top|
      sum += top
    end

    gcf = gcf(sum, lcm)

    result = [sum / gcf, lcm / gcf]

    puts result[0].to_s + "/" + result[1].to_s
  end
end

input = ["1/6", "3/10"]
test = Challenge226Easy.new
puts test.lcm([128, 256])
#test.add_fracs(input)