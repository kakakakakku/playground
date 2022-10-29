from uuid6 import uuid7
import time

# 018422b2-4843-7a62-935b-b4e65649de3e
id1 = uuid7()
print(id1)

time.sleep(2)

# 018422b2-5013-7f02-830f-2563ce4533df
id2 = uuid7()
print(id2)

time.sleep(2)

# 018422b2-57e8-79b2-8b59-d6926217a9dc
id3 = uuid7()
print(id3)

print(id1 < id2)  # True
print(id2 < id3)  # True
print(id3 < id1)  # False
