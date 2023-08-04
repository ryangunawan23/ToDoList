//
//  HeaderView.swift
//  ToDoList
//
//  Created by user on 01/08/23.
//

import SwiftUI

struct HeaderView: View {
    let isLogin : Bool
    var bgColor : Color
    var headerText : String
    var subHeaderText : String
    var angle : Double
    init(isLogin: Bool) {
        self.isLogin = isLogin
        if(isLogin){
            bgColor = .pink
            headerText = "To Do List"
            subHeaderText = "Get Things Done"
            angle = 15
        } else {
            bgColor = .orange
            headerText = "Register"
            subHeaderText = "Start organizing todos"
            angle = -15
        }
    }
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(bgColor)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(headerText)
                    .bold()
                    .font(.system(size: 50))
                Text(subHeaderText)
                    .font(.system(size: 30))
            }
            .padding(.top, 50)
            .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300 )
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(isLogin: false)
    }
}
