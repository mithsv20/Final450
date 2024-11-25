n = int(input("enter the odd number: "))
scnt = 1
for cnt in range(n//2, -1, -1):
    print(cnt*" "+"*"*scnt)
    scnt += 2
scnt -= 4
for cnt in range(1,(n//2)+1):
    print(cnt*" "+"*"*scnt)
    scnt -= 2