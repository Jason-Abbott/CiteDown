import Foundation
import GRDB

let dbQueue = try DatabaseQueue(path: "/path/to/database.sqlite")

try dbQueue.read { db in
    // Fetch database rows
    let rows = try Row.fetchCursor(db, sql: "SELECT * FROM place")
    while let row = try rows.next() {
        let title: String = row["title"]
        let isFavorite: Bool = row["favorite"]
        let coordinate = CLLocationCoordinate2D(
            latitude: row["latitude"],
            longitude: row["longitude"]
        )
    }

    // Fetch values
    let placeCount = try Int.fetchOne(db, sql: "SELECT COUNT(*) FROM place")! // Int
    let placeTitles = try String.fetchAll(db, sql: "SELECT title FROM place") // [String]
}

// https://github.com/groue/GRDB.swift
class SQLiteSource {
    private var db: DatabaseQueue
    private var config: Configuration
    private var path: String

    init(path: String) {
        config = Configuration()
        config.readonly = true
        config.label = "Zotero"
        config.maximumReaderCount = 10

        self.path = path

        #if DEBUG
            // Protect sensitive information by enabling verbose debugging in
            // DEBUG builds only
            config.publicStatementArguments = true
        #endif
    }

    func read(sql _: String) {
        db = try DatabaseQueue(path: path, configuration: config)

        try db.read { db in
            if let row = try Row.fetchOne(
                db,
                sql: "SELECT * FROM wine WHERE id = ?",
                arguments: [1]
            ) {
                let name: String = row["name"]
                let color: Color = row["color"]
                print(name, color)
            }
        }
    }
}
