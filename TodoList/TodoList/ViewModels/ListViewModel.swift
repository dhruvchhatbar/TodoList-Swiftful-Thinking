//
//  ListViewModel.swift
//  TodoList
//
//  Created by Dhruv Chhatbar on 21/04/26.
//

import Foundation
import SwiftUI
import Combine

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getDemoItems()
    }
    
    func getDemoItems() {
        let newItem = [
            ItemModel(title: "This is the first title!"),
            ItemModel(title: "This is the 2nd title!", isCompleted: true),
            ItemModel(title: "After 2nd, means 3rd")
        ]
        items.append(contentsOf: newItem)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        items.append(ItemModel(title: title))
    }
    
    func updateItem(item: ItemModel) {
        guard let index = items.firstIndex(where: {$0.id == item.id}) else { return }
        items[index] = item.updateCompletion()
    }
}
