//
//  BannerCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Meditation Series"
        label.textColor = UIColor.blueLabelcolor
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Manage Your Emotions"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timingLabel: UILabel = {
        let label = UILabel()
        label.text = "10 - 15 min"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trainerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coach Name"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trainerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.purple.cgColor
        return view
    }()
    
    private lazy var labelWrapper: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [titleLabel,
                                                       subtitleLabel,
                                                       timingLabel,
                                                       trainerNameLabel])
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
extension BannerCell{
    
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
        
        NSLayoutConstraint.activate([
            labelWrapper.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            labelWrapper.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor, constant: 16),
            labelWrapper.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -16),
            
            imageView.centerYAnchor.constraint(equalTo: wrapperView.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalTo: wrapperView.heightAnchor),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])

    }



    
}

// MARK: Configuration Functions
extension BannerCell{
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}
