s = "fewagbeogbawognfalgakjbfgkajbcaecbsakjhkc"

result = {}
for item in s:
    if item in 'aeiou':
        result[item] = result.get(item, 0) + 1

print(result)


def reverse(s):
    str_val = list(s)
    for i in range(len(str_val)//2):
        str_val[i], str_val[len(str_val)-i-1] = str_val[len(str_val)-i-1], str_val[i]
    return "".join(str_val)

print(reverse(s))