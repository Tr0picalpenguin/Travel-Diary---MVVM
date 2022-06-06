//
//  LogListViewModel.swift
//  Travel Diary - MVVM
//
//  Created by Scott Cox on 6/6/22.
//

import Foundation

class LogListViewModel {
    
    let storage: LogStorage
    var logs: [Log] = []
    
    init(storage: LogStorage = LogStorage.sharedInstance) {
        self.storage = storage
    }
    
    func loadData() {
        storage.load()
        self.logs = storage.logs
    }
    
    func delete(index: Int) {
        storage.logs.remove(at: index)
        storage.update()
        self.logs = storage.logs
    }
}
