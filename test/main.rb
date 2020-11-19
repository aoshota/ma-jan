def my_sort(array)
	comp = {"萬" => 0, "索" => 1, "筒" => 2, "　" => 3}
  length = array.length
  (1..length).each do |i|
    (1..(length-i)).each do |jx|
      jy = jx - 1
      if comp[array[jy][1]] > comp[array[jx][1]]
        tmp = array[jy]
        array[jy] = array[jx]
        array[jx] = tmp
			end
    end
  end
  return  array
end

# num = ["壱","二","三","四","伍","六","七","八","九"]
# types = { characters: "萬",circles: "筒",bamboos: "索" }
# honours = { east: "東", south: "南", west: "西", north: "北", white_dragon: "白", green_dragon: "撥", red_dragon: "中" }

num = ["壱","二","三","四","伍","六","七","八","九"]
types = ["萬","索","筒"]
honours = ["東","南","西","北","白","撥","中"]

suits = []
4.times do
	types.each do | type|
		num.each_with_index do | num, index |
			suits.push([num, type, index])
		end
	end
end

4.times do
	honours.each_with_index do | honour, index |
		suits.push([honour, "　", (index + 1) * 10])
	end
end

# suits.each { |tmp| p tmp }
hand = suits.sample(14)
# p hand
# hand = hand.sort {|a, b| (a[0] <=> b[0]).nonzero? || (a[1] <=> b[1])}
# hand = hand.sort {|a,b| a[1] <=> b[1]}.reverse

# p " === before ==="
# hand.each { |tmp| print("#{tmp}\n") }
hand = hand.sort {|a,b| a[2] <=> b[2]}
# p " === after ==="
# hand.each { |tmp| print("#{tmp}\n") }
# hand = hand.sort {|a,b| a[1] <=> b[1]}.reverse
# p " === after ==="
# hand.each { |tmp| print("#{tmp}\n") }

# p hand
hand = my_sort(hand)
# p hand

top = " ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿\n"
middle1 = "｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜\n"
middle2 = "｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜\n"
bottom = " ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣\n"

hand.each_with_index do |s, index|
	middle1[1+3*index] = s[0]
	middle2[1+3*index] = s[1]
end

print(top)
print(middle1)
print(middle2)
print(bottom)
