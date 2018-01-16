/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
 }

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let sum = self.toInt(l1) + self.toInt(l2)
        let arr = self.intToArray(sum)
        return self.buildList(arr)
    }

    func toInt(_ li: ListNode?) -> Int {
        var lastNode: ListNode? = li
        var sum: Int = 0

        if lastNode == nil {
            return sum
        }

        repeat {
            sum += lastNode!.val
            if lastNode!.next != nil {
                sum *= 10
            }
            lastNode = lastNode!.next
        } while (lastNode != nil)

        return sum
    }

    func intToArray(_ num: Int) -> [Int] {
        var arr = [Int]()
        if num == 0 {
            return arr
        } 
        var t = num
        while t != 0 {
            arr.append(t % 10)
            t = t / 10
        }
        return arr 
    }

    func buildList(_ nums: [Int]) -> ListNode? {
        if nums.count == 0 {
            return nil
        }
        var lastNode: ListNode
        let rootNode = ListNode(nums[0])
        lastNode = rootNode

        for (index, val) in nums.enumerated() {
            print(val)
            if index != 0 {
                let newNode = ListNode(val) 
                lastNode.next = newNode
                lastNode = newNode
            }
        }
        lastNode.next = nil

        return rootNode
    }
}

/*
*/

var arr1: [Int] = [2, 4, 3]
var arr2: [Int] = [5, 6, 4]
var s = Solution()
var l1 = s.buildList(arr1)
var l2 = s.buildList(arr2)

print(s.intToArray(342))
print(s.intToArray(807))
// var l3 = s.addTwoNumbers(l1, l2)