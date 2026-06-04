//
//  ContentView.swift
//  TodoList
//
//  Created by Dhruv Chhatbar on 21/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(.plain)
        .navigationTitle("ToDo List 📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add") {
                    AddView()
                        .environmentObject(listViewModel)
                }
            }
        }
    }
}

struct ListRowView: View {
    let item: ItemModel
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .yellow )
            Text(item.title)
        }
        .font(.title2)
    }
}

#Preview {
    NavigationView {
        ContentView()
            .environmentObject(ListViewModel())
    }
}
