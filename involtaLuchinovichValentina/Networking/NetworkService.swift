//
//  NetworkService.swift
//  involtaLuchinovichValentina
//
//  Created by Валентина Лучинович on 22.04.2022.
//

import Foundation

class NetworkService {
    
    func request(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask (with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion (.failure(error))
                    return
                }
                guard let data = data else { return }
                completion(.success(data))
            }
        } .resume()
    }
}
