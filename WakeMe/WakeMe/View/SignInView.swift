//
//  SignInView.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/22/21.
//

import SwiftUI

struct SignInView: View {
    
    @State var text = ""
    @AppStorage("SignIn") var signIn:Bool = false
    @AppStorage("name") var name:String = ""
    
    var body: some View {
        
        VStack(alignment:.leading) {
            VStack() {
                Text("Wake Me")
                   .font(.system(size: 50))
                   .fontWeight(.bold)
            }
           
            VStack(alignment:.center) {
                Image("clock")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 120, maxWidth: 130, minHeight: 120, maxHeight: 130)
                    .shadow(radius: 6)
                    .shadow(color: .red, radius: 8, x: 2, y: 2)
                    .clipped()
                
                TextField("Enter your Name",text:$text)
                    .padding()
                    .cornerRadius(10)
                    .shadow(radius:5)
                    .border(Color.red)
                    
                    
                    
                
                Button(action: {
                    signIn = true
                    name = text
                }) {
                    Text("Save")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        
                    
                }.padding(30)
            }
            Spacer()
        }.padding()
        .fullScreenCover(isPresented: $signIn) {
            ContentView()
        }
        
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
