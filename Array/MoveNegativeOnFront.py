# from collections import deque
arr = [-12, 11, -13, -5, 6, -7, 5, -3, -6]

# # Brute force approach
# new_arr1 = []
# new_arr2 = []
# for a in arr:
#     if a < 0:
#         new_arr1.append(a)
#     else:
#         new_arr2.append(a)
# response_arr = new_arr1+new_arr2
# print(response_arr)
#
# # Queue Approach
# new_arr = deque()
# for a in arr:
#     if a < 0:
#         new_arr.appendleft(a)
#     else:
#         new_arr.append(a)
# print(list(new_arr))
#
# # swap logic
# j = 0
# for i in range(0, len(arr)):
#     if arr[i] < 0:
#         temp = arr[i]
#         arr[i] = arr[j]
#         arr[j] = temp
#         j = j + 1
# print(arr)

# two pointer approach
i = 0
j = len(arr)-1
while i < j:
    if arr[i] < 0:
        i += 1
    elif arr[j] > 0:
        j -= 1
    else:
        arr[i], arr[j] = arr[j], arr[i]
print(arr)


