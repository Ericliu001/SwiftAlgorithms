// Original question: https://www.codingame.com/ide/puzzle/shadows-of-the-knight-episode-1

import Glibc
import Foundation

public struct StderrOutputStream: TextOutputStream {
    public mutating func write(_ string: String) {
        fputs(string, stderr)
    }
}

public var errStream = StderrOutputStream()

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/

let inputs = (readLine()!).characters.split {
    $0 == " "
}.map(String.init)
let W = Int(inputs[0])! // width of the building.
let H = Int(inputs[1])! // height of the building.
let N = Int(readLine()!)! // maximum number of turns before game over.
let inputs2 = (readLine()!).characters.split {
    $0 == " "
}.map(String.init)
let X0 = Int(inputs2[0])!
let Y0 = Int(inputs2[1])!



class Point {
    var x: Int = 0
    var y: Int = 0

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}



var upperLeft = Point(x: 0, y: 0)
var lowerRight = Point(x: W, y: H)
var batmanX = X0
var batmanY = Y0

private func zoomIn(bombDir: String) {
    switch bombDir {
    case "U":
        upperLeft.x = batmanX
        lowerRight.x = batmanX
        lowerRight.y = batmanY - 1

    case "UR":
        upperLeft.x = batmanX + 1
        lowerRight.y = batmanY - 1

    case "R":
        upperLeft.x = batmanX + 1
        upperLeft.y = batmanY
        lowerRight.y = batmanY

    case "DR":
        upperLeft.x = batmanX + 1
        upperLeft.y = batmanY + 1

    case "D":
        upperLeft.x = batmanX
        upperLeft.y = batmanY + 1
        lowerRight.x = batmanX

    case "DL":
        upperLeft.y = batmanY + 1
        lowerRight.x = batmanX - 1

    case "L":
        upperLeft.y = batmanY
        lowerRight.x = batmanX - 1
        lowerRight.y = batmanY

    case "UL":
        lowerRight.x = batmanX - 1
        lowerRight.y = batmanY - 1

    default: print("Error")
    }
}


// game loop
while true {
    let bombDir = readLine()! // the direction of the bombs from batman's current location (U, UR, R, DR, D, DL, L or UL)

    // Write an action using print("message...")
    // To debug: print("Debug messages...", to: &errStream)
    zoomIn(bombDir: bombDir)
    batmanX = (upperLeft.x + lowerRight.x) / 2
    batmanY = (upperLeft.y + lowerRight.y) / 2

    // the location of the next window Batman should jump to.
    print(batmanX, batmanY)
}



