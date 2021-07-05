import Foundation

//459. Repeated Substring Pattern
//Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.
//
//
//
//Example 1:
//
//Input: s = "abab"
//Output: true
//Explanation: It is the substring "ab" twice.
//Example 2:
//
//Input: s = "aba"
//Output: false
//Example 3:
//
//Input: s = "abcabcabcabc"
//Output: true
//Explanation: It is the substring "abc" four times or the substring "abcabc" twice.
// cpp version
//class Solution {
//public:
//    void getNext (int* next, const string& s){
//        next[0] = -1;
//        int j = -1;
//        for(int i = 1;i < s.size(); i++){
//            while(j >= 0 && s[i] != s[j+1]) {
//                j = next[j];
//            }
//            if(s[i] == s[j+1]) {
//                j++;
//            }
//            next[i] = j;
//        }
//    }
//    bool repeatedSubstringPattern (string s) {
//        if (s.size() == 0) {
//            return false;
//        }
//        int next[s.size()];
//        getNext(next, s);
//        int len = s.size();
//        if (next[len - 1] != -1 && len % (len - (next[len - 1] + 1)) == 0) {
//            return true;
//        }
//        return false;
//    }
//};
