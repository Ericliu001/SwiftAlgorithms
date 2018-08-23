//
// Created by Eric Liu on 8/21/18.
//

import Foundation


class Solution088 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {

        let start = m + n - 1

        var tail1 = m - 1
        var tail2 = n - 1

        for i in stride(from: start, through: 0, by: -1) {

            if tail1 < 0 || (0 <= tail2 && nums1[tail1] < nums2[tail2]) {
                nums1[i] = nums2[tail2]
                tail2 -= 1
            } else {
                nums1[i] = nums1[tail1]
                tail1 -= 1
            }
        }
    }
}


import XCTest

class Test088: XCTestCase {
    /**
    Input:
    nums1 = [1,2,3,0,0,0], m = 3
    nums2 = [2,5,6],       n = 3

    Output: [1,2,2,3,5,6]
    */
    func test01() {
        var nums1 = [1,2,3,0,0,0]
        let nums2 = [2,5,6]
        let m = 3
        let n = 3
        let expected = [1, 2, 2, 3, 5, 6]

        Solution088().merge(&nums1, m, nums2, n)

        assert(expected == nums1)
    }

    /**
    Input:
    nums1 = [0], m = 0
    nums2 = [1], n = 1

    Output: [1]
    */
    func test02() {
        var nums1 = [0]
        let nums2 = [1]
        let m = 0
        let n = 1
        let expected = [1]

        Solution088().merge(&nums1, m, nums2, n)

        assert(expected == nums1)
    }
}
