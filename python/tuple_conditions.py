# https://docs.python.jp/3/tutorial/datastructures.html#more-on-conditions
# まず、最初の二つの要素を比較し、その値が等しくなければその時点で比較結果が決まります。

# True
print((1, 2, 3) == (1, 2, 3))

# True
# 123 < 124
print((1, 2, 3) < (1, 2, 4))

# False
# 135 < 123
print((1, 3, 5) < (1, 2, 3, 4))

# True
# 123 < 124
print((1, 2, 3, 4) < (1, 2, 4))

# True
# 12 (-無限大) < 12 (-1)
print((1, 2) < (1, 2, -1))
