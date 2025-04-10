//
//  ContentView.swift
//  paytrack_test1
//
//  Created by Stephen Dawes on 07/04/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext // m context is memory, m content is storage
    @Query var transactions: [Transaction]

    @State private var navPath = [Transaction]()

    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                ForEach(transactions) { transaction in
                    NavigationLink(value: transaction) {
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
                .onDelete(perform: deleteTransaction)
            }
            .navigationTitle("PayTrack")
            .navigationDestination(for: Transaction.self) { transaction in
                EditTransactionView(transaction: transaction)
            }
            .toolbar {
                Button("Add Transaction", action: addNewTransaction)
            }
        }
    }

    func deleteTransaction(_ indexSet: IndexSet) {
        indexSet.forEach { index in
            modelContext.delete(transactions[index])
        }
    }
    
    func addNewTransaction() {
        let transaction = Transaction(name: "New Restaurant", amount: 50, date: Date(), category: "Food")
        modelContext.insert(transaction)
        navPath = [transaction]
    }
}


