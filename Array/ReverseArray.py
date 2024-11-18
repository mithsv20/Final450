arr = [1, 4, 3, 2, 6, 5]

# brute force approach O(N)
new_arr = []
for index in range(len(arr)-1, -1, -1):
    new_arr.append(arr[index])

arr = new_arr
print(arr)

# Optimize approach O(N/2)
n = len(arr)
for index in range(n//2):
    arr[index], arr[n-1-index] = arr[n-1-index], arr[index]
print(arr)

