//
//  LogDetailViewModel.swift
//  Travel Diary - MVVM
//
//  Created by Scott Cox on 6/6/22.
//

import Foundation

class LogDetailViewModel {
    
    let storage: LogStorage
    var log: Log?
    
    init(log: Log? = nil, storage: LogStorage = LogStorage.sharedInstance) {
        self.storage = storage
        self.log = log
    }
    
    func saveLog(with name: String, entry: String) {
        if log != nil {
            updateLog(newName: name, entry: entry)
        } else {
            let log = Log(name: name, entry: entry)
            storage.save(log)
        }
    }
    
    func updateLog(newName: String, entry: String) {
        guard let log = log, let indexOfLog = storage.logs.firstIndex(of: log) else {return}
        let logToUpdate = storage.logs[indexOfLog]
        logToUpdate.name = newName
        logToUpdate.entry = entry
        storage.update()
    }
    
    
}
