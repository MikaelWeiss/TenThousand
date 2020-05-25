//
//  LogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct LogListView: View {
    var body: some View {
        VStack {
            ZStack (alignment: .bottomLeading) {
                TopBar().frame(height: 88)
                Text("My Title")
                    .font(.system(.largeTitle, design: .rounded)).bold()
                    .lineLimit(1)
                    .padding(.leading)
            }
            List {
                VStack (alignment: .leading) {
                    HStack {
                        Text("Jan 1 , 01:55")
                    }
                    Text("Some Notes")
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        LogListView()
    }
}


struct Log: Identifiable {
    var id = UUID()
    var date: String
    var time: String
    var notes: String
}
var things = [
    Log(date: "Jan 1", time: "10 m", notes: "Things to say")
]



struct TopBar: View {
    @State private var showEditLogView = false
    @State private var showAccountView = false
    @State private var image: Image? = getImage()
    
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
                        if image == nil {
                            Image(systemName: "person.fill")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 44, height: 44)
                            .modifier(NavButtons())
                        } else {
                            image?
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                        }
                    }
                    .sheet(isPresented: $showAccountView) {
                        AccountView()
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
