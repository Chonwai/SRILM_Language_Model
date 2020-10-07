import sys

wordBaseFilePath = sys.argv[1]
charBaseFilePath = sys.argv[2]

file = open(wordBaseFilePath, "r")
newFile = open(charBaseFilePath, "w")
sentences = file.readlines()

for sentence in sentences:
    newSentence = []
    for char in list(sentence):
        newChar = ''
        newChar = char + ' '
        newSentence.append(newChar)
    newFile.writelines(newSentence)

newFile.close()
