//
//  SeasonCell.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 14.07.2022.
//

import UIKit

private extension SeasonViewCell {
    struct Constants {
        static let secondTextFont = UIFont.systemFont(ofSize: 12)
        static let contentLeftInset: CGFloat = 10
        static let contentRightInset: CGFloat = -10
    }
}

class SeasonViewCell: UITableViewCell {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.secondTextFont
        return label
    }()
    
    private lazy var startDateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.secondTextFont
        return label
    }()
    
    private lazy var endDateLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.secondTextFont
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    func configure(season: Season?) {
        nameLabel.text = season?.displayName
        yearLabel.text = "Year: \(season?.year ?? 0)"
        let startDate = DateFormatter.getDateString(date: season?.startDate ?? "") ?? Date()
        let startDateString = DateFormatter.getStringDate(date: startDate) ?? ""
        let endDate = DateFormatter.getDateString(date: season?.endDate ?? "") ?? Date()
        let endDateString = DateFormatter.getStringDate(date: endDate) ?? ""
        startDateLabel.text = "Start: \(startDateString)"
        endDateLabel.text = "End: \(endDateString)"
        
        configure()
    }
    
    func configure() {
        selectionStyle = .none
        addSubiews()
        makeConstraints()
    }
    
    private func addSubiews() {
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(yearLabel)
        stackView.addArrangedSubview(startDateLabel)
        stackView.addArrangedSubview(endDateLabel)
        addSubview(stackView)
    }
    
    private func makeConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.contentLeftInset),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.contentRightInset),
            stackView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }

}
