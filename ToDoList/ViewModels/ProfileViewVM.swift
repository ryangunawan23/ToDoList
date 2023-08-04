//
//  ProfileViewVM.swift
//  ToDoList
//
//  Created by user on 01/08/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewVM: ObservableObject{
    @Published var user: User? = nil
    init() {}
    
    func fetchUserData(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                                id: data["id"] as? String ?? "",
                                name: data["name"] as? String ?? "",
                                email: data["email"] as? String ?? "",
                                joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
        } catch {
            return
        }
    }
}
