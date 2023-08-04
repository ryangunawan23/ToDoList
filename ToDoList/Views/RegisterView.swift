//
//  RegisterView.swift
//  ToDoList
//
//  Created by user on 31/07/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewVM()
    
    var body: some View {
        var isError: Bool = !viewModel.errorMessage.isEmpty
        VStack{
            HeaderView(isLogin: false)
            
            Form{
                if isError{
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account",
                    bgColor: .green
                )   {
                    viewModel.register()
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: isError ? 320:276)
            .cornerRadius(15)
            Spacer()
        }
        .offset(y: -50)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
