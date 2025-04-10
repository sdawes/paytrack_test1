//
//  EditTransactionView.swift
//  paytrack_test1
//
//  Created by Stephen Dawes on 08/04/2025.
//

import SwiftUI
import SwiftData

struct EditTransactionView: View {
    @Bindable var transaction: Transaction
    
    var body: some View {
        Form {
            TextField("Name", text: $transaction.name)
            TextField("Amount", value: $transaction.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))  
            TextField("Category", text: $transaction.category)
        }
    }
}

#Preview {
    // Create a sample transaction
    let sampleTransaction = Transaction(name: "Sample", amount: 20.0, date: Date(), category: "Sample Category")
    
    // Create a model container configuration for in-memory storage
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    
    do {
        // Create a model container
        let container = try ModelContainer(for: Transaction.self, configurations: config)
        
        // Insert the sample transaction into the model context
        container.mainContext.insert(sampleTransaction)
        
        // Return the view with the model container
        return EditTransactionView(transaction: sampleTransaction)
            .modelContainer(container)
    } catch {
        // Handle the error, e.g., by returning an empty view or logging the error
        print("Failed to create model container: \(error)")
        return EmptyView()
    }
}
