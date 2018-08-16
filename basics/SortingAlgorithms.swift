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


    func quickSort(_ nums: inout [Int], start: Int, end: Int) {
        guard start < end else {
            return
        }

        var low = start
        var high = end

        let pivotValue = nums[(start + end) / 2]

        while low <= high {
            while nums[low] < pivotValue {
                low += 1
            }

            while pivotValue < nums[high] {
                high -= 1
            }

            if low <= high {
                nums.swapAt(low, high)
                low += 1
                high -= 1
            }
        }

        quickSort(&nums, start: start, end: high)
        quickSort(&nums, start: low, end: end)
    }


    func mergeSort(_ nums: inout [Int]) {
        var dup = nums.map { i -> Int in
            i
        }
        mergeSort(src: &dup, dest: &nums, start: 0, end: nums.count - 1)
    }

    private func mergeSort(src: inout [Int], dest: inout [Int], start: Int, end: Int) {
        guard start < end else {
            return
        }


        let mid = start + (end - start) / 2
        mergeSort(src: &dest, dest: &src, start: start, end: mid)
        mergeSort(src: &dest, dest: &src, start: mid + 1, end: end)

        var right = mid + 1
        var left = start
        for i in start...end {
            if (right > end) || (left <= mid && src[left] < src[right]) {
                dest[i] = src[left]
                left += 1
            } else {
                dest[i] = src[right]
                right += 1
            }
        }
    }
}


import XCTest

class TestSorting: XCTestCase {

    var nums = [Int]()

    override func setUp() {
        let size = 30
        nums = (0..<size).map { _ -> Int in
            Int(arc4random_uniform(UInt32(size)))
        }
    }


    func testInsertionSort() {
        print("\nInsertion Sort:")
        print(nums)

        SortingAlgorithms().insertionSort(&nums)
        let expected = nums.sorted()
        assert(expected == nums)

        print(nums)
    }

    func testQuickSort() {
        print("\nQuick Sort:")
        print(nums)

        SortingAlgorithms().quickSort(&nums, start: 0, end: nums.count - 1)

        let expected = nums.sorted()

        assert(expected == nums)
        print(nums)

        var testArray1 = [1, 1]
        SortingAlgorithms().quickSort(&testArray1, start: 0, end: testArray1.count - 1)
        assert([1, 1] == testArray1)
        print(testArray1)


        var testArray2 = [1]
        SortingAlgorithms().quickSort(&testArray2, start: 0, end: testArray2.count - 1)
        assert([1] == testArray2)
        print(testArray2)
    }

    func testMergeSort() {
        print("\nMerge Sort:")
        print(nums)

        SortingAlgorithms().mergeSort(&nums)

        let expected = nums.sorted()
        print(nums)
        assert(expected == nums)
    }
}





