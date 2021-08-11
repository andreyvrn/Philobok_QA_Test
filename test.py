i = 0
f = open('text.txt', 'w')
while i < 200:
    print(i)
    i = i + 5
print("finish")
f.write(str(i))
f.close()
