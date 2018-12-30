array = [
    ['A', 'B', 'C'],
    ['D', 'E', 'F'],
    ['G', 'H', 'I'],
]

# [['A', 'B', 'C'], ['D', 'E', 'F'], ['G', 'H', 'I']]
print(array)

# ['A', 'B', 'C'] ['D', 'E', 'F'] ['G', 'H', 'I']
# アンパックをしている
print(*array)

# <zip object at 0x10fe3e808>
# zip() で同じ順番の要素を持ったイテレータを生成する
print(zip(*array))

# [('A', 'D', 'G'), ('B', 'E', 'H'), ('C', 'F', 'I')]
# list() でリストを生成する
print(list(zip(*array)))
