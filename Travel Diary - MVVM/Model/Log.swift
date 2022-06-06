//
//  Log.swift
//  Travel Diary - MVVM
//
//  Created by Scott Cox on 6/6/22.
//

import Foundation

class Log: Codable {
    
    var name: String
    var date: Date = Date()
    var entry: String
    var uuid: UUID = UUID()
    
    init(name: String, date: Date = Date(), entry: String, uuid: UUID = UUID()) {
        self.name = name
        self.date = date
        self.entry = entry
        self.uuid = uuid
    }
    
}

extension Log: Equatable {
    static func == (lhs: Log, rhs: Log) -> Bool {
        return lhs.name == rhs.name &&
        lhs.entry == rhs.entry &&
        lhs.date == rhs.date
    }
}

