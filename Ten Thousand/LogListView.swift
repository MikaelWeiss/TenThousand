//
//  LogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct LogListView: View {
    
    @ObservedObject var store = LogListStore()
    @State var showHelpCenter = false
    @State var showAccountView = false
    
    var body: some View {
        ZStack {
            
            
            ZStack (alignment: .top) {
                List {
                    ForEach (store.allLogs) { thing in
                        VStack (alignment: .leading) {
                            HStack {
                                Text("\(thing.date) , \(thing.time)")
                            }
                            Text(thing.notes)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }.offset(y: 88)
                
                Color(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 88)
                
            }
            
            VStack {
                Image("Logo")
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {self.showAccountView.toggle()}) {
                        Image(systemName: "person.fill")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 44, height: 44)
                            .modifier(NavButtons())
                    }
                    .sheet(isPresented: $showAccountView) {
                        AccountView()
                    }
                    
                    Button(action: { self.showHelpCenter.toggle()}) {
                        Image(systemName: "questionmark")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .bold))
                            .modifier(NavButtons())
                    }
                    .sheet(isPresented: $showHelpCenter) {
                        HelpCenter()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                Spacer()
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
