//
//  SeasonsViewController.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 14.07.2022.
//

import UIKit

private extension SeasonsViewController {
    struct Constants {
        static let cellIdentifier = "SeasonCell"
        static let title = "Seasons"
        static let rowHeight: CGFloat = 100
    }
}

class SeasonsViewController: UIViewController {
    
    var league: League?
    var seasons: SeasonsResponse?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(LeagueViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = Constants.title
        tableView.rowHeight = Constants.rowHeight
        
        addSubviews()
        makeConstraints()
        fetchSeasons(from: Link.seasonsAvailable.rawValue)
    }
    
    private func fetchSeasons(from url: String?) {
        NetworkManager.shared.fetchSeasons(from: url) { seasons in
            self.seasons = seasons
            self.tableView.reloadData()
        }
    }
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func makeConstraints() {
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }

}

extension SeasonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seasons?.data.seasons.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? SeasonViewCell
        let season = seasons?.data.seasons[indexPath.row]
        cell?.configure(season: season)
        return cell ?? UITableViewCell()
    }
    
    
}

extension SeasonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
