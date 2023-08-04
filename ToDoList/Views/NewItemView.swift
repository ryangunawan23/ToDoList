//
//  NewItemView.swift
//  ToDoList
//
//  Created by user on 31/07/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewVM()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            
            ZStack{
                HStack{
                    Button("Back"){
                        newItemPresented = false
                    }.padding([.leading])
                    Spacer()
                }
                HStack{
                    Text("New Item")
                        .font(.system(size: 32))
                        .bold()
                }
            }
            
            Form{
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due date
                DatePicker("Due Date", selection: $viewModel.dueDate, in: Date()...)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    
                //Button
                TLButton(title: "Save", bgColor: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due date that is today or newer"))
            }
        }
        .offset(y: 30)
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
