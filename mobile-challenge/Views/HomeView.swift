//
//  HomeView.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 14/02/22.
//

import UIKit

final class HomeView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "RepositoryCell")
        tableView.rowHeight = 150

        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

}
