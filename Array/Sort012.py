from collections import deque
arr = [0, 1, 2, 0, 1, 2]

# Brute force approach
# arr1 = []
# arr2 = []
# arr3 = []
# for a in arr:
#     if a == 0:
#         arr1.append(a)
#     elif a == 1:
#         arr2.append(a)
#     else:
#         arr3.append(a)
# arr = arr1+arr2+arr3
# print(arr)

# Insertion Sort Approach
new_arr = deque()
i = 0
for a in arr:
    if a < 1:
        i += 1
        new_arr.appendleft(a)
    elif a > 1:
        new_arr.append(a)
    else:
        new_arr.insert(i, a)
print(list(new_arr))


# BASE(in hand)
# 10 % Variable
# Employee PF 12% of basic
#