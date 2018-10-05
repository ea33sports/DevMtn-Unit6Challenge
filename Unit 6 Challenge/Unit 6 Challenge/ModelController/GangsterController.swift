//
//  GangsterController.swift
//  Unit 6 Challenge
//
//  Created by Eric Andersen on 10/5/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class GangsterController {
    
    static let shared = GangsterController()
    var gangsters: [Gangster] = []
    
    
    // CRUD
    func createGangster(name: String) {
        let gangster = Gangster(name: name)
        gangsters.append(gangster)
        saveToPersistentStore()
    }
    
    func delete(gangster: Gangster) {
        guard let index = gangsters.index(of: gangster) else { return }
        gangsters.remove(at: index)
        saveToPersistentStore()
    }
    
    
    // Persist
    func fileURL() -> URL {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = path[0]
        let fileName = "gangsters.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        return fullURL
    }
    
    func saveToPersistentStore() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(gangsters)
            try data.write(to: fileURL())
        } catch {
            print("💩 There was an error Saving to the Persistent Store \(error): \(error.localizedDescription) 💩")
        }
    }
    
    func loadFromPersistentStore() -> [Gangster] {
        
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let bucketList = try decoder.decode([Gangster].self, from: data)
            return bucketList
        } catch {
            print("💩 There waas an error Loading from the Persistent Store \(error): \(error.localizedDescription)💩")
        }
        return []
    }
}
