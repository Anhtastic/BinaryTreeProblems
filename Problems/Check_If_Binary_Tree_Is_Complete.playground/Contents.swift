//: Playground - noun: a place where people can play

import UIKit

//  http://www.geeksforgeeks.org/check-if-a-given-binary-tree-is-complete-tree-or-not/
//  Given a Binary Tree, write a function to check whether the given Binary Tree is Complete Binary Tree or not.
//  A complete binary tree is a binary tree in which every level, except possibly the last, is completely filled, and all nodes are as far left as possible.
//  Examples: Complete Binary Trees:
//  [2] <- 1 -> [3]
//  [[4] <- 2] <- 1 -> [3]
//  [[4] <- 2 -> [5]] <- 1 -> [[6] <- 3]

//  Examples: NonComplete Binary Trees:
//  1 -> [4]
//  [2 -> [4]] <- 1 -> [[5] <- 3 -> [6]]
//  [2] <- 1 -> [[4] <- 3 -> [5]]


class Node<T>: CustomStringConvertible {
    
    var value: T
    var left: Node?
    var right: Node?
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
    
    var description: String {
        var rval = ""
        if let left = left {
            rval += "[\(left.description)] <- "
        }
        rval += "\(value)"
        if let right = right {
            rval += " -> [\(right.description)]"
        }
        return rval
    }
    
}

class LinkedList<T>: CustomStringConvertible {
    private var head: Node<T>?
    private var last: Node<T>? {
        var node = head
        if node?.next != nil {
            node = node?.next
        } else {
            return head
        }
        return node
    }
    
    func enqueue(value: T) {
        if let last = last {
            last.next = Node(value: value)
        } else {
            head = Node(value: value)
        }
    }
    
    func enqueueNode(value: Node<T>) {
        if let last = last {
            last.next = value
        } else {
            head = value
        }
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func removeFirst() -> Node<T>? {
        let rval = head
        head = head?.next
        return rval
    }
    
    var description: String {
        var rval = "["
        var node = head
        while node != nil {
            rval += "\(node!.value) -> "
            node = node?.next
        }
        return rval + "]"
    }
}

class Result<T> {

    // O(n) space for queue and O(n) time.
    // This solution use array for queue as a hack for a queue :), the one below more efficient as we used linked list for our queue.
//    func isBinaryTreeUsingArray(root: Node<T>?) -> Bool {
//        
//        if root == nil { return true }
//        
//        var queue = [Node<T>]()
//        queue.append(root!)
//        var flag = false
//        while !queue.isEmpty {
//            let temp = queue.removeFirst() // Probably better to implement your own linkedList for more efficiency.
//            if temp.left != nil {
//                if flag == true { return false }
//                queue.append(temp.left!)
//            } else {
//                flag = true
//            }
//            
//            if temp.right != nil {
//                if flag == true { return false }
//                queue.append(temp.right!)
//            } else {
//                flag = true
//            }
//        }
//        
//        return true
//    }
    
    // LinkedList for queue
    func isBinaryTree(root: Node<T>?) -> Bool {
        
        if root == nil { return true }
        
        let queue = LinkedList<T>()
        queue.enqueueNode(value: root!)
        var flag = false
        while !queue.isEmpty() {
            let temp = queue.removeFirst()
            if temp?.left != nil {
                if flag == true { return false }
                queue.enqueueNode(value: (temp?.left)!)
            } else {
                flag = true
            }
            
            if temp?.right != nil {
                if flag == true { return false }
                queue.enqueueNode(value: (temp?.right)!)
            } else {
                flag = true
            }
        }

        return true
    }
    
    
    
}

let result = Result<Int>()

let tree = Node(value: 1)
tree.left = Node(value: 2)
tree.right = Node(value: 3)
print(tree)
result.isBinaryTree(root: tree)

//let tree2 = Node(value: 1)
//tree2.left = Node(value: 2)
//tree2.right = Node(value: 3)
//tree2.left?.left = Node(value: 4)
//print(tree2)
//result.isBinaryTree(root: tree2)
//
//let tree3 = Node(value: 1)
//tree3.left = Node(value: 2)
//tree3.right = Node(value: 3)
//tree3.left?.left = Node(value: 4)
//tree3.left?.right = Node(value: 5)
//tree3.right?.left = Node(value: 6)
//print(tree3)
//result.isBinaryTree(root: tree3)
//
//let tree4 = Node(value: 1)
//tree4.right = Node(value: 4)
//print(tree4)
//result.isBinaryTree(root: tree4)
//
//let tree5 = Node(value: 1)
//tree5.left = Node(value: 2)
//tree5.right = Node(value: 3)
//tree5.left?.right = Node(value: 4)
//tree5.right?.left = Node(value: 5)
//tree5.right?.right = Node(value: 6)
//print(tree5)
//result.isBinaryTree(root: tree5)
//
//let tree6 = Node(value: 1)
//tree6.left = Node(value: 2)
//tree6.right = Node(value: 3)
//tree6.right?.left = Node(value: 4)
//tree6.right?.right = Node(value: 5)
//print(tree6)
//result.isBinaryTree(root: tree6)

















