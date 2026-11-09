//
//  Item.swift
//  luvbug
//
//  Created by Stanislav Yem on 2026-11-09.
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
