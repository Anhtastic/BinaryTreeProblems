
//import Foundation
//
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
//
//
//  public class ListNode {
//      public var val: Int
//      public var next: ListNode?
//      public init(_ val: Int) {
//          self.val = val
//          self.next = nil
//      }
//}


class Solution {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        let res = [root!.val]
        return res + preorderTraversal(root?.left) + preorderTraversal(root?.right)
    }
    
    func preOrderTraversal(_ root: TreeNode) -> [Int] {
        if root == nil { return [] }
        var result = [Int]()
        var stack = [root]
        var current: TreeNode?
        while !stack.isEmpty {
            current = stack.popLast()!
            result.append(current!.val)
            while current != nil {
                if current?.left != nil { result.append(current!.left!.val) }
                if current?.right != nil { stack.append(current!.right!) }
                current = current?.left
            }
        }
        
        return result
    }
}


























