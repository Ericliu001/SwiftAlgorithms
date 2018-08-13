//
// Created by Eric Liu on 8/12/18.
//

import Foundation

class SortingAlgorithms {

    func insertionSort(_ nums: inout [Int]) {
        for i in 0..<nums.count {
            for j in stride(from: i, through: 1, by: -1) {
                if nums[j] < nums[j - 1] {
                    nums.swapAt(j - 1, j)
                } else {
                    break
                }
            }
        }
    }
}


import XCTest

class TestSorting: XCTestCase {
    func testInsertionSort() {
        var nums = [1, 2, 3, 1, 4]
        SortingAlgorithms().insertionSort(&nums)

        let expected = [1, 1, 2, 3, 4]

        print(nums)
        assert(expected == nums)
    }

}





