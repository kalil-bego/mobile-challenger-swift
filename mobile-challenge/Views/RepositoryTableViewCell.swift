//
//  RepositoryTableViewCell.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import UIKit

final class RepositoryTableViewCell: UITableViewCell {
    
    private lazy var repositoryName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var repositoryDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    lazy var numberOfStars: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        return label
    }()
    
    private lazy var numberOfForks: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        return label
    }()
    
    private lazy var usernameAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var nameAuthor: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var pictureAuthor: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private lazy var forkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "shuffle")
        } else {
            imageView.image = UIImage()
        }
        imageView.tintColor = .orange
        return imageView
    }()
    
    private lazy var starImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "star.fill")
        } else {
            imageView.image = UIImage()
        }
        imageView.tintColor = .orange
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(pictureAuthor)
        NSLayoutConstraint.activate([
            pictureAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -50),
            pictureAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            pictureAuthor.widthAnchor.constraint(equalToConstant: 60),
            pictureAuthor.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        contentView.addSubview(repositoryName)
        NSLayoutConstraint.activate([
            repositoryName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            repositoryName.trailingAnchor.constraint(equalTo: pictureAuthor.leadingAnchor, constant: 10),
            repositoryName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
        
        contentView.addSubview(usernameAuthor)
        NSLayoutConstraint.activate([
            usernameAuthor.centerXAnchor.constraint(equalTo: pictureAuthor.centerXAnchor),
            usernameAuthor.topAnchor.constraint(equalTo: pictureAuthor.bottomAnchor, constant: 5)
        ])
        
        contentView.addSubview(nameAuthor)
        NSLayoutConstraint.activate([
            nameAuthor.centerXAnchor.constraint(equalTo: usernameAuthor.centerXAnchor),
            nameAuthor.topAnchor.constraint(equalTo: usernameAuthor.bottomAnchor, constant: 5)
        ])
        
        contentView.addSubview(repositoryDescription)
        NSLayoutConstraint.activate([
            repositoryDescription.topAnchor.constraint(equalTo: repositoryName.bottomAnchor, constant: 5),
            repositoryDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            repositoryDescription.trailingAnchor.constraint(equalTo: pictureAuthor.leadingAnchor, constant: -25)
        ])
        
        contentView.addSubview(forkImage)
        NSLayoutConstraint.activate([
            forkImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            forkImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        contentView.addSubview(numberOfForks)
        NSLayoutConstraint.activate([
            numberOfForks.leadingAnchor.constraint(equalTo: forkImage.trailingAnchor, constant: 5),
            numberOfForks.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        contentView.addSubview(starImage)
        NSLayoutConstraint.activate([
            starImage.leadingAnchor.constraint(equalTo: numberOfForks.trailingAnchor, constant: 20),
            starImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
        
        contentView.addSubview(numberOfStars)
        NSLayoutConstraint.activate([
            numberOfStars.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 5),
            numberOfStars.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(imageOwner: UIImage, repositoryInfo: RepositoryInfo) {
        DispatchQueue.main.async {
            self.repositoryName.text = repositoryInfo.name
            self.repositoryDescription.text = repositoryInfo.description
            self.numberOfStars.text = String(repositoryInfo.numbersOfStars)
            self.numberOfForks.text = String(repositoryInfo.numbersOfForks)
            self.nameAuthor.text = repositoryInfo.user.name
            self.usernameAuthor.text = repositoryInfo.user.username
            self.pictureAuthor.image = imageOwner
        }
    }

}
