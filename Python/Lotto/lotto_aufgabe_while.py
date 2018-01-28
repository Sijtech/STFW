#Erstelle ein Programm, dass Dir Lottozahlen für die Schweiz (6 aus 45) vorschlägt
import random

i = 0
lottozahlen = []

while i < 6:
    lottozahl = random.randint(1,45)
    abbr = False
    for x in lottozahlen:
        print(x, " == ", lottozahl)
        if x == lottozahl:
            abbr = True
            break
    if abbr:
        continue
    lottozahlen.append(lottozahl)
    i += 1
print(lottozahlen)
