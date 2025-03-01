//
//  AccountViewController.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 27/02/25.
//


import UIKit

class AccountViewController: UIViewController {
    
    private let categories = ["My Library", "Insights"]
    private var selectedCategoryIndex = 0
    
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        
        let bottomBorder = CALayer()
        bottomBorder.backgroundColor = UIColor.secondaryTextColor.cgColor
        bottomBorder.frame = CGRect(x: 0, y: 49, width: UIScreen.main.bounds.width, height: 3)
        collectionView.layer.addSublayer(bottomBorder)
        
        return collectionView
    }()

    
    private lazy var wrapperTableview: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = 0
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.register(FooterTableCell.self, forCellReuseIdentifier: "FooterTableCell")
        tableView.register(ProductSliderTableCell.self, forCellReuseIdentifier: "ProductSliderTableCell")
        tableView.register(AccountQuickItemsTableCell.self, forCellReuseIdentifier: "AccountQuickItemsTableCell")
        tableView.register(ProfileHeaderTableCell.self, forCellReuseIdentifier: "ProfileHeaderTableCell")
        tableView.register(WeeklyComparisonCell.self, forCellReuseIdentifier: "WeeklyComparisonCell")
        tableView.register(MindfulDaysCell.self, forCellReuseIdentifier: "MindfulDaysCell")
        tableView.register(MindfulnessIncreaseCell.self, forCellReuseIdentifier: "MindfulnessIncreaseCell")
        tableView.register(ActivitySliderTableCell.self, forCellReuseIdentifier: "ActivitySliderTableCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}

// MARK: - Controller Functions
extension AccountViewController {
    
    private func initView(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.appBackground
        setupView()
    }
    
    private func setupView() {
        view.addSubview(wrapperTableview)
        
        NSLayoutConstraint.activate([
            wrapperTableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            wrapperTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wrapperTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wrapperTableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
}

// MARK: - UICollectionView Delegate & DataSource
extension AccountViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configure(title: categories[indexPath.item], isSelected: indexPath.item == selectedCategoryIndex)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedCategoryIndex = indexPath.item
        collectionView.reloadData()
        wrapperTableview.reloadSections(IndexSet(integer: 1), with: .automatic)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2, height: 50)
    }
}

// MARK: - UITableView Delegate & DataSource
extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : selectedCategoryIndex == 0 ? 3 : 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTableCell", for: indexPath) as! ProfileHeaderTableCell
            return cell
        } else {
            if selectedCategoryIndex == 0{
                switch indexPath.row{
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderTableCell", for: indexPath) as! ProductSliderTableCell
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "AccountQuickItemsTableCell", for: indexPath) as! AccountQuickItemsTableCell
                    return cell
                case 2:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableCell", for: indexPath) as! FooterTableCell
                    return cell
                default:
                    return .init()
                }
            }else{
                switch indexPath.row{
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MindfulnessIncreaseCell", for: indexPath) as! MindfulnessIncreaseCell
                    return cell
                case 1:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyComparisonCell", for: indexPath) as! WeeklyComparisonCell
                    return cell
                case 2:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "MindfulDaysCell", for: indexPath) as! MindfulDaysCell
                    return cell
                case 3:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ActivitySliderTableCell", for: indexPath) as! ActivitySliderTableCell
                    return cell
                case 4:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableCell", for: indexPath) as! FooterTableCell
                    return cell
                default:
                    return .init()
                }
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
            headerView.backgroundColor = .clear
            categoryCollectionView.frame = headerView.bounds
            headerView.addSubview(categoryCollectionView)
            return headerView
        }else{
            return UIView(frame: .zero)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 80 : 0
    }
}

