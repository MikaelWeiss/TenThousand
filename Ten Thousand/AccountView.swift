//
//  AccountView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/5/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @State private var loggedIn: Bool = false
    @State private var loggingIn = true
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        ZStack {
            TitleView(loggedIn: $loggedIn, loggingIn: $loggingIn)
                .padding(.top, 16)
            VStack (alignment: .center) {
                AddProfilePicture()
                AccountInputTextField(title: "Name: ", textFieldInput: $name)
                AccountInputTextField(title: "Email: ", textFieldInput: $email)
                AccountInputTextField(title: "Password: ", textFieldInput: $password)
                AccountInputTextField(title: "Verify Password", textFieldInput: $confirmPassword)
            }
            //TODO: Add the Sign up, forgot password, and Login/signup/update profile Buttons
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct TitleView: View {
    @Binding var loggedIn: Bool
    @Binding var loggingIn: Bool
    var body: some View {
        VStack {
            Text(loggedIn ? "Account" : loggingIn ? "Login" : "Sign Up")
                .font(.system(.largeTitle, design: .rounded)).bold()
            Spacer()
        }
    }
}

struct AddProfilePicture: View {
    var body: some View {
        ZStack (alignment: .center) {
            Circle().size(width: 70, height: 70)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10, x: 0, y: 0).opacity(0.1)
            Image(systemName: "person.fill")
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1))).opacity(0.9)
                .font(.system(size: 45))
            Image(systemName: "plus")
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1))).opacity(0.9)
                .font(.system(size: 25, weight: .bold, design: .rounded))
                .offset(x: 25, y: -25)
        }
        .frame(width: 70, height: 70)
    }
}

struct AccountInputTextField: View {
    var title: String
    @Binding var textFieldInput: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .padding(.leading)
            TextField("", text: $textFieldInput)
                .frame(height: 44)
                .padding(.horizontal, 16)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
            
            
        }
        .padding()
    }
}
