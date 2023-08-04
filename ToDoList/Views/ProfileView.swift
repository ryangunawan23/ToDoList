//
//  ProfileView.swift
//  ToDoList
//
//  Created by user on 31/07/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewVM()
    
    var body: some View {
        NavigationStack{
            if let user = viewModel.user {
                VStack{
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        HStack{
                            Text("Name : ")
                            Text(user.name)
                        }
                        HStack{
                            Text("Email : ")
                            Text(user.email)
                        }
                        HStack{
                            Text("Member Since : ")
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        Spacer()
                        TLButton(title: "Logout", bgColor: .red) {
                            viewModel.logout()
                        }
                        .frame(height: 70)
                    }
                    .padding()
                    Spacer()
                }
                .navigationTitle("Profile")
            }
        }
        .onAppear {
            viewModel.fetchUserData()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
