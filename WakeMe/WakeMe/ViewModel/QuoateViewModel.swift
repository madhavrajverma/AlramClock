//
//  QuoateViewModel.swift
//  WakeMe
//
//  Created by Madhav Raj Verma on 8/18/21.
//

import Foundation



class QuoteViewModel:ObservableObject {
    
    @Published var quote :Quote?
   
    func fetchQuote() {
        let url  = URL(string: Constant.quoteUrl)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                let decoder = JSONDecoder()
              let decodeQuote  = try?   decoder.decode(Quote.self, from: data)
            if let deocodeQuote = decodeQuote {
                DispatchQueue.main.async {
                    self.quote = deocodeQuote
//                    print(self.quote?.content)
                }
            }
            }
        }.resume()
    }
    
}
