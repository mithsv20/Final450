# Find the "Kth" max and min element of an array
arr = [7, 10, 4, 3, 20, 15]
k = 4

# Brute force approach
arr.sort()
print(f"{k}th min value: {arr[k - 1]}")
print(f"{k}th max value: {arr[len(arr) - k]}")

# insertion sort approach
new_arr = [float('inf')] * k
for item in arr:
    i = 0
    while i < k and item > new_arr[i]:
        i += 1
    else:
        if i < k:
            new_arr = new_arr[:i] + [item] + new_arr[i:k - 1]
print(new_arr[-1])


# Pivot Concept
def get_kth_element(k, current_arr, pivot_element):
    left_arr = []
    right_arr = []

    if len(current_arr) == 1:
        return current_arr[0]

    for item in current_arr:
        if item < pivot_element:
            left_arr.append(item)
        elif item > pivot_element:
            right_arr.append(item)

    pivot_index = len(left_arr)
    if k - 1 == pivot_index:
        return pivot_element
    elif k - 1 < pivot_index:
        current_arr = left_arr
    else:
        k -= 1
        current_arr = right_arr
    return get_kth_element(k, current_arr, current_arr[-1])


print(get_kth_element(k, arr, arr[-1]))
