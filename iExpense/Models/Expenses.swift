//
//  Expenses.swift
//  iExpense
//
//  Created by Jiaming Guo on 2022-08-08.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
