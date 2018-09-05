//
//  Games.swift
//  Video Game Library
//
//  Created by Alex Richardson on 9/4/18.
//  Copyright © 2018 Alex Richardson. All rights reserved.
//

import Foundation

class Game {
    var title: String
    var checkedIn = true
    var dueDate: Date?
    
    
    init(title: String) {
        self.title = title
    }
    
}
