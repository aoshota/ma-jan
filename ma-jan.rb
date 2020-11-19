# 国士無双
def kokushi
	hand = [["壱","萬",0],["九","萬",0],
					["壱","索",0],["九","索",0],
					["壱","筒",0],["九","筒",0],
					["東","　",0],["南","　",0],
					["西","　",0],["北","　",0],
					["白","　",0],["撥","　",0],
					["中","　",0],["中","　",0]
				]
end

# 九連宝燈
def churen
	hand = [["壱","萬",0],["壱","萬",0],
					["壱","萬",0],["二","萬",0],
					["三","萬",0],["四","萬",0],
					["伍","萬",0],["六","萬",0],
					["七","萬",0],["八","萬",0],
					["八","萬",0],["九","萬",0],
					["九","萬",0],["九","萬",0]
				]
end

# 大三元
def daisangen
	hand = [["壱","萬",0],["二","萬",0],
					["三","萬",0],["九","筒",0],
					["九","筒",0],["白","　",0],
					["白","　",0],["白","　",0],
					["撥","　",0],["撥","　",0],
					["撥","　",0],["中","　",0],
					["中","　",0],["中","　",0]
				]
end

# 大四喜
def daisusi
	hand = [["四","筒",0],["四","筒",0],
					["東","　",0],["東","　",0],
					["東","　",0],["南","　",0],
					["南","　",0],["南","　",0],
					["西","　",0],["西","　",0],
					["西","　",0],["北","　",0],
					["北","　",0],["北","　",0]
				]
end

# 役満ランダム
def yakuman
	sw = rand(4)
	case sw
	when 0 then
		kokushi()
	when 1 then
		churen()
	when 2 then
		daisangen()
	when 3 then
		daisusi()
	else
		return nil
	end
end

# アスキーアートの雛形のxの箇所に数字や字を代入する
def majan_ascii(hand)
	# 麻雀牌のアスキーアートの雛形
	top = " ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿  ＿＿\n"
	middle1 = "｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜\n"
	middle2 = "｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜｜x｜\n"
	bottom = " ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣  ￣￣\n"

	# アスキーアートのxの箇所に数字や字牌を格納する
	hand.each_with_index do |s, index|
		middle1[1+3*index] = s[0]
		middle2[1+3*index] = s[1]
	end

	# アスキーアートを格納した配列を返す
	res = [top,middle1,middle2,bottom]
	return res
end

# 数字でソートした後に配種でソートするための関数
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

# 配を用意する材料
num = ["壱","二","三","四","伍","六","七","八","九"]
types = ["萬","索","筒"]
honours = ["東","南","西","北","白","撥","中"]

# 麻雀牌を全て格納する変数
tiles = []

# 数牌を全て用意する
4.times do
	types.each do | type|
		num.each_with_index do | num, index |
			tiles.push([num, type, index])
		end
	end
end

# 字牌を全て用意する
4.times do
	honours.each_with_index do | honour, index |
		tiles.push([honour, "　", (index + 1) * 10])
	end
end

# 配牌の14牌をランダムに選択
hand = tiles.sample(14)

# 配牌を数字で降順に並び替える
hand = hand.sort {|a,b| a[2] <=> b[2]}

# 数字でソートした後に配種でソートする
hand = my_sort(hand)

# コマンドライン引数がない時は配牌、それ以外は該当する役をhaipaiに格納する
if ARGV.empty?
	haipai = majan_ascii(hand)
elsif ARGV[0] == "国士無双"
	hand = kokushi()
	haipai = majan_ascii(hand)
elsif ARGV[0] == "九連宝燈"
	hand = churen()
	haipai = majan_ascii(hand)
elsif ARGV[0] == "大三元"
	hand = daisangen()
	haipai = majan_ascii(hand)
elsif ARGV[0] == "大四喜"
	hand = daisusi()
	haipai = majan_ascii(hand)
elsif ARGV[0] == "役満"
	hand = yakuman()
	haipai = majan_ascii(hand)
elsif ARGV[0] == "list"
	haipai = ["\n",
						"国士無双\n",
						"九連宝燈\n",
						"大三元\n",
						"大四喜\n",
						"役満\n",
						"\n"
						]
end

# 配牌を出力
haipai.each { |str| print(str) }
