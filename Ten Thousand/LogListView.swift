//
//  LogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

//MARK: - Full View


struct LogListView: View {
    @EnvironmentObject var userSettings: UserSettings
    @ObservedObject var listOfUserLogs = ListOfUserLogs()
    @State private var showChoseLogList = false
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomLeading) {
                
                TopBar()
                    .frame(height: 88)
                    .environmentObject(userSettings)
                
                Button(action: {
                    self.showChoseLogList.toggle()
                }) {
                    Text(listOfUserLogs.allLogLists[listOfUserLogs.currentLog].name)
                        .font(.system(.largeTitle, design: .rounded)).bold()
                        .lineLimit(1)
                        .padding(.leading)
                        
                }
                .buttonStyle(PlainButtonStyle())
            }
            List {
                ForEach(listOfUserLogs.allLogLists[listOfUserLogs.currentLog].logs) { log in
                    VStack(alignment: .leading) {
                        Text(log.date + ", " + log.time)
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                        Text(log.notes)
                            .font(.system(size: 15, weight: .regular, design: .rounded))
                    }
                }
            }
        }
    }
}


//MARK: - Preview


struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        LogListView()
            .environmentObject(UserSettings())
    }
}


//MARK: - Top Bar


struct TopBar: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var showEditLogView = false
    @State private var showAccountView = false
    
    var body: some View {
        ZStack {
            VStack {
                Image("Logo")
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {self.showAccountView.toggle()}) {
                        if userSettings.profilePicture == nil {
                            Image(systemName: "person.fill")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 44, height: 44)
                            .modifier(NavButtons())
                        } else {
                            userSettings.profilePicture!
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                                .modifier(NavButtons())
                        }
                    }
                    .sheet(isPresented: $showAccountView) {
                        AccountView().environmentObject(self.userSettings)
                    }
                    
                    Button(action: { self.showEditLogView.toggle()}) {
                        Image(systemName: "plus")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .bold))
                            .modifier(NavButtons())
                    }
                    .sheet(isPresented: $showEditLogView) {
                        UpdateLogListView()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                Spacer()
            }
        }
    }
}
