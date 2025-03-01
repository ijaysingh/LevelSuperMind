//
//  FeaturedCollectionCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class FeaturedCollectionCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Meditation Series"
        label.textColor = UIColor.blueLabelcolor
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Change your thought patterns"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trainerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Ranveer Allahabadia"
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Break down your thought patterns and understand why you think the way you do to optimise your emotional well-being."
        label.textColor = UIColor.white
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.text = "10 Mins"
        label.textAlignment = .center
        label.layer.cornerRadius = 22
        label.clipsToBounds = true
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.lightGray.withAlphaComponent(0.6)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "play_icon"), for: .normal)
        button.layer.cornerRadius = 22
        return button
    }()
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15.0
        view.layer.borderColor = UIColor.secondaryBackgroundColor.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    
    private lazy var labelWrapper: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [titleLabel,
                                                       subtitleLabel])
        stackview.distribution = .fill
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private lazy var descriptionWrapper: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [trainerNameLabel,
                                                       descriptionLabel])
        stackview.distribution = .fill
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
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

// MARK: CollectionView Functions
extension FeaturedCollectionCell{
    
    private func initView(){
        backgroundColor = .clear
        
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(wrapperView)
        
        NSLayoutConstraint.activate([
            wrapperView.topAnchor.constraint(equalTo: contentView.topAnchor),
            wrapperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            wrapperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            wrapperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
        
        wrapperView.addSubview(imageView)
        wrapperView.addSubview(labelWrapper)
        wrapperView.addSubview(descriptionWrapper)
        wrapperView.addSubview(durationLabel)
        wrapperView.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor),
            imageView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor),
            
            labelWrapper.topAnchor.constraint(equalTo: wrapperView.topAnchor, constant: 24),
            labelWrapper.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            labelWrapper.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24),
            
            durationLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            durationLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -24),
            durationLabel.heightAnchor.constraint(equalToConstant: 44),
            durationLabel.widthAnchor.constraint(equalToConstant: 130),
            
            playButton.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor, constant: -24),
            playButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24),
            playButton.widthAnchor.constraint(equalToConstant: 44),
            playButton.heightAnchor.constraint(equalToConstant: 44),
            
            descriptionWrapper.bottomAnchor.constraint(equalTo: durationLabel.topAnchor, constant: -24),
            descriptionWrapper.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 24),
            descriptionWrapper.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -24)
        ])
    }
}

// MARK: Configuration Functions
extension FeaturedCollectionCell{
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}

