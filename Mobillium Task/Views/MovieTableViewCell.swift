//
//  MovieTableViewCell.swift
//  Mobillium Task
//
//  Created by Yarkın Gazibaba on 11.05.2022.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let identifier = "MovieTableViewCell"
    
     private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        applyConstraints()
    }
    
    private func applyConstraints(){
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(titleLabelConstraints)
    }
    
    func configure(with titleName: String) {
        titleLabel.text = titleName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
