import Foundation
import GRDB

struct Source {
    var db: DatabaseQueue {
        try DatabaseQueue(path: "/path/to/database.sqlite")
    }

    var config: Configuration {
        var c = Configuration()
        c.readonly = true
        c.label = "Zotero"
        c.maximumReaderCount = 10
        return c
    }

    func read() {
        let rows = try Row.fetchCursor(db, sql: "SELECT * FROM place")
        while let row = try rows.next() {
            let title: String = row["title"]
            let isFavorite: Bool = row["favorite"]
            let coordinate = CLLocationCoordinate2D(
                latitude: row["latitude"],
                longitude: row["longitude"]
            )
        }
    }
}
