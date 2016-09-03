
import UIKit
import Foundation

//Primitive Way

let week: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Firday", "Saturday", "Sunday"]

func weekdayOrWeekend(day: String) -> String {
    switch day {
    case "Tuesday", "Wednesday", "Thursday", "Friday":
        return "Weekday"
    case "Saturday", "Sunday":
        return "Weekend"
    default:
        return "you input a wrong day"
    }
}

func mutedNotification(day: String) -> Bool {
    if day == "Weekend" {
        return true
    } else {
        return false
    }
}


let result = weekdayOrWeekend(week[6])

mutedNotification(result)


//Enum Technology
//Same Purpose but different technique and better

enum Day: Int {
    case Monday = 1
    case Tuesday = 2
    case Wednesday = 3
    case Thursday = 4
    case Friday = 5
    case Saturday = 6
    case Sunday = 7
}

enum DayType {
    case Weekday
    case Weekend
}

func weekdayOrWeekend(day: Day) -> DayType {
    switch day {
    case Day.Monday, Day.Tuesday, Day.Wednesday, Day.Thursday, Day.Friday:
        return DayType.Weekday
    case Day.Saturday, Day.Sunday:
        return DayType.Weekend
    }
}

func mutedNotification(dayType: DayType) -> Bool {
    switch dayType {
    case DayType.Weekday:
        return false
    case DayType.Weekend:
        return true
    }
}

let dayType = weekdayOrWeekend(Day.Sunday)
let muteMode = mutedNotification(dayType)

//Associated Enum

enum ColorComponents {
    case RGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    case HSB(CGFloat, CGFloat, CGFloat, CGFloat)
    
    func color() -> UIColor {
        switch self {
        case .RGB(let redValue, let greenValue, let blueValue, let alphaValue):
            return UIColor(red: redValue/255.0, green: greenValue/255.0, blue: blueValue/255.0, alpha: alphaValue)
        case .HSB(let hueValue, let saturationValue, let brightnessValue, let alphaValue):
            return UIColor(hue: hueValue/360, saturation: saturationValue/100, brightness: brightnessValue/100, alpha: alphaValue)
        }
    }
}

ColorComponents.RGB(red: 61.0, green: 120.0, blue: 198.0, alpha: 1.0).color()


enum MobilePhone {
    case iPhone(String)
    case Android(String)
    case Blackberry(String)
    case Windows(String)
}

let iPhone = MobilePhone.iPhone("6S")


//Enum Practice

class Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int){
        self.x = x
        self.y = y
    }
}

enum Direction {
    case Left
    case Right
    case Up
    case Down
}


class Robot {
    var location: Point
    
    init() {
        self.location = Point(x: 0, y: 0)
    }
    
    func move(direction: Direction) {
        switch direction {
        case Direction.Up:
            location.y = location.y + 1
        case Direction.Down:
            location.y = location.y - 1
        case Direction.Right:
            location.x = location.x + 1
        case Direction.Left:
            location.x = location.x - 1
        }
    }
}

//Enum Practice
//First File

enum UIBarButtonStyle {
    case Done
    case Plain
    case Bordered
}

class UIBarButtonItem {
    
    var title: String?
    let style: UIBarButtonStyle
    var target: AnyObject?
    var action: Selector
    
    init(title: String?, style: UIBarButtonStyle, target: AnyObject?, action: Selector) {
        self.title = title
        self.style = style
        self.target = target
        self.action = action
    }
}

//Second File



enum Button {
    case Done(String)
    case Edit(String)
    
    func toUIBarButtonItem() -> UIBarButtonItem {
        switch self {
        case .Done: return UIBarButtonItem(title: "Done", style: UIBarButtonStyle.Done, target: nil, action: nil)
        case .Edit: return UIBarButtonItem(title: "Edit", style: UIBarButtonStyle.Plain, target: nil, action: nil)
        }
    }
}

let done = Button.Done("Done")
let doneButton = done.toUIBarButtonItem()


//OPTIONALS

//struct Person {
//    let firstName: String
//    let middleName: String?
//    let lastName: String
//    
//    func getFullName() -> String {
//        if middleName == nil {
//            return firstName + " " + lastName
//        } else {
//            return firstName + " " + middleName! + " " + lastName
//        }
//    }
//}
//
//let me = Person(firstName: "Zulwiyoza", middleName: nil, lastName: "Putra")
//
//me.getFullName()

//Optional Binding


let airportCodes: [String: String] = ["CDG": "Charles de Gaulle"]

if let newYorkAirport = airportCodes["JFK"] {
    print(newYorkAirport)
} else {
    print("That key doesn't exist")
}

//another optional binding example

let weatherDictionary: [String: [String: String]] = [
    "Currently": ["Temperature": "22.3"],
    "Daily": ["Temperature": "22.3"],
    "Weekly": ["Temperature": "22.3"]
    ]

let daily = weatherDictionary["Daily"]

////the ancient way to get temperature key


if let dailyWeather = weatherDictionary["Daily"] {
    if let highTemperature = dailyWeather["Temperature"] {
        print(highTemperature)
    }
}


////the modern way to get temperature key

if let dailyWeather = weatherDictionary["Daily"],
    let highTemperature = dailyWeather["Temperature"] {
    print(highTemperature)
}

//

let movieDictionary = [
    "Spectre": [
        "Cast": [
            "Daniel Craig",
            "Christoph Waltz",
            "Léa Seydoux",
            "Ralph Fiennes",
            "Monica Bellucci",
            "Naomie Harris"
        ]
    ]
]

var leadActor: String = ""

if let movie = movieDictionary["Spectre"],
    let movieCast = movie["Cast"] {
    leadActor = movieCast[0]
    
    print(leadActor)
}

print(leadActor)

//Downside of Using If Let

struct Friend {
    let name: String
    let age: String
    let address: String?
}

/*
func createFriend(dict: [String: String]) -> Friend? {
    if let name = dict["name"],
    let age = dict["age"],
    let address = dict["age"] {
        return Friend(name: name, age: age, address: address)
    } else {
        return nil
    }
}
*/

/*
func createFriend(dict: [String: String]) -> Friend? {
    let name = dict["name"]
    if name == nil {
        return nil
    }
    
    let age = dict["age"]
    if age == nil {
        return nil
    }
    
    let address = dict["address"]
 
    return Friend(name: name!, age: age!, address: address)
}
*/

/*
func createFriend(dict: [String: String]) -> Friend? {
    if let name = dict["name"],
        let age = dict["age"] {
        let address = dict["address"]
        return Friend(name: name, age: age, address: address)
    } else {
        return nil
    }
}
*/

func createFriend(dict: [String: String]) -> Friend? {
    guard let name = dict["name"],
        let age = dict["age"] else {
            return nil
    }
    
    let address = dict["address"]
    
    return Friend(name: name, age: age, address: address)
    
}

//Initializing Failable Initializer

struct Book {
    let title: String
    let author: String
    let price: String?
    let pubDate: String?
    
    init? (dict: [String: String]) {
        
        guard let title = dict["title"], let author = dict["author"] else {
            return nil
        }
        
        self.title = title
        self.author = author
        self.price = dict["price"]
        self.pubDate = dict["pubDate"]
    }
    
}

//Enumeration with Raw Values

enum Coin: Double {
    case Penny = 0.01
    case Nickel = 0.05
    case Dime = 0.10
    case Quarter = 0.25
}

let coins: [Coin] = [
    Coin.Penny,
    Coin.Nickel,
    Coin.Dime,
    Coin.Dime,
    Coin.Quarter,
    Coin.Quarter,
    Coin.Quarter
]

func totalValue(coins: [Coin]) -> Double {
    var total: Double = 0
    for coin in coins {
        total = total + coin.rawValue
        
        /*
        switch coin {
        case Coin.Penny: total = total + 0.01
        case Coin.Nickel: total = total + 0.05
        case Coin.Dime: total = total + 0.1
        case Coin.Quarter: total = total + 0.25
        }
        */
    }
    return total
}

totalValue(coins)


enum HTTPMethod: String {
    case POST
    case GET
    case PUT
    case DELETE
}

HTTPMethod.GET.rawValue

enum HTTPStatusCodes: Int {
    case Continue = 100
    case Success = 200
    case Unauthorized = 401
    case forbidden = 403
    case NotFound = 404
}

let statusCode = 200
let httpCode = HTTPStatusCodes(rawValue: statusCode)

//Another Enum Challenge

enum Compass: Int {
    case North = 1
    case South = 2
    case East = 3
    case West = 4
    
}

if let direction = Compass(rawValue: 2) {
    print(direction)
}

//Optional chaining

class Address {
    var streetName: String?
    var buildingNumber: String?
    var apartmentNumber: String?
}

class Residence {
    var address: Address?
}

class Person {
    var residence: Residence?
}

let address = Address()
address.streetName = "411 O'Farrell"
address.buildingNumber = "Unit 1"
address.apartmentNumber = "616"

let residence = Residence()
residence.address = address

let susan = Person()
susan.residence = residence

/*
if let home = susan.residence,
    let postalAddress = home.address,
    let apartmentNumber = postalAddress.apartmentNumber,
    let convertedNumber = Int(apartmentNumber) {
    print(convertedNumber)
    
}
 */

let apartmentNumber = susan.residence?.address?.apartmentNumber

//PATTERN MATCHING









