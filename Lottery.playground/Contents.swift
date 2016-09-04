//: Playground - noun: a place where people can play

import UIKit
import GameplayKit


let randomNumberMaker = GKRandomDistribution.init(lowestValue: 0, highestValue: 99)
let jackpotGenerator = GKRandomDistribution.init(lowestValue: 10000, highestValue: 100000)
var userRegularNumbers = Set<Int> ()
let jackpot = jackpotGenerator.nextInt()
var numberCorrect = 0
var winnings = 0

// this is a proxy for letting user input numbers (otherwise, numbers could be typed into (var userRegularNumbers: Set<Int> = [Int, Int, Int, Int, Int])):
for index in 1...5 {
    var number = randomNumberMaker.nextInt()
    while userRegularNumbers.contains(number) {
        number = randomNumberMaker.nextInt()
    }
        userRegularNumbers.insert(number)
}
print (userRegularNumbers)

// this is a proxy for letting user input superball (otherwise, could have been set by (let UserSuperball = Int):
let userSuperball = randomNumberMaker.nextInt()

var drawnRegularNumbers = Set<Int>()
for index in 1...5 {
    var drawnNumber = randomNumberMaker.nextInt()
    while drawnRegularNumbers.contains(drawnNumber) {
        drawnNumber = randomNumberMaker.nextInt()
    }
    drawnRegularNumbers.insert(drawnNumber)
}

let drawnSuperball = randomNumberMaker.nextInt()

func calculateWinnings(numberCorrect: Int, jackpot: Int, userSuperball: Int, drawnSuperball: Int) -> Int {
    if ((numberCorrect > 0) && userSuperball == drawnSuperball) {
        winnings = (numberCorrect * (jackpot / 10) * 2)
    } else if ((numberCorrect > 0) && userSuperball != drawnSuperball) {
        winnings = (numberCorrect * (jackpot / 10))
    } else if ((numberCorrect == 0) && userSuperball == drawnSuperball) {
        winnings = (jackpot / 10)
    }
    return winnings
}
// this function accepts "userRegularNumbers" and "userSuperball", which are created above using random number generators but could also have been set otherwise
func play(userRegularNumbers: Set<Int>, drawnRegularNumbers: Set<Int>, userSuperball: Int, drawnSuperball: Int, jackpot: Int){
    let commonNumbers = userRegularNumbers.intersection(drawnRegularNumbers)
    print (drawnRegularNumbers)
    numberCorrect = commonNumbers.count
    calculateWinnings(numberCorrect: numberCorrect, jackpot: jackpot, userSuperball: userSuperball, drawnSuperball: drawnSuperball)
    if (userSuperball == drawnSuperball) {
        print("The total possible jackpot was $\(jackpot). You picked \(commonNumbers.count) of the numbers correctly and correctly picked the superball. You won $\(winnings).")
    } else {
        print("The total possible jackpot was $\(jackpot). You picked \(commonNumbers.count) of the numbers correctly and did not pick the superball. You won $\(winnings).")
    }
}

play(userRegularNumbers: userRegularNumbers, drawnRegularNumbers: drawnRegularNumbers, userSuperball: userSuperball, drawnSuperball: drawnSuperball, jackpot: jackpot)



