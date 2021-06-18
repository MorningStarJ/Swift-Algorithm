import Foundation

//Given a string, find the length of the longest substring without repeating characters.
//
//Example 1:
//
//
//Input: "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.
//
//Example 2:
//
//
//Input: "bbbbb"
//Output: 1
//Explanation: The answer is "b", with the length of 1.
//
//Example 3:
//
//
//Input: "pwwkew"
//Output: 3
//Explanation: The answer is "wke", with the length of 3.
//             Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
//
//Input: s = ""
//Output: 0

func lengthOfLongestSubstring(_ s: String) -> Int {
    var exist: [Character: Int] = [:]
    var start = 0
    var length = 0
    for (index, character) in s.enumerated() {
        if let existIndex = exist[character],
           existIndex >= start {
            start = existIndex + 1
        }
        length = max(index - start + 1, length)
        exist[character] = index
    }
    
    return length
}

print(lengthOfLongestSubstring("abba"))
print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring(" "))
print(lengthOfLongestSubstring(""))
print(lengthOfLongestSubstring("au"))
