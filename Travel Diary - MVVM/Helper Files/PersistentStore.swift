//
//  PersistentStore.swift
//  Travel Diary - MVVM
//
//  Created by Scott Cox on 6/6/22.
//

import Foundation

protocol LogStoreable {
        
    var logs: [Log] {get set}
    
    func save(_ log: Log)
    func update()
    func load()
    
}

class LogStorage: LogStoreable {
    
    
    static let sharedInstance = LogStorage()
    var logs: [Log] = []
    
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let url = documentsDirectory.appendingPathComponent("traveldiary-mvvm.json")
        return url
    }
    
    func save(_ log: Log) {
        guard let fileURL = fileURL else {return}
        do {
            logs.append(log)
           let data = try JSONEncoder().encode(logs)
            try data.write(to: fileURL)
        } catch let error {
            print(error)
        }
    }
    
    func update() {
        guard let url = fileURL else {return}
        do {
           let data = try JSONEncoder().encode(logs)
            try data.write(to: url)
        } catch let error {
            print(error)
        }
    }
    
    func load() {
        guard let url = fileURL else {return}
        do {
          let data = try Data(contentsOf: url)
          let logs = try JSONDecoder().decode([Log].self, from: data)
            self.logs = logs
        } catch let error {
            print(error)
        }
    }
}
