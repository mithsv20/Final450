arr = [22, 14, 8, 17, 35, 3]

# Brute force approach
min_val, max_val = float('inf'), float('-inf')
for item in arr:
    min_val = min(item, min_val)
    max_val = max(item, max_val)

print(f"{min_val} {max_val}")
