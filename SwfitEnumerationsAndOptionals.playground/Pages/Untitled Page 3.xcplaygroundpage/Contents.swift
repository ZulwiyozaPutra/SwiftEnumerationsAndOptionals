//: [Previous](@previous)

import Foundation

enum Coin: Double {
    case Penny = 0.01
    case Nickel = 0.05
    case Dime = 0.10
    case Quarter = 0.25
}

let wallet: [Coin] = [
    Coin.Penny,
    Coin.Nickel,
    Coin.Dime,
    Coin.Dime,
    Coin.Quarter,
    Coin.Quarter,
    Coin.Quarter
]

var count: Int = 0

for coin in wallet {
    switch coin {
    case Coin.Quarter: count = count + 1
    default: continue
    }
}

for case Coin.Quarter in wallet {
    count = count + 1
}

let firstName: String? = "Zulwiyoza"
let userName: String = "ZulwiyozaPutra"
var displayName: String

if firstName != nil {
    displayName = firstName!
} else {
    displayName = userName
}

//: [Next](@next)
