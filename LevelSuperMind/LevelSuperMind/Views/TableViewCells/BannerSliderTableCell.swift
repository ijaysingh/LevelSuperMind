//
//  BannerSliderTableCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//


import UIKit

class BannerSliderTableCell: UITableViewCell {
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Get Started"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
        return collectionView
    }()

    private var banners: [String] = ["banner_image", "banner_image"]

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
extension BannerSliderTableCell {
    
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
            headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            bannerCollectionView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 24),
            bannerCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bannerCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24),
            bannerCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bannerCollectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 50)
        ])
    }
    
}

// MARK: - UICollectionView DataSource & Delegate
extension BannerSliderTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.configure(with: banners[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: bannerCollectionView.frame.width, height: (UIScreen.main.bounds.width / 2) - 50)
    }
    
}


