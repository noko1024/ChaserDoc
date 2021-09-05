# -*- coding: utf-8 -*-
require  'CHaserConnect.rb' #呼び出すおまじない

# 書き換えない
target = CHaserConnect.new("prac") # ()の中好きな名前
values = Array.new(10)
random = Random.new # 乱数生成


#-------関数化---------

def _aruku(hoko, values, target)
	case hoko
	when 0
			#上方向に歩く
		values = target.walkUp()
	when 3
		values = target.walkRight()
	when 6
		values = target.walkDown()
	when 9
		values = target.walkLeft()
	end
end

def _mawaremigi(hoko, values)
	loop do #壁のない方向を向けるまで回れ右し続ける
		if hoko == 0 #上に行きたい
			if values[2] == 2 #上のマスが壁だったら
				hoko = 3 #右に向きを変える
			else
				break
			end
		elsif hoko == 3
			if values[6] == 2
				hoko = 6
			else
				break
			end
		elsif hoko == 6
			if values[8] == 2
				hoko = 9
			else
				break
			end
		elsif hoko == 9
			if values[4] == 2
				hoko = 0
			else
				break
			end
		end
	end
	return hoko
end

def _oku(hoko, values, target)
	case hoko
	when 0
		values = target.putUp()
	when 3
		values = target.putRight()
	when 6
		values = target.putDown()
	when 9
		values = target.putLeft()
	end
end

def _tonarinitekigairu(hoko, values, target)
	ita = 0 #フラグ

	if values[2] == 1
		hoko = 0
		ita = 1 #フラグを立てる
	elsif values[6] == 1
		hoko = 3
		ita = 1
	elsif values[8] == 1
		hoko = 6
		ita = 1
	elsif values[4] == 1
		hoko = 9
		ita = 1
	end 

	if ita == 1
		ita = 0 #フラグを回収する ０にする
		_oku(hoko, values, target)
	end

end

			

hoko = 0
#--------ここから--------
loop do # ここからループ

#---------ここから---------
  values = target.getReady()

  if values[0] == 0
    break
  end
#-----ここまで書き換えない-----

#ここに処理を書く

	#hoko = 0

	_tonarinitekigairu(hoko, values, target)

	hoko = _mawaremigi(hoko, values)

	_aruku(hoko, values, target)


	#if hoko == 0
	#	values = target.walkUp()
	#end




#---------ここから---------
  if values[0] == 0
    break
  end

end # ループここまで
target.close
#-----ここまで書き換えない-----