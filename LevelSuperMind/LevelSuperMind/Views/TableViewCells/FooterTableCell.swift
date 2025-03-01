//
//  FooterTableCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class FooterTableCell: UITableViewCell {
    
    private lazy var footerView: FooterView = {
        let footerView = FooterView()
        footerView.translatesAutoresizingMaskIntoConstraints = false
        return footerView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
}

// MARK: TableView Cell Functions
extension FooterTableCell {
    private func initView() {
        selectionStyle = .none
        backgroundColor = .clear
        setupView()
    }
    
    private func setupView() {
        contentView.addSubview(footerView)
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            footerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            footerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            footerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
