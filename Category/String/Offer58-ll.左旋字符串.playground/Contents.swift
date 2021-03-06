import Foundation

//剑指 Offer 58 - II. 左旋转字符串
//字符串的左旋转操作是把字符串前面的若干个字符转移到字符串的尾部。请定义一个函数实现字符串左旋转操作的功能。比如，输入字符串"abcdefg"和数字2，该函数将返回左旋转两位得到的结果"cdefgab"。

// cpp version
//class Solution {
//public:
//    string reverseLeftWords(string s, int n) {
//        reverse(s.begin(), s.begin() + n);
//        reverse(s.begin() + n, s.end());
//        reverse(s.begin(), s.end());
//        return s;
//    }
//};
class Solution {
    func reverse(_ s: inout [Character], start: Int, end: Int) {
        var lower = start
        var upper = end
        while lower < upper {
            s.swapAt(lower, upper)
            lower += 1
            upper -= 1
        }
    }
    
    
    func reverseLeftWords(_ s: String, _ n: Int) -> String {
        guard n <= s.count else { return s }
        var character = Array(s)
        character = Array(character[n...]) + Array(character[..<n])
        return String(character)
    }
}
