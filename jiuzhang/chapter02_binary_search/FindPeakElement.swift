//
// Created by Eric Liu on 6/28/18.
//

import Foundation

/*

    A peak element is an element that is greater than its neighbors.

    Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

    The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

    You may imagine that nums[-1] = nums[n] = -∞.

    Example 1:

    Input: nums = [1,2,3,1]
    Output: 2
    Explanation: 3 is a peak element and your function should return the index number 2.
    Example 2:

    Input: nums = [1,2,1,3,5,6,4]
    Output: 1 or 5
    Explanation: Your function can return either index number 1 where the peak element is 2,
                 or index number 5 where the peak element is 6.
    Note:

    Your solution should be in logarithmic complexity.

*/

class Solution162 {
    func findPeakElement(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else {
            return -1
        }

        var low = 1
        var high = nums.count - 2

        while low + 1 < high {
            let mid = low + (high - low) / 2

            if nums[mid] < nums[mid + 1] {
                low = mid
            } else if nums[mid] < nums[mid - 1] {
                high = mid
            }
        }

        return nums[low] < nums[high] ? high : low
    }
}


import XCTest

class Test162: XCTestCase {

    func test01() {
        let nums = [1, 2, 3, 1]
        let peak = Solution162().findPeakElement(nums)
        assert(peak == 2)
    }

    func test02() {
        let nums = [1,2,1,3,5,6,4]
        let peak = Solution162().findPeakElement(nums)

        let resultSet: Set<Int> = [1, 5]
        assert(resultSet.contains(peak))
    }

}