i = 0
f = open('text.txt', 'w')
while i < 120:
    print(i)
    i = i + 5
print("finish")
f.write(str(i))
f.close()
