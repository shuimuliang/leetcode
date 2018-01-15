class Solution {
    func twoSum(_ nums:[Int], _ target: Int) -> [Int]{
        var arr = [Int]()
        var kvhash: [Int:Int] = [Int:Int]()
        for (i, val) in nums.enumerated() {
            kvhash[val] = i
        }
        for (index, value) in nums.enumerated() {
            let complement = target - value 
            if let theindex = kvhash[complement], index != theindex {
                arr.append(index) 
                arr.append(theindex)
                return arr
            }
        }
        return arr
    }
}

// hash set
var s = Solution()
var target: Int = 6
var nums: [Int] = [2,3,4]
var result:[Int] = s.twoSum(nums, target)
print(result)