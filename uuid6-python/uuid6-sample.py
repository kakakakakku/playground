from uuid6 import uuid6
import time

# 1ed575d3-b55c-6f9c-93a7-e81a4645882c
id1 = uuid6()
print(id1)

time.sleep(2)

# 1ed575d3-c876-609c-9270-7532b69c8a8e
id2 = uuid6()
print(id2)

time.sleep(2)

# 1ed575d3-db8a-669c-8634-8a0ba964ffa3
id3 = uuid6()
print(id3)

print(id1 < id2)  # True
print(id2 < id3)  # True
print(id3 < id1)  # False
