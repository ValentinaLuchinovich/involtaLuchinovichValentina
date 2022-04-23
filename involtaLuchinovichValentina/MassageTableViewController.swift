//
//  MassageTableViewController.swift
//  involtaLuchinovichValentina
//
//  Created by Валентина Лучинович on 22.04.2022.
//

import UIKit

class MassageTableViewController: UITableViewController {
    
    let networkDataFetcher = NetworkDataFetcher()
    var massageResponse: Message?
    lazy var footerView = FooterView()
    var result: [String] = []
    
    let cellId = "cell"
    let url = "https://numero-logy-app.org.in/getMessages?offset="
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = footerView
        reloadMassage()
    }
    
    func reloadMassage() {
        networkDataFetcher.fetchTracks(viewController: self, urlString: url + String(counter)) { (massageResponse) in
            guard let massageResponse = massageResponse else { return }
            self.footerView.showLoader()
            self.massageResponse = massageResponse
            self.result.append(contentsOf: massageResponse.result)
            if massageResponse.result == [] {
                self.footerView.stopLoader()
            }
            self.counter += 20
            self.tableView.reloadData()
        }
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        reloadMassage()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let massage = result[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = massage
        cell.contentConfiguration = content
        return cell
    }
}
