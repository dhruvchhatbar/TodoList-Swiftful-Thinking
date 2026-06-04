//
//  ItemModel.swift
//  TodoList
//
//  Created by Dhruv Chhatbar on 21/04/26.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    init(title: String) {
        self.title = title
        self.isCompleted = false
    }
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> Self{
        return ItemModel(title: title, isCompleted: !isCompleted)
    }
}
