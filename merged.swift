//
//  paytrack_test1App.swift
//  paytrack_test1
//
//  Created by Stephen Dawes on 07/04/2025.
//

import SwiftUI
import SwiftData

@main
struct paytrack_test1App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Transaction.self)
    }
}
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
//
//  ContentView.swift
//  paytrack_test1
//
//  Created by Stephen Dawes on 07/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var transactions: [Transaction]

    var body: some View {
        NavigationStack {
            List {
                ForEach(transactions) { transaction in
                    VStack(alignment: .leading) {
                        Text(transaction.name)
                        HStack(spacing: 30) {
                            // Text(transaction.amount, style: .currency)
                            Text(transaction.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            Text(transaction.date, style: .date)
                            Text(transaction.category)
                        }
                    }
                }
            }
            .navigationTitle("PayTrack")
            .toolbar {
                Button("Add Samples", action: addSampleData)
            }
        }
    }

    private func addSampleData() {
        let sampleTransactions = [
            Transaction(name: "Groceries", amount: 50.0, date: Date(), category: "Food"),
            Transaction(name: "Amazon", amount: 100.0, date: Date(), category: "Shopping"),
            Transaction(name: "Netflix", amount: 15.0, date: Date(), category: "Entertainment"),
            Transaction(name: "Gym", amount: 20.0, date: Date(), category: "Fitness"),
            Transaction(name: "Dinner", amount: 30.0, date: Date(), category: "Food")
        ]

        for transaction in sampleTransactions {
            modelContext.insert(transaction)
        }
    }
}


