//
//  PullRequestView.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 14/02/22.
//

import UIKit

final class PullRequestView: UIView {
    
    private lazy var quantityPullRequest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: "PullRequestCell")
        tableView.rowHeight = 180
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(quantityPullRequest)
        NSLayoutConstraint.activate([
            quantityPullRequest.topAnchor.constraint(equalTo: topAnchor),
            quantityPullRequest.trailingAnchor.constraint(equalTo: trailingAnchor),
            quantityPullRequest.leadingAnchor.constraint(equalTo: leadingAnchor),
            quantityPullRequest.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: quantityPullRequest.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
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
    
    func setTextQuantityPullRequest(opened: Int, closed: Int) {
        quantityPullRequest.text = "\(opened) opened / \(closed) closed"
    }

}
