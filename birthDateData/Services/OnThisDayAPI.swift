//
//  OnThisDayService.swift
//  birthDateData
//
//  Created by Matheus Homrich on 30/11/21.
//

import Foundation


struct OnThisDayAPI {
    
    static func get<T:Codable>(month: String, day: String, type: String, completionHandler: @escaping (T?)-> Void) {
            let decoder = JSONDecoder()
            
        guard let url = URL(string: "\(Constants.PATH)/\(month)/\(day)/\(type).json") else {
                completionHandler(nil)
                return
            }
        
            var request = URLRequest(url: url)
            request.httpMethod = "GET"

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if (error != nil) {
                    completionHandler(nil)
                    return
                }
                
                guard let data = data  else {
                    completionHandler(nil)
                    return
                }
                
                do {
                    let received = try decoder.decode(T.self, from: data)
                    completionHandler(received)
                } catch {
                    completionHandler(nil)
                }
            }
            .resume()
        }
}
