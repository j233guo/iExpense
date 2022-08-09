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
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(expenses.items) { item in
                        Text(item.name)
                    }
                    .onDelete(perform: removeItem)
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
