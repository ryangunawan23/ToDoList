//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by user on 31/07/23.
//

import SwiftUI

struct ToDoListItemView: View {
    let modelItem: ToDoListItem
    @StateObject var viewModel = ToDoListItemViewVM()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(modelItem.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: modelItem.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: modelItem)
            } label: {
                Image(systemName: modelItem.isDone ? "checkmark.circle.fill" : "circle")
            }

        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(modelItem: .init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
