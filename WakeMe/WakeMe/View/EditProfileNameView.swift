//
//  EditProfileNameView.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/22/21.
//

import SwiftUI

struct EditProfileNameView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var text = ""
    @AppStorage("name")   var name :String?
    @AppStorage("isVoice") var isVoice:Bool?
    @State  var isOn:Bool
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Enter your Name",text:$text)
                    .padding()
                    .cornerRadius(10)
                    .shadow(radius:5)
                    .border(Color.red)
                
                
                
                HStack {
                    
                    Toggle("Voice Over", isOn: $isOn  )
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                        .onChange(of: isOn) { (_) in
                            isVoice = isOn
                        }
                }.padding()
                
                Button(action: {
                    name = text
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth:.infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        
                    
                
            }
                
               
                
                Spacer(minLength: 0)
            }.padding()
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading: Button(action:{
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
                    .font(.body)
                    .bold()
            })
        }
}

    
}

