//
//  AddView.swift
//  iExpense
//
//  Created by Jiaming Guo on 2022-08-08.
//

import SwiftUI

struct AddView: View {
    @StateObject var expenses: Expenses
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                } header: {
                    Text("Name")
                }
                
                Picker("Type", selection: $type, content: {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                })
                .pickerStyle(.inline)
                
                Section {
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Amount")
                }
            }
            .navigationTitle("Add a new expense")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
