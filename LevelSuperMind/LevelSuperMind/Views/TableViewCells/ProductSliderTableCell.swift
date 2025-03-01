//
//  ProductSliderTableCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//

import UIKit

class ProductSliderTableCell: UITableViewCell {
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommended For You"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 0)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        return collectionView
    }()


    private var banners: [String] = ["banner_image", "banner_image", "banner_image", "banner_image", "banner_image", "banner_image", "banner_image", "banner_image", "banner_image"]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }

    func configure(with banners: [String]) {
        self.banners = banners
        bannerCollectionView.reloadData()
        bannerCollectionView.layoutIfNeeded()
    }
    
}

// MARK: TableView Cell Functions
extension ProductSliderTableCell {
    
    private func initView(){
        selectionStyle = .none
        backgroundColor = .clear
        contentView.isMultipleTouchEnabled = true
        isMultipleTouchEnabled = true
        
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(bannerCollectionView)
        contentView.addSubview(headingLabel)
        
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            bannerCollectionView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 24),
            bannerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            bannerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) + 50)
        ])
    }
    
}

// MARK: - UICollectionView DataSource & Delegate
extension ProductSliderTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.configure(with: banners[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (bannerCollectionView.frame.width / 2.7), height: (UIScreen.main.bounds.width / 2) + 30)
    }
    
}






