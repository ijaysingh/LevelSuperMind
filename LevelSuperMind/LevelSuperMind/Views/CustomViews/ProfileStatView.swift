//
//  ProfileStatView.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class ProfileStatView: UIView {
    
    private lazy var iconLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(icon: String, stat: String, description: String) {
        super.init(frame: .zero)
        iconLabel.text = icon
        statLabel.text = stat
        descriptionLabel.text = description
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
}

// MARK: View Functions
extension ProfileStatView {
    
    private func initView(){
        backgroundColor = .clear
        layer.borderColor = UIColor.secondaryBackgroundColor.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 15
        
        setupView()
    }
    
    private func setupView() {
        addSubview(iconLabel)
        addSubview(statLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            iconLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            iconLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            
            statLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            statLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: statLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconLabel.trailingAnchor, constant: 8),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
}
