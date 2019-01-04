from collections import deque

print('----- append() / appendleft() / pop() / popleft() -----')

d = deque(['B', 'C', 'D'])

# deque(['B', 'C', 'D'])
print(d)

# deque(['B', 'C', 'D', 'E'])
d.append('E')
print(d)

# deque(['A', 'B', 'C', 'D', 'E'])
d.appendleft('A')
print(d)

# E
print(d.pop())

# A
print(d.popleft())

# deque(['B', 'C', 'D'])
print(d)

del d
print('\n')

print('----- maxlen / maxlen() -----')

# deque([1, 2, 3, 4, 5], maxlen=5)
# 5
d = deque([1, 2, 3, 4, 5], 5)
print(d)
print(d.maxlen)

# deque([2, 3, 4, 5, 6], maxlen=5)
d.append(6)
print(d)

# deque([1, 2, 3, 4, 5], maxlen=5)
d.appendleft(1)
print(d)

del d

# deque([4, 5, 6], maxlen=3)
# 3
d = deque([1, 2, 3, 4, 5, 6], 3)
print(d)
print(d.maxlen)

del d
print('\n')

print('----- reverse() -----')

d = deque([1, 2, 3, 4, 5])

# deque([5, 4, 3, 2, 1])
d.reverse()
print(d)

del d
print('\n')

print('----- copy() -----')

d1 = deque([1, 2, 3, 4, 5])
d2 = d1.copy()

# deque([1, 2, 3, 4, 5])
# deque([1, 2, 3, 4, 5])
print(d1)
print(d2)

d1.append(6)

# deque([1, 2, 3, 4, 5, 6])
# deque([1, 2, 3, 4, 5])
print(d1)
print(d2)

print('\n')

print('----- index() -----')

# 1
d = deque([1, 2, 3, 4, 5])
print(d.index(2))

del d
print('\n')

print('----- insert() -----')

d = deque([1.0, 2.0, 3.0, 4.0, 5.0])

# deque([1.0, 2.0, 3.0, 4.0, 5.0])
print(d)

d.insert(3, 3.5)

# deque([1.0, 2.0, 3.0, 3.5, 4.0, 5.0])
print(d)
