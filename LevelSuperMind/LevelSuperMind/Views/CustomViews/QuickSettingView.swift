//
//  QuickSettingView.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class QuickSettingView: UIView {
    
    private lazy var settingNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var settingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var navigateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "arrow_right"), for: .normal)
        button.layer.cornerRadius = 22
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    init(icon: String, settingName: String) {
        super.init(frame: .zero)
        settingNameLabel.text = settingName
        settingIcon.image = UIImage(named: icon)
        initView()
    }
}

extension QuickSettingView{
    private func initView(){
        backgroundColor = .clear
        setupView()
    }
    
    private func setupView() {
        addSubview(settingIcon)
        addSubview(settingNameLabel)
        addSubview(navigateButton)
        
        NSLayoutConstraint.activate([
            // Setting Icon Constraints
            settingIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            settingIcon.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            settingIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            settingIcon.heightAnchor.constraint(equalToConstant: 32),
            settingIcon.widthAnchor.constraint(equalToConstant: 32),

            // Setting Name Label Constraints
            settingNameLabel.leadingAnchor.constraint(equalTo: settingIcon.trailingAnchor, constant: 16),
            settingNameLabel.trailingAnchor.constraint(equalTo: navigateButton.leadingAnchor, constant: -16),
            settingNameLabel.centerYAnchor.constraint(equalTo: settingIcon.centerYAnchor),

            // Navigate Button Constraints
            navigateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            navigateButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            navigateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            navigateButton.heightAnchor.constraint(equalToConstant: 32),
            navigateButton.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
}
