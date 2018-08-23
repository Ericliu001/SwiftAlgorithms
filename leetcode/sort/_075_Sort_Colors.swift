//
// Created by Eric Liu on 8/22/18.
//

import Foundation

class Solution075 {
    func sortColors(_ nums: inout [Int]) {
        var red = 0
        var white = 0
        var blue = nums.count - 1

        while white < blue {
            while 0 <= blue && nums[blue] == 2 { // Range Check, don't forget!!!
                blue -= 1
            }

            while white < nums.count && nums[white] <= 1 { // Range Check, don't forget!!!
                if nums[white] == 0 {
                    nums.swapAt(white, red)
                    white += 1
                    red += 1
                } else if nums[white] == 1 {
                    white += 1
                }
            }

            if white < blue {
                nums.swapAt(blue, white)
            }
        }
    }
}

import XCTest

class Test075: XCTestCase {

    func test01() {
        var nums = [2, 0, 1]
        let expected = nums.sorted()

        Solution075().sortColors(&nums)

        assert(expected == nums)
    }

    func test02() {
        var nums = [0, 0]
        let expected = nums.sorted()

        Solution075().sortColors(&nums)

        assert(expected == nums)
    }

    func test03() {
        var nums = [2, 2]
        let expected = nums.sorted()

        Solution075().sortColors(&nums)

        assert(expected == nums)
    }
}