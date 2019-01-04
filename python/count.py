num_list = [2, 4, 6, 4, 4, 2, 6]

# https://docs.python.org/3/library/array.html?highlight=count#array.array.count
# シーケンス中の x の出現回数を返します。
# 0 1 2
for i in range(num_list.count(4)):
    print(i, end=' ')
