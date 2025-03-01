//
//  HomeViewController.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 27/02/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var isExpanded = false
    
    private lazy var wrapperTableview: UITableView = {
        let tableview = UITableView()
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.backgroundColor = .clear
        tableview.delegate = self
        tableview.dataSource = self
        tableview.sectionHeaderHeight = 0
        tableview.contentInsetAdjustmentBehavior = .never
        tableview.sectionHeaderTopPadding = 0
        tableview.separatorStyle = .none
        tableview.showsVerticalScrollIndicator = false
        tableview.showsHorizontalScrollIndicator = false
        tableview.register(HeaderImageTableCellTableViewCell.self, forCellReuseIdentifier: "HeaderImageTableCellTableViewCell")
        tableview.register(BannerSliderTableCell.self, forCellReuseIdentifier: "BannerSliderTableCell")
        tableview.register(ProductSliderTableCell.self, forCellReuseIdentifier: "ProductSliderTableCell")
        tableview.register(LearningTableCell.self, forCellReuseIdentifier: "LearningTableCell")
        tableview.register(FeaturedTableCell.self, forCellReuseIdentifier: "FeaturedTableCell")
        tableview.register(FooterTableCell.self, forCellReuseIdentifier: "FooterTableCell")
        tableview.register(HomeCategoryCell.self, forCellReuseIdentifier: "HomeCategoryCell")
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor.appBackground
        
        setupView()
    }
    
}

// MARK: Controller Functions
extension HomeViewController {
    
    private func setupView(){
        view.addSubview(wrapperTableview)
        NSLayoutConstraint.activate([
            wrapperTableview.topAnchor.constraint(equalTo: view.topAnchor),
            wrapperTableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wrapperTableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wrapperTableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
}

// MARK: Tableview Delegates and Datasoruce
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderImageTableCellTableViewCell", for: indexPath) as! HeaderImageTableCellTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerSliderTableCell", for: indexPath) as! BannerSliderTableCell
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCategoryCell", for: indexPath) as! HomeCategoryCell
            cell.delegate = self
            cell.isExpanded = isExpanded
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderTableCell", for: indexPath) as! ProductSliderTableCell
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSliderTableCell", for: indexPath) as! ProductSliderTableCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LearningTableCell", for: indexPath) as! LearningTableCell
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FeaturedTableCell", for: indexPath) as! FeaturedTableCell
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableCell", for: indexPath) as! FooterTableCell
            return cell
        default:
            return .init()
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 2 ? isExpanded ? 370 : 150 : UITableView.automaticDimension
    }
    
}

extension HomeViewController: ExpandableCellDelegate{
    func toggleExpansion() {
        isExpanded.toggle()
        wrapperTableview.beginUpdates()
        wrapperTableview.endUpdates()
        wrapperTableview.reloadRows(at: [.init(row: 2, section: 0)], with: .automatic)
    }
}















