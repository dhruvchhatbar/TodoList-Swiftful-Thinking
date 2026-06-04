//
//  TodoListApp.swift
//  TodoList
//
//  Created by Dhruv Chhatbar on 21/04/26.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(listViewModel)
        }
    }
}
