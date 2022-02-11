//
//  PullRequestTableViewCell.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import UIKit

final class PullRequestTableViewCell: UITableViewCell {
    
    private lazy var titlePullRequest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var descriptionPullRequest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.text = "Body do pull request lorem ipsum dolor sit amet lorem ipsum dolor..."
        return label
    }()
    
    private lazy var imageOwnerPullRequest: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 25
        return imageView
    }()
    
    private lazy var usernameOwnerPullRequest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var nameOwnerPullRequest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlePullRequest)
        NSLayoutConstraint.activate([
            titlePullRequest.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titlePullRequest.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titlePullRequest.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            titlePullRequest.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(descriptionPullRequest)
        NSLayoutConstraint.activate([
            descriptionPullRequest.topAnchor.constraint(equalTo: titlePullRequest.bottomAnchor, constant: 5),
            descriptionPullRequest.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionPullRequest.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        contentView.addSubview(imageOwnerPullRequest)
        NSLayoutConstraint.activate([
            imageOwnerPullRequest.topAnchor.constraint(equalTo: descriptionPullRequest.bottomAnchor, constant: 5),
            imageOwnerPullRequest.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageOwnerPullRequest.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            imageOwnerPullRequest.widthAnchor.constraint(equalToConstant: 50),
            imageOwnerPullRequest.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(usernameOwnerPullRequest)
        NSLayoutConstraint.activate([
            usernameOwnerPullRequest.topAnchor.constraint(equalTo: descriptionPullRequest.bottomAnchor, constant: 5),
            usernameOwnerPullRequest.leadingAnchor.constraint(equalTo: imageOwnerPullRequest.trailingAnchor, constant: 5),
            usernameOwnerPullRequest.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        contentView.addSubview(nameOwnerPullRequest)
        NSLayoutConstraint.activate([
            nameOwnerPullRequest.topAnchor.constraint(equalTo: usernameOwnerPullRequest.bottomAnchor, constant: 5),
            nameOwnerPullRequest.leadingAnchor.constraint(equalTo: imageOwnerPullRequest.trailingAnchor, constant: 5),
            nameOwnerPullRequest.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameOwnerPullRequest.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(imageOwner: UIImage, pullRequest: PullRequest) {
        DispatchQueue.main.async {
            self.titlePullRequest.text = pullRequest.title
            self.descriptionPullRequest.text = pullRequest.body
            self.usernameOwnerPullRequest.text = pullRequest.user.username
            self.nameOwnerPullRequest.text = pullRequest.user.name
            self.imageOwnerPullRequest.image = imageOwner
        }
    }

}
