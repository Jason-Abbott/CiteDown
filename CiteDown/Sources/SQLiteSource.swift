import Foundation
import GRDB

class SQLiteSource {
    private var db: DatabaseQueue
    private var config: Configuration

    init(path: String) {
        config = Configuration()
        config.readonly = true
        config.label = "Zotero" // Useful when your app opens multiple databases
        config.maximumReaderCount = 10

        #if DEBUG
            // Protect sensitive information by enabling verbose debugging in
            // DEBUG builds only
            config.publicStatementArguments = true
        #endif

        db = try DatabaseQueue( // or DatabasePool
            path: path,
            configuration: config
        )
    }
}
