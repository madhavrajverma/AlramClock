//
//  Card.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/18/21.
//

import SwiftUI

struct Card:View  {
    var content :String
    var author:String
    var body: some View {
        
        VStack {
            VStack(alignment:.center) {
                Text( " ''\(content) '' ")
                   .font(.headline)
                   .fontWeight(.semibold)
                    .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        
                    .foregroundColor(.white)
            }
            
            
            HStack {
                Spacer()
                Text(" by \(author)")
                    .font(.footnote)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
            }
                
            
        }.padding()
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color(red: 32/255, green: 36/255, blue: 38/255))
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}


