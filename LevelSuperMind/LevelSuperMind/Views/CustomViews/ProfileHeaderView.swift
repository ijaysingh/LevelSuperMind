//
//  ProfileHeaderView.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit


class ProfileHeaderView: UIView {
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .darkGray
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Sourav"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "setting_icon")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var editIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pencil_icon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var premiumButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("  Join Level Premium  ", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(.orange, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.orange.cgColor
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var streakView = ProfileStatView(icon: "🔥", stat: "17", description: "Day Streak")
    private lazy var leagueView = ProfileStatView(icon: "🏅", stat: "#04", description: "Gold League")
    
    private lazy var statsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
}

// MARK: View Functions
extension ProfileHeaderView{
    
    private func initView(){
        backgroundColor = .clear
        setupView()
    }
    
    private func setupView() {
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(settingsButton)
        addSubview(editIcon)
        addSubview(premiumButton)
        addSubview(statsStackView)
        
        statsStackView.addArrangedSubview(streakView)
        statsStackView.addArrangedSubview(leagueView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: 60),
            profileImageView.heightAnchor.constraint(equalToConstant: 60),
            
            editIcon.trailingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 4),
            editIcon.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4),
            editIcon.widthAnchor.constraint(equalToConstant: 18),
            editIcon.heightAnchor.constraint(equalToConstant: 18),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 0),
            
            premiumButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            premiumButton.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            premiumButton.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            
            settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            settingsButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: 24),
            settingsButton.heightAnchor.constraint(equalToConstant: 24),
            
            
            
            statsStackView.topAnchor.constraint(equalTo: premiumButton.bottomAnchor, constant: 16),
            statsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
