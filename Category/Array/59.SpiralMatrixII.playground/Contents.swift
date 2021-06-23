import Foundation

//Given a positive integer n, generate an n x n matrix filled with elements from 1 to n2 in spiral order.
//
//
//
//Example 1:
//
//
//Input: n = 3
//Output: [[1,2,3],[8,9,4],[7,6,5]]
//[
// [ 1, 2, 3 ],
// [ 8, 9, 4 ],
// [ 7, 6, 5 ]
//]
//Example 2:
//
//Input: n = 1
//Output: [[1]]
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/spiral-matrix-ii
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
// 注意区间，要么一直左闭右开，要么一直左开右避
class Solution {
    class Solution {
        func generateMatrix(_ n: Int) -> [[Int]] {
            var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
            // 循环没一圈的起始位置
            var startX = 0
            var starty = 0
            var loop = n / 2 // 每圈循环几次
            let mid = n / 2 // 矩阵中间的位置，例如：n为3， 中间的位置就是(1，1)，n为5，中间位置为(2, 2)
            var count = 1 // 用来给矩阵中每一个空格赋值
            var offset = 1 // 每一圈循环，需要控制每一条边遍历的长度
            
            while loop > 0 {
                var i = startX
                var j = starty
                // 上行左到右
                for index in (j..<starty + n - offset) {
                    print("left: \(startX)\(index)")
                    result[startX][index] = count
                    j += 1
                    count += 1
                }
                
                // 右行
                for index in (i..<startX + n - offset) {
                    print("right: \(index)\(j)")
                    result[index][j] = count
                    i += 1
                    count += 1
                }
                // 下行
                for index in stride(from: j, to: starty, by: -1) {
                    print("bottom: \(i)\(index)")
                    result[i][index] = count
                    count += 1
                    j -= 1
                }
                //左行
                for index in stride(from: i, to: startX, by: -1) {
                    print("left: \(index)\(j)")
                    result[index][j] = count
                    count += 1
                    
                }
                
                // 第二圈开始，起始位置要+1 因为走一圈了
                startX += 1
                starty += 1
                // 控制每一圈每一边的长度
                offset += 2
                loop -= 1
            }
            
            if n % 2 != 0 {
                result[mid][mid] = count
            }
            return result
        }
    }
}
