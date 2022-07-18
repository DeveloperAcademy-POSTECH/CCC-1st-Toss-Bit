//
//  CollectionViewCell.swift
//  TossClone
//
//  Created by yeongwoocho on 2022/07/12.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    private let subTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
        configureAddSubviews()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init error")
    }
    
    private func configureView() {
        contentView.backgroundColor = ColorStyle.contentView.color
        contentView.layer.cornerRadius = 15
    }
    
    private func configureAddSubviews() {
        [subTitle, mainTitle, imageIcon].forEach { view in
            self.contentView.addSubview(view)
        }
    }
    
    private func configureConstraints() {
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            subTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            subTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 10),
            mainTitle.leadingAnchor.constraint(equalTo: subTitle.leadingAnchor),
            mainTitle.trailingAnchor.constraint(equalTo: subTitle.trailingAnchor, constant: -20)
        ])
        
        imageIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            imageIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageIcon.widthAnchor.constraint(equalToConstant: 40),
            imageIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func updateUI(at index: CellData) {
        self.subTitle.text = index.subtitle
        self.mainTitle.text = index.mainTitle
        if !index.imageName.isEmpty {
            self.imageIcon.image = UIImage(named: index.imageName)
        }
    }

}
