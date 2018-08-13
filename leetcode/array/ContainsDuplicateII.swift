//
// Created by Eric Liu on 7/7/18.
//

import Foundation

/**
 * Question Link: https://leetcode.com/problems/contains-duplicate-ii/
 * Primary idea: use a dictionary to check duplicates, then judge if their distance is less than k
 *
 * Time Complexity: O(n), Space Complexity: O(n)


Given an array of integers and an integer k, find out whether there are two distinct indices i and j in the array such that nums[i] = nums[j] and the absolute difference between i and j is at most k.

Example 1:
Input: nums = [1,2,3,1], k = 3
Output: true

Example 2:

Input: nums = [1,0,1,1], k = 1
Output: true
Example 3:

Input: nums = [1,2,3,1,2,3], k = 2
Output: false

 *
 */

class ContainsDuplicateII {
    func containsNearbyDuplicate(nums: [Int], _ k: Int) -> Bool {
        guard k > 0 && nums.count > k else {
            return false
        }

        var set = Set<Int>(nums[0..<k])

        var left: Int = 0

        for right in k..<nums.count {
            if set.contains(nums[right]) {
                return true
            }

            set.remove(nums[left])
            set.insert(nums[right])

            left += 1
        }

        return false
    }
}

import XCTest
class TestContainsDuplicateII: XCTestCase {
    func test01() {
        let nums = [1, 2, 3, 1]
        let k = 3
        let result = ContainsDuplicateII().containsNearbyDuplicate(nums: nums, k)

        assert(result)
    }

    func test02() {
        let nums = [1,0,1,1]
        let k = 1
        let result = ContainsDuplicateII().containsNearbyDuplicate(nums: nums, k)

        assert(result)
    }

    func test03() {
        let nums = [1,2,3,1,2,3]
        let k = 2
        let result = ContainsDuplicateII().containsNearbyDuplicate(nums: nums, k)

        assert(result == false)
    }
}