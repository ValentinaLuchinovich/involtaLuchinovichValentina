//
//  AlertController.swift
//  involtaLuchinovichValentina
//
//  Created by Валентина Лучинович on 23.04.2022.
//

import UIKit

class AlertController {
    func showAlert(viewController: UIViewController) {
        let alert = UIAlertController(title: "Соединение прервано", message: "Проверьте соединение с интернетом и обновите страницу", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}

