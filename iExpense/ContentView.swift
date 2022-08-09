//
//  ContentView.swift
//  iExpense
//
//  Created by Jiaming Guo on 2022-08-07.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }
                            Spacer()
                            if item.amount <= 10.0 {
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(.green)
                            } else if item.amount <= 500.0 {
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(.primary)
                            } else {
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(.red)
                            }
                            
                        }
                    }
                    .onDelete(perform: {offset in
                        expenses.remove(at: offset)
                    })
                }
                if expenses.items.count == 0 {
                    Text("Nothing to show here..")
                        .foregroundColor(.secondary)
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button(action: {
                    showingAddExpense = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $showingAddExpense, content: {
                AddView(expenses: expenses)
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
