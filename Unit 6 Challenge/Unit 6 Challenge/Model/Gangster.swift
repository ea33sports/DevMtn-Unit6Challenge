//
//  Gangster.swift
//  Unit 6 Challenge
//
//  Created by Eric Andersen on 10/5/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class Gangster: Equatable, Codable {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Gangster, rhs: Gangster) -> Bool {
        if lhs.name == rhs.name { return true }
        return false
    }
}
