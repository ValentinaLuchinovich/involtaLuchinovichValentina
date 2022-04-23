//
//  NetworkDataFetcher .swift
//  involtaLuchinovichValentina
//
//  Created by Валентина Лучинович on 22.04.2022.
//

import Foundation
import UIKit

class NetworkDataFetcher {
    
    let networkService = NetworkService()
    let alertController = AlertController()
    
    func fetchTracks(viewController: UIViewController, urlString: String, response: @escaping (Message?) -> Void) {
        networkService.request(urlString: urlString) { (result) in
            switch result {
            case .success(let data):
                do {
                    let massage = try JSONDecoder().decode(Message.self, from: data)
                    response(massage)
                } catch let jsonError{
                    print("Faield to decode JSON", jsonError)
                    self.alertController.showAlert(viewController: viewController)
                }
            case .failure(let error):
                print("Error received requesting data: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
