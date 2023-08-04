//
//  User.swift
//  ToDoList
//
//  Created by user on 31/07/23.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
