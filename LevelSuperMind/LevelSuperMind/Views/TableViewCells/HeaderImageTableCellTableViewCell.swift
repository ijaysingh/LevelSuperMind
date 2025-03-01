//
//  HeaderImageTableCellTableViewCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//

import UIKit

class HeaderImageTableCellTableViewCell: UITableViewCell {
    
    private lazy var streakButton: SecondaryButton = {
        let secondaryButton = SecondaryButton()
        secondaryButton.translatesAutoresizingMaskIntoConstraints = false
        secondaryButton.configure(with: "streak_icon", text: "2")
        secondaryButton.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        secondaryButton.layer.cornerRadius = 22
        secondaryButton.clipsToBounds = true
        return secondaryButton
    }()
    
    private lazy var rankButton: SecondaryButton = {
        let secondaryButton = SecondaryButton()
        secondaryButton.translatesAutoresizingMaskIntoConstraints = false
        secondaryButton.configure(with: "rank_icon", text: "Rank 5")
        secondaryButton.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        secondaryButton.layer.cornerRadius = 22
        secondaryButton.clipsToBounds = true
        return secondaryButton
    }()
    
    private lazy var rewardButton: SecondaryButton = {
        let secondaryButton = SecondaryButton()
        secondaryButton.translatesAutoresizingMaskIntoConstraints = false
        secondaryButton.configure(with: "reward_icon", text: "")
        secondaryButton.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        secondaryButton.layer.cornerRadius = 22
        secondaryButton.clipsToBounds = true
        return secondaryButton
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.image = UIImage(named: "home.header_image")
        return imageview
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

}

// MARK: Tableview Cell Functions
extension HeaderImageTableCellTableViewCell {
    
    private func initView(){
        selectionStyle = .none
        backgroundColor = .clear
        
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(backgroundImage)
        contentView.addSubview(streakButton)
        contentView.addSubview(rankButton)
        contentView.addSubview(rewardButton)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            streakButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            streakButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            streakButton.heightAnchor.constraint(equalToConstant: 44),
            
            rankButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            rankButton.leadingAnchor.constraint(equalTo: streakButton.trailingAnchor, constant: 24),
            rankButton.heightAnchor.constraint(equalToConstant: 44),
            
            rewardButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            rewardButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            rewardButton.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
}
