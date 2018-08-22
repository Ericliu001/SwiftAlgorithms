////
//// Created by Eric Liu on 8/17/18.
////
//
//import Foundation
//
//
///**
// * Definition for an interval.
//*/
//
//class _057_Insert_Interval {
//    func insert(_ intervals: [Interval], _ newInterval: Interval) -> [Interval] {
//        guard !intervals.isEmpty else {
//            return [newInterval]
//        }
//
//        var replaceInterval = Interval(0, 0)
//        var replaceStartIndex = 0
//        var replaceEndIndex = 0
//
//        if newInterval.start <= intervals.first!.start {
//            replaceInterval.start = newInterval.start
//            replaceStartIndex = 0
//        } else {
//            let lowerBound: (Int, Int) = binarySearch(intervals: intervals, target: newInterval.start)
//            if lowerBound.0 % 2 == 0 {
//                // between [a, b]
//                replaceInterval.start = intervals[lowerBound.0 / 2].start
//                replaceStartIndex = lowerBound.0 / 2
//            } else {
//                if intervals[lowerBound.0 / 2].end == newInterval.start {
//                    // ...b] == newInterval.start
//                    replaceInterval.start = intervals[lowerBound.0 / 2].start
//                    replaceStartIndex = lowerBound.0 / 2
//                }
//                //between ...a], [b...
//                replaceInterval.start = newInterval.start
//                replaceStartIndex = lowerBound.1 / 2 + 1
//            }
//        }
//
//        if newInterval.end >= intervals.last!.end {
//            replaceInterval.end = newInterval.end
//            replaceEndIndex = intervals.count - 1
//        } else {
//            let upperBound: (Int, Int) = binarySearch(intervals: intervals, target: newInterval.end)
//            if upperBound.1 % 2 == 1 {
//                // between [a, b]
//                replaceInterval.end = intervals[upperBound.1 / 2].end
//                replaceEndIndex = upperBound.1 / 2
//            } else {
//                if newInterval.end == intervals[upperBound.1 / 2].start {
//                    // newInterval.end == [b ...
//                    replaceInterval.end = intervals[upperBound.1 / 2].end
//                    replaceEndIndex = upperBound.1 / 2
//                }
//                // between ...a], [b...
//                replaceInterval.end = newInterval.end
//                replaceEndIndex = upperBound.1 / 2 - 1
//            }
//        }
//
//
//        var result = intervals
//        result.removeSubrange(replaceStartIndex...replaceEndIndex)
//        result.insert(replaceInterval, at: replaceStartIndex)
//
//        return result
//    }
//
//
//    /**
//    *  Internals:  [[1,2],[3,5],[6,7],[8,10],[12,16]]
//    *  low, high:    0 1   2 3   4 5   6  7    8  9
//    */
//    private func binarySearch(intervals: [Interval], target: Int) -> (Int, Int) {
//        var low = 0
//        var high = intervals.count * 2 - 1
//
//        while low + 1 < high {
//            let mid = (low + high) / 2
//            let index = mid / 2
//            let midInterval = intervals[index]
//            let midValue = mid % 2 == 0 ? midInterval.start : midInterval.end
//
//            if midValue < target {
//                low = mid
//            } else {
//                high = mid
//            }
//        }
//
//        return (low, high)
//    }
//}
//
//import XCTest
//
//class Test057: XCTestCase {
//    /**
//    * Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
//    * Output: [[1,5],[6,9]]
//    */
//    func test01() {
//        let intervals = [Interval(1, 3), Interval(6, 9)]
//        let newInterval = Interval(2, 5)
//        let result = _057_Insert_Interval().insert(intervals, newInterval)
//
//        let expected = [Interval(1, 5), Interval(6, 9)]
//
//        assert(expected == result)
//    }
//
//    /**
//    Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
//                         0 1   2 3   4 5   6  7    8  9
//    Output: [[1,2],[3,10],[12,16]]
//    Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
//    */
//    func test02() {
//        let intervals = [Interval(1, 2), Interval(3, 5), Interval(6, 7), Interval(8, 10), Interval(12, 16)]
//        let newInterval = Interval(4, 8)
//        let result = _057_Insert_Interval().insert(intervals, newInterval)
//
//        let expected = [Interval(1, 2), Interval(3, 10), Interval(12, 16)]
//
//        assert(expected == result)
//    }
//
//
//    func test03() {
//        let intervals = [Interval(2, 3), Interval(6, 9)]
//        let newInterval = Interval(1, 5)
//        let result = _057_Insert_Interval().insert(intervals, newInterval)
//
//        let expected = [Interval(1, 5), Interval(6, 9)]
//
//        assert(expected == result)
//    }
//
//
//}