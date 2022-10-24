import Foundation
import GRDB

struct Creator: Codable, FetchableRecord {
    var firstName: String
    var lastName: String
}
