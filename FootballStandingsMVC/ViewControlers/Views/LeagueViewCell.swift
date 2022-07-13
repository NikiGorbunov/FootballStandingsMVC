//
//  LeagueCell.swift
//  FootballStandingsMVC
//
//  Created by Никита Горбунов on 14.07.2022.
//

import UIKit

private extension LeagueViewCell {
    struct Constants {
        static let abbrFont = UIFont.systemFont(ofSize: 12)
        static let abbrColor = UIColor.gray
        static let nameLeftInset: CGFloat = 10
        static let nameRightInset: CGFloat = 50
        static let abbrLeftInset: CGFloat = 10
        static let logoLeftInset: CGFloat = 50
        static let logoRightInset: CGFloat = -10
    }
}

class LeagueViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private lazy var abbrLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.abbrFont
        label.textColor = Constants.abbrColor
        return label
    }()
    
    private lazy var logo: LeagueImageView = {
        let image = LeagueImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    func configure(model: League?) {
        nameLabel.text = model?.name
        abbrLabel.text = model?.abbr
        logo.fetchImage(from: model?.logos.light ?? "")
        configure()
    }
    
    private func configure() {
        selectionStyle = .none
        addSubview()
        makeConstraints()
    }
    
    private func addSubview() {
        addSubview(nameLabel)
        addSubview(abbrLabel)
        addSubview(logo)
    }
    
    private func makeConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        abbrLabel.translatesAutoresizingMaskIntoConstraints = false
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.nameLeftInset),
            nameLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: Constants.nameRightInset),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            abbrLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: Constants.abbrLeftInset),
            abbrLabel.topAnchor.constraint(equalTo: centerYAnchor),
            abbrLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logo.heightAnchor.constraint(equalTo: heightAnchor),
            logo.rightAnchor.constraint(equalTo: rightAnchor, constant: Constants.logoRightInset),
            logo.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: Constants.logoLeftInset)
            
            
        ])
    }

}
