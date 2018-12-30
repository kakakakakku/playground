# https://docs.python.org/ja/3/library/stdtypes.html?highlight=replace#str.replace
# str.replace(old, new[, count])
# 文字列をコピーし、現れる部分文字列 old 全てを new に置換して返します。
# オプション引数 count が与えられている場合、先頭から count 個の old だけを置換します。

d = 'xxxxHELLOxxxxHELLOxxxxHELLO'

# xxxxBYExxxxBYExxxxBYE
print(d.replace('HELLO', 'BYE'))

# xxxxHELLOxxxxHELLOxxxxHELLO
print(d.replace('HELLO', 'BYE', 0))

# xxxxBYExxxxHELLOxxxxHELLO
print(d.replace('HELLO', 'BYE', 1))

# xxxxBYExxxxBYExxxxHELLO
print(d.replace('HELLO', 'BYE', 2))
