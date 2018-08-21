//
// Created by Eric Liu on 8/20/18.
//

import Foundation


class Solution056 {
    func merge(_ intervals: [Interval]) -> [Interval] {
        var result = [Interval]()

        let sorted = intervals.sorted { (interval1: Interval, interval2: Interval) -> Bool in
            if interval1.start != interval2.start {
                return interval1.start < interval2.start
            } else {
                return interval1.end < interval2.end
            }
        }

        for interval in sorted {
            guard let last = result.last else {
                result.append(interval)
                continue
            }

            if interval.start > last.end {
                result.append(interval)
            } else {
                last.end = max(last.end, interval.end)
            }
        }
        return result
    }
}


import XCTest

class Test056: XCTestCase {
    /**
    Input: [[1,3],[2,6],[8,10],[15,18]]
    Output: [[1,6],[8,10],[15,18]]
    Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
    */
    func test01() {
        let input = [Interval(1, 3), Interval(2, 6), Interval(8, 10), Interval(15, 18)]
        let expected = [Interval(1, 6), Interval(8, 10), Interval(15, 18)]
        let result = Solution056().merge(input)
        assert(expected == result)
    }


    /**
    Input: [[1,4],[0,4]]
    Output: [[0,4]]
    */
    func test02() {
        let input = [Interval(1, 4), Interval(0, 4)]
        let expected = [Interval(0, 4)]
        let result = Solution056().merge(input)
        assert(expected == result)
    }

}