//
//  SoundView.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/19/21.
//

import SwiftUI

struct SoundView: View {
    @Binding var sound: String
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            let sounds = ["deepgroove","springmelody","alarmsound","morningalarm","fantasy"]

            List {
                
                Section(header: Text("Selected Sound")) {
                    if sound.isEmpty {
                        Text(sounds[0])
                    }else {
                        Text(sound)
                    }
                }
                
                ForEach(sounds,id:\.self) { item in
                    VStack{
                        SoundListView(soundString: item)
                    }.onTapGesture {
                        sound = item
                    }
                        
                     
                }
            }
            .navigationBarTitle("Sound",displayMode: .inline)
            .navigationBarItems(leading: Button(action:{
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .font(.body)
            }, trailing: Button(action:{
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Done")
                    .font(.body)
            })
        }.accentColor(.red)
    }
}



struct SoundListView:View {
    var soundString = ""
    @StateObject var audioPlayer = AudioPlayer()
    
    
    var body: some View {
        
        HStack {
            Text(soundString)
                .font(.body)
                .fontWeight(.bold)
        Spacer()
            if audioPlayer.isPlaying == false {
                          Button(action: {
                            audioPlayer.startPlayback(sound: soundString, type: "mp3")
                          }) {
                              Image(systemName: "play.circle")
                                .font(.title3)
                                .foregroundColor(.red)
                          }
                      } else {
                          Button(action: {
                            audioPlayer.stopPlayback()
                          }) {
                              Image(systemName: "stop.fill")
                                .font(.title3)
                                .foregroundColor(.red)
                                  
                          }
                      }
                
        }.padding(.vertical,5)
    }
}
