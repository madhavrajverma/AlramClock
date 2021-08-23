//
//  Home.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/14/21.
//

import SwiftUI
import SwiftClockUI

struct Home: View {
    @State private var date = Date()
    @StateObject  var quotes :QuoteViewModel = QuoteViewModel()
    @AppStorage("name")   var name :String?
    @State private var isEditProfile:Bool = false
    @State var timeString:String = ""
    @State var isAppear:Bool = true
    @AppStorage("isVoice") var isVoice = true
    
    var body: some View {
            ScrollView(.vertical,showsIndicators :false) {
                VStack(alignment:.leading) {
                    HStack {
                        VStack(alignment:.leading) {
                            Text(timeString)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(name ?? "")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.red)
                        }
                        Spacer()
                        HStack(spacing:10) {
                            Button(action:{ }){
                                HStack {
                                    Image(systemName: "bell")
                                        .font(.title)
                                }
                            }
                            Button(action:{
                                isEditProfile = true
                            }){
                                Image(systemName: "person.circle")
                                    .font(.title)
                            }
                                
                        }

                    }.padding(.vertical)
                    
                    ClockView().environment(\.clockDate, .constant(date))
                    
                    Card(content: quotes.quote?.content ?? "Check your interntet Connection", author: quotes.quote?.author ?? "")
                
                }.padding()
                
            }.sheet(isPresented: $isEditProfile) {
                EditProfileNameView(isOn: isVoice)
            }

            .onAppear(perform: {
                if isAppear  {
                    self.quotes.fetchQuote()
                }
                if isAppear && isVoice {
                    GetCurrentTime { (time) in
                        timeString  = time
                    }
                    let string = "\(timeString), \(name ?? "") , glad to see you again"
                    speak(speech: string)
                }
            })
            .onDisappear {
                isAppear = false
            }
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



