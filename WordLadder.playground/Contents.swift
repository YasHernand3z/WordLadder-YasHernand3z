import UIKit


func getShortestChainLen(startWord: String, targetWord: String, wordsSet: [String]) -> Int {
    
    if startWord == targetWord {
        return 1
    }
    
    var level: Int = 1
    var hasFoundWord: Bool = false

    var currentChildren: [String] = [startWord]
    var auxCurrentChildren: [String] = []
    var previousChildren: [String] = currentChildren
    
    while !hasFoundWord {
        repeat {
            if let currentWorld = currentChildren.first {
                for word in wordsSet {
                    if validateWordHasOneDifferentCharacter(currentWord: currentWorld, newWord: word) && !auxCurrentChildren.contains(word) {
                        auxCurrentChildren.append(word)
                    }
                    
                    if validateWordHasOneDifferentCharacter(currentWord: currentWorld, newWord: targetWord) && !auxCurrentChildren.contains(targetWord) {
                        auxCurrentChildren.append(targetWord)
                    }
                }
            }
            currentChildren.removeFirst()
        } while !currentChildren.isEmpty
        level += 1
        
        if auxCurrentChildren.isEmpty || auxCurrentChildren.sorted() == previousChildren.sorted() {
            level = -1
            hasFoundWord = true
        }
        
        currentChildren = auxCurrentChildren
        previousChildren = currentChildren
        auxCurrentChildren.removeAll()
        if currentChildren.contains(targetWord) {
            hasFoundWord = true
        }
    }
    
    
    return level
}

func validateWordHasOneDifferentCharacter(currentWord: String, newWord: String) -> Bool {
    var equalCharacters = zip(currentWord, newWord).filter{$0 == $1}
    return equalCharacters.count == (currentWord.count - 1)
}

getShortestChainLen(startWord: "hit", targetWord: "cog", wordsSet: ["hot","dot","dog","lot","log"])

getShortestChainLen(startWord: "met", targetWord: "ced", wordsSet: ["xet","ten","cet","lot","log"])

getShortestChainLen(startWord: "met", targetWord: "xyz", wordsSet: ["xet","ten","cet","lot","log"])

getShortestChainLen(startWord: "ABCV", targetWord: "EBAD", wordsSet: ["ABCD", "EBAD", "EBCD", "XYZA"])

getShortestChainLen(startWord: "TOON", targetWord: "PLEA", wordsSet: ["POON","PLEE","SAME","POIE","PLEA", "PLIE", "POIN"])
getShortestChainLen(startWord: "TOON", targetWord: "TOON", wordsSet: ["POON","PLEE","SAME","POIE","PLEA", "PLIE", "POIN"])
