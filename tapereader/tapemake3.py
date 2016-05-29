holeXSize = 6
holeXSep = 4.5

holeYSize = 6
holeYSep = 4.5

holes = 6
rows = 8

bits=[
(1,1,0,1,0,1,0,0,0,1,0,0,0,1,0,0,1,1),
(1,0,1,0,1,1,0,1,0,0,1,1,0,0,1,1,0,1),
(1,0,0,1,0,1,0,0,1,0,1,0,0,0,1,0,0,1),
(1,1,1,0,0,1,0,1,0,0,0,0,1,0,0,1,0,1),
(1,0,1,0,1,1,0,0,1,1,0,0,0,0,0,0,1,1),
(1,0,0,0,0,1,1,0,0,1,0,0,1,1,0,0,1,1),
(1,0,1,0,1,1,1,0,0,0,1,0,0,1,0,0,0,1),
(1,0,0,0,0,1,0,1,0,0,1,1,0,0,1,0,1,1),
(1,1,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1),
(1,0,0,1,0,1,0,0,1,1,1,0,0,1,0,0,1,1),
(1,1,0,0,1,1,0,1,0,1,0,0,0,0,0,0,0,1),
(1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,1),
(1,0,1,0,0,1,0,0,0,0,1,1,0,0,1,0,0,1),
(1,1,0,0,0,1,0,1,0,0,0,0,1,0,0,0,0,1),
(1,0,0,0,1,1,0,0,0,1,0,0,0,0,0,0,1,1),
(1,1,0,1,0,1,0,1,1,0,0,0,1,0,0,0,0,1),
(1,1,0,0,0,1,0,0,0,1,1,1,0,1,0,0,1,1),
(1,0,1,0,1,1,0,0,0,0,1,0,1,0,1,1,0,1),
(1,0,0,1,1,1,0,1,0,0,0,1,1,0,0,0,1,1),
(1,0,1,0,0,1,1,0,0,1,0,0,0,1,0,1,0,1),
]

cardXSize = (holeXSize+holeXSep)*holes+holeXSep 
cardYSize = (holeYSize+holeYSep)*rows+holeYSep

print("difference()")
print("{")
print("  cube(size=["+str(cardXSize)+","+str(cardYSize)+",0.4],center=true);")

print("  union()")
print("  {")

for x in range(0,holes):
  for y in range(0,rows):
    if bits[y][x]:
      print("    translate(v=["+str(-cardXSize/2+holeXSep+holeXSize/2+x*(holeXSize+holeXSep))+","+str(-cardYSize/2+holeYSep+holeYSize/2+y*(holeYSize+holeYSep))+",0])")
      print("      cube(size=["+str(holeXSize)+","+str(holeYSize)+",0.4],center=true);")

print("  }")
print("}")