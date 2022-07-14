//
//  LeaguesViewController.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 14.07.2022.
//

import UIKit

private extension LeaguesViewController {
    struct Constants {
        static let cellIdentifier = "Cell"
        static let title = "Leagues"
        static let rowHeight: CGFloat = 100
    }
}

class LeaguesViewController: UIViewController {
    
    private var leagues: Leagues?
    
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
        fetchLeagues(from: Link.allLeagues.rawValue)
    }
    
    private func fetchLeagues(from url: String?) {
        NetworkManager.shared.fetchLeagues(from: url) { leagues in
            self.leagues = leagues
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

extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        leagues?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as? LeagueViewCell
        let league = leagues?.data[indexPath.row]
        cell?.configure(league: league)
        return cell ?? UITableViewCell()
    }
}

extension LeaguesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = SeasonsViewController()
        viewController.league = leagues?.data[indexPath.row]
        navigationController?.pushViewController(viewController, animated: true)
    }
}
