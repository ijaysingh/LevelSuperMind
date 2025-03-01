//
//  LearningLessonCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class LearningLessonCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "How to meditate like a monk"
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Read More"
        label.textColor = UIColor.gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "share_icon"), for: .normal)
        button.backgroundColor = UIColor.blurBackgroundColor
        button.layer.cornerRadius = 16.0
        return button
    }()
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondaryBackgroundColor
        view.layer.cornerRadius = 15.0
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
extension LearningLessonCell{
    
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
        
        wrapperView.addSubview(labelWrapper)
        wrapperView.addSubview(imageView)
        wrapperView.addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 8),
            imageView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.05),
            
            labelWrapper.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            labelWrapper.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            labelWrapper.trailingAnchor.constraint(equalTo: shareButton.leadingAnchor, constant: -16),
            
            shareButton.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 32),
            shareButton.heightAnchor.constraint(equalToConstant: 32)
        ])

    }



    
}

// MARK: Configuration Functions
extension LearningLessonCell{
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}
