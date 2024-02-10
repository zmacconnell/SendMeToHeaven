//
//  Item.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/1/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
