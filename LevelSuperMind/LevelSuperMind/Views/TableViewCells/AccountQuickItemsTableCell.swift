//
//  AccountQuickItemsTableCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//

import UIKit

class AccountQuickItemsTableCell: UITableViewCell {
    
    private lazy var myFavouritesview: QuickSettingView = {
        let view = QuickSettingView(icon: "heart_icon", settingName: "My Favourites")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var downloadView: QuickSettingView = {
        let view = QuickSettingView(icon: "download_icon", settingName: "Downloads")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var playlistView: QuickSettingView = {
        let view = QuickSettingView(icon: "playlist_icon", settingName: "My Playlists")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var journalView: QuickSettingView = {
        let view = QuickSettingView(icon: "journal_icon", settingName: "My Journal Entries")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewWrapper: UIStackView = {
        let stackview = UIStackView(arrangedSubviews: [myFavouritesview,
                                                       downloadView,
                                                       playlistView,
                                                       journalView])
        stackview.distribution = .fill
        stackview.axis = .vertical
        stackview.spacing = 8
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    private func initView(){
        backgroundColor = .clear
        selectionStyle = .none
        setupView()
    }
    
    private func setupView(){
        contentView.addSubview(viewWrapper)
        
        NSLayoutConstraint.activate([
            viewWrapper.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            viewWrapper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewWrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewWrapper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}


