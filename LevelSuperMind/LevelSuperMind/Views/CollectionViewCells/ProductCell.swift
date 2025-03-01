//
//  ProductCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Meditation Series"
        label.textColor = UIColor.blueLabelcolor
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Freedom Series"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var trainerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Coach Name"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelWrapper: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, trainerNameLabel])
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.distribution = .fill
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

// MARK: - CollectionView Functions
extension ProductCell {
    
    private func initView() {
        backgroundColor = .clear
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(labelWrapper)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: labelWrapper.topAnchor, constant: -8),

            labelWrapper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelWrapper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelWrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        imageView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }
}


// MARK: Configuration Functions
extension ProductCell{
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
}


