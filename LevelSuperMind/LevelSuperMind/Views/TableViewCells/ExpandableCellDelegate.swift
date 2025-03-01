//
//  ExpandableCellDelegate.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//


import UIKit

protocol ExpandableCellDelegate: AnyObject {
    func toggleExpansion()
}

class HomeCategoryCell: UITableViewCell {
    
    weak var delegate: ExpandableCellDelegate?
    
    var isExpanded = false {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private let items: [(title: String, icon: String)] = [
        ("Meditation", "selected_account"),
        ("Workout", "selected_account"),
        ("Sleep", "selected_account"),
        ("Close", "selected_account"),
        ("Mantra", "selected_account"),
        ("Events", "selected_account"),
        ("Courses", "selected_account"),
        ("Community", "selected_account"),
        ("Timer", "selected_account"),
        ("Affirmation", "selected_account"),
        ("Music", "selected_account"),
        ("Journal", "selected_account")
    ]
    
    private lazy var headingLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore"
        label.textColor = UIColor.headerLabelcolor
        label.font = .systemFont(ofSize: 24, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ShortcutCell.self, forCellWithReuseIdentifier: "ShortcutCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.frame = contentView.bounds
        collectionView.collectionViewLayout.invalidateLayout()  // Recalculate layout when needed
    }
    
    private func initView(){
        selectionStyle = .none
        backgroundColor = .clear
        
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(collectionView)
        contentView.addSubview(headingLabel)
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            headingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            headingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            collectionView.topAnchor.constraint(equalTo: headingLabel.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension HomeCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isExpanded ? items.count : 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShortcutCell", for: indexPath) as! ShortcutCell
        let item = items[indexPath.item]
        cell.configure(title: item.title, iconName: item.icon, isExpanded: self.isExpanded)
        
        if item.title == "Close" {
            cell.buttonAction = { [weak self] in
                self?.delegate?.toggleExpansion()
                self?.collectionView.reloadData()
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 50) / 4
        return CGSize(width: width, height: width)
    }
}
