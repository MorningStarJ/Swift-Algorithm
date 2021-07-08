import Foundation

//请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
//输入：s = "We are happy."
//输出："We%20are%20happy."
class Solution {
    func replaceSpace(_ s: String) -> String {
        var result = ""
        for character in s {
            if character == " " {
                result.append("%20")
            } else {
                result.append(character)
            }
        }
        return result
    }
}
