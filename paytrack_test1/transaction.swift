//
//  transaction.swift
//  paytrack_test1
//
//  Created by Stephen Dawes on 07/04/2025.
//

import Foundation
import SwiftData

@Model
class Transaction {
    var name: String
    var amount: Double
    var date: Date
    var category: String

    init(name: String, amount: Double, date: Date, category: String) {
        self.name = name
        self.amount = amount
        self.date = date
        self.category = category
    }
}
