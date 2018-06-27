//
// Created by Eric Liu on 6/26/18.
//

import Foundation


/**
    Implement strStr().

    Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

    Example 1:

    Input: haystack = "hello", needle = "ll"
    Output: 2
    Example 2:

    Input: haystack = "aaaaa", needle = "bba"
    Output: -1
    Clarification:

    What should we return when needle is an empty string? This is a great question to ask during an interview.

    For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
*/


class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard needle.count > 0 else {
            return 0
        }

        guard haystack.count >= needle.count else {
            return -1
        }

        let needleArray = Array(needle)
        let haystackArray = Array(haystack)

        for i in 0...haystack.count - needle.count {
            var j = 0
            while j < needle.count {
                if haystackArray[i + j] != needleArray[j] {
                    break
                }
                j += 1
            }

            if j == needle.count {
                return i
            }
        }

        return -1
    }
}


import XCTest

class Test: XCTestCase {

    func test01() {
        let hayStack = "a"
        let needle = "a"
        let index = Solution().strStr(hayStack, needle)

        assert(index == 0)
    }

    func test02() {
        let hayStack = "hello"
        let needle = "ll"
        let index = Solution().strStr(hayStack, needle)

        assert(index == 2)
    }

    func test03() {
        let hayStack = "aaaaaa"
        let needle = "ba"
        let index = Solution().strStr(hayStack, needle)

        assert(index == -1)
    }


    func test04() {
        let hayStack = ""
        let needle = "a"
        let index = Solution().strStr(hayStack, needle)

        assert(index == -1)
    }

}
