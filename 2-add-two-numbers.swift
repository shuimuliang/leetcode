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
         if l1 == nil {
            return l2
        }
        if l2 == nil {
            return l1
        }
        
        let dummyHead = ListNode(0)
        var p: ListNode? = l1
        var q: ListNode? = l2
        var curr = dummyHead
        
        var x, y, sum: Int
        var carry:Int = 0
        
        while (p != nil || q != nil) {
            if p == nil {
                x = 0
            }
            else {
                x = p!.val
            }
            if q == nil {
                y = 0
            }
            else {
                y = q!.val
            }
            sum = carry + x + y
            carry = sum / 10
            curr.next = ListNode(sum % 10)
            curr = curr.next!
            if p != nil {
                p = p!.next
            }
            if q != nil {
                q = q!.next
            }
        }
        
        if carry > 0 {
            curr.next = ListNode(carry)
        }
        
        return dummyHead.next
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

//print(s.intToArray(342))
//print(s.intToArray(807))
var l3 = s.addTwoNumbers(l1, l2)