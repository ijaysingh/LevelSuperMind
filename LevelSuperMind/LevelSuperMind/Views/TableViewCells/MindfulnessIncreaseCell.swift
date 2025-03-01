//
//  MindfulnessIncreaseCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//


import UIKit

class MindfulnessIncreaseCell: UITableViewCell {
    
    private lazy var backgroundImage: UIImageView = {
        let imageview = UIImageView()
        imageview.image = UIImage(named: "growth_background")
        imageview.clipsToBounds = true
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "30%"
        label.textColor = UIColor.cyan
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var upArrowImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "up_arrow")
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Your mindfulness practice\nincreased by 30% this week"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
extension MindfulnessIncreaseCell{
    
    private func initView(){
        selectionStyle = .none
        backgroundColor = .clear
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(backgroundImage)
        contentView.addSubview(upArrowImage)
        contentView.addSubview(percentageLabel)
        contentView.addSubview(dividerView)
        contentView.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            backgroundImage.heightAnchor.constraint(equalToConstant: 100),
            
            upArrowImage.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 12),
            upArrowImage.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            upArrowImage.widthAnchor.constraint(equalToConstant: 30),
            upArrowImage.heightAnchor.constraint(equalToConstant: 30),
            
            percentageLabel.leadingAnchor.constraint(equalTo: upArrowImage.trailingAnchor, constant: 6),
            percentageLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            
            dividerView.leadingAnchor.constraint(equalTo: percentageLabel.trailingAnchor, constant: 12),
            dividerView.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            dividerView.heightAnchor.constraint(equalTo: backgroundImage.heightAnchor, multiplier: 0.6),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 12),
            descriptionLabel.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor)
        ])
    }
}
