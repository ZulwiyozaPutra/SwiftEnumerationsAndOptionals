let firstName: String? = "Zulwiyoza"
let userName: String = "ZulwiyozaPutra"

var displayName: String

if firstName != nil {
    displayName = firstName!
} else {
    displayName = userName
}

displayName = firstName != nil ? firstName! : userName

displayName = firstName ?? userName
