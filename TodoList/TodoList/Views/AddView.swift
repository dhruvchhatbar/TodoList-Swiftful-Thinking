//
//  ContentView.swift
//  TodoList
//
//  Created by Dhruv Chhatbar on 21/04/26.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textfieldText: String = ""
    @State var errorMessage: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TextField("Type something here...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.gray.opacity(0.2))
                    .cornerRadius(10)
                
                Text(errorMessage)
                    .font(.headline)
                    .foregroundStyle(.red)
                    .animation(.default)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding()
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .padding(14)
        }
        .navigationTitle("Add an Item 🖊️")
        .onChange(of: textfieldText) {
            errorMessage = ""
        }
    }
    func saveButtonPressed(){
        guard textfieldText.count > 3 else {
            errorMessage = "Enter Valid Note"
            return
        }
        listViewModel.addItem(title: textfieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
