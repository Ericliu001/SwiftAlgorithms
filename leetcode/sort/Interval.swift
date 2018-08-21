//
// Created by Eric Liu on 8/20/18.
//

import Foundation

public class Interval: Equatable {
    public var start: Int
    public var end: Int

    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }

    public static func ==(lhs: Interval, rhs: Interval) -> Bool {
        return lhs.start == rhs.start && lhs.end == lhs.end
    }
}
