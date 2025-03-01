//
//  ActivityCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//


import UIKit

class ActivityCell: UICollectionViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGreen
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Meditation"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "activity_image")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var infoContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sessionsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGreen
        label.text = "200"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var xpLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.systemGreen
        label.text = "700"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sessionsTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Sessions"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var xpTextLabel: UILabel = {
        let label = UILabel()
        label.text = "XP"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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

// MARK: Collectionview Cell Functions
extension ActivityCell{
    private func initView(){
        layer.cornerRadius = 15.0
        clipsToBounds = true
        backgroundColor = UIColor.secondaryBackgroundColor
        setupView()
    }
    
    private func setupView() {
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView)
        contentView.addSubview(infoContainerView)
        infoContainerView.addSubview(sessionsLabel)
        infoContainerView.addSubview(xpLabel)
        infoContainerView.addSubview(sessionsTextLabel)
        infoContainerView.addSubview(xpTextLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: infoContainerView.topAnchor, constant: -0),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            infoContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            infoContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            infoContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            infoContainerView.heightAnchor.constraint(equalToConstant: 50),
            
            sessionsLabel.leadingAnchor.constraint(equalTo: infoContainerView.leadingAnchor, constant: 16),
            sessionsLabel.centerYAnchor.constraint(equalTo: infoContainerView.centerYAnchor),
            
            xpLabel.trailingAnchor.constraint(equalTo: infoContainerView.trailingAnchor, constant: -16),
            xpLabel.centerYAnchor.constraint(equalTo: infoContainerView.centerYAnchor),
            
            sessionsTextLabel.topAnchor.constraint(equalTo: sessionsLabel.bottomAnchor, constant: 2),
            sessionsTextLabel.leadingAnchor.constraint(equalTo: sessionsLabel.leadingAnchor),
            
            xpTextLabel.topAnchor.constraint(equalTo: xpLabel.bottomAnchor, constant: 2),
            xpTextLabel.trailingAnchor.constraint(equalTo: xpLabel.trailingAnchor)
        ])
    }
}
