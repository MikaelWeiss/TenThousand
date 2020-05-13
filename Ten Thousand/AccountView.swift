//
//  AccountView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/5/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct AccountView: View
{
    @State private var accountStatus = accountStatusEnum.signingUp
    @State private var forgotPassword = false
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        ZStack {
            TitleView(accountStatus: $accountStatus)
                .padding(.top, 16)
            VStack (alignment: .center, spacing: 16) {
                AddProfilePicture(showingImagePicker: self.$showingImagePicker)
                VStack {
                    TextField("Name", text: $name).frame(height: 35)
                    Divider()
                    TextField("Email", text: $email).frame(height: 35)
                    Divider()
                    TextField("Password", text: $password).frame(height: 35)
                    if accountStatus == .signingUp {
                        Divider()
                        TextField("Conform Password", text: $confirmPassword).frame(height: 35)
                    } else {
                        EmptyView()
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .frame(width: 300)
                .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
            }
            //TODO: Add the Sign up, forgot password, and Login/signup/update profile Buttons
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        if self.accountStatus == .loggingIn {
                            self.accountStatus = .signingUp
                        } else if self.accountStatus == .signingUp {
                            self.accountStatus = .loggingIn
                        }
                    }) {
                        Text(self.accountStatus == .loggingIn ? "Sign Up" : "Login")
                            .foregroundColor(Color.black.opacity(0.9))
                    }
                    
                    if accountStatus == .signingUp {
                        Button(action: { self.forgotPassword.toggle() }) {
                            Text("Forgot Password?")
                                .foregroundColor(Color.black.opacity(0.9))
                        }
                    } else {
                        EmptyView()
                    }
                    Spacer()
                    Button(action: {}) {
                        Text(self.accountStatus == .loggedIn ? "Update Account" : self.accountStatus == .signingUp ? "Sign Up" : "Log In")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)))
                        .frame(width: 100, height: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 40, style: .circular))
                        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                    }
                }
                .padding()
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}

struct TitleView: View {
    @Binding var accountStatus: accountStatusEnum
    
    var body: some View {
        VStack {
            Text(accountStatus == .loggedIn ? "Account" : accountStatus == .signingUp ? "Sign Up" : "Login")
                .font(.system(.largeTitle, design: .rounded)).bold()
            Spacer()
        }
    }
}

struct AddProfilePicture: View {
    @Binding var showingImagePicker: Bool
    
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
        .onTapGesture {
            self.showingImagePicker = true
        }
    }
}





enum accountStatusEnum {
    case loggedIn
    case loggingIn
    case signingUp
}
