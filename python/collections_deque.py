from collections import deque

d = deque(['task1', 'task2', 'task3'])
d.append('task4')

# deque(['task1', 'task2', 'task3', 'task4'])
print(d)

# task4
print(d.pop())

# task1
print(d.popleft())

# deque(['task2', 'task3'])
print(d)
