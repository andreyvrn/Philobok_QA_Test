i = 0
f = open('text.txt' 'w')
while i < 20:
    print(i)
    i = i + 5
print("finish")
f.write(i)
f.close()
