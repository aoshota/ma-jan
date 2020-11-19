# puts " ＿＿"
# puts "｜一｜"
# puts "｜萬｜"
# puts " ￣￣"

# manzu = [[" ＿","＿","\n","｜","一","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","二","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","三","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","四","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","伍","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","六","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","七","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","八","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"],
# 				 [" ＿","＿","\n","｜","九","｜","\n","｜","萬","｜","\n"," ￣","￣","\n"]]

# manzu.each { |manzu_n|
# 	manzu_n.each { |s| print(s) }
# }

# manzu[0].each { |s| print(s) }

# tmp1 = [" ＿","＿","  ＿","＿","  ＿","＿","\n"]
# #        0  , 1,  2,   3,   4,  5,   6,   7,  8,   9
# tmp2 = ["｜","壱","｜","｜","二","｜","｜","三","｜","\n"]
# tmp3 = ["｜","萬","｜","｜","萬","｜","｜","萬","｜","\n"]
# tmp4 = [" ￣","￣","  ￣","￣","  ￣","￣","\n"]

# tmp1.each { |s| print(s) }
# tmp2.each { |s| print(s) }
# tmp3.each { |s| print(s) }
# tmp4.each { |s| print(s) }

# tmp1 = " ＿＿  ＿＿  ＿＿\n"
#        0  , 1,  2,   3,   4,  5,   6,   7,  8,   9
# tmp2 = ["｜","壱","｜","｜","二","｜","｜","三","｜","\n"]
# tmp3 = ["｜","萬","｜","｜","萬","｜","｜","萬","｜","\n"]
# tmp4 = [" ￣","￣","  ￣","￣","  ￣","￣","\n"]

num = ["壱","二","三","四","伍","六","七","八","九"]
types = { characters: "萬",circles: "筒",bamboos: "索" }
honours = { east: "東", south: "南", west: "西", north: "北", white_dragon: "白", green_dragon: "撥", red_dragon: "中" }

suits = []
4.times do
	types.each do | type_key, type_value |
		num.each do | num_value |
			suits.push([num_value, type_value])
		end
	end
end

honours.each do | honours_key, honours_value |
	suits.push([honours_value, "　"])
end

# suits.each { |tmp| p tmp }
hand = suits.sample(14)
# hand = hand.sort {|a,b| a[1] <=> b[1]}.reverse
hand = hand.sort {|a, b| (a[0] <=> b[0]).nonzero? || (a[1] <=> b[1])}

top = " ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿\n"
middle1 = "｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜\n"
middle2 = "｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜\n"
bottom = " ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣\n"

hand.each_with_index do |s, index|
	middle1[1+3*index] = s[0]
	middle2[1+3*index] = s[1]
end

# num.each_with_index do |s, index|
# 	middle1[1+3*index] = s
# end

# middle2.gsub!('x',types[:bamboos])

print(top)
print(middle1)
print(middle2)
print(bottom)
