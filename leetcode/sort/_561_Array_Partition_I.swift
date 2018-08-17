//
// Created by Eric Liu on 8/16/18.
//

import Foundation

class _561_Array_Partition_I {

    func arrayPairSum(_ nums: [Int]) -> Int {
        let sortedArray = nums.sorted()
        var sum = 0

        for i in stride(from: 0, to: nums.count - 1, by: 2) {
            sum += min(sortedArray[i], sortedArray[i + 1])
        }
        return sum
    }

}


import XCTest

class Test561: XCTestCase {

    func test01() {
        let nums = [1, 4, 3, 2]
        let result = _561_Array_Partition_I().arrayPairSum(nums)

        assert(4 == result)
    }


    func test02() {
        let nums = [2, 5, 7, 50]
        let result = _561_Array_Partition_I().arrayPairSum(nums)

        assert(9 == result)
    }
}