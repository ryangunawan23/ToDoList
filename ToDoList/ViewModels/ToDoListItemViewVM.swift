//
//  ToDoListItemViewVM.swift
//  ToDoList
//
//  Created by user on 01/08/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListItemViewVM: ObservableObject{
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
