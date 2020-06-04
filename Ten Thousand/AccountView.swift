//
//  AccountView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/5/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var forgotPassword = false
    @State private var confirmPassword = ""
    @State private var showingImagePicker = false
    
    var body: some View {
        ZStack {
                TitleView(accountStatus: $userSettings.accountStatus)
                .padding(.top, 16)
            VStack (alignment: .center, spacing: 16) {
                AddProfilePicture(showingImagePicker: self.$showingImagePicker)
                if !(userSettings.accountStatus == .loggedIn) {
                    VStack {
                        TextField("Name", text: $userSettings.name).frame(height: 35)
                        Divider()
                        
                        TextField("Email", text: $userSettings.email).frame(height: 35)
                        Divider()
                        
                        TextField("Password", text: $userSettings.password).frame(height: 35)
                        
                        if userSettings.accountStatus == .signingUp {
                            Divider()
                            TextField("Conform Password", text: $confirmPassword).frame(height: 35)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .frame(width: 300)
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                } else {
                    VStack {
                        Text("Welcome!")
                            .font(.system(size: 27, weight: .bold, design: .rounded))
                        if !userSettings.name.isEmpty {
                            Text(userSettings.name)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                        if !userSettings.name.isEmpty {
                            Text(userSettings.email)
                                .font(.system(size: 20, weight: .bold, design: .rounded))
                        }
                    }
                }
            }
            //TODO: Add the Sign up, forgot password, and Login/signup/update profile Buttons
            VStack {
                Spacer()
                
                if !(userSettings.accountStatus == .loggedIn) {
                    HStack {
                        
                        Button(action: {
                            if self.userSettings.accountStatus == .loggingIn {
                                self.confirmPassword = ""
                                withAnimation() {
                                    self.userSettings.accountStatus = .signingUp
                                }
                            } else if self.userSettings.accountStatus == .signingUp {
                                withAnimation() {
                                    self.userSettings.accountStatus = .loggingIn
                                }
                            }
                        }) {
                            Text(self.userSettings.accountStatus == .loggingIn ? "Sign Up" : "Login")
                                .foregroundColor(Color.black.opacity(0.9))
                                .minimumScaleFactor(0.5)
                                .animation(.none)
                        }
                        
                        if userSettings.accountStatus == .loggingIn {
                            Button(action: { self.forgotPassword.toggle() }) {
                                Text("Forgot Password?")
                                    .foregroundColor(Color.black.opacity(0.9))
                            }
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            if !(self.userSettings.accountStatus == .loggedIn) {
                                self.userSettings.accountStatus = .loggedIn
                            }
                            
                        }) {
                            Text(self.userSettings.accountStatus == .loggedIn ? "Update Account" : self.userSettings.accountStatus == .signingUp ? "Sign Up" : "Log In")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)))
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 40, style: .circular))
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                        }
                        .minimumScaleFactor(0.5)
                    }
                    .padding()
                }
                else {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.userSettings.accountStatus = .signingUp
                        }) {
                            Text("Log Out")
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1)))
                            .frame(width: 100, height: 50)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 40, style: .circular))
                            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 0)
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear() {
            
            }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(UserSettings())
    }
}

struct TitleView: View {
    @Binding var accountStatus: accountStatusEnum
    
    var body: some View {
        VStack {
            Text(accountStatus == .loggedIn ? "Account" : accountStatus == .signingUp ? "Sign Up" : "Login")
                .font(.system(.largeTitle, design: .rounded)).bold()
                .minimumScaleFactor(0.5)
            Spacer()
        }
    }
}

struct AddProfilePicture: View {
    @EnvironmentObject var userSettings: UserSettings
    @Binding var showingImagePicker: Bool
    @State private var image: Image? = getImage()
    @State private var inputImage: UIImage?
    
    var body: some View {
        ZStack (alignment: .center) {
            Circle().size(width: 70, height: 70)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 10, x: 0, y: 0).opacity(0.1)
            if userSettings.profilePicture == nil {
                ZStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1))).opacity(0.9)
                        .font(.system(size: 45))
                    Image(systemName: "plus")
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0.568627451, blue: 1, alpha: 1))).opacity(0.9)
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .offset(x: 25, y: -25)
                }
            } else {
                userSettings.profilePicture!
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .clipShape(Circle())
            }
        }
        .frame(width: 70, height: 70)
        .onTapGesture {
            self.showingImagePicker = true
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        setImageFor(image: inputImage)
        userSettings.profilePicture = getImage()
    }
}

func setImageFor(image inputImage: UIImage?) {
    guard let image = inputImage else { return }
    guard let imageJPEGData = image.jpegData(compressionQuality: 1.0) else {
        guard let imagePNGData = image.pngData() else { return }
        defaults.set(imagePNGData, forKey: "ProfilePicture")
        return
    }
    defaults.set(imageJPEGData, forKey: "ProfilePicture")
}
