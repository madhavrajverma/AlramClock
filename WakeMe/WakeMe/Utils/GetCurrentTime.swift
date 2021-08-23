//
//  GetCurrentTime.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/22/21.
//

import Foundation

func GetCurrentTime(completion: @escaping (String)->Void) {
    let hour = Calendar.current.component( .hour, from:Date() )

    if (hour > 1 &&  hour <  12)  {
        completion("Good Morning")
    }
    else if (hour > 12 && hour < 16) {
        completion("Good AfterNoon")
    }
    else if (hour > 16 && hour < 20) {
        completion("Good Evening")
    }
    else {
        completion("Good Night")
    }
    
}
