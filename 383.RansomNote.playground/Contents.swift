import Foundation

//383. Ransom Note
//Given two stings ransomNote and magazine, return true if ransomNote can be constructed from magazine and false otherwise.
//
//Each letter in magazine can only be used once in ransomNote.
//
//
//
//Example 1:
//
//Input: ransomNote = "a", magazine = "b"
//Output: false
//Example 2:
//
//Input: ransomNote = "aa", magazine = "ab"
//Output: false
//Example 3:
//
//Input: ransomNote = "aa", magazine = "aab"
//Output: true
//

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard ransomNote.count <= magazine.count else { return false }
        var record = Array(repeating: 0, count: 26)
        for charcter in ransomNote.unicodeScalars {
            let index = Int(charcter.value - 97)
            record[index] += 1
        }
        
        for charcter in magazine.unicodeScalars {
            let index = Int(charcter.value - 97)
            record[index] -= 1
        }
        
        return record.filter { $0 > 0 }.count <= 0
    }
}
