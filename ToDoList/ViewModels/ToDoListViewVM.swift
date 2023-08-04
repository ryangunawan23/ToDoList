//
//  ToDoListViewVM.swift
//  ToDoList
//
//  Created by user on 01/08/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListViewVM: ObservableObject{
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete to do list uten
    /// - Parameter id: <#id description#>
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
